\NeedsTeXFormat{LaTeX2e}[]
\ProvidesClass{UPN}[2012/05/05 Trabajo de grado UPN]

\newif\if@openright 
\newif\if@mainmatter \@mainmattertrue
\newif\if@numcit

% Opciones
\DeclareOption{12pt}{\renewcommand\normalsize{\fontsize{12pt}{12pt}\selectfont}}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{onehalfspace}{\renewcommand\baselinestretch{1.5}}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{numcit}{\@numcittrue}
\ExecuteOptions{12pt,oneside,onehalfspace,openright}
\ProcessOptions

% Caracteres especiales del español 
\RequirePackage[utf8]{inputenc}


% Dimensiones del papel - Tamaño carta
\setlength{\paperwidth}{8.5in}
\setlength{\paperheight}{11in}
% Dimensiones del texto
\setlength{\textwidth}{156mm}%
\setlength{\textheight}{209.4mm}
% Margenes
\if@twoside
	\setlength{\oddsidemargin}{14.6mm}
	\setlength{\evensidemargin}{-5.4mm}
	\def\ps@headings{
	\def\@oddfoot{\hfil\thepage}
	\def\@evenfoot{\thepage\hfil}
	}
\else
	\setlength{\oddsidemargin}{14.6mm}
	\setlength{\evensidemargin}{14.6mm}
	\def\ps@headings{
	\def\@oddfoot{\hfil\thepage\hfil}
	}
\fi

\def\ps@atsectionini{
	\setlength{\topmargin}{14.6mm}
	\setlength{\textheight}{109.4mm}
}

\setlength{\topmargin}{4.6mm}
\setlength{\headsep}{10mm}
\setlength{\headheight}{0pt}
\setlength{\footskip}{15mm}
\setlength{\parskip}{12pt}
\setlength{\parindent}{0pt}

% Numeración
\pagenumbering{arabic}

% Pagina de titulo
\newcommand\@degree{}
\newcommand\@director{}

\newcommand\degree[1]{\gdef\@degree{#1}}
\newcommand\director[1]{\gdef\@director{#1}}
\newcommand\portada{
	\begin{center}%
    {\bfseries\@title}
    \vfill
    {\bfseries\@author}
      \vfill
    {\bfseries
    	\begin{tabular}[t]{c}%
      	UNIVERSIDAD PEDAGÓGICA NACIONAL \\
      	{DEPARTAMENTO DE TECNOLOGÍA} \\
      	{LICENCIATURA EN ELECTRÓNICA} \\
      	{BOGOTÁ} \\
      	\number\year
      \end{tabular}}
  \end{center}
  \if@twoside\cleardoublepage\else\clearpage\fi
  \begin{center}
    {\bfseries\@title}
    \vfill%
    {\bfseries
        \@author
      }%
    \vfill
    {\bfseries \@degree}
    \vfill
    {\bfseries
    	\begin{tabular}[t]{c}%
      	Director \\
        \@director
      \end{tabular}}
    \vfill
    {\bfseries
    	\begin{tabular}[t]{c}%
      	UNIVERSIDAD PEDAGÓGICA NACIONAL \\
      	{DEPARTAMENTO DE TECNOLOGÍA} \\
      	{LICENCIATURA EN ELECTRÓNICA} \\
      	{BOGOTÁ} \\
      	\number\year
      \end{tabular}}
  \end{center}
  \thispagestyle{empty}
  }
  
% Dimensiones de la pagina que contiene la tabla de contenido
\newcommand\@pnumwidth{1.55em} 
\newcommand\@tocrmarg{2.55em} 
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{4}

\setcounter{secnumdepth}{4}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand\thesection{\arabic{section}.}
\renewcommand\thesubsection{\thesection\arabic{subsection}.}
\renewcommand\thesubsubsection{\thesubsection\arabic{subsubsection}.}
\renewcommand\theparagraph{\thesubsubsection\arabic{paragraph}.}

% Estilos de las secciones, subsecciones, subsubsecciones, parrafos y subparrafos
\newcommand\section{\if@openright\cleardoublepage\else\clearpage\fi
																	 \vspace*{-10mm}
																	 \@startsection{section}{1}{0pt}
                                   {-3\baselineskip}
                                   {2\baselineskip}
                                   {\centering\normalfont\normalsize\bfseries\MakeUppercase}}
                                   
\newcommand\subsection{\@startsection{subsection}{2}{0pt}
                                     {-2\baselineskip}
                                     {\baselineskip}
                                     {\normalfont\normalsize\bfseries\MakeUppercase}}
                                     
\newcommand\subsubsection{\@startsection{subsubsection}{3}{0pt}
                                     {-\baselineskip}
                                     {0.25\baselineskip}
                                     {\normalfont\normalsize\itshape}}
                                     
\newcommand\paragraph{\@startsection{paragraph}{4}{0pt}
                                    {-0.5\baselineskip}
                                    {-1em}
                                    {\normalfont\normalsize}}
\newcommand\appendix{\if@openright\cleardoublepage\else\clearpage\fi
																	 \vspace*{-10mm}
																	 {\vfill\begin{center}\bf ANEXOS\end{center}\vfill\null\vfill}
																	 \addcontentsline{toc}{section}{\protect ANEXOS}
																	 \setcounter{section}{0}
																	 \gdef\thesection{\Alph{section}.}}
% Estilos de Listas
\def\@listi{\leftmargin 2em
            \parsep 0pt
            \topsep 0pt
            \itemsep 0pt
            \labelsep 1em
            \labelwidth 1em
            \listparindent 2em}
\def\@listii {\leftmargin 2em
              \parsep 0pt
            	\topsep 0pt
            	\itemsep 0pt
            	\labelsep 1em
            	\labelwidth 1em
            	\listparindent 2em}
\def\@listiii{\leftmargin 2em
              \parsep 0pt
            	\topsep 0pt
            	\itemsep 0pt
            	\labelsep 1em
            	\labelwidth 1em
            	\listparindent 2em}
\def\@listiv {\leftmargin 2em
              \parsep 0pt
            	\topsep 0pt
            	\itemsep 0pt
            	\labelsep 1em
            	\labelwidth 1em
            	\listparindent 2em}
\def\@listv  {\leftmargin 2em
              \parsep 0pt
            	\topsep 0pt
            	\itemsep 0pt
            	\labelsep 1em
            	\labelwidth 1em
            	\listparindent 2em}
\def\@listvi {\leftmargin 2em
              \parsep 0pt
            	\topsep 0pt
            	\itemsep 0pt
            	\labelsep 1em
            	\labelwidth 1em
            	\listparindent 2em}

\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}

\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

\@addtoreset{equation}{chapter}
\renewcommand\theequation{\arabic{equation}}
\newcounter{figure}

\renewcommand\thefigure{\arabic{figure}}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

\newcounter{table}
\renewcommand\thetable{\arabic{table}}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10pt}
\setlength\belowcaptionskip{6pt}
\newcommand\@makecaption[2]{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1. #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% Pagina de aprobación
\newcommand\aprobacion{\if@openright\cleardoublepage\else\clearpage\fi
												\twocolumn\null\vfill Bogotá, \today \newpage
												Nota de aceptación\par
												\vspace{48pt}
												\null\hrulefill\null\par
												\vspace{24pt}
												\null\hrulefill\null\\
												\null\hrulefill\null\\
												\null\hrulefill\null\par
												\vspace{48pt}
												\null\hrulefill\null\\
												Firma\\
												Nombre:\\
												Presidente del jurado\par
												%\vspace{48pt}
												\null\hrulefill\null\\
												Firma\\
												Nombre:\\
												Jurado\par
												\null\hrulefill\null\\
												Firma\\
												Nombre:\\
												Jurado
												\onecolumn}
          
% Entorno agradecimientos
\newenvironment{agradecimientos}
               {\section*{Agradecimientos}}
               {}

% Entorno del resumen analitico en educación       
\newenvironment{RAE}
               {\section*{Resumen Analítico En Educación}}
               {}
               


\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagestyle{empty}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagestyle{headings}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

% Definición del comando que crea la tabla de contenido
\newcommand\tabladecontenido{%
    \section*{\MakeUppercase\contentsname}
		\begin{flushright}{P\'{a}g.}\end{flushright}%
    \@starttoc{toc}%
    }
\newcommand*\l@section{\@dottedtocline{1}{0pt}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{0pt}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{0pt}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{0pt}{5em}}

% Lista de tablas y lista de figuras
\newcommand\listadefiguras{%
    \section*{\MakeUppercase\listfigurename}%
    \begin{flushright}{P\'{a}g.}\end{flushright}
    \@starttoc{lof}%
    \thispagestyle{empty}
    }
\newcommand*\l@figure{\@dottedtocline{1}{0pt}{2.3em}}
\newcommand\listadetablas{%
    \section*{\listtablename}%
    \begin{flushright}{P\'{a}g.}\end{flushright}
    \@starttoc{lot}%
    \thispagestyle{empty}
    }
\let\l@table\l@figure 

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}

\@addtoreset{footnote}{page}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\setlength\footnotesep{12pt}
\setlength{\skip\footins}{24pt}
\if@numcit
	\renewcommand\thefootnote{\fnsymbol{footnote}}
\else
	\renewcommand\thefootnote{\arabic{footnote}}
\fi
\renewcommand\footnoterule{%
  \vspace*{-3pt}
  \hrule width 2in height 0.4pt
  \vspace*{2.6pt}}
\if@numcit

\newenvironment{thebibliography}[1]
     {\section*{\bibname}
     \addcontentsline{toc}{section}{BIBLIOGRAFÍA}%
      \list{\@biblabel{\@arabic\c@enumiv}}
           {\leftmargin 0pt
            \parsep 12pt
            \topsep 0pt
           	\itemsep 0pt
           	\labelsep 1em
            \labelwidth 1em
            \listparindent 2em
          	\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      }
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\else

% Entorno Bibliografia
\newenvironment{bibliografia}
     {\section*{\bibname}
     \addcontentsline{toc}{section}{BIBLIOGRAFÍA}
      \list{}
           {\leftmargin 0pt
            \parsep 12pt
            \topsep 0pt
           	\itemsep 0pt
           	\labelsep 1em
            \labelwidth 1em
            \listparindent 2em
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      }
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\fi
\def\newblock{\hskip .11em plus .33em minus .07em}

\newcommand\contentsname{Contenido}
\newcommand\listfigurename{Lista de Figuras}
\newcommand\listtablename{Lista de Tablas}
\newcommand\bibname{Bibliografía}

\newcommand\figurename{Figura}
\newcommand\tablename{Tabla}
\newcommand\appendixname{Apéndice}
\def\today{\ifcase\month\or
  Enero\or Febrero\or Marzo\or Abril\or Mayo\or Junio\or
  Julio\or Agosto\or Septiembre\or Octubre\or Noviembre\or Diciembre\fi
  \space\number\day{} de \number\year}