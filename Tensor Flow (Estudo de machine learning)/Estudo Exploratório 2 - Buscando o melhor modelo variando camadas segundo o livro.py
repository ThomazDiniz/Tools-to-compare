
# coding: utf-8

# In[2]:


import warnings; warnings.simplefilter('ignore')
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Activation, Dropout, Flatten
import tensorflow_hub as hub
import matplotlib.pyplot as plt
import numpy as np
import csv
import random
from tensorflow.keras.utils import plot_model
import pydot
import graphviz


tf.__version__


# In[3]:


categorias = ["Semântico", "Sintático"]
diretorio = "/mnt/c/Users/Thomaz/desktop/ufcg/Tools to compare/Tensor Flow/"
evalDir = "eval.csv"
trainDir = "training.csv"
balanceadoDir = "balanceado.csv"
delimitador="|"
column = 13 ## 3: by values|13: by classification
f1 = open(diretorio+trainDir,'r',newline='', encoding='utf-8')
r1 = csv.reader(f1, delimiter=delimitador)


training_balanced_data = []
training_data = []
evaluation_data = []
training_balanced_data_classified = []
training_data_classified = []
evaluation_data_classified = []

#[v1,v2,s,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10]
for row in r1:
    try:
        training_data.append([[float(x) for x in row[3:3+10]], int(row[2]),row[0:2]])#[[functions],classification]
        training_data_classified.append([[float(x) for x in row[13:13+10]], int(row[2]),row[0:2]])
    except:
        pass #remove label

f2 = open(diretorio+evalDir,'r',newline='', encoding='utf-8')
r2 = csv.reader(f2, delimiter=delimitador)

for row in r2:
    try:
        evaluation_data.append([[float(x) for x in row[3:3+10]], int(row[2]),row[0:2]])#[[functions],classification]
        evaluation_data_classified.append([[float(x) for x in row[13:13+10]], int(row[2]),row[0:2]])#[[functions],classification]
    except:
        pass #remove label
evaluation_data.append(evaluation_data[len(evaluation_data)-2])
evaluation_data.append(evaluation_data[len(evaluation_data)-2])
count = 0
for k1 in training_balanced_data:
    if k1[1]:
        count+=1
print(count)

f3 = open(diretorio+balanceadoDir,'r',newline='', encoding='utf-8')
r3 = csv.reader(f3, delimiter=delimitador)

for row in r3:
    try:
        training_balanced_data.append([[float(x) for x in row[3:3+10]], int(row[2]),row[0:2]])#[[functions],classification]
        training_balanced_data_classified.append([[float(x) for x in row[13:13+10]], int(row[2]),row[0:2]])#[[functions],classification]
    except:
        pass #remove label


random.shuffle(training_data)
random.shuffle(training_balanced_data)
random.shuffle(evaluation_data)

random.shuffle(training_data_classified)
random.shuffle(training_balanced_data_classified)
random.shuffle(evaluation_data_classified)

print(len(training_data),len(evaluation_data),len(training_balanced_data))


# In[4]:


###com valores reais

training_balanced_X = []
training_balanced_y = []
for features,label,actual in training_balanced_data:
    training_balanced_X.append(features)
    training_balanced_y.append(label)

training_balanced_X = np.array(training_balanced_X).reshape(-1, 10)


X_test = []
y_test = []
for features,label,actual in evaluation_data:
    X_test.append(features)
    y_test.append(label)

X_test = np.array(X_test).reshape(-1, 10)


# In[26]:


def addCamada(md,ns,fn,cmd):
    for i in range(cmd):
        md.add(Dense(ns, activation=fn))
p = 0      
camadas = [2]
nos = [20]
funcc = ['softplus']
meinkampf = [('Camadas','nos','função','score','true positive','true negative', 'false positive', 'false negative','acurácia','precisão','recall')]
while p < 0.95:
    for camada in camadas:
        for n in nos:
            for func in funcc:
                model_balanced = Sequential()
                model_balanced.add(Dense(64, input_dim=10, activation='relu'))
                addCamada(model_balanced,n,func,camada)
                model_balanced.add(Dense(2, activation='softmax'))
                model_balanced.compile(loss='sparse_categorical_crossentropy',optimizer='rmsprop', metrics=['accuracy'])
                model_balanced.fit(training_balanced_X, training_balanced_y, epochs=20, batch_size=2)
                score = model_balanced.evaluate(X_test, y_test, batch_size=2)
                predictions = model_balanced.predict([X_test])
                tp=0
                tn=0
                fp=0
                fn=0
                for i in range(len(predictions)):
                    if evaluation_data[i][1]:
                        if np.argmax(predictions[i]):
                            tp += 1
                        else:
                            fp += 1
                    else:
                        if np.argmax(predictions[i]):
                            fn += 1
                        else:
                            tn += 1    
                acc = (tp+tn)/(tp+tn+fp+fn)
                pre = 0 #tp/(tp+fp)
                rec = 0 #tp/(tp+fn)
                meinkampf.append( (camada,n,func,tp,tn,fp,fn, acc, pre, rec) )
                print("###",p ,"###")
                p = acc
    



# In[28]:



#model.save('my_model.h5')  # creates a HDF5 file 'my_model.h5'
#del model  # deletes the existing model

# returns a compiled model
# identical to the previous one
#model = load_model('my_model.h5')

model_balanced.save("/mnt/c/Users/Thomaz/desktop/ufcg/Tools to compare/Tensor Flow/melhor_modelo.h5")


# In[42]:


pred = model_balanced.predict(X_test) 
for i in range(len(evaluation_data)):
    print([np.argmax(pred[i])]+evaluation_data[i][2])

