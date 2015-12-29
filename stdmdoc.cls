\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{stdmdoc}[2015/05/09 Il vaffanculo ed il budello di tu ma]
\RequirePackage{titlesec} % Per modificare i titoli delle sezioni
\RequirePackage{fancyhdr} % Per modificare l'intestazione ed il piè di pagina
\RequirePackage{bm}
%\RequirePackage{mbboard}
\RequirePackage[utf8]{inputenc}
\RequirePackage[italian]{babel}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm} % Per definire \newtheorem

\RequirePackage{xifthen}
\RequirePackage{xparse}
\RequirePackage{etoolbox}% http://ctan.org/pkg/etoolbox
\RequirePackage[linktoc=all]{hyperref} % Per i collegamenti ipertestuali. [linktoc=all] mette i link nell'indice
\RequirePackage{color} % Per i comandi \textcolor{'colore'}{'testo da colorare'} e \color{'colore'}
\RequirePackage{hhline} % Per fare tabelle variegate


% https://it.sharelatex.com/blog/2011/03/27/how-to-write-a-latex-class-file-and-design-your-own-cv.html

% Definizioni dei margini del foglio
\DeclareOption{a4paper}
	{\setlength\paperheight {297mm}
	\setlength\paperwidth {210mm}}
\DeclareOption{WithNotes}
	{\setlength\textheight{680pt} %Altezza del corpo
	\setlength\textwidth{360pt} %Larghezza del corpo
	\setlength\marginparsep{12pt} %Distanza corpo - note a margine
	\setlength\marginparwidth{110pt} %Larghezza note a margine
	}
\DeclareOption{NoNotes}
	{\setlength\textheight{680pt}
	\setlength\textwidth{470pt}
	\setlength\marginparsep{0pt}
	\setlength\marginparwidth{0pt}
	}


\setlength\hoffset{-20pt} %Margine sinistro quasi nullo (1in)
\setlength\voffset{-30pt} %Margine superiore quasi nullo (1in)
\setlength\oddsidemargin{10pt} %Distanza del testo dal margine sinistro
\setlength\topmargin{5pt} %Distanza intestazione da margine superiore
\setlength\headheight{5pt} %Altezza intestazione
\setlength\headsep{5pt} %Distanza Intestazione - Corpo
\setlength\footskip{20pt} %Distanza corpo - piè di pagina

% Imposta i titoli in stampatello e con la linea sotto
\titleformat{\section}
	{\Large\scshape\raggedright}
	{}{1em}		%Può essere usato per dare un prefisso a tutte le sezioni
	{}		%Può essere usato per inserire codice prima del titolo
	[\titlerule{\vskip 0.5ex}]	%Mette la linea orizzontale dopo il titolo

\titleformat{\subsection}
	{\large\scshape}
	{}{0em}
	{}

\renewcommand{\title}[1]{
	\centerline{\Huge\scshape\raggedright{#1}}{\vskip 5ex}
	}
\renewcommand{\author}[1]{
	\centerline{\LARGE\scshape\raggedright{#1}}{\vskip 1ex}
	}

\newcommand{\autodate}{
	\hfill\large{\today}{\vskip 1ex}
	}

% Definiamo i font da utilizzare per le varie sezioni
\renewcommand*{\familydefault}{\rmdefault}
\renewcommand*{\rmdefault}{ppl}
\renewcommand*{\sfdefault}{cmss}
\renewcommand*{\ttdefault}{lmtt}

% Oggetti utili per dare spaziatura al corpo del testo e per aggiungere note a margine
\newcommand{\Nextblock}{{\vskip 1.5ex}\noindent}
\newcommand{\paragrafo}[1]{{\vskip 3ex}{\normalfont\large\bf\noindent{#1}}{\hskip 3ex}}
\newcommand{\Nota}[1]{\marginpar{\footnotesize{\vskip 4ex}#1}}

% Parole più usate in matematica
\newtheorem{mydef}{Definizione}[section]
\newtheorem{mythm}{Teorema}[section]
\newtheorem{myex}{Esercizio}[section]
\newtheorem{myes}{Esempio}[section]
\newtheorem{mylemma}{Lemma}[section]
\newtheorem{myprop}{Proposizione}[section]
\newtheorem{mycor}{Corollario}[section]
\newtheorem{myobs}{Osservazione}[section]

\newtheorem*{mydef*}{Definizione}
\newtheorem*{mythm*}{Teorema}
\newtheorem*{myex*}{Esercizio}
\newtheorem*{myes*}{Esempio}
\newtheorem*{mylemma*}{Lemma}
\newtheorem*{myprop*}{Proposizione}
\newtheorem*{mycor*}{Corollario}
\newtheorem*{myobs*}{Osservazione}

\NewDocumentCommand{\Teorema}{g}{
  \IfNoValueTF{#1}
	{\paragrafo{Teorema}}
	{\paragrafo{Teorema {\it (#1)}}}}

\NewDocumentCommand{\Definizione}{g}{
  \IfNoValueTF{#1}
	{\paragrafo{Definizione}}
	{\paragrafo{Definizione {\it (#1)}}}}

\NewDocumentCommand{\Lemma}{g}{
  \IfNoValueTF{#1}
	{\paragrafo{Lemma}}
	{\paragrafo{Lemma {\it (#1)}}}}

\NewDocumentCommand{\Corollario}{g}{
  \IfNoValueTF{#1}
	{\paragrafo{Corollario}}
	{\paragrafo{Corollario {\it (#1)}}}}

\NewDocumentCommand{\Dimostrazione}{g}{
  \IfNoValueTF{#1}
	{\paragrafo{Dimostrazione}}
	{\paragrafo{Dimostrazione {\it (#1)}}}}

\NewDocumentCommand{\Osservazione}{g}{
  \IfNoValueTF{#1}
	{\paragrafo{Osservazione}}
	{\paragrafo{Osservazione {\it (#1)}}}}

\NewDocumentCommand{\Proposizione}{g}{
  \IfNoValueTF{#1}
	{\paragrafo{Proposizione}}
	{\paragrafo{Proposizione {\it (#1)}}}}

\NewDocumentCommand{\Esempio}{g}{
  \IfNoValueTF{#1}
	{\paragrafo{Esempio}}
	{\paragrafo{Esempio {\it (#1)}}}}

\NewDocumentCommand{\Achtung}{g}{
  \IfNoValueTF{#1}
	{\paragrafo{Achtung!}}
	{\paragrafo{Achtung! {\it (#1)}}}}

\newcommand{\Passo}[1]{\paragrafo{Passo {#1}}}
\newcommand{\Freccia}[1]{\paragrafo{Freccia {#1}}}

\NewDocumentCommand{\Altro}{g}{
  \IfNoValueTF{#1}
	{\paragrafo{}}
	{\paragrafo{#1}}}

\newcommand{\frdx}{ \framebox[\width]{ $\Rightarrow$ } }
\newcommand{\frsx}{ \framebox[\width]{ $\Leftarrow$ } }
\newcommand{\opp}{\text{ oppure }}
\def\checkmark{\tikz\fill[scale=0.4](0,.35) -- (.25,0) -- (1,.7) -- (.25,.15) -- cycle;} 
\newcommand{\crossmark}{$\times$}


%mathbb mathcal mathfrak e mathbm per le lettere dell'alfabeto e anche mathbb per quelle greche
\def\mydeflett#1{\expandafter\def\csname bb#1\endcsname{\mathbb{#1}}
		\expandafter\def\csname c#1\endcsname{\mathcal{#1}}
		\expandafter\def\csname k#1\endcsname{\mathfrak{#1}}
		\expandafter\def\csname bl#1\endcsname{\mathbf{#1}}}
\def\mydefalllett#1{\ifx#1\mydefalllett\else\mydeflett#1\expandafter\mydefalllett\fi}
\mydefalllett ABCDEFGHIJKLMNOPQRSTUVWXYZ\mydefalllett

\def\mydefgreek#1{\expandafter\def\csname bl#1\endcsname{\text{\boldmath$\mathbf{\csname #1\endcsname}$}}}
\def\mydefallgreek#1{\ifx\mydefallgreek#1\else\mydefgreek{#1}%
   \lowercase{\mydefgreek{#1}}\expandafter\mydefallgreek\fi}
\mydefallgreek {Gamma}{Delta}{Theta}{Lambda}{Xi}{Pi}{Sigma}{Upsilon}{Phi}{Varphi}{Psi}{Omega}{alpha}{beta}{gamma}{delta}{epsilon}{varepsilon}{zeta}{eta}{theta}{iota}{kappa}{lambda}{mu}{nu}{xi}{omicron}{pi}{rho}{sigma}{tau}{upsilon}{phi}{varphi}{chi}{psi}{omega}\mydefallgreek

\NewDocumentCommand{\FF}{g}{
  \IfNoValueTF{#1}
	{\mathbb{F}}
	{\mathbb{F}_{#1}}}

\NewDocumentCommand{\ZZ}{g}{
  \IfNoValueTF{#1}
	{\mathbb{Z}}
	{\mathbb{Z}_{#1}}}

\NewDocumentCommand{\de}{gg}{
	\IfNoValueTF{#1}
		{\text{ d}}
		{\IfNoValueTF{#2}	{\text{ d}#1}
			{\frac{\text{d}#1}{\text{d}#2}}
	}
}

\NewDocumentCommand{\dpar}{gg}{
	\IfNoValueTF{#1}
		{\partial}
		{\IfNoValueTF{#2}	{\partial_{#1}}
			{\frac{\partial {#1}}{\partial {#2}}}
	}
}


%nuovi comandi per svariate cose
\DeclareOption{GeneralMath}
{
	\newcommand{\sse}{\Leftrightarrow}
	\newcommand{\Rar}{\Rightarrow}
	\newcommand{\rar}{\rightarrow}
	\newcommand{\ol}[1]{\overline{#1}}
	\newcommand{\ot}[1]{\widetilde{#1}}
	\newcommand{\oc}[1]{\widehat{#1}}
	\newcommand{\tc}{\mbox{ t.c. }}

	\newcommand{\norma}[1]{\mid\mid #1 \mid\mid}
	\newcommand{\abs}[1]{\mid #1 \mid}
	\newcommand{\scal}[2]{\langle #1 \mid #2 \rangle}
	\newcommand{\floor}[1]{\lfloor #1 \rfloor}

	\newcommand{\Ker}{\mbox{Ker } }
	\newcommand{\Deg}{\mbox{deg }}
	\newcommand{\Det}{\mbox{det }}
	\newcommand{\Dim}{\mbox{dim }}
	\newcommand{\End}{\mbox{End }}
	\newcommand{\Rad}{\mbox{Rad }}
	\newcommand{\Ann}{\mbox{Ann }}
	\newcommand{\Sp}{\mbox{Sp }}
	\newcommand{\Rk}{\mbox{rk }}
	\newcommand{\Tr}{\mbox{tr }}
	\newcommand{\GL}{\mbox{GL}}
	\newcommand{\Isom}{\mbox{Isom}}
	\newcommand{\Fix}{\mbox{Fix }}
	\newcommand{\Giac}{\mbox{Giac }}
	\newcommand{\Ort}{\mbox{O}}
	\newcommand{\Aff}{\mbox{Aff }}
	\newcommand{\Supp}{\mbox{Supp }}
	\newcommand{\Span}{\mbox{Span }}
	\newcommand{\Symm}{\mbox{Sym }}
	\newcommand{\Asymm}{\mbox{Asym }}
	\newcommand{\Img}{\mbox{Im }}
	\newcommand{\Id}{\mbox{id}}
	\newcommand{\PS}{\mbox{PS }}
	\newcommand{\Mtr}{\mathfrak{m}}
	\newcommand{\fucknullset}{\{0\}}

	\makeatletter
	% Permette di fare sistemi di equazioni
		\newcommand{\hsystem}[1][]{$\left. \begin{array}{c} \gobblenext }%
		\newcommand{\system}[1][]{$\left\{ \begin{array}{c}  \gobblenext }
		\newcommand{\gobblenext}[1]{#1\@ifnextchar\bgroup{\\ \gobblenext}{ \end{array} \right.$ }}% Gobble next "argument"
	\makeatother
}

\ProcessOptions
%---Comandi Strani---
\newcommand{\TODO}{{\LARGE\bf TO DO}}


\sloppy

