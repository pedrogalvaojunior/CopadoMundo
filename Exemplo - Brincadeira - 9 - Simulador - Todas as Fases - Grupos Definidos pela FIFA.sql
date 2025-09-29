-- Acessando --
Use Qatar2022
Go

-- Desativando a Contagem de Linhas --
Set NoCount On
Go

Select Replicate('>>>',2) As 'Em execu��o - Preparando as tabelas internas'
Go

-- Limpando todas as tabelas, para garantir o armazenamento correto dos dados da nova simula��o --
Truncate Table Grupos
Truncate Table Potes
Truncate Table Selecoes
Truncate Table Sorteios
Truncate Table Jogos
Truncate Table GrupoA
Truncate Table GrupoB
Truncate Table GrupoC
Truncate Table GrupoD
Truncate Table GrupoE
Truncate Table GrupoF
Truncate Table GrupoG
Truncate Table GrupoH
Truncate Table ClassificadosOitavasDeFinal
Truncate Table ClassificadosQuartasDeFinal
Truncate Table ClassificadosSemiFinais
Truncate Table ClassificadosTerceiroLugar
Truncate Table ClassificadosFinal
Truncate Table ClassificacaoGeral
Go

Select Replicate('>>>',3) As 'Em execu��o - Populando as tabelas internas com os dados padr�es'
Go

-- Populando as Tabelas --
-- Inserindo os 8 Grupos de Selec�es --
Insert Into Grupos (SiglaGrupo) Values ('A'),('B'),('C'),('D'),('E'),('F'),('G'),('H')
Go

-- Inserindo os 4 Potes --
Insert Into Potes Default Values
Go 4

-- Inserindo as 32 Selecoes --
Insert Into Selecoes (NomeSelecao, CodigoPote, SiglaContinente)
Values ('Qatar',1,'AF'), ('Brasil',1,'AS'),('B�lgica',1,'EU'),('Fran�a',1,'EU'),('Argentina',1,'AS'),('Inglaterra',1,'EU'),('Espanha',1,'EU'),('Portugal',1,'EU'),
            ('M�xico',2,'AC'), ('Holanda',2,'EU'),('Dinamarca',2,'EU'),('Alemanha',2,'EU'),('Uruguai',2,'AS'),('Su��a',2,'EU'),('Estados Unidos',2,'AC'),('Cro�cia',2,'EU'),
            ('Senegal',3,'AF'), ('Ir�',3,'AA'),('Jap�o',3,'AA'),('Marrocos',3,'AF'),('S�rvia',3,'EU'),('Pol�nia',3,'EU'),('Coreia do Sul',3,'AA'),('Tun�sia',3,'AF'),
            ('Camar�es',4,'AF'), ('Canad�',4,'AC'),('Equador',4,'AS'),('Ar�bia Saudita',4,'AA'),('Gana',4,'AF'),('Austr�lia',4,'II'),('Costa Rica',4,'II'),('Pa�s de Gales',4,'EU')
Go

-- Inserindo as Sele��es nos Grupos definidos no Sorteio da Fifa --
Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 1, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Qatar','Equador','Senegal','Holanda')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 2, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Inglaterra','Ir�','Estados Unidos','Pa�s de Gales')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 3, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Argentina','Ar�bia Saudita','M�xico','Pol�nia')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 4, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Fran�a','Austr�lia','Dinamarca','Tun�sia')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 5, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Espanha','Costa Rica','Alemanha','Jap�o')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 6, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('B�lgica','Canad�','Marrocos','Cro�cia')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 7, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Brasil','S�rvia','Su��a','Camar�es')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 8, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Portugal','Gana','Uruguai','Coreia do Sul')
Go

Select Replicate('>>>',4) As 'Em execu��o - Defini��o dos Grupos - Sorteio da Fifa'
Go

-- Populandos os respectivos Grupos de acordo com as Sele��es Sorteios --
Insert Into GrupoA (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 1
Go

Insert Into GrupoB(CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 2
Go

Insert Into GrupoC (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 3
Go

Insert Into GrupoD (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 4
Go

Insert Into GrupoE (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 5
Go

Insert Into GrupoF (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 6
Go

Insert Into GrupoG (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 7
Go

Insert Into GrupoH (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 8
Go

Select Replicate('>>>',5) As 'Em execu��o - Grupos Definidos'
Go

-- Consultando a forma��o completa de cada Grupo de Sele��es --
;With CTEGrupoA (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
																						   And S.CodigoGrupo = 1),
CTEGrupoB (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
																						   And S.CodigoGrupo = 2),
CTEGrupoC (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
																						   And S.CodigoGrupo = 3),
CTEGrupoD (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 4),
CTEGrupoE (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 5),
CTEGrupoF (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 6),
 CTEGrupoG (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 7),
CTEGrupoH (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 8)
Select Row_Number() Over(Order By A.Posicao) As 'Pote',
           A.NomeSelecao As 'Grupo A', B.NomeSelecao As 'Grupo B', 
           C.NomeSelecao As 'Grupo C', D.NomeSelecao As 'Grupo D',
           E.NomeSelecao As 'Grupo E', F.NomeSelecao As 'Grupo F',
		   G.NomeSelecao As 'Grupo G', H.NomeSelecao As 'Grupo H'
From CTEGrupoA A Inner Join CTEGrupoB B
                                On A.Posicao = B.Posicao
							   Inner Join CTEGrupoC C
                                On A.Posicao = C.Posicao
							   Inner Join CTEGrupoD D
                                On A.Posicao = D.Posicao
							   Inner Join CTEGrupoE E
                                On A.Posicao = E.Posicao
							   Inner Join CTEGrupoF F
                                On A.Posicao = F.Posicao
							   Inner Join CTEGrupoG G
                                On A.Posicao = G.Posicao
							   Inner Join CTEGrupoH H
                                On A.Posicao = H.Posicao
Go

Select Replicate('>>>',6) As 'Em execu��o - Fase de Grupos - Simula��o dos Jogos'
Go

-- Criando os 48 Jogos da Fase de Grupos --
Declare @CodigoGrupoSorteio TinyInt, @CodigoJogoNoGrupo TinyInt, 
             @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt, @CodigoSelecao3 TinyInt, @CodigoSelecao4 TinyInt

Set @CodigoGrupoSorteio=1

While (Select Count(CodigoJogo) From Jogos) <=48
 Begin

   Set @CodigoSelecao1 = (Select CodigoSelecao From Sorteios Where CodigoGrupo = @CodigoGrupoSorteio And PosicaoGrupo=1)
   Set @CodigoSelecao2 = (Select CodigoSelecao From Sorteios Where CodigoGrupo = @CodigoGrupoSorteio And  PosicaoGrupo=2)
   Set @CodigoSelecao3 = (Select CodigoSelecao From Sorteios Where CodigoGrupo = @CodigoGrupoSorteio And  PosicaoGrupo=3)
   Set @CodigoSelecao4 = (Select CodigoSelecao From Sorteios Where CodigoGrupo = @CodigoGrupoSorteio And  PosicaoGrupo=4)
   
   Set @CodigoJogoNoGrupo = 1   
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao1,@CodigoSelecao2, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

   Set @CodigoJogoNoGrupo = 2
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao3,@CodigoSelecao4, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

   Set @CodigoJogoNoGrupo = 3
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao1,@CodigoSelecao3, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

   Set @CodigoJogoNoGrupo = 4
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao2,@CodigoSelecao4, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

   Set @CodigoJogoNoGrupo = 5
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao1,@CodigoSelecao4, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

   Set @CodigoJogoNoGrupo = 6
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao2,@CodigoSelecao3, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

  If (Select Count(CodigoJogo) From Jogos) In (6,12,18,24,30,36,42)
   Set @CodigoGrupoSorteio = @CodigoGrupoSorteio+1
  
  If (Select Count(CodigoJogo) From Jogos) = 48
   Break

End
Go

Select Replicate('>>>',7) As 'Em execu��o - Fase de Grupos - Resultados'
Go

-- Consultando os 48 Jogos da Fase de Grupo - Resultados e Vencedores --
Select Concat('Jogo n� ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Fase de Grupos',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao,' Venceu')
		    When J.GolsSelecao1 = J.GolsSelecao2 Then 'Empate'
		   Else
		    Concat(S2.NomeSelecao,' Venceu')
           End As ' '
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Order By J.CodigoJogo
Go

Select Replicate('>>>',8) As 'Em execu��o - Fase de Grupos - Atualizando a Tabela de Classifica��o'
Go

-- Atualizando as Classifica��es
Exec P_ClassificacaoGrupoA
Go

Exec P_ClassificacaoGrupoB
Go

Exec P_ClassificacaoGrupoC
Go

Exec P_ClassificacaoGrupoD
Go

Exec P_ClassificacaoGrupoE
Go

Exec P_ClassificacaoGrupoF
Go

Exec P_ClassificacaoGrupoG
Go

Exec P_ClassificacaoGrupoH
Go

Select Replicate('>>>',9) As 'Em execu��o - Definindo as Sele��es - Fase - Oitavas de Final'
Go

Select Replicate('>>>',9) As 'Em execu��o - Sele��es Classificadas - Fase - Oitavas de Final'
Go

-- Inserindo as Sele��es Classificados de cada Grupo na Tabela ClassificadosOitavasDeFinal --
Insert Into ClassificadosOitavasDeFinal (CodigoGrupoSorteio, CodigoSelecaoSorteio, ClassificacaoFinalNoGrupo)
Select CodigoGrupoSorteio, CodigoSelecaoSorteio, ClassificacaoFinalGrupo From GrupoA
Where ClassificacaoFinalGrupo In (1,2)
Union 
Select CodigoGrupoSorteio, CodigoSelecaoSorteio, ClassificacaoFinalGrupo From GrupoB
Where ClassificacaoFinalGrupo In (1,2)
Union 
Select CodigoGrupoSorteio, CodigoSelecaoSorteio, ClassificacaoFinalGrupo From GrupoC
Where ClassificacaoFinalGrupo In (1,2)
Union 
Select CodigoGrupoSorteio, CodigoSelecaoSorteio, ClassificacaoFinalGrupo From GrupoD
Where ClassificacaoFinalGrupo In (1,2)
Union 
Select CodigoGrupoSorteio, CodigoSelecaoSorteio, ClassificacaoFinalGrupo From GrupoE
Where ClassificacaoFinalGrupo In (1,2)
Union 
Select CodigoGrupoSorteio, CodigoSelecaoSorteio, ClassificacaoFinalGrupo From GrupoF
Where ClassificacaoFinalGrupo In (1,2)
Union 
Select CodigoGrupoSorteio, CodigoSelecaoSorteio, ClassificacaoFinalGrupo From GrupoG
Where ClassificacaoFinalGrupo In (1,2)
Union 
Select CodigoGrupoSorteio, CodigoSelecaoSorteio, ClassificacaoFinalGrupo From GrupoH
Where ClassificacaoFinalGrupo In (1,2)
Order By CodigoGrupoSorteio, ClassificacaoFinalGrupo
Go

-- Consultando as Sele��es Classificadas para as Oitavas de Finais --
Select 'Classificada(o)' As 'Oitavas de Final', G.SiglaGrupo As Grupo, S.NomeSelecao As 'Sele��es', Concat(C.ClassificacaoFinalNoGrupo,'�') As 'Classifica��o'
From ClassificadosOitavasDeFinal C Inner Join Grupos G
															On C.CodigoGrupoSorteio = G.CodigoGrupo
                                                            Inner Join Selecoes S
                                                             On C.CodigoSelecaoSorteio = S.CodigoSelecao

Go

Select Replicate('>>>',10) As 'Em execu��o - Fase - Oitavas de Final - Simulando os Jogos'
Go

-- Criando os 8 Jogos da Fase de Oitavas de Final --
Declare @CodigoGrupoSorteioInicial TinyInt, @CodigoGrupoSorteioFinal TinyInt, @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoGrupoSorteioInicial = 1
Set @CodigoGrupoSorteioFinal = 2
Set @CodigoSelecao1 = 1
Set @CodigoSelecao2 = 1

While (Select Count(CodigoJogo) From Jogos) <= 56
 Begin
 
  Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosOitavasDeFinal
                                          Where CodigoGrupoSorteio=@CodigoGrupoSorteioInicial
                                          And ClassificacaoFinalNoGrupo=1)

  Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosOitavasDeFinal
										  Where CodigoGrupoSorteio=@CodigoGrupoSorteioFinal
										  And ClassificacaoFinalNoGrupo=2)

  Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
  Values (@CodigoGrupoSorteioInicial,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

  Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosOitavasDeFinal
										   Where CodigoGrupoSorteio=@CodigoGrupoSorteioFinal
											And ClassificacaoFinalNoGrupo=1)

  Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosOitavasDeFinal
										   Where CodigoGrupoSorteio=@CodigoGrupoSorteioInicial
											And ClassificacaoFinalNoGrupo=2)

  Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
  Values (@CodigoGrupoSorteioFinal,@CodigoSelecao1,@CodigoSelecao2, 2, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

  If (Select Count(CodigoJogo) From Jogos) In (50,52,54,56)
   Begin
    Set @CodigoGrupoSorteioInicial = @CodigoGrupoSorteioInicial+2
    Set @CodigoGrupoSorteioFinal = @CodigoGrupoSorteioFinal+2
   End

  If (Select Count(CodigoJogo) From Jogos) = 56
   Break
End
Go

Select Replicate('>>>',11) As 'Em execu��o - Fase - Oitavas de Final - An�lise de Empates'
Go

-- Eliminando a ocorr�ncia de poss�veis empates nos Jogos de Oitavas de Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo Between 49 And 56 And GolsSelecao1 = GolsSelecao2) >=1
Begin

 Select 'Ocorreu empate(s) no(s) seguinte(s) jogos' As 'Oitavas de Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo n� ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Oitavas de Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 49 And 56 And GolsSelecao1 = GolsSelecao2)

 Select 'Prorroga��o ou Penaltys ser�o realizados.' As 'Oitavas de Final'
 
 Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

 Set @GolsSelecao1=1
 Set @GolsSelecao2=1

 While @GolsSelecao1 = @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorroga��o est� sendo realizada.' As 'Oitavas de Final - Prorroga��o'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys est�o sendo realizados.' As 'Oitavas de Final - Penaltys'

     Set @StatusProrrogacaoOuPenaltys = 'PE'
    End

   If @GolsSelecao1 <> @GolsSelecao2
    Begin
     Update Jogos
     Set GolsSelecao1 = J.GolsSelecao1+@GolsSelecao1,
           GolsSelecao2 = J.GolsSelecao2+@GolsSelecao2,
           ProrrogacaoOuPenaltys = @StatusProrrogacaoOuPenaltys
     From Jogos J
     Where CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 49 And 56 And GolsSelecao1 = GolsSelecao2)
 
     Break
    End
  End
End
Go

Select Replicate('>>>',12) As 'Em execu��o - Fase - Oitavas de Final - Resultados'
Go

-- Consultando os Jogos da Fase Oitavas de Final - Resultados e Vencedores --
Select Concat('Jogo n� ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Oitavas de Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  'Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorroga��o' End)
		    When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorroga��o' End)
           End As 'Vencedor'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 49 And 56
Order By J.CodigoJogo
Go

Select Replicate('>>>',13) As 'Em execu��o - Fase - Quartas de Final - Definindo as Sele��es Classificadas'
Go

Select Replicate('>>>',13) As 'Em execu��o - Fase - Quartas de Final - Sele��es Classificadas'
Go

-- Inserindo as Sele��es Classificadas para as Quartas de Final --
Insert Into ClassificadosQuartasDeFinal
Select G.CodigoGrupo, 
           Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then S1.CodigoSelecao
		    When J.GolsSelecao2 > J.GolsSelecao1 Then S2.CodigoSelecao
           End As CodigoSelecaoSorteio
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 49 And 56
Order By J.CodigoJogo
Go

-- Consultando --
Select 'Classificada(o)' As 'Quartas de Final', S.NomeSelecao As 'Sele��es' 
From ClassificadosQuartasDeFinal Q Inner Join Selecoes S
															 On Q.CodigoSelecaoSorteio = S.CodigoSelecao
Go

Select Replicate('>>>',14) As 'Em execu��o - Fase - Quartas de Final - Simulando os Jogos'
Go

-- Criando os 4 Jogos da Fase de Quartas de Final --
Declare @CodigoQuartasDeFinal1 TinyInt, @CodigoQuartasDeFinal2 TinyInt, @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoQuartasDeFinal1 = 1
Set @CodigoQuartasDeFinal2 = 2

Set @CodigoSelecao1=1
Set @CodigoSelecao2=1

While @CodigoQuartasDeFinal1 <=7
 Begin
 
  Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosQuartasDeFinal Where CodigoQuartasDeFinal = @CodigoQuartasDeFinal1)
  Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosQuartasDeFinal Where CodigoQuartasDeFinal = @CodigoQuartasDeFinal2)
  
  Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
  Values (1,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)
  
  Set @CodigoQuartasDeFinal1 = @CodigoQuartasDeFinal1 + 2
  Set @CodigoQuartasDeFinal2 = @CodigoQuartasDeFinal2 + 2

End
Go

Select Replicate('>>>',15) As 'Em execu��o - Fase - Quartas de Final - An�lise de Empates'
Go

-- Eliminando a ocorr�ncia de poss�veis empates nos Jogos de Quartas de Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo Between 57 And 60 And GolsSelecao1 = GolsSelecao2) >=1
Begin

 Select 'Ocorreu empate(s) no(s) seguinte(s) jogos' As 'Quartas de Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo n� ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Quartas de Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 57 And 60 And GolsSelecao1 = GolsSelecao2)

 Select 'Prorroga��o ou Penaltys ser�o realizados.' As 'Quartas de Final'

 Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

 Set @GolsSelecao1=1
 Set @GolsSelecao2=1

 While @GolsSelecao1 = @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorroga��o est� sendo realizada.' As 'Quartas de Final - Prorroga��o'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys est�o sendo realizados.' As 'Quartas de Final - Penaltys'

     Set @StatusProrrogacaoOuPenaltys = 'PE'
    End

   If @GolsSelecao1 <> @GolsSelecao2
    Begin
     Update Jogos
     Set GolsSelecao1 = J.GolsSelecao1+@GolsSelecao1,
           GolsSelecao2 = J.GolsSelecao2+@GolsSelecao2,
           ProrrogacaoOuPenaltys = @StatusProrrogacaoOuPenaltys
     From Jogos J
     Where CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 57 And 60 And GolsSelecao1 = GolsSelecao2)
 
     Break
    End
  End
End
Go

Select Replicate('>>>',16) As 'Em execu��o - Fase - Quartas de Final - Resultados'
Go

-- Consultando os Jogos da Fase Quartas de Final - Resultados e Vencedores --
Select Concat('Jogo n� ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Quartas de Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  'Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorroga��o' End)
		    When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorroga��o' End)
           End As 'Vencedor'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 57 And 60
Order By J.CodigoJogo
Go

Select Replicate('>>>',17) As 'Em execu��o - Fase - Semi Final - Definindo as Sele��es Classificadas'
Go

 -- Inserindo as Sele��es Classificadas para as Semi de Finais --
Insert Into ClassificadosSemiFinais
Select G.CodigoGrupo, 
           Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then S1.CodigoSelecao
		    When J.GolsSelecao2 > J.GolsSelecao1 Then S2.CodigoSelecao
           End As CodigoSelecaoSorteio
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 57 And 60
Order By J.CodigoJogo
Go

-- Consultando --
Select 'Classificada(o)' As 'Semi Final' ,S.NomeSelecao As 'Sele��es'
From ClassificadosSemiFinais Q Inner Join Selecoes S
                                                     On Q.CodigoSelecaoSorteio = S.CodigoSelecao
Go

Select Replicate('>>>',18) As 'Em execu��o - Fase - Semi Final - Simulando os Jogos'
Go

-- Criando os 2 Jogos da Fase de Semi Final --
Declare @CodigoSemiFinal1 TinyInt, @CodigoSemiFinal2 TinyInt, @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoSemiFinal1 = 1
Set @CodigoSemiFinal2 = 2

Set @CodigoSelecao1=1
Set @CodigoSelecao2=1

While @CodigoSemiFinal1 <=3
 Begin
 
  Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosSemiFinais Where CodigoSemiFinais = @CodigoSemiFinal1)
  Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosSemiFinais Where CodigoSemiFinais = @CodigoSemiFinal2)
  
  Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
  Values (1,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)
  
  Set @CodigoSemiFinal1 = @CodigoSemiFinal1 + 2
  Set @CodigoSemiFinal2 = @CodigoSemiFinal2 + 2

End
Go

Select Replicate('>>>',19) As 'Em execu��o - Fase - Semi Final - An�lise de Empates'
Go

-- Eliminando a ocorr�ncia de poss�veis empates nos Jogos de Semi Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo Between 61 And 62 And GolsSelecao1 = GolsSelecao2) >=1
Begin

 Select 'Ocorreu empate(s) no(s) seguinte(s) jogos' As 'Semi Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo n� ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Semi Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 61 And 62 And GolsSelecao1 = GolsSelecao2)

 Select 'Prorroga��o ou Penaltys ser�o realizados.' As 'Semi Final'
 
  Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

  Set @GolsSelecao1=1
  Set @GolsSelecao2=1

  While @GolsSelecao1 =  @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorroga��o est� sendo realizada.' As 'Semi Final - Prorroga��o'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys est�o sendo realizados.' As 'Semi Final - Penaltys'

     Set @StatusProrrogacaoOuPenaltys = 'PE'
    End

   If @GolsSelecao1 <> @GolsSelecao2
    Begin
     Update Jogos
     Set GolsSelecao1 = J.GolsSelecao1+@GolsSelecao1,
           GolsSelecao2 = J.GolsSelecao2+@GolsSelecao2,
           ProrrogacaoOuPenaltys = @StatusProrrogacaoOuPenaltys
     From Jogos J
     Where CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 61 And 62 And GolsSelecao1 = GolsSelecao2)
 
     Break
    End
  End
End
Go

Select Replicate('>>>',20) As 'Em execu��o - Fase - Semi Final - Resultados'
Go

-- Consultando os Jogos da Fase Semi Final - Resultados e Vencedores --
Select Concat('Jogo n� ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Semi Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  'Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorroga��o' End)
		    When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorroga��o' End)
           End As 'Disputa Final',
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  'Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorroga��o' End)
		    When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then ' Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorroga��o' End)
           End As 'Disputa Terceiro Lugar'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 61 And 62
Order By J.CodigoJogo
Go

Select Replicate('>>>',21) As 'Em execu��o - Fase - Terceiro Lugar e Final - Definindo as Sele��es'
Go

-- Inserindo as Sele��es definidas para disputar o Terceiro Lugar --
Insert Into ClassificadosTerceiroLugar
Select G.CodigoGrupo, 
           Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then S2.CodigoSelecao
		    When J.GolsSelecao2 > J.GolsSelecao1 Then S1.CodigoSelecao
           End As CodigoSelecaoSorteio
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 61 And 62
Order By J.CodigoJogo
Go
 
-- Inserindo as Sele��es Classificadas para Final --
Insert Into ClassificadosFinal
Select G.CodigoGrupo, 
           Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then S1.CodigoSelecao
		    When J.GolsSelecao2 > J.GolsSelecao1 Then S2.CodigoSelecao
           End As CodigoSelecaoSorteio
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 61 And 62
Order By J.CodigoJogo
Go

Select Replicate('>>>',22) As 'Em execu��o - Fase - Terceiro Lugar e Final - Jogos Definidos'
Go

-- Consultando --
Select 'Terceiro e Quarto' As Fase, 
          (Select S.NomeSelecao As 'Sele��o' 
		   From ClassificadosTerceiroLugar Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoTerceiroLugar = 1) + ' x '+
          (Select S.NomeSelecao As 'Sele��o' 
		   From ClassificadosTerceiroLugar Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoTerceiroLugar = 2) As 'Sele��es'
Go

Select 'Final' As Fase, 
          (Select S.NomeSelecao As 'Sele��o' 
		   From ClassificadosFinal Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoFinal = 1) + ' x '+
          (Select S.NomeSelecao As 'Sele��o' 
		   From ClassificadosFinal Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoFinal = 2) As 'Sele��es'
Go

Select Replicate('>>>',23) As 'Em execu��o - Fase - Terceiro Lugar - Simulando o Jogo'
Go

-- Criando o Jogo da Disputa do Terceiro Lugar --
Declare @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosTerceiroLugar Where CodigoTerceiroLugar = 1)
Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosTerceiroLugar Where CodigoTerceiroLugar = 2)
  
Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
Values (1,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)
Go

Select Replicate('>>>',24) As 'Em execu��o - Fase - Terceiro Lugar - An�lise de Empate'
Go

-- Eliminando a ocorr�ncia de poss�vel empate no Jogo da Disputa do Terceiro Lugar --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo = 63 And GolsSelecao1 = GolsSelecao2) = 1
Begin

 Select 'Ocorreu empate no jogo' As 'Terceiro Lugar',' ' As 'Placar'
 Union All
 Select Concat('Jogo n� ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Terceiro Lugar',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo = 63

 Select 'Prorroga��o ou Penaltys ser�o realizados.' As 'Terceiro Lugar'

 Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

 Set @GolsSelecao1=1
 Set @GolsSelecao2=1

 While @GolsSelecao1 =  @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorroga��o est� sendo realizada.' As 'Terceiro Lugar - Prorroga��o'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys est�o sendo realizados.' As 'Terceiro Lugar - Penaltys'

     Set @StatusProrrogacaoOuPenaltys = 'PE'
    End

   If @GolsSelecao1 <> @GolsSelecao2
    Begin
     Update Jogos
     Set GolsSelecao1 = J.GolsSelecao1+@GolsSelecao1,
           GolsSelecao2 = J.GolsSelecao2+@GolsSelecao2,
           ProrrogacaoOuPenaltys = @StatusProrrogacaoOuPenaltys
     From Jogos J
     Where CodigoJogo = 63
 
     Break
    End
  End
End
Go

Select Replicate('>>>',25) As 'Em execu��o - Fase - Terceiro Lugar - Resultado'
Go

-- Consultando o resultado do Jogo - Disputa do Terceiro Lugar --
Select Concat('Jogo n� ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Terceiro e Quarto',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		    Case When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorroga��o' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorroga��o' End) End As 'Terceiro Lugar',
   		    Case When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorroga��o' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorroga��o' End) End As 'Quarto Lugar'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo = 63
Order By J.CodigoJogo
Go

WaitFor Delay '00:00:05'
Go

Select Replicate('>>>',26) As 'Em execu��o - Fase - Final - Simulando o Jogo'
Go

-- Criando o Jogo da Final --
Declare @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosFinal Where CodigoFinal = 1)
Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosFinal Where CodigoFinal = 2)
  
Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
Values (1,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)
Go

Select Replicate('>>>',27) As 'Em execu��o - Fase - Final - An�lise de Empate'
Go

-- Eliminando a ocorr�ncia de poss�vel empate na Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo = 64 And GolsSelecao1 = GolsSelecao2) =1
Begin

 Select 'Ocorreu empate no jogo' As 'Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo n� ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo = 64

 Select 'Prorroga��o ou Penaltys ser�o realizados.' As 'Final'

  Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

  Set @GolsSelecao1 = 1
  Set @GolsSelecao2 = 1

  While @GolsSelecao1 =  @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorroga��o est� sendo realizada.' As 'Final - Prorroga��o'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys est�o sendo realizados.' As 'Final - Penaltys'

     Set @StatusProrrogacaoOuPenaltys = 'PE'
    End

   If @GolsSelecao1 <> @GolsSelecao2
    Begin

     Update Jogos
     Set GolsSelecao1 = J.GolsSelecao1+@GolsSelecao1,
           GolsSelecao2 = J.GolsSelecao2+@GolsSelecao2,
           ProrrogacaoOuPenaltys = @StatusProrrogacaoOuPenaltys
     From Jogos J
     Where CodigoJogo = 64
 
     Break
    End
  End
End
Go

Select Replicate('>>>',28) As 'Em execu��o - Fase - Final - Resultado'
Go

-- Consultando o resultado do Jogo - Final --
Select Concat('Jogo n� ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		    Case When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorroga��o' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorroga��o' End) End As 'Fifa World Champions',
   		    Case When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorroga��o' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorroga��o' End) End As 'Runner-up'	   
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo = 64
Go

Select Replicate('>>>',29) As 'Atualizando as tabelas internas'
Go

-- Apresentando a Classifica��o Geral --
Exec P_ClassificacaoGeral
Go

-- Processando o Hist�rico de Simula��es - Armazenando os Hist�rico de Jogos, Classifica��o e Atualizando a Contagem de Simula��es realizadas --
Exec P_HistoricoSimulacao 'F'
Go

-- Atualizando o Hist�rico - Estat�stica de Desempenho - 16 Primeiras Posi��es'
Exec P_AtualizarHistoricoEstatisticaDesempenho
Go

-- Apresentando o Hist�rico de Finais Disputadas da atual Sele��o Campe� Mundial, Jogos e Placares --
Declare @NomeSelecaoExtenso Varchar(30)

Set @NomeSelecaoExtenso=(Select Top 1 SelecaoCampea From HistoricoSimulacao Order By CodigoHistoricoSimulacao Desc)

Select Replicate('>>>',30) As 'Resumo de Conquistas'

Select Sele��o, 
           Concat(Convert(Varchar(4),TotalCampea),' vez(es)') As 'Campe� Mundial', 
           Concat(Convert(Varchar(4),TotalViceCampea),' vez(es)') As 'Vice-Campe� Mundial',
           Convert(Varchar(4),TotalCampea+TotalViceCampea) As 'Total de Final(is) Disputada(s)'
From dbo.F_HistoricoDeFinais(@NomeSelecaoExtenso) 

Select Replicate('>>>',31) As 'Hist�rico de Finais Disputadas'

Select @NomeSelecaoExtenso As ' ',
           'N� '+Convert(Varchar(4),Row_Number() Over(Order By CodigoHistoricoSimulacao)) As 'Final', 
           Jogo As 'Jogo(s)', 
		   Placar As 'Placar(es)',
		   Format(DataHistoricoSimulacao,'yyyy-mm-dd') As 'Data Realiza��o'
From HistoricoSimulacao
Where SelecaoCampea = @NomeSelecaoExtenso
Or SelecaoVice = @NomeSelecaoExtenso

-- Apresentando o Hist�rico - Estat�stica de Desempenho - 16 Primeiras Posi��es --
Select Replicate('>>>',32) As 'Hist�rico - Estat�stica de Desempenho - 16 Primeiras Posi��es'

Select * from dbo.F_EstatisticaDesempenho16PrimeirasPosicoes(@NomeSelecaoExtenso)
Go

Select Replicate('>>>',33) As 'Processamento da Simula��o conclu�do com Sucesso!!!'
Go