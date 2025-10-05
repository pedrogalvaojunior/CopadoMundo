
# 🏆 CopadoMundo - Simulador da Copa do Mundo 2022

Este projeto apresenta um simulador completo da Copa do Mundo FIFA 2022, com funcionalidades que permitem a criação de grupos, execução de partidas, análise de desempenho e geração de estatísticas históricas com base em simulações.

---

## 🚀 Como Executar o Projeto

Para garantir a execução correta, siga **rigorosamente a ordem de numeração** dos arquivos conforme descrito abaixo:

### 🔢 Etapas de Execução

#### 🔧 Preparação do Ambiente
**1 - Criando o Ambiente - Simulador - Copa do Mundo 2022**  
Prepara o ambiente necessário para rodar o simulador. Deve ser executado antes de qualquer outro arquivo.

#### 🎲 Sorteio dos Grupos
Escolha uma das opções abaixo:

- **1.0 - Sorteio Aleatório**  
  Realiza o sorteio dos grupos e distribui as seleções de forma aleatória, com base na ordenação do SQL Server.

- **1.1 - Sorteio Dirigido (FIFA)**  
  Utiliza os grupos oficiais definidos pela FIFA no sorteio realizado em 01/04.

#### 🏆 Simulação das Fases
Execute os arquivos conforme o tipo de sorteio escolhido:

- Se usou **sorteio aleatório (1.0)** → execute o arquivo **9**
- Se usou **sorteio dirigido (1.1)** → execute o arquivo **10**

#### 📊 Análises Estatísticas
Após a simulação, execute os arquivos abaixo para visualizar os resultados:

- **11 - Histórico de Finais Disputadas**
- **12 - Classificações Totais Obtidas**

---

## 📦 Funcionalidades por Versão

### 🔸 Versão 1.0 (01/04/22 a 15/04/22)
- Simulação completa das fases: grupos, oitavas, quartas, semi, final e terceiro lugar
- Análise de empates com prorrogação ou pênaltis
- Classificação final das seleções por pontuação e critérios FIFA
- Histórico de jogos, classificações e campeões

### 🔸 Versão 2.0 (18/04/22 a 05/05/22)
- Estatísticas de desempenho nas finais e posições
- Nova barra de progresso
- Redução do tempo médio de processamento para ~0.07s

### 🔸 Versão 3.0 (10/05/22 a 15/06/22)
- Atualização das seleções participantes
- Correção de erros em simulações de pênaltis
- Inclusão dos arquivos 11 e 12

### 🔸 Versão 4.0 (06/09/22 a 07/09/22)
- Correções nas estatísticas das 16 primeiras posições
- Acréscimo do arquivo 8.3

### 🔸 Versão 4.1 (09/11/23 a 10/11/23)
- Correção na definição das 16 seleções classificadas para as oitavas

### 🔸 Versão 4.2 (09/01/24 a 11/01/24)
- Correções nos arquivos 1.0 e 2.0 relacionados à definição das seleções da FIFA

### 🔸 Versão 4.3 (27/09/25 a 02/10/25)
- Inclusão da coluna `ProrrogacaoOuPenaltys` para controle de empates
- Simulação condicional de prorrogação ou pênaltis
- Melhor apresentação dos resultados finais
- Correções nas fases de quartas e semi-final
- Redução do tempo médio de processamento para ~0.05s

---

## 📌 Observações
- Para melhor experiência, siga a ordem de execução dos arquivos conforme indicado.
- As versões posteriores incluem melhorias de desempenho e correções importantes.
- O projeto é ideal para fins didáticos, estatísticos e simulações esportivas.
