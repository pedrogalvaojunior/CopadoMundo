-- Acessando --
Use Qatar2022
Go

-- Criando a Tabela ClassificacaoGeral --
Create Table ClassificacaoGeral
 (CodigoClassificacaoGeral TinyInt Identity(1,1) Primary Key Clustered,
  PosicaoClassificacaoGeral TinyInt Default 0,
  CodigoSelecao TinyInt Not Null,
  Jogos TinyInt Default 0,
  Pontos TinyInt Default 0,
  Vitorias TinyInt Default 0,
  Empates TinyInt Default 0,
  Derrotas TinyInt Default 0,
  CartoesAmarelos TinyInt Default 0,
  CartoesVermelhos TinyInt Default 0,
  GolsPro Int Default 0,
  GolsContra Int Default 0,
  SaldoGols As (GolsPro - GolsContra))
Go

-- Implementando a Classificaca��o Geral ap�s o encerramento da Copa do Mundo --
Create Or Alter Procedure P_ClassificacaoGeral
As
Begin

-- Removendo as classifica��es anteriores --
Truncate Table ClassificacaoGeral

-- Desativando a Contagem de Linhas --
Set NoCount On

-- Inserindo as 32 Selecoes na ClassificacaoGeral --
Insert Into ClassificacaoGeral (CodigoSelecao)
Select CodigoSelecao From Selecoes

-- Identificando a Quantidade de Jogos, GolsPro, GolsContra, Carto�es Amarelos e Vermelhos --
Declare @CodigoSelecao TinyInt

Set @CodigoSelecao = 1

While @CodigoSelecao <=32
Begin

 ;With CTEResumoJogos (CodigoSelecao, Jogos, Gols, GolsContra, Amarelos, Vermelhos)
 As

 (Select CodigoSelecao1, Count(CodigoJogo) As Jogos, Sum(GolsSelecao1) As GolsPro, Sum(GolsSelecao2) As GolsContra,              
             Sum(CartoesAmareloSelecao1) As Amarelos, Sum(CartoesVermelhoSelecao1) As Vermelhos
 From Jogos
 Where CodigoSelecao1=@CodigoSelecao
 Group By CodigoSelecao1

 Union

 Select CodigoSelecao2, Count(CodigoJogo) As Jogos, Sum(GolsSelecao2) As GolsPro, Sum(GolsSelecao1) As GolsContra,   
            Sum(CartoesAmareloSelecao2) As Amarelos, Sum(CartoesVermelhoSelecao2) As Vermelhos
 From Jogos
 Where CodigoSelecao2=@CodigoSelecao
 Group By CodigoSelecao2)

 Update ClassificacaoGeral
 Set Jogos = CR.Jogos,
       GolsPro = CR.GolsPro,
	   GolsContra = CR.GolsContra,
       CartoesAmarelos = CR.Amarelos,
	   CartoesVermelhos = CR.Vermelhos
 From ClassificacaoGeral C Cross Apply (Select CodigoSelecao, Sum(Jogos) As Jogos, Sum(Gols) As GolsPro, Sum(GolsContra) As GolsContra,
                                                                             Sum(Amarelos) As Amarelos, Sum(Vermelhos) As Vermelhos
																  From CTEResumoJogos
																  Where CodigoSelecao = C.CodigoSelecao
																  Group By CodigoSelecao) As CR (CodigoSelecao, Jogos, GolsPro, GolsContra, Amarelos, Vermelhos)

 Where C.CodigoSelecao = @CodigoSelecao

 Set @CodigoSelecao = @CodigoSelecao + 1
End

-- Identificando a Quantidade de Vitorias, Empates, Derrotas e Pontos --
Set @CodigoSelecao = 1

While @CodigoSelecao <=32
Begin

 ;With CTEResumoVitorasEmpatesDerrotas(CodigoSelecao, Vitorias, Derrotas, Empates)
 As
 (
  Select CodigoSelecao1,
             IsNull(Case When GolsSelecao1 > GolsSelecao2 Then 1 End,0) As Vitorias,
             IsNull(Case When GolsSelecao1 < GolsSelecao2 Then 1 End,0) As Derrotas,
             IsNull(Case When GolsSelecao1 = GolsSelecao2 Then 1 End,0) As Empates
  From Jogos
  Where CodigoSelecao1=@CodigoSelecao

  Union All

  Select CodigoSelecao2,
             IsNull(Case When GolsSelecao2 > GolsSelecao1 Then 1 End,0) As Vitorias,
             IsNull(Case When GolsSelecao2 < GolsSelecao1 Then 1 End,0) As Derrotas,
             IsNull(Case When GolsSelecao2 = GolsSelecao1 Then 1 End,0) As Empates
  From Jogos
  Where CodigoSelecao2=@CodigoSelecao
 ),
  CTEResumoPontuacao (CodigoSelecao, TotalVitorias, TotalDerrotas, TotalEmpates, Pontos)
  As
  (
   Select CodigoSelecao, Sum(Vitorias) As V, Sum(Derrotas) As D, Sum(Empates) As E,
              Sum(Vitorias)*3+Sum(Empates)*1 As Pontos
   From CTEResumoVitorasEmpatesDerrotas
   Where CodigoSelecao = @CodigoSelecao
   Group By CodigoSelecao
  )
  
  Update ClassificacaoGeral
  Set Vitorias = CT.TotalVitorias,
		Derrotas = CT.TotalDerrotas,
        Empates = CT.TotalEmpates,
		Pontos = CT.Pontos
  From ClassificacaoGeral C Inner Join CTEResumoPontuacao CT
											  On C.CodigoSelecao = CT.CodigoSelecao
  Where C.CodigoSelecao = @CodigoSelecao

 Set @CodigoSelecao = @CodigoSelecao + 1
End

-- Atualizando a Classifica��o Geral --
;With CTEPosicaoClassificacaoGeral (Classificacao, CodigoSelecao)
As
(
Select Row_Number() Over (Order By Pontos Desc, Jogos Desc, Vitorias Desc, Empates Desc, Derrotas Desc,
                                              GolsPro Desc, GolsContra Desc, SaldoGols Desc, 
											  CartoesAmarelos Desc, CartoesVermelhos Desc) As 'Classifica��o',
		  CodigoSelecao
From ClassificacaoGeral
)
Update ClassificacaoGeral
Set PosicaoClassificacaoGeral = CP.Classificacao
From ClassificacaoGeral C Inner Join CTEPosicaoClassificacaoGeral CP
										    On C.CodigoSelecao = CP.CodigoSelecao

-- Apresentando - Classifica��o Final - World Champion, Runner-Up, Terceiro e Quarto --
Select 'Classifica��o Final - World Champion, Runner-Up, Terceiro e Quarto' As 'Qatar 2022'
Union All
Select Case When J.GolsSelecao1 > J.GolsSelecao2 Then '1� lugar: '+S1.NomeSelecao Else '1� lugar: '+S2.NomeSelecao End As 'Classifica��o'
From ClassificadosFinal C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 64

Union All

Select Case When J.GolsSelecao1 < J.GolsSelecao2 Then '2� lugar: '+S1.NomeSelecao Else '2� lugar: '+S2.NomeSelecao End As 'Classifica��o'
From ClassificadosFinal C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 64

Union All

Select Case When J.GolsSelecao1 > J.GolsSelecao2 Then '3� lugar: '+S1.NomeSelecao Else '3� lugar: '+S2.NomeSelecao End As 'Classifica��o'
From ClassificadosTerceiroLugar C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 63

Union All

Select Case When J.GolsSelecao1 < J.GolsSelecao2 Then '4� lugar: '+S1.NomeSelecao Else '4� lugar: '+S2.NomeSelecao End As 'Classifica��o'
From ClassificadosTerceiroLugar C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 63

-- Apresentando - Classifica��o Final - Posicionamento - Sele��es --
Select 'Classifica��o Final - Posicionamento - Sele��es' As 'Qatar 2022'
Union All
Select Case When J.GolsSelecao1 > J.GolsSelecao2 Then '1� lugar: '+S1.NomeSelecao Else '1� lugar: '+S2.NomeSelecao End As 'Classifica��o'
From ClassificadosFinal C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 64

Union All

Select Case When J.GolsSelecao1 < J.GolsSelecao2 Then '2� lugar: '+S1.NomeSelecao Else '2� lugar: '+S2.NomeSelecao End As 'Classifica��o'
From ClassificadosFinal C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 64

Union All

Select Case When J.GolsSelecao1 > J.GolsSelecao2 Then '3� lugar: '+S1.NomeSelecao Else '3� lugar: '+S2.NomeSelecao End As 'Classifica��o'
From ClassificadosTerceiroLugar C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 63

Union All

Select Case When J.GolsSelecao1 < J.GolsSelecao2 Then '4� lugar: '+S1.NomeSelecao Else '4� lugar: '+S2.NomeSelecao End As 'Classifica��o'
From ClassificadosTerceiroLugar C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 63
Union All

Select Concat(Row_Number() Over (Order By PosicaoClassificacaoGeral Asc)+4,'� lugar: ', S.NomeSelecao) As 'Classifica��o'
From ClassificacaoGeral C Inner Join Selecoes S
										 On C.CodigoSelecao = S.CodigoSelecao 
Where C.PosicaoClassificacaoGeral >=5

-- Apresentando - Classifica��o Final - Performance Geral - Sele��es - Considerando todas as fases disputadas --
Select 'Classifica��o Final - Performance Geral - Sele��es - Considerando todas as fases disputadas' As 'Qatar 2022'
Select Concat(Row_Number() Over (Order By Case PosicaoClassificacaoGeral When 2 Then Pontos - 3 Else Pontos End Desc, Jogos Desc, Vitorias Desc, Empates Desc, Derrotas Desc ),'� lugar: ', S.NomeSelecao) As 'Classifica��o',
		   C.Jogos, C.Vitorias, C.Empates, C.Derrotas,
		   C.GolsPro As 'Gols Pr�', C.GolsContra As 'Gols Contra', C.SaldoGols As 'Saldo de Gols',
		   C.CartoesAmarelos  As Amarelos, C.CartoesVermelhos As Vermelhos,
		   Convert(Varchar(4),Ceiling((Convert(Numeric(2,0),C.Pontos)/21.00)*100))+'%' As '% de Pontos'
From ClassificacaoGeral C Inner Join Selecoes S
										 On C.CodigoSelecao = S.CodigoSelecao 

-- Apresentando - Classifica��o Geral - Desempenho ao longo da Copa do Mundo - Crit�rios - Pontos, Jogos, Vit�rias, Empates --
Select 'Classifica��o Geral - Desempenho ao longo da Copa do Mundo - Crit�rios - Pontos, Jogos, Vit�rias, Empates, Derrotas...' As 'Qatar 2022'
Select Concat(Row_Number() Over (Order By Pontos Desc, Jogos Desc, Vitorias Desc, Empates Desc, Derrotas Desc,
                                                                          GolsPro Desc, GolsContra Desc, SaldoGols Desc, 
											                              CartoesAmarelos Desc, CartoesVermelhos Desc),
           '� lugar: ', S.NomeSelecao) As 'Classifica��o',
		   C.Pontos,
		   C.Jogos, C.Vitorias, C.Empates, C.Derrotas,
		   C.GolsPro As 'Gols Pr�', C.GolsContra As 'Gols Contra', C.SaldoGols As 'Saldo de Gols',
		   C.CartoesAmarelos  As Amarelos, C.CartoesVermelhos As Vermelhos,
		   Round(Percent_Rank() Over (Order By Case PosicaoClassificacaoGeral 
																			When 1 Then (Pontos - 3) 
																			When 2 Then (Pontos - 3) 
																		  Else Pontos
																		 End),2) As 'Ranking'
From ClassificacaoGeral C Inner Join Selecoes S
										 On C.CodigoSelecao = S.CodigoSelecao 
Order By Pontos Desc
End
Go