-- Acessando --
Use Qatar2022
Go

-- Criando a Tabela ClassificadosOitavasDeFinal --
Create Table ClassificadosOitavasDeFinal
 (CodigoOitavasDeFinal TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null,
  ClassificacaoFinalNoGrupo TinyInt Not Null)
 Go

-- Simulando as Seleções Classificadas em cada Grupo --
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

 -- Declarando a Variável do Tipo Tabela @JogosComEmpates para armazenar o código dos jogos empatados --
 Declare @JogosComEmpates Table
 (CodigoJogo TinyInt Primary Key)

  Insert Into @JogosComEmpates (CodigoJogo)
  Select CodigoJogo From Jogos Where CodigoJogo Between 49 And 56 And GolsSelecao1 = GolsSelecao2

  Select 'Prorrogação ou Penaltys serão realizados.' As 'Oitavas de Final'
 
  Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

  Set @GolsSelecao1=1
  Set @GolsSelecao2=1

  While @GolsSelecao1 = @GolsSelecao2
   Begin
  
    Set @GolsSelecao1 = Rand()*Rand()*8
    Set @GolsSelecao2 = Rand()*Rand()*8

    While (Select Count(CodigoJogo) From @JogosComEmpates) >0
     Begin

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
         Where CodigoJogo = (Select Top 1 CodigoJogo From @JogosComEmpates)

         Delete From @JogosComEmpates
         Where CodigoJogo = (Select Top 1 CodigoJogo From @JogosComEmpates)
        End
      End
    End
 End
Go

-- Consultando os Jogos da Fase Oitavas de Final - Resultados e Vencedores --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Oitavas de Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End)
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