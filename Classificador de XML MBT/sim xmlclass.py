from xml.etree import ElementTree
import html
import csv

login = [
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/login.claret/6/tests/login-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/login.claret/5/tests/login-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/login.claret/4/tests/login-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/login.claret/3/tests/login-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/login.claret/2/tests/login-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/login.claret/1/tests/login-annotated_generatedTS.xml"]

sel = [
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/SelecaoDeSintoma.claret/5/tests/SelecaoDeSintoma-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/SelecaoDeSintoma.claret/4/tests/SelecaoDeSintoma-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/SelecaoDeSintoma.claret/3/tests/SelecaoDeSintoma-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/SelecaoDeSintoma.claret/2/tests/SelecaoDeSintoma-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/SelecaoDeSintoma.claret/1/tests/SelecaoDeSintoma-annotated_generatedTS.xml"]

logout = [
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/Logout.claret/2/tests/logout-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/Logout.claret/1/tests/logout-annotated_generatedTS.xml"]

deletarTMA = [
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/DeletarTMA.claret/2/tests/DeletarTMA-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/DeletarTMA.claret/1/tests/DeletarTMA-annotated_generatedTS.xml"]

exe = [
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/ExecucaoDePlanoDeTestes.claret/8/tests/ExecucaoDePlanoDeTestes-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/ExecucaoDePlanoDeTestes.claret/7/tests/ExecucaoDePlanoDeTestes-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/ExecucaoDePlanoDeTestes.claret/6/tests/ExecucaoDePlanoDeTestes-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/ExecucaoDePlanoDeTestes.claret/5/tests/ExecucaoDePlanoDeTestes-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/ExecucaoDePlanoDeTestes.claret/3/tests/ExecucaoDePlanoDeTestes-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/ExecucaoDePlanoDeTestes.claret/2/tests/ExecucaoDePlanoDeTestes-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/ExecucaoDePlanoDeTestes.claret/1/tests/ExecucaoDePlanoDeTestes-annotated_generatedTS.xml"]

gerarTma = [
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/GerarTMA.claret/2/tests/GerarTMA-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/GerarTMA.claret/1/tests/GerarTMA-annotated_generatedTS.xml"]

identificacao = [
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/identificacao.claret/7/tests/Identificacao-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/identificacao.claret/6/tests/Identificacao-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/identificacao.claret/5/tests/Identificacao-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/identificacao.claret/4/tests/Identificacao-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/identificacao.claret/3/tests/Identificacao-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/identificacao.claret/2/tests/Identificacao-annotated_generatedTS.xml",
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/identificacao.claret/1/tests/Identificacao-annotated_generatedTS.xml"]

def inner_xml(element: ElementTree.Element):
    return ((html.unescape((element.text or '') + ''.join(ElementTree.tostring(e, 'unicode') for e in element))))

def inner_xml2(element: ElementTree.Element):
	if isinstance(element, list):
		ret = ''
		for e in element:
			if e is None:
				continue
			if ret != '':
				ret+=';'
			ret += inner_xml2(e)
		return ret
	return removetags(alfnum(html.unescape((element.text or '') + ';'.join(ElementTree.tostring(e, 'unicode') for e in element))))

def alfnum(s):
	accents = 'çÇÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
	permit = ' '
	return ''.join(e for e in s if (e.isalnum() or e in permit or e == ";") and e not in accents)

def removetags(s):
	tags = ['1sp','psp','2sp','3sp','4sp','5sp','6sp','7sp','8sp','9sp','10sp','nodeorder','system','operador','action','number','externalid','testcase','version','executiontype','importance','summary','preconditions','steps','step','stepnumber','stepnumber','expectedresults','customfields','customfield','name','postconditions','value','testsuite']
	for t in tags:
		s = s.replace(t,'')
	s = s.replace('  ','')
	return s.strip();
value = 0.59

def lev(str1,str2):
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

gabarito_base = []
gabarito_delta = []
gabarito_areSyntatic = []
gabarito_distance = []

f = open('sim.csv','r',encoding='utf-8')
r = csv.reader(f)
isHeader = True
for row in r:
	if isHeader:
		isHeader = False
		continue
	if not row[0].strip() or not row[1].strip():
		continue 
	gabarito_base.append(alfnum(row[0]))
	gabarito_delta.append(alfnum(row[1]))
	gabarito_areSyntatic.append('1' in row[2])
	gabarito_distance.append(float(row[3]))
f.close()



predictions = []
f = open('predictions.csv','r',encoding='utf-8')
r = csv.reader(f)
isHeader = True
for row in r:
	predictions.append([row[0],alfnum(row[1]),alfnum(row[2])])

f.close()



f = open('result.csv','w',newline='', encoding='utf-8')
e = csv.writer(f)
e.writerow(['Path','total','new','reusables','impacted','low','high','high_low','low_right','low_wrong','high_right','high_wrong','high_low_right','high_low_wrong'])

con_file = open('confusion.csv','w',newline='', encoding='utf-8')
con_writer = csv.writer(con_file)

tc_file = open('testcases.csv','w',newline='', encoding='utf-8')
tc_writer = csv.writer(tc_file)


def filtra_testcases(l):
	return [v for v in l if v.tag == 'testcase']

def filtra_steps(l):
	return l.findall('*/steps')

def filtra_actions_expectedresults(l):
	steps = l.findall("step")
	actions = [action.find("actions") for action in steps]
	expectedresults = [expectedresult.find("expectedresults") for expectedresult in steps]
	return actions + expectedresults


confusion =[[0,0,0],[0,0,0],[0,0,0]]

def compara(t1,t2):
	trees = [ElementTree.parse(t1),ElementTree.parse(t2)]
	testsuits = [trees[0].getroot(),trees[1].getroot()]
	base = filtra_steps(testsuits[0])
	delta = filtra_steps(testsuits[1])
	reusables = 0
	new = 0
	impacted = 0
	high = 0
	low = 0
	high_low = 0
	low_right = 0
	low_wrong = 0
	high_right = 0
	high_wrong = 0
	high_low_right = 0
	high_low_wrong = 0
	loading = 0
	count = 0


	for elemento_delta in delta:
		count+=1
		loading+=1
		#print(loading/len(delta))
		found = False

		steps_delta = inner_xml2(elemento_delta)
		for elemento_base in base:
			steps_base = inner_xml2(elemento_base)
			if (steps_base == steps_delta):
				reusables+=1
				found = True
				break
		
		if found:
			continue
		
		for elemento_base in base:
			steps_base = inner_xml2(elemento_base)
			isLow = False
			isHigh = False
			found = False
			bigger_distance = 0
			lower_distance = 1
			s_delta = steps_delta.split(";")
			s_base = steps_base.split(";")
			c_high = 0
			c_low = 0
			for gabarito_indice in range(len(gabarito_base)):
				if gabarito_base[gabarito_indice] in steps_base and gabarito_delta[gabarito_indice] in steps_delta and len(s_base) == len(s_delta):
					found = True
					q_high = 0
					q_low = 0
					break_step = False
					for step_indice in range(len(s_base)):
						for p in predictions:
							if (p[1] in s_base[step_indice] and p[2] in s_delta[step_indice]) or (p[2] in s_base[step_indice] and p[1] in s_delta[step_indice]):
								if p[0] == '0':
									q_high += 1
									c_high += 1
									print("Classificado como high: ",s_base[step_indice], s_delta[step_indice])
									if q_low > 0:
										break_step=True
										break
								else:
									q_low += 1
									c_low += 1
									print("Classificado como low: ",s_base[step_indice], s_delta[step_indice])
									if q_high > 0:
										break_step=True
										break
						if break_step:
							print("Achou high_low skippando o resto dos passos...")
							break
									

					if not gabarito_areSyntatic[gabarito_indice]:
						isHigh = True
					else:
						isLow = True
			
			if found:
				impacted+=1
				if isHigh and isLow:
					high_low+=1
					tc_writer.writerow([t2,count,len(s_delta),q_high,q_low])
					if c_high > 0 and c_low > 0:
						high_low_right+=1
						confusion[2][2]+=1
						print("ACERTOU HIGH_LOW")
					elif c_high > 0 and c_low == 0:
						high_low_wrong+=1
						confusion[1][2]+=1
						print("ERROU HIGH_LOW (PREVIU HIGH)")
					else:
						high_low_wrong+=1
						confusion[0][2]+=1
						print("ERROU HIGH_LOW (PREVIU LOW)")	
				elif isHigh:
					high+=1
					if c_high > 0 and c_low > 0:
						high_wrong+=1
						confusion[2][1]+=1
						print("ERROU HIGH (PREVIU HIGH_LOW)")
					elif c_high > 0 and c_low == 0:
						high_right+=1
						confusion[1][1]+=1
						print("ACERTOU HIGH")
					else:
						high_wrong+=1
						confusion[0][1]+=1
						print("ERROU HIGH (PREVIU LOW)")
				else:
					low+=1
					if c_high > 0 and c_low > 0:
						low_wrong+=1
						confusion[2][0]+=1
						print("ERROU LOW (PREVIU HIGH_LOW)")
					elif c_high > 0 and c_low == 0:
						low_wrong+=1
						confusion[1][0]+=1
						print("ERROU LOW (PREVIU HIGH)")
					else:
						low_right+=1
						confusion[0][0]+=1	
						print("ACERTOU LOW")
						#print("Exemplo")
						#print(inner_xml(elemento_base))
						#print(inner_xml(elemento_delta))
						#print("Fim Exemplo")
				break				
		if found:
			continue
		new+=1


	e.writerow([t2,len(delta),new,reusables,impacted,low,high,high_low,low_right,low_wrong,high_right,high_wrong,high_low_right,high_low_wrong])
	print([t2,len(delta),new,reusables,impacted,low,high,low_right,low_wrong,high_right,high_wrong])


files = [login,sel,logout,deletarTMA,exe,gerarTma,identificacao]
tc_writer.writerow(['filename','TestCase','steps','high','low'])
for file in files:
	print(file)
	tam = len(file)
	indice = 0
	first = file[indice]
	firstTree = ElementTree.parse(first)
	firstSteps = filtra_steps(firstTree)
	e.writerow([first,len(firstSteps),len(firstSteps),0,0,0,0,0,0,0,0,0,0,0])
	for indice in range(tam-1):
		print(indice)
		compara(file[indice],file[indice+1])


for v in confusion:
	con_writer.writerow(v)
