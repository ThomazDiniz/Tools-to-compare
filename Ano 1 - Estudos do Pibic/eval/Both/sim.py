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

#matplot
#plot

def hamming_distance(str1,str2):#Distância de coincidência
    diferenca = abs(len(str1)-len(str2))
    difMax = max(len(str1),len(str2))
    menorTamanho = min(len(str1),len(str2))

    for i in range(menorTamanho):
        if str1[i] != str2[i]:
            diferenca+=1
    return (diferenca/difMax)

def hamming_reversed_distance(str1,str2):#Distância de coincidência inversa
    return hamming_distance(str1[::-1],str2[::-1])

def Levenshtein(str1, str2):#Distância de Edição
    if str1 == "":
        return len(str2)
    if str2 == "":
        return len(str1)
    if str1[-1] == str2[-1]:
        custo = 0
    else:
        custo = 1
       
    resultado = min([Levenshtein(str1[:-1], str2)+1,
               Levenshtein(str1, str2[:-1])+1, 
               Levenshtein(str1[:-1], str2[:-1]) + custo])
    return resultado

def removetags(s):
    tags = ['<step_number>','</step_number>','<p>','</p>','<expectedresults>','</expectedresults>','<actions>','</actions>']
    for t in tags:
        s = s.replace(t,'')
    s = s.replace('  ','')
    return s.strip();


def LevenshteinDistance(str1,str2):
    s1 = removetags(str1)
    s2 = removetags(str2)
    str1 = s1
    str2 = s2
    if len(str1) > len(str2):
        str1,str2 = str2,str1

    distances = range(len(str1) + 1)
    for index2,char2 in enumerate(str2):
        newDistances = [index2+1]
        for index1,char1 in enumerate(str1):
            if char1 == char2:
                newDistances.append(distances[index1])
            else:
                newDistances.append(1 + min((distances[index1],
                                             distances[index1+1],
                                             newDistances[-1])))
        distances = newDistances
    return (distances[-1]/len(str2))


def OptimalStringAlignmentDistance(str1, str2):#adapted from: https://gist.github.com/giststhebearbear/4145811
    bigger = str1
    if (len(bigger) < len(str2)):
        bigger = str2
    maxDistance = len(bigger)
    
    str1, str2 = (str1, str2) if len(str1) <= len(str2) else (str2, str1)
    l1, l2 = len(str1), len(str2)
    transpositionRow = None
    prevRow = None
    curRow = [x for x in range(0, l1 + 1)]
    for rowNum in range(1, l2 + 1):
        transpositionRow, prevRow, curRow = prevRow, curRow, [rowNum] + [0] * l1
        if transpositionRow:
            if not any(cellValue < maxDistance for cellValue in transpositionRow):
                return maxDistance

        for colNum in range(1, l1 + 1):
            insertionCost = curRow[colNum - 1] + 1
            deletionCost = prevRow[colNum] + 1
            changeCost = prevRow[colNum - 1] + (0 if str1[colNum - 1] == str2[rowNum - 1] else 1)
            curRow[colNum] = min(insertionCost, deletionCost, changeCost)
            if 1 < rowNum <= colNum:
                if str1[colNum - 1] == str2[colNum - 2] and str2[colNum - 1] == str1[colNum - 2]:
                    curRow[colNum] = min(curRow[colNum], transpositionRow[colNum - 2] + 1)
    return (curRow[-1]/maxDistance)

def jaroDistance(s, t):#from: https://rosettacode.org/wiki/Jaro_distance#Python
    s_len = len(s)
    t_len = len(t)
 
    if s_len == 0 and t_len == 0:
        return 1
 
    match_distance = (max(s_len, t_len) // 2) - 1
 
    s_matches = [False] * s_len
    t_matches = [False] * t_len
 
    matches = 0
    transpositions = 0
 
    for i in range(s_len):
        start = max(0, i-match_distance)
        end = min(i+match_distance+1, t_len)
 
        for j in range(start, end):
            if t_matches[j]:
                continue
            if s[i] != t[j]:
                continue
            s_matches[i] = True
            t_matches[j] = True
            matches += 1
            break
 
    if matches == 0:
        return 0
 
    k = 0
    for i in range(s_len):
        if not s_matches[i]:
            continue
        while not t_matches[k]:
            k += 1
        if s[i] != t[k]:
            transpositions += 1
        k += 1
 
    return ((  (matches / s_len) + 
            (matches / t_len) + 
            ((matches - transpositions/2) / matches)) / 3) 


def lcs(a, b):
    bigger = max(len(a),len(b));
    lengths = [[0 for j in range(len(b)+1)] for i in range(len(a)+1)]
    # row 0 and column 0 are initialized to 0 already
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            if x == y:
                lengths[i+1][j+1] = lengths[i][j] + 1
            else:
                lengths[i+1][j+1] = max(lengths[i+1][j], lengths[i][j+1])
    # read the substring out from the matrix
    result = ""
    x, y = len(a), len(b)
    while x != 0 and y != 0:
        if lengths[x][y] == lengths[x-1][y]:
            x -= 1
        elif lengths[x][y] == lengths[x][y-1]:
            y -= 1
        else:
            assert a[x-1] == b[y-1]
            result = a[x-1] + result
            x -= 1
            y -= 1
    return (1-len(result)/bigger)


def ngrams(string, n=3):
    string = re.sub(r'[,-./]|\sBD',r'', string)
    ngrams = zip(*[string[i:] for i in range(n)])
    return [''.join(ngram) for ngram in ngrams]



def agrupa(a):
    return round(a*10)/10;

def agp(a):
    return 1+round(a*10);

tam = 0
delimitador = ',';
nomeArquivo = 'sim.csv'
try:
    f = open(nomeArquivo,'r',newline='', encoding='utf-8')
    r = csv.reader(f)
    countHeader = 1
    s1 = []
    s2 = []
    s3 = []
    for row in r:
        print(row)
        if len(row)>1:
            if countHeader <= 0:
                if (row[0] == 'Total'):
                    break
                s = (row[0],row[1],row[2])
                if (row[2] == '1'):
                    s1.append(s)
                elif (row[2] == '0'):
                    s2.append(s)
                else:
                    s3.append(s)
            else:
                countHeader-=1
    f.close()
    strings = s1+s2
    qtdSintaticos = len(s1)
    qtdSemanticos = len(s2)

    tam = len(strings)
    print(tam)
except IOError:
    print("Problema de leitura. Criando o Arquivo...")

lista = [   'old','new', 'isSyntactic',
            'Hamming','Reversed Hamming',
            'Levenshtein','OSA','Jaro','Jaro-Winkler',
            'LCS','Jaccard','NGram','Cosine','Sørensen–Dice']
ocorrencias = []

for x in lista[2:]:
    ocorrencias.append([x] + [0]*14)

ng = NGram(4)
css = Cosine(1)
aj = Jaccard(1)
ss = SorensenDice(2)
jj = JaroWinkler()

v = []
f = open(nomeArquivo,'w',newline='', encoding='utf-8')
e = csv.writer(f)
e.writerow(lista)

for i in range(tam):
    print(i)
    str1 = strings[i][0]
    str2 = strings[i][1]
    str3 = strings[i][2]
    l = LevenshteinDistance(str1,str2)
    e.writerow([str1,str2,str3,l])


f.close()

print("Finalizado... Criando arquivo de análise. com " + str(tam) + " Linhas.")
