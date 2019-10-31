% LaTeX definitions for PPGSI-EACH-USP
%
% Created by Jomi Hubner & Rafael Bordini, june 2001, as SBC 2001 style
% updated march 2005
% Modified on May 2010 by Norton T. Roman: to comply with EACH-USP standards
% Modified on Feb 2013 by Norton T. Roman: use of natbib included
% Modified on Feb 2015 by Norton T.Roman: front cover address layout changed

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ppgsi}[2013/02/12 Classe Latex para relatórios técnicos - PPgSI-EACH-USP]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% opções de codificação
\newcommand\@codificacao{}
\DeclareOption{latin1} {%
	\let\@codificacao\CurrentOption
}
\DeclareOption{utf8} {%
	% defino a codificação
	\let\@codificacao\CurrentOption
}

% Para a bibliografia
\newcommand\@ebib{}

% Opções de língua
\newcommand\@lingua{}
\DeclareOption{brazilian} {%
	% defino a codificação
	\let\@lingua\CurrentOption
	\def\@ebib{e}
}
\DeclareOption{english} {%
	% defino a codificação
	\let\@lingua\CurrentOption
	\def\@ebib{and}
}

% Opções de imagens
\newcommand\@imagem{}
\DeclareOption{eps} {%
	% defino a codificação
	\let\@imagem\CurrentOption
}
\DeclareOption{outros} {%
	% defino a codificação
	\let\@imagem\CurrentOption
}

% opções padrão
\ExecuteOptions{utf8,brazilian,eps}

% Executo o código das opções
\ProcessOptions

% Classe principal sobre a qual essa é construída (passo a ela os parâmetros de entrada, como letterpaper, por exemplo)
\LoadClassWithOptions{article}

% carrego o pacote para a codificação de caracteres
\RequirePackage[\@codificacao]{inputenc}

% carrego o pacote para o português do Brasil
\RequirePackage[\@lingua]{babel}

% pacote útil para o posicionamento de figuras (com um H)
\RequirePackage{float}

% pacote para identação do primeiro parágrafo
\RequirePackage{indentfirst}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% margem sup 3.5 cm: há 1,5 cm para header, + 2 cm para top
% margem inf 2.5 cm: há 1,5 cm para foot, + 1 cm para bottom
% margem esq/dir 3 cm
\RequirePackage[a4paper,top=3.5cm,left=3cm,right=3cm,bottom=2.5cm]{geometry}

\parskip   6pt

\flushbottom

% captions
\RequirePackage[bf,sf,footnotesize,indent,labelsep=period]{caption}

\setlength{\captionmargin}{0.8cm}
\renewcommand{\captionfont}{\sffamily\footnotesize\bfseries}

% fontes
\RequirePackage{times}

\renewcommand{\normalsize}{\@setfontsize\normalsize\@xiipt\@xivpt}
\newcommand{\XIIIPT}{\@setfontsize\xiiipt{13}{17}}
\newcommand{\XVIPT}{\@setfontsize\xvipt{16}{20}}

% novos comandos
\newcounter{instn}
\setcounter{instn}{1}
\newcommand{\instnum}{\arabic{instn}}
\newcommand{\inst}[1]{\ensuremath{^{#1}}}
\newcommand{\nextinstitute}{\\\mbox{}\\[-6pt] \addtocounter{instn}{1}\inst{\instnum}}
\newcommand{\email}[1]{\\\mbox{}\\[-6pt]\footnotesize\texttt{#1}}
\renewcommand{\and}{, }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% número e data do relatório técnico
\newcommand\@numero{}
\newcommand{\numero}[1]{%
	\renewcommand\@numero{#1}
}

\newcommand\@mes{}
\newcommand{\mes}[1]{%
	\renewcommand\@mes{#1}
}

\newcommand\@ano{}
\newcommand{\ano}[1]{%
	\renewcommand\@ano{#1}
}

% autores como aparecerão na capa do relatório
\newcommand\@coverauthor{}
\newcommand{\coverauthor}[1]{%
	\renewcommand\@coverauthor{#1}
}

% para o condicional e valores booleanos
\RequirePackage{ifthen}

% macro para mês e ano
\newcommand\@mesExt{%
	\ifthenelse{\equal{\@lingua}{brazilian}}%
    {% português do Brasil
		\ifcase\@mes\or Janeiro\or Fevereiro\or Mar\c{c}o\or
		Abril\or Maio\or Junho\or Julho\or Agosto\or Setembro\or
		Outubro\or Novembro\or Dezembro\fi%
    }%
    {% inglês
		\ifcase\@mes\or
		January\or February\or March\or
		April\or May\or June\or
		July\or August\or September\or
		October\or November\or December\fi
    }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% logo
\usepackage{color}
\definecolor{eachsteelblue}{rgb}{0.00,0.63,0.73}
\newsavebox{\sep}
\savebox{\sep}(0,0)[lb] {
	\color{eachsteelblue}
	\put(0.00,0.00){\line(4,0){360}}
	\put(0.00,0.50){\line(4,0){360}}
	\put(0.00,1.00){\line(4,0){360}}
	\put(0.00,1.50){\line(4,0){360}}
	\put(0.00,2.00){\line(4,0){360}}
}
\newsavebox{\university}
\font\univ=cmss10 % fonte para o nome da universidade
\font\ninst=cmbx10 % fonte para o nome do instituto
\newcommand\q{\hspace*{.07in}}
\savebox{\university}(151,6)[lb] {
	\ifthenelse{\equal{\@lingua}{brazilian}}%
	{%
		\univ\put(1,1){U N I V E R S I D A D E \q DE \q S \~A O \q P A U L O}
	}%
	{%
		\univ\put(22,1){U N I V E R S I T Y \q OF \q S \~A O \q P A U L O}
	}%
}
\newsavebox{\institute}
\savebox{\institute}(80,5)[lb] {
	\ifthenelse{\equal{\@lingua}{brazilian}}%
	{%
		\ninst\put(1,1){Escola de Artes, Ci\^encias e Humanidades}
	}%
	{%
		\ninst\put(6,1){School of Arts, Sciences and Humanities}
	}%
}
\newsavebox{\header}
\setlength{\unitlength}{1 mm}
\savebox{\header}(151,30)[lb] {
	\put(72,24){\usebox{\university}}
	\put(24,21){\usebox{\sep}}
	\put(78,15){\usebox{\institute}}
}

% cria a capa
\RequirePackage{graphicx}
\newcommand{\makecover} {%
	% Cabeçalho do relatório
	\begin{picture}(0,20)
		\ifthenelse{\equal{\@imagem}{eps}}
		{\put(0,32){\rotatebox{180}{\includegraphics[height=2.2cm,width=2.2cm]{logo-each.eps}}}}
		{\put(0,32){\rotatebox{180}{\includegraphics[height=2.2cm,width=2.2cm]{logo-each.png}}}}
		\put(0.5,0){\usebox{\header}}
	\end{picture}

	% Identificação do relatório
	\vspace{6cm}
	\begin{center}
		% Número do relatório
		\ifthenelse{\equal{\@lingua}{brazilian}}%
    	{%
			{\LARGE Relatório Técnico PPgSI-\@numero \par}%
		}%
		{%
			{\LARGE Technical Report PPgSI-\@numero \par}%
		}%
		% Título do relatório
		{\LARGE \textit{\@title} \par}%
		\vspace{2cm}
		% Autores do relatório
		{\large \@coverauthor \par}%
		\vspace{2cm}
		% Data do relatório
		{\@mesExt\quad-\quad\@ano \par}%
		\vspace{0.2cm}
		% Nota legal
		\ifthenelse{\equal{\@lingua}{brazilian}}%
    	{%
			{\footnotesize O conteúdo do presente relatório é de única responsabilidade dos autores.}%
    	}%
    	{%
			{\footnotesize The contents of this report are the sole responsibility of the authors.}%
		}%
	\end{center}

	\vfill

	\centering
	%\framebox[12cm][s]{%
	\begin{minipage}{12.8cm}
		\ifthenelse{\equal{\@lingua}{brazilian}}%
    	{%
			\centering
			Série de Relatórios Técnicos

			\rule{11cm}{0.2mm}

			PPgSI-EACH-USP\\Rua Arlindo Béttio, 1000 -- Ermelino Matarazzo\\03828-000 -- São Paulo, SP.

			\vspace{1mm}

			\begin{minipage}{6cm}
				TEL: (11) 3091-8197
			\end{minipage}
			\begin{minipage}{6cm}
			 	\hfill http://www.each.usp.br/ppgsi
			\end{minipage}
		}%
    	{%
			\centering
			Technical Report Series

			\rule{11cm}{0.2mm}

			PPgSI-EACH-USP\\Arlindo Béttio St. 1000 - Ermelino Matarazzo - 03828-000.\\São Paulo, SP. Brazil.

			\vspace{1mm}

			\begin{minipage}{6cm}
				TEL: 55 (11) 3091-8197
			\end{minipage}
			\begin{minipage}{6cm}
				\hfill http://www.each.usp.br/ppgsi
			\end{minipage}
		}%
	\end{minipage}
	%}

	% fecho a página
	\pagebreak
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% to avoid [...] in the bibliography
% \item[] instead of \item[\@biblabel{#1}\hfill]
\def\@lbibitem[#1]#2{\item[]\if@filesw
      {\let\protect\noexpand
       \immediate
       \write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces}
\renewenvironment{thebibliography}[1]
     {\section*{\refname
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            %% changed!
               \itemindent -\leftmargin
               \itemsep 6pt
            %%%%%%%%%%%
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


% itens
\setlength\leftmargini   {1.27cm}
\setlength\leftmargin    {\leftmargini}
\setlength\leftmarginii  {\leftmargini}
\setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini}
\setlength  \labelsep    {.5em}
\setlength  \labelwidth  {\leftmargini}
\addtolength\labelwidth  {-\labelsep}
\def\@listI{\leftmargin\leftmargini
            \parsep 0\p@ \@plus1\p@ \@minus\p@
            \topsep 0\p@ \@plus2\p@ \@minus4\p@
            \itemsep0\p@}
\let\@listi\@listI
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus2\p@ \@minus\p@}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@}


% sections
\renewcommand\section{\@startsection{section}{1}{\z@}%
                       {-6\p@ \@plus -4\p@ \@minus -4\p@}%
                       {0\p@ \@plus 4\p@ \@minus 4\p@}%
                       {\normalfont\XIIIPT\bfseries\boldmath
                        \rightskip=\z@ \@plus 8em\pretolerance=10000 }}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                       {-6\p@ \@plus -4\p@ \@minus -4\p@}%
                       {0\p@ \@plus 4\p@ \@minus 4\p@}%
                       {\normalfont\normalsize\bfseries\boldmath
                        \rightskip=\z@ \@plus 8em\pretolerance=10000 }}

%\renewcommand{\thesection}{\arabic{section}.}
%\renewcommand{\thesubsection}{\thesection\arabic{subsection}.}
%\renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}.}

\RequirePackage{titlesec}
\titlelabel{\thetitle.\hspace{1ex}}

% first page

\pagestyle{empty}

\newcommand{\authortag}[1]{$^{#1}$}

\def\address#1{\gdef\@address{#1}}

\def\@maketitle{\newpage
	\makecover % monta a capa
	%\null % isso dava um espaco extra antes do title
	\begin{center}
		\vspace*{-.7cm}
		{\XVIPT\bf\@title\par}
		\vglue 6pt plus 3pt minus 3pt
		{\normalsize
		\textbf{\begin{tabular}[t]{c}\@author\end{tabular}}\par}
		\vglue 6pt plus 3pt minus 3pt
		{\normalsize
		\begin{tabular}[t]{c}\inst{\instnum}\@address\end{tabular}\par}
		\vglue 6pt plus 3pt minus 3pt
   \end{center}\par
}
\let\maketitleOLD\maketitle
\renewcommand{\maketitle}{\maketitleOLD\thispagestyle{empty}}

\renewenvironment{abstract}{%
      \list{}{\advance\topsep by6pt\relax\small
      \leftmargin=0.8cm
      \labelwidth=\z@
      \listparindent=\z@
      \itemindent\listparindent
      \rightmargin\leftmargin}\item[\hskip\labelsep
                                    \bfseries\itshape \ifthenelse{\equal{\@lingua}{brazilian}}{Resumo}{Abstract}.]\itshape}%
      {\endlist}

% para apêndices
% \newcommand{\appsection}[1]{\let\oldthesection\thesection
%   \renewcommand{\thesection}{Appendix \oldthesection}
%   \section{#1}\let\thesection\oldthesection}
\ifthenelse{\equal{\@lingua}{brazilian}}{%
	\newcommand{\nomeApendice}{Apêndice}
}%
{%
	\newcommand{\nomeApendice}{Appendix}
}%

\newcommand{\appsection}[1]{%
	\let\oldthesection\thesection
	\renewcommand{\thesection}{%
		\nomeApendice{} \oldthesection
	}
	\section{#1}\let\thesection\oldthesection
}%

% funções para as referências bibliográficas
\newcommand{\ebib}{%
	\ifthenelse{\equal{\@lingua}{brazilian}}%
	{%
		e
	}%
	{%
		and
	}%
}

\newcommand{\editoresbib}{%
	\ifthenelse{\equal{\@lingua}{brazilian}}%
	{%
		editores
	}%
	{%
		editors
	}%
}

\newcommand{\edicaobib}{%
	\ifthenelse{\equal{\@lingua}{brazilian}}%
	{%
		edi\c{c}\~{a}o\,\negthinspace
	}%
	{%
		edition
	}%
}

\newcommand{\paginasbib}{%
	\ifthenelse{\equal{\@lingua}{brazilian}}%
	{%
		p\'{a}ginas
	}%
	{%
		pages
	}%
}

\newcommand{\paginabib}{%
	\ifthenelse{\equal{\@lingua}{brazilian}}%
	{%
		p\'{a}gina
	}%
	{%
		page
	}%
}

\newcommand{\tesebib}{%
	\ifthenelse{\equal{\@lingua}{brazilian}}%
	{%
		Tese de Doutorado
	}%
	{%
		PhD thesis
	}%
}

\newcommand{\embib}{%
	\ifthenelse{\equal{\@lingua}{brazilian}}%
	{%
		Em
	}%
	{%
		In
	}%
}

% restabelece o tamanho original
%\setlength{\unitlength}{1pt}

% \typeout{================================}
% \message{Unitlength: \the\unitlength}
% \typeout{================================}

% pacote para formatação da bibliografia (deve vir ao final do cls)
\RequirePackage{natbib}
\bibpunct{[}{]}{,}{a}{}{,}
