from xml.etree import ElementTree
import html
import csv

loginSintatico = [
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/login.claret/5/syntacticObsolete.xml"]

loginSemantico = [
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/login.claret/5/semanticObsolete.xml"]

loginGabarito = [
"C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesDifs/Login/1.csv"]

value = 0.59

def inner_xml(element: ElementTree.Element):
    return ((html.unescape((element.text or '') + ''.join(ElementTree.tostring(e, 'unicode') for e in element))))

def inner_xml2(element: ElementTree.Element):
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

def carrega(path):
	gabarito_base = []
	gabarito_delta = []
	gabarito_areSyntatic = []
	gabarito_distance = []
	f = open(path,'r',encoding='utf-8')
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
	return [gabarito_base,gabarito_delta,gabarito_areSyntatic,gabarito_distance]


f = open('result.csv','w',newline='', encoding='utf-8')
e = csv.writer(f)
e.writerow(['Path','total','new','reusables','impacted','low','high','low_right','low_wrong','high_right','high_wrong'])

def filtra_testcases(l):
   return [v for v in l if v.tag == 'testcase']

def filtra_steps(l):
   return l.findall('*/steps')

def compara(t1,t2,gabarito):
	trees = [ElementTree.parse(t1),ElementTree.parse(t2)]
	testsuits = [trees[0].getroot(),trees[1].getroot()]
	sintaticos = filtra_steps(testsuits[0])
	semanticos = filtra_steps(testsuits[1])
	gab = carrega(gabrito)
	gabarito_base = gab[0]
	gabarito_delta = gab[1]
	gabarito_areSyntatic = gab[2]
	gabarito_distance = gab[3]
	reusables = 0
	new = 0
	impacted = 0
	high = 0
	low = 0
	low_right = 0
	low_wrong = 0
	high_right = 0
	high_wrong = 0
	loading = 0
	for passo in sintaticos:
		loading+=1
		print(loading/len(sintaticos))
		found=False
		steps = inner_xml2(passo)
		for gabarito_indice in range(len(gabarito_delta)):
			if passo in alfnum(gabarito_delta):
				print("found")


files = [loginSintatico]


compara("C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/login.claret/5/syntacticObsolete.xml","C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesHistory/login.claret/5/semanticObsolete.xml","C:/Users/Thomaz/Desktop/UFCG/tcom-app-analysis/useCasesDifs/Login/1.csv")
