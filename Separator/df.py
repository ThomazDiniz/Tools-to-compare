
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

def LevenshteinDistance(str1,str2):
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


def OptimalStringAlignmentDistance(str1, str2):
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

def jaroDistance(s, t):
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
