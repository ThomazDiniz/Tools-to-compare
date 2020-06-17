Os arquivos de cada pasta são feitos para fazer a análise de como cada função se comporta de acordo com o limiar estabelecido.
O limiar estabelecido varia de 0 a 1 (representado por uma porcentagem de 0 a 100% de similaridade). Sendo 0% uma comparação
entre cadeias de caracteres que são completamente diferentes e.g. ("","Uma mudança qualquer") = 0% de similaridade e 
("Uma mudança qualquer","Uma mudança qualquer") = 100% de similaridade.

As pastas correspondem aos projetos analisados e se os projetos estão balanceados ou não.

Os projetos analisados possuem uma maioria de mudanças sintáticas. Então para fazer uma análise mais equilibrada das mudanças
e de uma base que fosse um pouco mais balanceada, a partir da base original foram sorteadas mudanças sintáticas 
da quantidade de mudanças semânticas para formar uma base 50/50 de mudanças.

Lembrando que a linha verde corresponde a acurácia (acertos)
		linha azul corresponde ao recall (true positives)/(true positives + false negatives)
		linha vermelha corresponde a precisão (true positives)/(true positives + false positives)

para cada x% da classificação.

Tcom App:	133 observações.
	 	100 são sintáticas.
	 	33 são semânticas.

Saff e Vicceri: 518 Observações.
		38 São Semânticas
		480 São sintáticas
