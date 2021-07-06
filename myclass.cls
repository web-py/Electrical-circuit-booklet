\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myclass}
[2020/03/23 v1]
\newif\ifparsibook@crop
\parsibook@croptrue
\DeclareOption{nocrop}{\parsibook@cropfalse}

\newif\if@blanknotif


\DeclareOption{blanknotif}{\@blanknotiftrue}


 % فراخوانی کلاس book برای استفاده در کلاس
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[11pt,a4paper,twoside]{book}
\linespread{1.3}


% بسته‌هایی برای حروف‌چینی متن‌های ریاضی
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}

% بسته‌ای برای تعریف محیط قضایا، تعاریف و...
\RequirePackage{amsthm}

% دستورهایی برای نحوه ظاهر شدن تعاریف، قضایا، مثال‌ها و... در متن
% باید توجه داشت که متن محیط‌های ادعایی مثل قضیه، لم، گزاره، نتیجه و ملاحظه باید به صورت ایتالیک باشد؛ ولی
% محیط مثال و تعریف، باید به صورت ایستاده باشند. همچنین شماره تمام این محیط‌ها برای پیدا کردن راحت‌تر آن‌ها
% باید از یکدیگر پیروی کنند.
\theoremstyle{definition}
\newtheorem{definition}{تعریف}[section]
\theoremstyle{plain}
\newtheorem{theorem}[definition]{قضیه}
\newtheorem{lemma}[definition]{کنجکاوی}
\newtheorem{proposition}[definition]{گزاره}
\newtheorem{corollary}[definition]{نتیجه}
%\newtheorem{remark}[definition]{توجه}
\newtheorem*{remark}{توجه}
\theoremstyle{definition}
\newtheorem{example}[definition]{مثال}
\newtheorem*{solu}{حل}
\renewcommand\proofname{{\rm \textbf{برهان}}}

% بازتعریف محیط solu برای اضافه کردن یک مربع توپر به انتهای محیط «حل» مثال‌ها
\newenvironment{solution}
{\begin{solu}}
	{\hfill$\blacksquare $\end{solu}}

\makeatletter
% حذف علامت نقطه بعد از شماره محیط‌های تعریف، قضیه، مثال و...
\def\@thm#1#2#3{%
	\ifhmode\unskip\unskip\par\fi
	\normalfont
	\trivlist
	\let\thmheadnl\relax
	\let\thm@swap\@gobble
	\thm@notefont{\fontseries\mddefault\upshape}%
	\thm@headpunct{}
	\thm@headsep 5\p@ plus\p@ minus\p@\relax
	\thm@space@setup
	#1% style overrides
	\@topsep \thm@preskip
	\@topsepadd \thm@postskip
	\def\@tempa{#2}\ifx\@empty\@tempa
	\def\@tempa{\@oparg{\@begintheorem{#3}{}}[]}%
	\else
	\refstepcounter{#2}%
	\def\@tempa{\@oparg{\@begintheorem{#3}{\csname the#2\endcsname}}[]}%
	\fi
	\@tempa
}

%بسته‌ای برای فراخوانی رنگ‌ها
\usepackage[dvipsnames]{xcolor}
% بسته‌ای برای قرار دادن شکل در صفحات
\RequirePackage[]{graphicx}
% دستوری برای تعیین آدرس محل شکل‌ها
\graphicspath{{figures/}}
% بسته‌ای برای قرار دادن چند شکل در کنار یکدیگر با عنوان‌های مختلف
\RequirePackage{subfig}

% حذف تورفتگی‌های ابتدای عنوان شکل‌ها، جدول‌ها و کدها در فهرست آن‌ها
\makeatletter
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}
\let\l@table\l@figure
\def\l@lstlisting#1#2{\@dottedtocline{1}{0em}{2.3em}{#1}{#2}}

% بسته‌ای برای کنترل نحوه ظاهر شدن برچسب شکل‌ها
\RequirePackage[font={small,onehalfspacing},labelfont={bf},labelsep= quad,labelformat=default,format=plain]{caption}


%بسته‌هایی برای رسم تصاویر و مدارها
\RequirePackage{tikz}
\usetikzlibrary{shadows,arrows,automata,mindmap,trees,positioning,shapes.geometric,snakes}
\RequirePackage{circuitikz}

\RequirePackage{pstricks,pst-plot}
 % بسته و دستورهایی برای سفارشی کردن محیط‌های لیستی
\RequirePackage{enumitem}
\setitemize{nosep}
\setenumerate{nosep}
\setdescription{nosep}

%بسته‌ی مورد نیاز برای وارد کردن کدها
\RequirePackage{listings}

\lstdefinelanguage{mytex}{
	basicstyle=\footnotesize,
	keywords={begin, end, documentclass},
    commentstyle=\color{red},
    keywordstyle=\color{blue},
    stringstyle=\color{green},
    frame=shadowbox,
}

% تعیین نحوه نمایش کدها در بسته listings
\lstset{
	language=Python,
	frame=trBL,
	frameround=fttt,
	numbers=left,
	numberstyle=\scriptsize,
	showspaces=false,
	showtabs=false,
	xleftmargin=23pt,
	xrightmargin=9pt,
	framexleftmargin=17pt,
	framexrightmargin=5pt,
	framexbottommargin=2pt,
	showstringspaces=false ,
	breaklines=true,
	texcl=true,
	basicstyle=\setLTR\footnotesize\ttfamily,
	commentstyle= \itshape,
	belowcaptionskip=12pt,
	aboveskip=15pt,
	belowskip=15pt
}

% تعریف دستوری برای چاپ و نحوه چینش فصل‌های بدون شماره مثل «پیش‌گفتار»
\newcommand{\mychapter}[1]{%
	\phantomsection%
	\addcontentsline{toc}{chapter}{#1}\chapter*{#1}\markboth{#1}{#1}%
}

% تعریف دستورهایی برای جلوگیری از ظاهر شدن سربرگ و شماره در صفحات خالی
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\vspace*{\fill}
	\begin{center}
		% در صورت استفاده از گزینه blanknotif، متن زیر در صفحات خالی نمایش داده می‌شود.
		\if@blanknotif
		این صفحه عمداً خالی گذاشته شده است.
		\fi
	\end{center}
	\vspace{\fill}
	\thispagestyle{empty}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%دستوری برای وارد کردن فایل‌های pdf به کتاب
\RequirePackage{pdfpages}
%%%%%%%%%%%%5
%دستورات مربوط به تنظیمات واژه‌نامه

\RequirePackage[xindy,acronym,nonumberlist=true]{glossaries}
\RequirePackage[pagebackref=false,colorlinks,linkcolor=blue,citecolor=magenta]{hyperref} 

\newglossarystyle{myFaToEn}{%
	\renewenvironment{theglossary}{}{}
	\renewcommand*{\glsgroupskip}{\vskip 10mm}
	\renewcommand*{\glsgroupheading}[1]{\subsection*{\glsgetgrouptitle{##1}}}
	\renewcommand*{\glossentry}[2]{\noindent\glsentryname{##1}\dotfill\space \glsentrytext{##1}
		
	}
}
\newglossarystyle{myEntoFa}{% 
	\renewenvironment{theglossary}{}{}
	\renewcommand*{\glsgroupskip}{\vskip 10mm}
	\renewcommand*{\glsgroupheading}[1]{\begin{LTR} \subsection*{\glsgetgrouptitle{##1}} \end{LTR}} 
	\renewcommand*{\glossentry}[2]{\noindent\glsentrytext{##1}\dotfill\space \glsentryname{##1} 
		    
	}
}
\newglossarystyle{myAbbrlist}{%
	\renewenvironment{theglossary}{}{}
	\renewcommand*{\glsgroupskip}{\vskip 10mm}
	\renewcommand*{\glsgroupheading}[1]{\begin{LTR} \subsection*{\glsgetgrouptitle{##1}} \end{LTR}}
	\renewcommand*{\glossentry}[2]{\noindent\glsentrytext{##1}\dotfill\space \Glsentrylong{##1}
		
	}
	\renewcommand*{\acronymname}{\rl{فهرست اختصارات
	}}
} 
\newglossary[glg]{english}{gls}{glo}{واژه‌نامه انگلیسی به فارسی}
\newglossary[blg]{persian}{bls}{blo}{واژه‌نامه فارسی به انگلیسی}
\makeglossaries
\glsdisablehyper
\let\oldgls\gls
\let\oldglspl\glspl
\makeatletter
\renewrobustcmd*{\gls}{\@ifstar\@msgls\@mgls}
\newcommand*{\@mgls}[1] {\ifthenelse{\equal{\glsentrytype{#1}}{english}}{\oldgls{#1}\glsuseri{f-#1}}{\oldgls{#1}}}
\newcommand*{\@msgls}[1]{\ifthenelse{\equal{\glsentrytype{#1}}{english}}{\glstext{#1}\glsuseri{f-#1}}{\oldgls{#1}}}

\renewrobustcmd*{\glspl}{\@ifstar\@msglspl\@mglspl}
\newcommand*{\@mglspl}[1] {\ifthenelse{\equal{\glsentrytype{#1}}{english}}{\oldglspl{#1}\glsuseri{f-#1}}{\oldglspl{#1}}}
\newcommand*{\@msglspl}[1]{\ifthenelse{\equal{\glsentrytype{#1}}{english}}{\glsplural{#1}\glsuseri{f-#1}}{\oldglspl{#1}}}
\makeatother

\newcommand{\newword}[4]{
	\newglossaryentry{#1}     {type={english},name={\lr{#2}},plural={#4},text={#3},description={}}
	\newglossaryentry{f-#1}		 {type={persian},name={#3},text={\lr{#2}},description={}}
} 
\defglsentryfmt[english]{\glsgenentryfmt\ifglsused{\glslabel}{}{\LTRfootnote{\glsentryname{\glslabel}}}}
\defglsentryfmt[acronym]{\glsentryname{\glslabel}\ifglsused{\glslabel}{}{\LTRfootnote{\glsentrydesc{\glslabel}}}} 
\newcommand{\printabbreviation}{
	\cleardoublepage
	\phantomsection
	\baselineskip=.75cm
	\addcontentsline{toc}{chapter}{فهرست اختصارات}
	\setglossarystyle{myAbbrlist}
	\begin{RTL}
		\Oldprintglossary[type=acronym] 
	\end{RTL}
	\clearpage
}%

\newcommand{\printacronyms}{\printabbreviation}
\let\Oldprintglossary\printglossary
\renewcommand{\printglossary}{
	\let\appendix\relax
	\clearpage
	\phantomsection 
	\twocolumn{}
	\addcontentsline{toc}{chapter}{واژه نامه انگلیسی به فارسی}
	\setglossarystyle{myEntoFa}
	\Oldprintglossary[type=english]
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{واژه نامه فارسی به انگلیسی}
	\setglossarystyle{myFaToEn}
	\Oldprintglossary[type=persian]
	\onecolumn{}
}%

% بسته‌ای برای تغییر ظاهر سربرگ‌های کتاب
\RequirePackage{fancyhdr}

% دستورهایی برای تنظیم نحوه چینش سربرگ‌ها
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE]{\thepage\hfill\small مدار الکتریکی و الکترونیکی}
\fancyhead[RO]{\small\leftmark\hfill\thepage}
%\fancyhead[RE,LO]{\small\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\chaptermark}[1]{%
	\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ \ #1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% بسته و دستوری برای ریست کردن شماره پانویس‌ها در هر صفحه
\RequirePackage{zref-perpage}
\zmakeperpage{footnote}

% حذف امکان منبسط شدن یا همان stretch خودکار فاصله بین پاراگراف‌ها
\setlength{\parskip}{0in}

\makeatletter
% تعیین نحوه ظاهر شدن عنوان فصل‌ها در صفحه اول فصل‌ها
\def\@makechapterhead#1{%
	\vspace*{6.3\baselineskip}%
	{\parindent \z@ \if@RTL\raggedleft\else\raggedright\fi \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
		\huge\bfseries \@chapapp\space {%\chapfont
			\thechapter}
		\par\nobreak
		\vskip 5\p@
		\fi
		\fi
		\interlinepenalty\@M
		\Huge \bfseries \linespread{1.5}\selectfont #1\par\nobreak
		\vskip 70\p@
		\thispagestyle{empty}
}}


% حذف امکان منقبض شدن یا همان shrink و منبسط شدن یا همان stretch خودکار فاصله قبل و بعد از
%%عنوان قسمت‌ها، زیرقسمت‌‌ها و زیرزیرقسمت‌‌ها و همچنین زیاد کردن فاصله بین خطوط در عنوان‌های بیشتر از یک خط
\renewcommand\section{\@startsection {section}{1}{\z@}%
	{-1.9ex}%
	{2.3ex}%
	{\normalfont\Large\bfseries\linespread{1.5}\selectfont}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex}%
	{1.5ex}%
	{\normalfont\large\bfseries\linespread{1.4}\selectfont}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-3.25ex}%
	{1.5ex}%
	{\normalfont\normalsize\bfseries\linespread{1.3}\selectfont}}

% زیاد کردن فاصله بین خطوط در پانویس‌های فارسی چند خطی
\renewcommand\@makefntext[1]{%
	\parindent 1em%
	\noindent
	\hb@xt@1.8em{\hss\@makefnmark}\linespread{1.2}\selectfont#1}


% در حالت پیش‌فرض، عنوان بخش، زیربخش و زیرزیربخش در پایین صفحات قرار نمی‌گیرند؛ مگر اینکه دو خط متن هم پایین
% آن‌ها وجود داشته باشد. با بازتعریف زیر می‌توان دو خط را به یک خط تبدیل کرد که باعث بهتر پر شدن صفحات می‌شود.
\renewcommand\@afterheading{%
	\@nobreaktrue
	\everypar{%
		\if@nobreak
		\@nobreakfalse
		\clubpenalty 1
		\if@afterindent \else
		{\setbox\z@\lastbox}%
		\fi
		\else
		\clubpenalty 1
		\everypar{}%
		\fi}}
\makeatother

% تعیین فاصله بین سربرگ و اولین خط هر صفحه
\headsep=.7cm
% بسته‌ای برای تعیین اندازه بلوک (چارچوب) متن با احتساب مقدار دستور بالا
\makeatletter
\ifparsibook@crop
\RequirePackage[%total={12cm,19.1cm},
right=2.5cm,left=2.5cm,bottom=2.5cm,
centering,includehead=true,paperwidth=17cm, paperheight=24.5cm,top=3.5cm]{geometry}
%\RequirePackage[cross,center,noinfo,a4]{crop}
\else
\RequirePackage[total={12cm,19.1cm},centering,includehead=true]{geometry}
\fi
\makeatother



%بسته مورد نیاز برای پشتیبانی از زبان فارسی
\RequirePackage[extrafootnotefeatures]{xepersian}
\settextfont[Scale=1]{XB VNiloofar}
\setlatintextfont[Scale=.9]{Times New Roman}
\ExplSyntaxOn \cs_set_eq:NN \etex_iffontchar:D \tex_iffontchar:D \ExplSyntaxOff
\setmathdigitfont[Scale=.9]{XB VNiloofar}
\defpersianfont\mysmallfont[Scale=.9]{XB VNiloofar}
\defpersianfont\chapfont[Scale=3.3]{XB VNiloofar}
\defpersianfont\norfont[Scale=1]{XB VNiloofar}
% تنظیم نوع چینش پانویس‌ها به حالت پاراگرافی (پشت سر هم)
\paragraphfootnotes

\SepMark{-}

% چند بازتعریف
\renewcommand\listtablename{فهرست جدول‌ها}
\renewcommand\bibname{منابع}
\renewcommand\listfigurename{فهرست شکل‌ها}
\makeatletter
\def\lstlistingname{\if@RTL کد\else Code\fi}
\def\lstlistlistingname{\if@RTL فهرست کدها\else Listings\fi}
\makeatother