import math
import csv
import sys
import re
import numpy as np
from similarity.jarowinkler import JaroWinkler
from similarity.ngram import NGram
from similarity.cosine import Cosine
from similarity.sorensen_dice import SorensenDice
from similarity.jaccard import Jaccard
from xml.etree import ElementTree
import html
import csv
import df


base_s = ['<?xml version="1.0" encoding="ISO-8859-1"?>','<testsuite name="TS">','<node_order />','<details />']
base_f = ['</testsuite>']

ng = NGram(4)
css = Cosine(1)
aj = Jaccard(1)
ss = SorensenDice(2)
jj = JaroWinkler()

value = 0.59

def get_distance(str1,str2,function = "lev"):
    if function == "lcs":
        return df.lcs(str1,str2)
    elif function == "jaro":
        return 1-df.jaroDistance(str1,str2)
    elif function == "osa":
        return df.OptimalStringAlignmentDistance(str1,str2)
    elif function == "hamming":
        return df.hamming_distance(str1,str2)
    elif function == "jaccard":
        return aj.distance(str1,str2)
    elif function == "jarowinkler":
        return jj.distance(str1,str2)
    elif function == "ngram":
        return ng.distance(str1,str2)
    elif function == "sorensendice":
        return ss.distance(str1,str2)
    elif function == "cosine":
        return css.distance(str1,str2)
    else:
        return df.LevenshteinDistance(str1,str2)

def get_claret_array(path):
    ar = []
    file = open(path,"r")
    for line in file:
        if "step" in line:
            ar.append(line.split('"')[1])
    file.close()
    return ar

def get_xml_array(path):
    ar = []
    file = open(path,"r")
    isTestCase = False
    startString = '<testcase internalid=""'
    endString = '</testcase>'
    for line in file:
        if startString in line:
            isTestCase = True
            testcase = []
        if endString in line:
            isTestCase = False
            ar.append(testcase)
        if isTestCase:
            testcase.append(line.replace("\n",""))
    file.close()
    return ar

def write_xml(path,base_start,ar,base_finish):
    file = open(path,"w")
    arr = base_start + ar + base_finish
    for line in arr:
        file.write(line)
        file.write('\n')
    file.close()


print("\n\n\n\n")
old_xml = input("Path to the older version of the .xml: ").replace('"','')
old_claret = input("Path to the older version of the .claret: ").replace('"','')
new_xml = input("Path to the newer version of the .xml: ").replace('"','')
new_claret = input("Path to the newer version of the .claret: ").replace('"','')
value = float(input("Distance threshold (between 0 and 1): "))
function = input("Distance Function:(cosine, sorensendice, ngram, jarowinkler, jaccard, hamming, osa, jaro, lcs): ")
print("\n\n\n\n")

old_claret_ar = get_claret_array(old_claret)
new_claret_ar = get_claret_array(new_claret)
old_xml_ar = get_xml_array(old_xml)
new_xml_ar = get_xml_array(new_xml)

high_impacted_steps = []
low_impacted_steps = []
low_impacted_tcs = []
high_impacted_tcs = []

#find all matching steps between versions and classify them
for new_step in new_claret_ar:
    best_match = 2
    best_match_string = ''
    for old_step in old_claret_ar:
        new_match_value = get_distance(old_step,new_step,function)
        if (new_match_value < best_match):
            best_match = new_match_value
            best_match_string = new_step
    #print(best_match)
    if (best_match > value):
        high_impacted_steps.append((old_step,best_match_string))
    else:
        low_impacted_steps.append((old_step,best_match_string))

if (len(high_impacted_steps) == 0):#there is no highly impacted steps, so every tc is low impacted and therefore reusable
    for steps in new_xml_ar:
        for line in steps:
            low_impacted_tcs.append(line)
elif (len(low_impacted_steps) == 0):#there is no low impacted steps, so every tc is highly impacted and therefore not reusable
    for steps in new_xml_ar:
        for line in steps:
            high_impacted_tcs.append(line)
else:
    for steps in new_xml_ar:
        hasHigh = False;
        for line in steps:
            for step in high_impacted_steps:
                if step[1] in line:
                    hasHigh = True
        
        for line in steps:
            if hasHigh:
                high_impacted_tcs.append(line)
            else:
                low_impacted_tcs.append(line)

write_xml("low_impacted.xml",base_s,low_impacted_tcs,base_f)
write_xml("high_impacted.xml",base_s,high_impacted_tcs,base_f)
