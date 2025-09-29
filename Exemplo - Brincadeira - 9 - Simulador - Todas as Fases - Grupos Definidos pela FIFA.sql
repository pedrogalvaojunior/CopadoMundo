-- Acessando --
Use Qatar2022
Go

-- Desativando a Contagem de Linhas --
Set NoCount On
Go

Select Replicate('>>>',2) As 'Em execução - Preparando as tabelas internas'
Go

-- Limpando todas as tabelas, para garantir o armazenamento correto dos dados da nova simulação --
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

Select Replicate('>>>',3) As 'Em execução - Populando as tabelas internas com os dados padrões'
Go

-- Populando as Tabelas --
-- Inserindo os 8 Grupos de Selecões --
Insert Into Grupos (SiglaGrupo) Values ('A'),('B'),('C'),('D'),('E'),('F'),('G'),('H')
Go

-- Inserindo os 4 Potes --
Insert Into Potes Default Values
Go 4

-- Inserindo as 32 Selecoes --
Insert Into Selecoes (NomeSelecao, CodigoPote, SiglaContinente)
Values ('Qatar',1,'AF'), ('Brasil',1,'AS'),('Bélgica',1,'EU'),('França',1,'EU'),('Argentina',1,'AS'),('Inglaterra',1,'EU'),('Espanha',1,'EU'),('Portugal',1,'EU'),
            ('México',2,'AC'), ('Holanda',2,'EU'),('Dinamarca',2,'EU'),('Alemanha',2,'EU'),('Uruguai',2,'AS'),('Suíça',2,'EU'),('Estados Unidos',2,'AC'),('Croácia',2,'EU'),
            ('Senegal',3,'AF'), ('Irã',3,'AA'),('Japão',3,'AA'),('Marrocos',3,'AF'),('Sérvia',3,'EU'),('Polônia',3,'EU'),('Coreia do Sul',3,'AA'),('Tunísia',3,'AF'),
            ('Camarões',4,'AF'), ('Canadá',4,'AC'),('Equador',4,'AS'),('Arábia Saudita',4,'AA'),('Gana',4,'AF'),('Austrália',4,'II'),('Costa Rica',4,'II'),('País de Gales',4,'EU')
Go

-- Inserindo as Seleções nos Grupos definidos no Sorteio da Fifa --
Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 1, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Qatar','Equador','Senegal','Holanda')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 2, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Inglaterra','Irã','Estados Unidos','País de Gales')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 3, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Argentina','Arábia Saudita','México','Polônia')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 4, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('França','Austrália','Dinamarca','Tunísia')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 5, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Espanha','Costa Rica','Alemanha','Japão')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 6, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Bélgica','Canadá','Marrocos','Croácia')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 7, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Brasil','Sérvia','Suíça','Camarões')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 8, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Portugal','Gana','Uruguai','Coreia do Sul')
Go

Select Replicate('>>>',4) As 'Em execução - Definição dos Grupos - Sorteio da Fifa'
Go

-- Populandos os respectivos Grupos de acordo com as Seleções Sorteios --
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

Select Replicate('>>>',5) As 'Em execução - Grupos Definidos'
Go

-- Consultando a formação completa de cada Grupo de Seleções --
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

Select Replicate('>>>',6) As 'Em execução - Fase de Grupos - Simulação dos Jogos'
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

Select Replicate('>>>',7) As 'Em execução - Fase de Grupos - Resultados'
Go

-- Consultando os 48 Jogos da Fase de Grupo - Resultados e Vencedores --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Fase de Grupos',
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

Select Replicate('>>>',8) As 'Em execução - Fase de Grupos - Atualizando a Tabela de Classificação'
Go

-- Atualizando as Classificações
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

Select Replicate('>>>',9) As 'Em execução - Definindo as Seleções - Fase - Oitavas de Final'
Go

Select Replicate('>>>',9) As 'Em execução - Seleções Classificadas - Fase - Oitavas de Final'
Go

-- Inserindo as Seleções Classificados de cada Grupo na Tabela ClassificadosOitavasDeFinal --
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

-- Consultando as Seleções Classificadas para as Oitavas de Finais --
Select 'Classificada(o)' As 'Oitavas de Final', G.SiglaGrupo As Grupo, S.NomeSelecao As 'Seleções', Concat(C.ClassificacaoFinalNoGrupo,'º') As 'Classificação'
From ClassificadosOitavasDeFinal C Inner Join Grupos G
															On C.CodigoGrupoSorteio = G.CodigoGrupo
                                                            Inner Join Selecoes S
                                                             On C.CodigoSelecaoSorteio = S.CodigoSelecao

Go

Select Replicate('>>>',10) As 'Em execução - Fase - Oitavas de Final - Simulando os Jogos'
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

Select Replicate('>>>',11) As 'Em execução - Fase - Oitavas de Final - Análise de Empates'
Go

-- Eliminando a ocorrência de possíveis empates nos Jogos de Oitavas de Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo Between 49 And 56 And GolsSelecao1 = GolsSelecao2) >=1
Begin

 Select 'Ocorreu empate(s) no(s) seguinte(s) jogos' As 'Oitavas de Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Oitavas de Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 49 And 56 And GolsSelecao1 = GolsSelecao2)

 Select 'Prorrogação ou Penaltys serão realizados.' As 'Oitavas de Final'
 
 Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

 Set @GolsSelecao1=1
 Set @GolsSelecao2=1

 While @GolsSelecao1 = @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorrogação está sendo realizada.' As 'Oitavas de Final - Prorrogação'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys estão sendo realizados.' As 'Oitavas de Final - Penaltys'

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

Select Replicate('>>>',12) As 'Em execução - Fase - Oitavas de Final - Resultados'
Go

-- Consultando os Jogos da Fase Oitavas de Final - Resultados e Vencedores --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Oitavas de Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  'Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End)
		    When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End)
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

Select Replicate('>>>',13) As 'Em execução - Fase - Quartas de Final - Definindo as Seleções Classificadas'
Go

Select Replicate('>>>',13) As 'Em execução - Fase - Quartas de Final - Seleções Classificadas'
Go

-- Inserindo as Seleções Classificadas para as Quartas de Final --
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
Select 'Classificada(o)' As 'Quartas de Final', S.NomeSelecao As 'Seleções' 
From ClassificadosQuartasDeFinal Q Inner Join Selecoes S
															 On Q.CodigoSelecaoSorteio = S.CodigoSelecao
Go

Select Replicate('>>>',14) As 'Em execução - Fase - Quartas de Final - Simulando os Jogos'
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

Select Replicate('>>>',15) As 'Em execução - Fase - Quartas de Final - Análise de Empates'
Go

-- Eliminando a ocorrência de possíveis empates nos Jogos de Quartas de Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo Between 57 And 60 And GolsSelecao1 = GolsSelecao2) >=1
Begin

 Select 'Ocorreu empate(s) no(s) seguinte(s) jogos' As 'Quartas de Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Quartas de Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 57 And 60 And GolsSelecao1 = GolsSelecao2)

 Select 'Prorrogação ou Penaltys serão realizados.' As 'Quartas de Final'

 Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

 Set @GolsSelecao1=1
 Set @GolsSelecao2=1

 While @GolsSelecao1 = @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorrogação está sendo realizada.' As 'Quartas de Final - Prorrogação'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys estão sendo realizados.' As 'Quartas de Final - Penaltys'

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

Select Replicate('>>>',16) As 'Em execução - Fase - Quartas de Final - Resultados'
Go

-- Consultando os Jogos da Fase Quartas de Final - Resultados e Vencedores --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Quartas de Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  'Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End)
		    When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End)
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

Select Replicate('>>>',17) As 'Em execução - Fase - Semi Final - Definindo as Seleções Classificadas'
Go

 -- Inserindo as Seleções Classificadas para as Semi de Finais --
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
Select 'Classificada(o)' As 'Semi Final' ,S.NomeSelecao As 'Seleções'
From ClassificadosSemiFinais Q Inner Join Selecoes S
                                                     On Q.CodigoSelecaoSorteio = S.CodigoSelecao
Go

Select Replicate('>>>',18) As 'Em execução - Fase - Semi Final - Simulando os Jogos'
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

Select Replicate('>>>',19) As 'Em execução - Fase - Semi Final - Análise de Empates'
Go

-- Eliminando a ocorrência de possíveis empates nos Jogos de Semi Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo Between 61 And 62 And GolsSelecao1 = GolsSelecao2) >=1
Begin

 Select 'Ocorreu empate(s) no(s) seguinte(s) jogos' As 'Semi Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Semi Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 61 And 62 And GolsSelecao1 = GolsSelecao2)

 Select 'Prorrogação ou Penaltys serão realizados.' As 'Semi Final'
 
  Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

  Set @GolsSelecao1=1
  Set @GolsSelecao2=1

  While @GolsSelecao1 =  @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorrogação está sendo realizada.' As 'Semi Final - Prorrogação'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys estão sendo realizados.' As 'Semi Final - Penaltys'

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

Select Replicate('>>>',20) As 'Em execução - Fase - Semi Final - Resultados'
Go

-- Consultando os Jogos da Fase Semi Final - Resultados e Vencedores --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Semi Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  'Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End)
		    When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End)
           End As 'Disputa Final',
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  'Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End)
		    When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then ' Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End)
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

Select Replicate('>>>',21) As 'Em execução - Fase - Terceiro Lugar e Final - Definindo as Seleções'
Go

-- Inserindo as Seleções definidas para disputar o Terceiro Lugar --
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
 
-- Inserindo as Seleções Classificadas para Final --
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

Select Replicate('>>>',22) As 'Em execução - Fase - Terceiro Lugar e Final - Jogos Definidos'
Go

-- Consultando --
Select 'Terceiro e Quarto' As Fase, 
          (Select S.NomeSelecao As 'Seleção' 
		   From ClassificadosTerceiroLugar Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoTerceiroLugar = 1) + ' x '+
          (Select S.NomeSelecao As 'Seleção' 
		   From ClassificadosTerceiroLugar Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoTerceiroLugar = 2) As 'Seleções'
Go

Select 'Final' As Fase, 
          (Select S.NomeSelecao As 'Seleção' 
		   From ClassificadosFinal Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoFinal = 1) + ' x '+
          (Select S.NomeSelecao As 'Seleção' 
		   From ClassificadosFinal Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoFinal = 2) As 'Seleções'
Go

Select Replicate('>>>',23) As 'Em execução - Fase - Terceiro Lugar - Simulando o Jogo'
Go

-- Criando o Jogo da Disputa do Terceiro Lugar --
Declare @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosTerceiroLugar Where CodigoTerceiroLugar = 1)
Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosTerceiroLugar Where CodigoTerceiroLugar = 2)
  
Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
Values (1,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)
Go

Select Replicate('>>>',24) As 'Em execução - Fase - Terceiro Lugar - Análise de Empate'
Go

-- Eliminando a ocorrência de possível empate no Jogo da Disputa do Terceiro Lugar --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo = 63 And GolsSelecao1 = GolsSelecao2) = 1
Begin

 Select 'Ocorreu empate no jogo' As 'Terceiro Lugar',' ' As 'Placar'
 Union All
 Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Terceiro Lugar',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo = 63

 Select 'Prorrogação ou Penaltys serão realizados.' As 'Terceiro Lugar'

 Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

 Set @GolsSelecao1=1
 Set @GolsSelecao2=1

 While @GolsSelecao1 =  @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorrogação está sendo realizada.' As 'Terceiro Lugar - Prorrogação'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys estão sendo realizados.' As 'Terceiro Lugar - Penaltys'

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

Select Replicate('>>>',25) As 'Em execução - Fase - Terceiro Lugar - Resultado'
Go

-- Consultando o resultado do Jogo - Disputa do Terceiro Lugar --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Terceiro e Quarto',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		    Case When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End) End As 'Terceiro Lugar',
   		    Case When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End) End As 'Quarto Lugar'
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

Select Replicate('>>>',26) As 'Em execução - Fase - Final - Simulando o Jogo'
Go

-- Criando o Jogo da Final --
Declare @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosFinal Where CodigoFinal = 1)
Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosFinal Where CodigoFinal = 2)
  
Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
Values (1,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)
Go

Select Replicate('>>>',27) As 'Em execução - Fase - Final - Análise de Empate'
Go

-- Eliminando a ocorrência de possível empate na Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo = 64 And GolsSelecao1 = GolsSelecao2) =1
Begin

 Select 'Ocorreu empate no jogo' As 'Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo = 64

 Select 'Prorrogação ou Penaltys serão realizados.' As 'Final'

  Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

  Set @GolsSelecao1 = 1
  Set @GolsSelecao2 = 1

  While @GolsSelecao1 =  @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorrogação está sendo realizada.' As 'Final - Prorrogação'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys estão sendo realizados.' As 'Final - Penaltys'

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

Select Replicate('>>>',28) As 'Em execução - Fase - Final - Resultado'
Go

-- Consultando o resultado do Jogo - Final --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		    Case When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End) End As 'Fifa World Champions',
   		    Case When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End) End As 'Runner-up'	   
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

-- Apresentando a Classificação Geral --
Exec P_ClassificacaoGeral
Go

-- Processando o Histórico de Simulações - Armazenando os Histórico de Jogos, Classificação e Atualizando a Contagem de Simulações realizadas --
Exec P_HistoricoSimulacao 'F'
Go

-- Atualizando o Histórico - Estatística de Desempenho - 16 Primeiras Posições'
Exec P_AtualizarHistoricoEstatisticaDesempenho
Go

-- Apresentando o Histórico de Finais Disputadas da atual Seleção Campeã Mundial, Jogos e Placares --
Declare @NomeSelecaoExtenso Varchar(30)

Set @NomeSelecaoExtenso=(Select Top 1 SelecaoCampea From HistoricoSimulacao Order By CodigoHistoricoSimulacao Desc)

Select Replicate('>>>',30) As 'Resumo de Conquistas'

Select Seleção, 
           Concat(Convert(Varchar(4),TotalCampea),' vez(es)') As 'Campeã Mundial', 
           Concat(Convert(Varchar(4),TotalViceCampea),' vez(es)') As 'Vice-Campeã Mundial',
           Convert(Varchar(4),TotalCampea+TotalViceCampea) As 'Total de Final(is) Disputada(s)'
From dbo.F_HistoricoDeFinais(@NomeSelecaoExtenso) 

Select Replicate('>>>',31) As 'Histórico de Finais Disputadas'

Select @NomeSelecaoExtenso As ' ',
           'Nº '+Convert(Varchar(4),Row_Number() Over(Order By CodigoHistoricoSimulacao)) As 'Final', 
           Jogo As 'Jogo(s)', 
		   Placar As 'Placar(es)',
		   Format(DataHistoricoSimulacao,'yyyy-mm-dd') As 'Data Realização'
From HistoricoSimulacao
Where SelecaoCampea = @NomeSelecaoExtenso
Or SelecaoVice = @NomeSelecaoExtenso

-- Apresentando o Histórico - Estatística de Desempenho - 16 Primeiras Posições --
Select Replicate('>>>',32) As 'Histórico - Estatística de Desempenho - 16 Primeiras Posições'

Select * from dbo.F_EstatisticaDesempenho16PrimeirasPosicoes(@NomeSelecaoExtenso)
Go

Select Replicate('>>>',33) As 'Processamento da Simulação concluído com Sucesso!!!'
Go