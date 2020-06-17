
# coding: utf-8

# In[1]:


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


# In[20]:


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


# In[23]:


###com valores reais
training_X = []
training_y = []
for features,label,actual in training_data:
    training_X.append(features)
    training_y.append(label)

training_X = np.array(training_X).reshape(-1, 10)

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

##com classificação
training_class_X = []
training_class_y = []
for features,label,actual in training_data_classified:
    training_class_X.append(features)
    training_class_y.append(label)

training_class_X = np.array(training_X).reshape(-1, 10)

training_balanced_class_X = []
training_balanced_class_y = []
for features,label,actual in training_balanced_data_classified:
    training_balanced_class_X.append(features)
    training_balanced_class_y.append(label)

training_balanced_class_X = np.array(training_balanced_class_X).reshape(-1, 10)

X_class_test = []
y_class_test = []
for features,label,actual in evaluation_data_classified:
    X_class_test.append(features)
    y_class_test.append(label)

X_class_test = np.array(X_class_test).reshape(-1, 10)


# In[24]:


model = Sequential()
model.add(Dense(64, input_dim=10, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(64, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(2, activation='softmax'))

model_balanced = Sequential()
model_balanced.add(Dense(64, input_dim=10, activation='relu'))
model_balanced.add(Dropout(0.5))
model_balanced.add(Dense(64, activation='relu'))
model_balanced.add(Dropout(0.5))
model_balanced.add(Dense(2, activation='softmax'))

model_class = Sequential()
model_class.add(Dense(64, input_dim=10, activation='relu'))
model_class.add(Dropout(0.5))
model_class.add(Dense(64, activation='relu'))
model_class.add(Dropout(0.5))
model_class.add(Dense(2, activation='softmax'))

model_class_balanced = Sequential()
model_class_balanced.add(Dense(64, input_dim=10, activation='relu'))
model_class_balanced.add(Dropout(0.5))
model_class_balanced.add(Dense(64, activation='relu'))
model_class_balanced.add(Dropout(0.5))
model_class_balanced.add(Dense(2, activation='softmax'))

# For a binary classification problem
model.compile(loss='sparse_categorical_crossentropy',
              optimizer='rmsprop',
              metrics=['accuracy'])

model_balanced.compile(loss='sparse_categorical_crossentropy',
              optimizer='rmsprop',
              metrics=['accuracy'])

model_class.compile(loss='sparse_categorical_crossentropy',
              optimizer='rmsprop',
              metrics=['accuracy'])

model_class_balanced.compile(loss='sparse_categorical_crossentropy',
              optimizer='rmsprop',
              metrics=['accuracy'])

model.fit(training_X, training_y,
          epochs=20,
          batch_size=2)

model_balanced.fit(training_balanced_X, training_balanced_y,
          epochs=20,
          batch_size=2)

model_class.fit(training_class_X, training_class_y,
          epochs=20,
          batch_size=2)

model_class_balanced.fit(training_balanced_class_X, training_balanced_class_y,
          epochs=20,
          batch_size=2)


# In[6]:


plot_model(model, to_file='model.png', show_shapes=True, show_layer_names=True)



# In[25]:


score = model.evaluate(X_test, y_test, batch_size=2)
score_balanced = model_balanced.evaluate(X_test, y_test, batch_size=2)

score_class = model_class.evaluate(X_test, y_test, batch_size=2)
score_class_balanced = model_class_balanced.evaluate(X_test, y_test, batch_size=2)


print("Score: ", score)
print("Score balanceado: ", score_balanced)
print("Score Class: ", score_class)
print("Score Class balanceado: ", score_class_balanced)

predictions = model_balanced.predict([X_test])

predictions_training = model_balanced.predict([training_X])


print("Predictions: ")
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
print("tp:", tp,"tn:", tn,"fp:", fp,"fn:", fn)

print("SAFF + BZC: ")
tp=0
tn=0
fp=0
fn=0
for i in range(len(predictions_training)):
    if training_data[i][1]:
        if np.argmax(predictions_training[i]):
            tp += 1
        else:
            fp += 1
    else:
        if np.argmax(predictions_training[i]):
            fn += 1
        else:
            tn += 1    
print("tp:", tp,"tn:", tn,"fp:", fp,"fn:", fn)


# In[8]:


predictions

