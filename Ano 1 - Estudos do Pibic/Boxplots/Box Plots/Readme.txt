Os arquivos de cada pasta s�o feitos para fazer a an�lise de como cada fun��o se comporta de acordo com o limiar estabelecido.
O limiar estabelecido varia de 0 a 1 (representado por uma porcentagem de 0 a 100% de similaridade). Sendo 0% uma compara��o
entre cadeias de caracteres que s�o completamente diferentes e.g. ("","Uma mudan�a qualquer") = 0% de similaridade e 
("Uma mudan�a qualquer","Uma mudan�a qualquer") = 100% de similaridade.

As pastas correspondem aos projetos analisados e se os projetos est�o balanceados ou n�o.

Os projetos analisados possuem uma maioria de mudan�as sint�ticas. Ent�o para fazer uma an�lise mais equilibrada das mudan�as
e de uma base que fosse um pouco mais balanceada, a partir da base original foram sorteadas mudan�as sint�ticas 
da quantidade de mudan�as sem�nticas para formar uma base 50/50 de mudan�as.

Lembrando que a linha verde corresponde a acur�cia (acertos)
		linha azul corresponde ao recall (true positives)/(true positives + false negatives)
		linha vermelha corresponde a precis�o (true positives)/(true positives + false positives)

para cada x% da classifica��o.

Tcom App:	133 observa��es.
	 	100 s�o sint�ticas.
	 	33 s�o sem�nticas.

Saff e Vicceri: 518 Observa��es.
		38 S�o Sem�nticas
		480 S�o sint�ticas
