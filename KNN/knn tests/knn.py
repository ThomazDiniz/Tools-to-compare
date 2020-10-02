import csv
import random
import math

categorias = ["Semântico", "Sintático"]
diretorio = "C:\\Users\\Thomaz\\desktop\\ufcg\\Tools to compare\\Tensor Flow\\"
evalDir = "eval.csv"
trainDir = "balanceado.csv"
balanceadoDir = "balanceado.csv"
delimitador="|"
f1 = open(diretorio+evalDir,'r',newline='', encoding='utf-8')
r1 = csv.reader(f1, delimiter=delimitador)
training_data = []

def euclidean_distance(ar1,ar2):
	soma = 0
	for i in range(len(ar1)):
		soma += (ar1[i] - ar2[i]) * (ar1[i] - ar2[i])
	return math.sqrt(soma)

def get_mais_proximo(pos,resto):
	mais_proximos = 0
	menor_distancia = 10000
	i = 0
	for obs in resto:
		dist = euclidean_distance(pos,obs[0]) 
		if (dist < menor_distancia):
			menor_distancia = dist
			mais_proximo = i
		i+=1
	return mais_proximo

def get_mais_proximos(pos,resto,n):
	distancias = []
	indices = []
	j = 0
	for obs in resto:
		dist = euclidean_distance(pos,obs[0]) 
		i = 0
		for d in distancias:
			if dist < d:
				break
			i+=1
		distancias.insert(i,dist)
		indices.insert(i,j)
		j+=1
	return indices[:n]

def get_args_max(array,data):
	soma = 0
	for i in array:
		if data[i][1] == 0:
			soma += 1
		else:
			soma -= 1
	if soma < 0:
		return 1
	return 0

for row in r1:
	try:
		training_data.append([[float(x) for x in row[3:13]], int(row[2]),row[0:2]])#[[functions],classification]
	except:
		pass #remove label

f2 = open(diretorio+evalDir,'r',newline='', encoding='utf-8')
r2 = csv.reader(f2, delimiter=delimitador)
evaluation_data = []
#[[distancias],classificação,[original,delta]]
for row in r2:
	try:
		evaluation_data.append([[float(x) for x in row[3:13]], int(row[2]),row[0:2]])#[[functions],classification]
	except:
		pass #remove label
    
print("neighbors","tp","tn","fp","fn","qtd","acuracia","precision","recall")
for n in range(1,100,2):
	vp = 0
	vn = 0
	fp = 0
	fn = 0
	i = 0
	for evaluation_observation in evaluation_data:
		i+=1
		ar = get_mais_proximos(evaluation_observation[0],training_data,n)
		classification = get_args_max(ar,evaluation_data)
		
		if classification:
			if evaluation_observation[1] == 1:
				vp+=1
			else:
				fn+=1
		else:
			if evaluation_observation[1] == 1:
				fp+=1
			else:
				vn+=1

		#training_data.append(evaluation_observation)

	#(neighbors,vp,vn,fp,fn,qtd,acuracia,precision,recall)
	print(str(n),vp,vn,fp,fn,i,round(10000*(vp+vn)/i)/10000,round(10000*vp/(vp+fp))/10000,round(10000*(vp/(vp+fn))/10000))




for evaluation_observation in evaluation_data:
	i+=1
	ar = get_mais_proximos(evaluation_observation[0],training_data,11)
	classification = get_args_max(ar,evaluation_data)
	print( str(classification) +  "," + "'" + evaluation_observation[2][1] + "'" + "," + "'" + evaluation_observation[2][0] + "'")	
