%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Classe de documento LATEX para confecção do relatório de ESO e tabéms       %%
%% TCC do curso de Bacharelado em Ciência da Computação da Universidade        %%
%% Federal Rural de Pernambuco                                                 %%
%%                                                                             %%
%% Autor: Rian Pinheiro - rian.gabriel@gmail.com                               %%                                      %%
%% Correções desta versão: Armstrong Lohãns - lohansdemelo1108@gmail.com       %%                                                        %%
%%                                                                             %%
%% Data: Julho de 2016                                                         %%
%% Data das correções: Agosto de 2022                                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\NeedsTeXFormat{LaTeX2e}
   \ProvidesClass{bcc}[2016/07/08 v1.0 Modelo BCC::UAG::UFRPE]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Definição de extensão da classe REPORT - Papel A4, FONTE 12pt              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper,12pt]{report} %210 mm X 294 mm
%%------------------------------------------------------------------------------
%% Habilita a utilização de arroba
%%------------------------------------------------------------------------------
\makeatletter

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      LISTA DE PACOTES REQUERIDOS PARA A UTILIZAÇÃO DESTA CLASSE            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[T1]{fontenc} % Definição da codificação das fontes como T1
\RequirePackage{graphicx} % Inclusão de imagens
\RequirePackage{setspace} % Definição dos espaçamemtos entre linhas
\RequirePackage{calc} % Aceitação de notação infixa
\RequirePackage{fancyhdr} % Personalização de cabeçalhos e rodapés
\RequirePackage{listings} % Inclusão de código fonte de diversas linguagens
% \RequirePackage{pslatex} % Utilização de fontes PostScript Tipo 1
\RequirePackage[utf8]{inputenc} % Uso caracteres especiais UTF8
\RequirePackage[a4paper]{geometry} % Para ajustar o papel
\RequirePackage[portuguese,english]{babel} % Para habilitar os macros de linguas
\RequirePackage[numbers]{natbib} % Estilo das referências
\RequirePackage{url} % Para lidar com URLs
\RequirePackage{doc} % Contém a definição da logomarca do BibTex
\RequirePackage{color,colortbl} % Permite "pintar" as tabelas
\RequirePackage[active]{srcltx} % Busca inversa do dvi para o tex
\RequirePackage{ifthen} % Utilização de condicionais em latex
\RequirePackage{xparse}

%%%%%%%%%%%%%%%%%%%%%%%%%% Modificações Avançadas %%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath} %
\RequirePackage{amsthm} %
\RequirePackage{bbm}
\RequirePackage{amssymb} %
\RequirePackage{amscd} %
\RequirePackage{units} %
\RequirePackage{dsfont}
\RequirePackage{booktabs}% Linhas das tabelas
\RequirePackage{indentfirst}
\RequirePackage{enumerate}
\RequirePackage{rotating} % Rotacionar tabelas
\RequirePackage[ruled,chapter]{algorithm}
\RequirePackage{algpseudocode}
\floatname{algorithm}{Algoritmo}
\renewcommand{\listalgorithmname}{Lista de Algoritmos}


\RequirePackage{tikz} % Pacote para desenhos (fig:diagrama)
\RequirePackage{xcolor} % Definição das cores
\RequirePackage{bm} % Pacote para criação do modelo de RSsF (fig:model_rssf)
\RequirePackage{float} %
\RequirePackage{hyperref} %
\RequirePackage{fancybox}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage[nowarn,nonumberlist,toc,hyperfirst=false]{glossaries}
\RequirePackage{subfig} %
\RequirePackage{xfrac}
\RequirePackage{xcolor}
\definecolor{black}{gray}{0}
\definecolor{white}{rgb}{1,1,1}
\definecolor{Blue}{rgb}{0,0,0.5}
\newtheorem{teorema}{Teorema}[section]
% \newtheorem{lema}{Lema}[section]






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                DECLARAÇÃO DE OPÇÕES: TESE E DISSERTAÇÃO                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%------------------------------------------------------------------------------
%% Define tese como padrão
%%------------------------------------------------------------------------------
\newboolean{eso}
\setboolean{eso}{false}


%%------------------------------------------------------------------------------
%% Declara a opção de ESO
%%------------------------------------------------------------------------------
\DeclareOption{eso}{%
    \setboolean{eso}{true}
    \typeout{Tipo de Documento: Relatório de Estágio.}
}

%%------------------------------------------------------------------------------
%% Executa as opções
%%------------------------------------------------------------------------------
\ProcessOptions\relax

%% Desativa o agrupamento por capitulos no lof e lot
\DeclareRobustCommand*{\deactivateaddvspace}{\let\addvspace\@gobble}
\AtBeginDocument{
  \addtocontents{lof}{\deactivateaddvspace}
  \addtocontents{lot}{\deactivateaddvspace}
}
%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                 DEFINIÇÃO DO LAYOUT DO DOCUMENTO                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%------------------------------------------------------------------------------
%%  TAMANHOS VERTICAIS - COPIADO DO ESTILO PADRÃO DA ABNT - Pacote abntex.cls
%%------------------------------------------------------------------------------
% A distancia entre o topo do cabeçalho e o topo do texto é de 1cm,
% isto é, 1cm=\headheight+\headsep
% ...mas, nós consideramos a profundidade do cabeçallho, adicionando 2mm.
\setlength{\headsep}{1.2cm-\headheight}
% A distância entre a borda do papel e o número deve ser de 2cm
% 2cm=\topmargin+\voffset+1in
\setlength{\topmargin}{2cm-1in-\voffset}
% A borda inferior deve ser de 2cm
% \paperheight=\topmargin+\voffset+1in+\headheight+\headsep+\textheight+2cm
\setlength{\textheight}%
{\paperheight-\topmargin-\voffset-1in-\headheight-\headsep-2cm}

%%------------------------------------------------------------------------------
%% TAMANHOS HORIZONTAIS - COPIADO DO ESTILO PADRÃO DA ABNT - Pacote abntex.cls
%%------------------------------------------------------------------------------
% A margem esquerda é de 3cm e a direita é igual a 2cm.
\setlength{\oddsidemargin}{3cm-\hoffset-1in}
% para compatibilidade com impressão frente e verso, o tamanho das margens
%deve ser alterado
\setlength{\evensidemargin}{2cm-\hoffset-1in}
% \paperwidth=\textwidth+\oddsidemargin+\hoffset+1in+2cm
\setlength{\textwidth}{\paperwidth-\oddsidemargin-\hoffset-1in-2cm}

%%------------------------------------------------------------------------------
%% Define o cabeçalho das páginas
%%------------------------------------------------------------------------------
% Limpa qualquer configuração anterior
\fancyhf{}

% Define a aparição do nome da seção no cabeçalho(esquerda)
\lhead{\nouppercase\rightmark}

% Define a aparição do número da página no cabeçalho(direita)
\rhead{\thepage} % Número da página

% Define a largura da barra
\renewcommand{\headrulewidth}{0.6pt}

% Define a altura do cabeçalho
\addtolength{\headheight}{3.05pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                           DEFINIÇÃO DOS COMANDOS                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%------------------------------------------------------------------------------
%% Definição do comando CAPA
%%----------------------------------------------------------------------------
\newcommand{\capa}{%
    \thispagestyle{empty}%
    \begin{center} % Alinhamento
    \begin{figure}
        \centering
        \includegraphics[scale=0.3]{Figuras/UFAPE_logo.png}
        \label{ufape}
        \end{figure}
     \vspace*{0.2cm} \large UNIVERSIDADE FEDERAL DO AGRESTE DE PERNAMBUCO \\
      \vspace*{4.5cm} \large  \textbf{\MakeUppercase \@autorNome} \\%
      \vspace*{4cm} \Large \textbf{\@titulo} \\%
      \normalsize \vfill GARANHUNS \\
      \vspace*{.3cm} \@ano \\
      \vspace*{1.8cm}
    \end{center}%
    \folhaDeRosto%
    \aprovacao%
    \renewcommand{\thepage}{\roman{page}} \setcounter{page}{0}
    \normalsize%
}



%%------------------------------------------------------------------------------
%% Definição do comando EMPRESA
%%----------------------------------------------------------------------------
\newcommand{\@logo}{LOGO}
\newcommand{\logo}[2]{
    \renewcommand{\@logo}{
        \includegraphics[width=#2\linewidth]{#1}
    }
}

\newcommand{\@empresaNome}{~}
\newcommand{\empresaNome}[1]{
   \renewcommand{\@empresaNome}{#1}
}
\newcommand{\@empresaArea}{~}
\newcommand{\empresaArea}[1]{
   \renewcommand{\@empresaArea}{#1}
}
\newcommand{\@empresaPeriodo}{~}
\newcommand{\empresaPeriodo}[1]{
   \renewcommand{\@empresaPeriodo}{#1}
}
\newcommand{\@empresaCargaH}{~}
\newcommand{\empresaCargaH}[1]{
   \renewcommand{\@empresaCargaH}{#1}
}
\newcommand{\@empresaRemuneracao}{~}
\newcommand{\empresaRemuneracao}[1]{
   \renewcommand{\@empresaRemuneracao}{#1}
}
\newcommand{\@empresaSupervisorEmail}{~}
\newcommand{\empresaSupervisorEmail}[1]{
   \renewcommand{\@empresaSupervisorEmail}{#1}
}


%%------------------------------------------------------------------------------
%% Definição do comando FOLHA DE ROSTO
%%------------------------------------------------------------------------------
\newcommand{\folhaDeRosto}{
    \newpage%
    \thispagestyle{empty}%
    \begin{center}
        \Large
        \@autorNome\\
        \vspace*{3cm} \LARGE \textbf{\@titulo} \\%
    \end{center}
    \vspace*{2cm}
    \hspace{5 cm}%

    \ifthenelse{\boolean{eso}}%
    {\vspace*{-1cm}
        \begin{center}{\setlength\extrarowheight{5pt}
        \begin{tabular}{|p{.14\linewidth}|p{.8\linewidth}|}
         \hline
         \multirow{6}{*}{\@logo} & EMPRESA: \@empresaNome \\ \cline{2-2}
         & ÁREA DE ATUAÇÃO: \@empresaArea \\ \cline{2-2}
         & PERÍODO DE REALIZAÇÃO: \@empresaPeriodo \\ \cline{2-2}
         & CARGA HORÁRIA SEMANAL: \@empresaCargaH \\ \cline{2-2}
         & REMUNERAÇÃO/AJUDA: \@empresaRemuneracao \\ \cline{2-2}
         & SUPERVISOR/E-MAIL: \@empresaSupervisorEmail \\ \hline
        \end{tabular}
        }\end{center}}
        {}
       \vspace*{1cm}
       \large%
       \hfill%
    \begin{minipage}{ 11 cm }%
        \ifthenelse{\boolean{eso}}%
       {\@texto.}%
        {\@texto.}%
    \end{minipage}%
    \begin{flushright}
        \vspace*{2cm} \large%
        \ifthenelse{\boolean{orientadorDoisExiste}}{Orientadores:}{Orientador:}%
        \\%
        \vspace*{0.5cm}%
        \Large%
        \@orientadorNome\\
        \vspace*{0.2cm}%
        \@orientadorDoisNome\\
        \vspace*{0.2cm}%
        \@orientadorTresNome\\
        \normalsize%
        \vfill%
        Garanhuns, \@data%
    \end{flushright}
    \normalsize%
}%

%%------------------------------------------------------------------------------
%% Contador de assinaturas
%%------------------------------------------------------------------------------
\newcounter{numeroDeAssinaturas}
\setcounter{numeroDeAssinaturas}{2}

%%------------------------------------------------------------------------------
%% Início do termo de aprovação
%%------------------------------------------------------------------------------
\newcommand{\aprovacao}{
    \newpage%
    \thispagestyle{empty}%
    \ifthenelse{\boolean{eso}}%
        {\@texto, aprovada pela comissão examinadora que abaixo assina.}%
        {\@texto, aprovada pela comissão examinadora que abaixo assina.}%
    \begin{center}
        \normalsize%
        % 6 assinaturas: 0.7cm
        % 5 assinaturas: 1.5cm
        % 4 assinaturas: 3.0cm
        % 3 assinaturas: 4.0cm
        % 2 assinaturas: 4.0cm
        \ifthenelse{\value{numeroDeAssinaturas} = 2}{\vspace*{4cm}}{}%
        \ifthenelse{\value{numeroDeAssinaturas} = 3}{\vspace*{4cm}}{}%
        \ifthenelse{\value{numeroDeAssinaturas} = 4}{\vspace*{3cm}}{}%
        \ifthenelse{\value{numeroDeAssinaturas} = 5}{\vspace*{1.5cm}}{}%
        \ifthenelse{\value{numeroDeAssinaturas} = 6}{\vspace*{0.7cm}}{}%
        \ifthenelse{\value{numeroDeAssinaturas} = 7}{\vspace*{0.5cm}}{}%
        \rule{9cm}{0.02cm}\\%
        \vspace*{0.2cm}%
        \@orientadorNome~-~Orientador\@orientadorSexo~\\
        \@orientadorDepartamento\\
        \@orientadorInstituicao\\
        \ifthenelse{\boolean{orientadorDoisExiste}}{
            \vspace*{1cm}%
            \rule{9cm}{0.02cm}\\%
            \vspace*{0.2cm}%
            \@orientadorDoisNome~-~Orientador\@orientadorDoisSexo\\
            \@orientadorDoisDepartamento\\
            \@orientadorDoisInstituicao\\
        }{}
        \ifthenelse{\boolean{orientadorTresExiste}}{
            \vspace*{1cm}%
            \rule{9cm}{0.02cm}\\%
            \vspace*{0.2cm}%
            \@orientadorTresNome~-~Orientador\@orientadorTresSexo\\
            \@orientadorTresDepartamento\\
            \@orientadorTresInstituicao\\
        }{}
        \vspace*{1cm}%
        \rule{9cm}{0.02cm}\\%
        \vspace*{0.2cm}%
        \@examinadorNome~-~Examinador\@examinadorSexo\\
        \@examinadorDepartamento\\
        \@examinadorInstituicao\\
        \ifthenelse{\boolean{examinadorDoisExiste}}{
            \vspace*{1cm}%
            \rule{9cm}{0.02cm}\\%
            \vspace*{0.2cm}%
            \@examinadorDoisNome~-~Examinador\@examinadorDoisSexo\\
            \@examinadorDoisDepartamento\\
            \@examinadorDoisInstituicao\\
        }{}
        \ifthenelse{\boolean{examinadorTresExiste}}{
            \vspace*{1cm}%
            \rule{9cm}{0.02cm}\\%
            \vspace*{0.2cm}%
            \@examinadorTresNome~-~Examinador\@examinadorTresSexo\\
            \@examinadorTresDepartamento\\
            \@examinadorTresInstituicao\\
        }{}
        \ifthenelse{\boolean{examinadorQuatroExiste}}{
            \vspace*{1cm}%
            \rule{9cm}{0.02cm}\\%
            \vspace*{0.2cm}%
             \@examinadorQuatroNome~-~Examinador\@examinadorQuatroSexo\\
            \@examinadorQuatroDepartamento\\
            \@examinadorQuatroInstituicao\\
        }{}
        \vfill%
        Garanhuns, \@data%
    \end{center}
    \normalsize%
}


%%------------------------------------------------------------------------------
%% Definição do comando INICIO para formatação de páginas
%%------------------------------------------------------------------------------
\newcommand{\inicio}{%
    \newpage%
    %Números no estilo arábico
    \renewcommand{\thepage}{\arabic{page}}%
    %Contador de página = 1
    \setcounter{page}{1}%
    %Espaçamento 1,5
    \onehalfspacing%
    \lhead{\nouppercase\rightmark}
}%


%%------------------------------------------------------------------------------
%% Definição do comando AUTOR
%%------------------------------------------------------------------------------
\newcommand{\@autorNome}{}
\newcommand{\@autorEmail}{}
\newcommand{\autor}[2]{
    \renewcommand{\@autorNome}{#1}
     \renewcommand{\@autorEmail}{#2}
}



%%------------------------------------------------------------------------------
%% Definição do comando ORIENTADOR
%%------------------------------------------------------------------------------
\newcommand{\@orientadorNome}{}
\newcommand{\@orientadorDepartamento}{}
\newcommand{\@orientadorInstituicao}{}
\newcommand{\@orientadorSexo}{~}
\NewDocumentCommand \orientador{ s mmm }
{%
  \IfBooleanT {#1}
  {%
    \renewcommand{\@orientadorSexo}{a}
  }
    \renewcommand{\@orientadorNome}{#2}
    \renewcommand{\@orientadorDepartamento}{#3}
    \renewcommand{\@orientadorInstituicao}{#4}
}

% \newcommand{\orientador}[3]{
%     \renewcommand{\@orientadorNome}{#1}
%     \renewcommand{\@orientadorDepartamento}{#2}
%     \renewcommand{\@orientadorInstituicao}{#3}
% }

%%------------------------------------------------------------------------------
%% Definição do comando ORIENTADOR 2
%%------------------------------------------------------------------------------
\newcommand{\@orientadorDoisNome}{~}
\newcommand{\@orientadorDoisDepartamento}{~}
\newcommand{\@orientadorDoisInstituicao}{~}
\newcommand{\@orientadorDoisSexo}{~}
\newboolean{orientadorDoisExiste}
\setboolean{orientadorDoisExiste}{false}
\NewDocumentCommand \orientadorDois{ s mmm }
{%
  \IfBooleanT {#1}
  {%
    \renewcommand{\@orientadorDoisSexo}{a}
  }
    \renewcommand{\@orientadorDoisNome}{#2}
    \renewcommand{\@orientadorDoisDepartamento}{#3}
    \renewcommand{\@orientadorDoisInstituicao}{#4}
    \setboolean{orientadorDoisExiste}{true}
    \addtocounter{numeroDeAssinaturas}{1}
}


%%------------------------------------------------------------------------------
%% Definição do comando ORIENTADOR 3
%%------------------------------------------------------------------------------
\newcommand{\@orientadorTresNome}{~}
\newcommand{\@orientadorTresDepartamento}{~}
\newcommand{\@orientadorTresInstituicao}{~}
\newcommand{\@orientadorTresSexo}{~}
\newboolean{orientadorTresExiste}
\setboolean{orientadorTresExiste}{false}
\NewDocumentCommand \orientadorTres{ s mmm }
{%
  \IfBooleanT {#1}
  {%
    \renewcommand{\@orientadorTresSexo}{a}
  }
    \renewcommand{\@orientadorTresNome}{#2}
    \renewcommand{\@orientadorTresDepartamento}{#3}
    \renewcommand{\@orientadorTresInstituicao}{#4}
    \setboolean{orientadorTresExiste}{true}
    \addtocounter{numeroDeAssinaturas}{1}
}

%%------------------------------------------------------------------------------
%% Definição do comando EXAMINADOR
%%------------------------------------------------------------------------------
\newcommand{\@examinadorNome}{~}
\newcommand{\@examinadorDepartamento}{~}
\newcommand{\@examinadorInstituicao}{~}
\newcommand{\@examinadorSexo}{~}
\NewDocumentCommand \examinador{ s mmm }
{%
  \IfBooleanT {#1}
  {%
    \renewcommand{\@examinadorSexo}{a}
  }
    \renewcommand{\@examinadorNome}{#2}
    \renewcommand{\@examinadorDepartamento}{#3}
    \renewcommand{\@examinadorInstituicao}{#4}
}

%%------------------------------------------------------------------------------
%% Definição do comando EXAMINADOR 2
%%------------------------------------------------------------------------------
\newcommand{\@examinadorDoisNome}{~}
\newcommand{\@examinadorDoisDepartamento}{~}
\newcommand{\@examinadorDoisInstituicao}{~}
\newcommand{\@examinadorDoisSexo}{~}
\newboolean{examinadorDoisExiste}
\setboolean{examinadorDoisExiste}{false}
\NewDocumentCommand \examinadorDois{ s mmm }
{%
  \IfBooleanT {#1}
  {%
    \renewcommand{\@examinadorDoisSexo}{a}
  }
    \renewcommand{\@examinadorDoisNome}{#2}
    \renewcommand{\@examinadorDoisDepartamento}{#3}
    \renewcommand{\@examinadorDoisInstituicao}{#4}
    \setboolean{examinadorDoisExiste}{true}
    \addtocounter{numeroDeAssinaturas}{1}
}

%%------------------------------------------------------------------------------
%% Definição do comando EXAMINADOR 3
%%------------------------------------------------------------------------------
\newcommand{\@examinadorTresNome}{~}
\newcommand{\@examinadorTresDepartamento}{~}
\newcommand{\@examinadorTresInstituicao}{~}
\newcommand{\@examinadorTresSexo}{~}
\newboolean{examinadorTresExiste}
\setboolean{examinadorTresExiste}{false}
\NewDocumentCommand \examinadorTres{ s mmm }
{%
  \IfBooleanT {#1}
  {%
    \renewcommand{\@examinadorTresSexo}{a}
  }
    \renewcommand{\@examinadorTresNome}{#2}
    \renewcommand{\@examinadorTresDepartamento}{#3}
    \renewcommand{\@examinadorTresInstituicao}{#4}
    \setboolean{examinadorTresExiste}{true}
    \addtocounter{numeroDeAssinaturas}{1}
}

%%------------------------------------------------------------------------------
%% Definição do comando EXAMINADOR 4
%%------------------------------------------------------------------------------
\newcommand{\@examinadorQuatroNome}{~}
\newcommand{\@examinadorQuatroDepartamento}{~}
\newcommand{\@examinadorQuatroInstituicao}{~}
\newcommand{\@examinadorQuatroSexo}{~}
\newboolean{examinadorQuatroExiste}
\setboolean{examinadorQuatroExiste}{false}
\NewDocumentCommand \examinadorQuatro{ s mmm }
{%
  \IfBooleanT {#1}
  {%
    \renewcommand{\@examinadorQuatroSexo}{a}
  }
    \renewcommand{\@examinadorQuatroNome}{#2}
    \renewcommand{\@examinadorQuatroDepartamento}{#3}
    \renewcommand{\@examinadorQuatroInstituicao}{#4}
    \setboolean{examinadorQuatroExiste}{true}
    \addtocounter{numeroDeAssinaturas}{1}
}


%%------------------------------------------------------------------------------
%% Definição do comando TITULO
%%------------------------------------------------------------------------------
\newcommand{\@titulo}{}
\newcommand{\titulo}[1]{\renewcommand{\@titulo}{#1}}

%%------------------------------------------------------------------------------
%% Definição do comando DATA
%%------------------------------------------------------------------------------
\newcommand{\@data}{}
\newcommand{\dataMesAno}[3]{
    \renewcommand{\@data}{
        #1 de #2 de #3
    }%%Fim de @DATA
    \newcommand{\@ano}{#3}
    \newcommand{\@mes}{#2}
    \newcommand{\@dia}{#1}
}%Fim de DATA

\newcommand{\@palavrasChave}{}
\newcommand{\palavrasChave}[3]{
  \renewcommand{\@palavrasChave}{
      #1. #2. #3}
  \newcommand{\@palavrasChaveA}{
      #1}
  \newcommand{\@palavrasChaveB}{
      #2}
  \newcommand{\@palavrasChaveC}{
      #3}}

\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{
  \renewcommand{\@keywords}{
      #1}}


\ifthenelse{\boolean{eso}}
{
  \newcommand{\@texto}{Relatório de Estágio apresentado ao Curso de Ciência da Computação, como requisito necessário para avaliação final na disciplina de Estágio Supervisionado Obrigatório}
}
{%else
  \newcommand{\@texto}{Monografia apresentada como requisito parcial para obtenção do grau de Bacharel em Ciência da Computação da Universidade Federal do Agreste de Pernambuco}
}

% \ifthenelse{\boolean{tese}}{
%   \newcommand{\@grau}{Doutor}
%   }
%   {\newcommand{\@grau}{Mestre}}

  \renewcommand{\qedsymbol}{$\blacksquare$}
  \newenvironment{prova}{\begin{proof}[\bf\textsc{Prova.}]}{\end{proof}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                       DEFINIÇÃO DE AMBIENTES                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%------------------------------------------------------------------------------
%% Definição do ambiente RESUMO
%%------------------------------------------------------------------------------
\newenvironment{resumo}{
    \onehalfspacing
    \thispagestyle{empty}
    \chapter*{\centering Resumo}
}{\vspace*{.8cm} %
 \\ \textbf{Palavras-chave:}~\@palavrasChave
 }

%%------------------------------------------------------------------------------
%% Redefinição do ambiente ABSTRACT
%%------------------------------------------------------------------------------
\renewenvironment{abstract}{
    \onehalfspacing
    \thispagestyle{empty}
    \chapter*{\centering Abstract}
}{\vspace*{.8cm} %
 \\ \textbf{Keywords:}~\@keywords
\thispagestyle{empty}
}

%%------------------------------------------------------------------------------
%% Definição do ambiente AGRADECIMENTOS
%%------------------------------------------------------------------------------
\newenvironment{agradecimentos}{
    \onehalfspacing
    \thispagestyle{empty}
    \chapter*{\centering Agradecimentos}
}{}




%%------------------------------------------------------------------------------
%% Definição do ambiente CODIGO
%%------------------------------------------------------------------------------

% Ambiente COPIADO do pacote listings.sty (Ambiente:lstlisting)
% \lstnewenvironment{codigo}[2][]
%     {\lst@TestEOLChar{#2}
%      \lstset{#1}
%      \csname\@lst @SetFirstNumber\endcsname}
%     {\csname\@lst @SaveFirstNumber\endcsname}

% Configurações de exibição
% \lstset{basicstyle=\small\tt,keywordstyle=\tt,numbers=left,  language=R, frame=trbl}
% \lstset{commentstyle=\textit}
% \lstset{emph={kappa,var,args,length,mean,set,as,real,file,paste,write,table,commandArgs,print}}
% \renewcommand{\lstlistlistingname}{Lista de Códigos}
% \renewcommand{\lstlistingname}{Algoritmo}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                 CONFIGURAÇÕES PARA O CORPO DO DOCUMENTO                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{


    \normalsize
    %% Configura para utilizar o cabeçalho e rodapé definidos anteriormente.
    \pagestyle{fancy}
    %% Define o módulo de citação abreviado(Harvard)
    %% \citationmode{abbr}
    %% Define o estilo bibligráfico agsm(Harvard)
    %%\bibliographystyle{agsm}
\addto\captionsportuguese{\def\bibname{\centerline{Referências Bibliográficas}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\hypersetup{
%
linktocpage = {false},
plainpages = {false},
pageanchor={false},
hidelinks,% = {true},
% linkcolor = {black},
% citecolor = {black},
% citebordercolor = {black},
% urlcolor = {black},
% linkbordercolor={black},
% unicode = {true},
pdftitle = {\@titulo},
pdfauthor = {\@autorNome},
pdfcreator = {LaTeX2e},
pdfsubject = {},
pdfkeywords={\@palavrasChaveA ,} {\@palavrasChaveB ,} {\@palavrasChaveC},
% pdffitwindow = {false},
% pdfstartview = {FitH},
% pdftoolbar = {true},
% pdfpagemode = {UseOutlines},
pdfview = {XYZ null null null}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \makeglossary
}


\newglossarystyle{mylist}{%
\renewenvironment{theglossary}%
{\begin{description}[font=\normalfont,leftmargin=.19\linewidth,labelwidth=.14\linewidth]}{\end{description}}%
\renewcommand*{\glossaryheader}{}%
\renewcommand*{\glsgroupheading}[1]{}%
\renewcommand*{\glsgroupskip}{}%
\renewcommand*{\glossaryentryfield}[5]{%
\item [\glstarget{##1}{##2}]% Name
:~~##3% Description
% end of row
}}



% Traduzindo algorithm
\renewcommand{\algorithmicprocedure}{\textbf{função}}
\renewcommand{\algorithmicend}{\textbf{fim}}
\renewcommand{\algorithmicif}{\textbf{se}}
\renewcommand{\algorithmicwhile}{\textbf{enquanto}}
\renewcommand{\algorithmicdo}{\textbf{faça}}
\renewcommand{\algorithmicreturn}{\textbf{retorne}}
\renewcommand{\algorithmicthen}{\textbf{então}}
\renewcommand{\algorithmicfor}{\textbf{para}}
\renewcommand{\algorithmicelse}{\textbf{senão}}
%%------------------------------------------------------------------------------
%% Desabilita a utilização de arroba
%%------------------------------------------------------------------------------
\makeatother

