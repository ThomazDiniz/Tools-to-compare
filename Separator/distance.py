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

logout = [
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/identificacao.claret/5/tests/Identificacao-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/identificacao.claret/4/tests/Identificacao-annotated_generatedTS.xml"]

str_original = []
str_new = []
equal = []
different = []

original = open(logout[0],"r")
for o in original:
    str_original.append(o)
original.close()

new = open(logout[1],"r")
for n in new:
    str_new.append(n)
new.close()

isTestCase = False

for o in str_original:
    bestmatch = ""
    distance = 1

    if "<testcase" in o:
        isTestCase = True
        steps = []
        distances = []

    if isTestCase:
	    for n in str_new:
	        dist = get_distance(o,n)
	        if dist < distance:
	            distance = dist
	            bestmatch = n

    if (not isTestCase):
        equal.append(o)
        different.append(o)
    else:
        steps.append(bestmatch)
        distances.append(distance)
        if "</testcase>" in o:
            isTestCase = False
            if max(distances) < value:
                for s in steps:
                    equal.append(s)
            else:
                for s in steps:
                    different.append(s)

file = open("reusable.xml","w")
for l in equal:
    print(l)
    file.write(l)
file.close()

file = open("nonreusable.xml","w")
for l in different:
    print(l)
    file.write(l)
file.close()