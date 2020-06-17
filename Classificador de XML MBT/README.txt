Aqui são os geradores de matriz de confusão para sabermos como nosso modelo classifica os testes MBT propriamente.

Arquivos:
	Utilizados:
	sim xml - classificação utilizando levshtein (considera high, low, mixed).
	sim xmlclass - Classificações utilizando classificações de passos anteriores utilizada no momento do estudo de Machine Learning. (Classificação High, low e mixed).
	predictions - para sim xmlclass, um modelo vai me dar uma coleção de predições de passos que eu utilizo para classificar o testcase como um tudo.
	
	Legados:
	sim xml antigo - Classificação usando levshtein (considera apenas high, low).
	sim - são os passos encontrados em um determinado projeto (necessário apenas para a classificação sem utilizar funções de distância).
