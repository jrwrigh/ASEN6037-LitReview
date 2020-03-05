\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucb}[UCB Template]
\LoadClass{article}

%% PACKAGES

% Language
\RequirePackage[english]{babel}

% Conditional statements
\RequirePackage{xifthen}
\RequirePackage{ifxetex}

% Encoding
\ifxetex
    \RequirePackage[quiet]{fontspec}
\else
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
\fi

% Page layout
\RequirePackage[letterpaper, margin = 30mm]{geometry}

% Graphics
\RequirePackage{graphicx}

% Colors
\RequirePackage[usenames, dvipsnames]{xcolor}

% Normal quotes
\RequirePackage[autostyle]{csquotes}
\MakeOuterQuote{"}
\DeclareQuoteAlias{english}{catalan}

% Linebreak spacing
\RequirePackage{setspace}
\RequirePackage{parskip}
\setlength{\parindent}{1.5em}

% \paragraph = \subsubsubsection
\RequirePackage{titlesec}
\titleformat{\paragraph}{\normalfont\normalsize\bfseries}{\theparagraph}{}{}

% Lists
\RequirePackage[inline]{enumitem}
% \setlist{nosep}
% \setlist[enumerate, 1]{label = \arabic*.}
% \setlist[enumerate, 2]{label* = \arabic*., itemindent = 1\parindent}
% \setlist[enumerate, 3]{label* = \arabic*., itemindent = 2\parindent}
% \setlist[enumerate, 4]{label* = \arabic*., itemindent = 3\parindent}
\setlist[itemize]{label = {--}}
\newcommand{\settablelist}{
    \setlist{nosep, before = \vspace{-\dimexpr\baselineskip +2 \partopsep}, after = \vspace{-\baselineskip}} % leftmargin = *
    \setlist[itemize]{label = {}}
}
\AtBeginEnvironment{tabular}{\settablelist}
\AtBeginEnvironment{tabularx}{\settablelist}
\AtBeginEnvironment{longtable}{\settablelist}

% Cool icons
% \RequirePackage{fontawesome}

% Calculate lengths
% \RequirePackage{calc}

% Modify the style of titles
% \RequirePackage{titlesec}

% Better horizontal rulers
% \RequirePackage{xhfill}

% Fancy footers
% \RequirePackage{fancyhdr}

% Change date format
\RequirePackage{datetime}
\newdateformat{monthyear}{\monthname[\THEMONTH] \THEYEAR}
\newdateformat{monthdayyear}{\monthname[\THEMONTH] \THEDAY, \THEYEAR}

% Manipulate strings
% \RequirePackage{xstring}

% Fancy headers
% \RequirePackage{tikz}

% Units typesetting
\RequirePackage[binary-units = true]{siunitx}
\sisetup{per-mode = symbol} % fractioned units
\sisetup{range-phrase= \,--\,} % range dash
\sisetup{range-units= single} % range units
\DeclareSIUnit\rpm{rpm}
\DeclareSIUnit\ft{ft}
\DeclareSIUnit\kW{\kilo\watt}
\DeclareSIUnit\HP{HP}
\DeclareSIUnit\Mach{Mach}
\DeclareSIUnit\kts{kts}
\DeclareSIUnit\Arms{Arms}
\DeclareSIUnit\h{\hour}
\DeclareSIUnit\kWh{kWh}
\DeclareSIUnit\Wh{Wh}
\DeclareSIUnit\AU{AU}

% Figures, keep them in the original section
\RequirePackage{float}
\RequirePackage[section]{placeins}

% Rotate-to-fit figures
\RequirePackage[figuresleft]{rotating}

% Rotate-to-fit pages
\RequirePackage{pdflscape}

% Tables
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{adjustbox}
\RequirePackage{longtable}
\RequirePackage{ltablex}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{colortbl}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Code
\RequirePackage{listings}
\RequirePackage[numbered, framed]{matlab-prettifier}
\lstset{
    language = Matlab,
    style = Matlab-editor,
    basicstyle = \mlttfamily,
    numbers = left,
	frame = single,
	tabsize = 4,
	showstringspaces=false,
	breaklines = true
}

% Captions
\RequirePackage{caption}
\RequirePackage{subcaption}

% Math
\RequirePackage{mathtools}
% \RequirePackage{amsmath}
\RequirePackage{nicefrac}
\RequirePackage{bm}
\RequirePackage{commath}
\RequirePackage{wasysym}
\RequirePackage{cancel}
\RequirePackage{physics}
\RequirePackage{relsize}
% \RequirePackage{breqn}
\DeclareMathOperator{\sign}{sgn}
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\spanspace}{span}
\renewcommand{\Re}{\operatorname{Re}}
\renewcommand{\Im}{\operatorname{Im}}
\DeclareMathOperator*{\Assembly}{
    \mathlarger{\mathlarger{\mathlarger{\boldsymbol{\mathsf{A}}}}}
}
\DeclareMathOperator*{\Localize}{
    \mathlarger{\mathlarger{\mathlarger{\boldsymbol{\mathsf{L}}}}}
}

% Chemistry
% \RequirePackage[version = 4]{mhchem}
\RequirePackage{chemformula}

% Bibliography
\RequirePackage[backend = biber, style=ieee, giveninits]{biblatex}
\addbibresource{references.bib}
% \nocite{*}

% Multiple files
\RequirePackage{subfiles}

% Footnotes
\RequirePackage{footnote}

% Mini toc/lof/lot
% \RequirePackage{minitoc}

% Insert pdfs
% \RequirePackage{pdfpages}

% Currency
\RequirePackage{eurosym}
\DeclareUnicodeCharacter{20AC}{\euro}
\DeclareSIUnit\EUR{\text{\euro}}
\DeclareSIUnit\USD{\$}
\newcommand{\usd}[2][]{
    \SI{#2}[\$\,]{#1}
} % e.g. \usd{100}, \usd[M]{100}

% File/directory tree structure
\RequirePackage{dirtree}

% Hyperlinks
\RequirePackage[hidelinks]{hyperref}

% Add parentheses around Equation (#)
\AtBeginDocument{
    \def\equationautorefname~#1\null{Equation~(#1)\null}
}

%% COVER

\newcommand*{\ucbcourse}[1]{\def\@ucbcourse{#1}}
\newcommand*{\ucbtitle}[1]{\def\@ucbtitle{#1}}
\newcommand*{\ucbgroup}[1]{\def\@ucbgroup{#1}}
\newcommand{\ucbauthors}[1]{\def\@ucbauthors{#1}}
\newcommand*{\ucblocation}[1]{\def\@ucblocation{#1}}
\newcommand*{\ucbdate}[3]{
    \newdate{ucbdate}{#1}{#2}{#3}
    \def\@ucbdate{ucbdate}
}

\newcommand{\ucbcover}{
    \begin{titlepage}
    \begin{center}
    
    \vspace{\fill}
    
    \includegraphics[width = 0.6\textwidth]{img/ucb.eps}
    ~\\[15pt]
    Ann and H.J. Smead Department of Aerospace Engineering Sciences
    
    \vspace{\fill}
    
    {\rule{\linewidth}{0.25mm}}
    ~\\[10pt]
    \textsc{\Large \@ucbcourse}
    ~\\[15pt]
    \begin{doublespace}
        \textsc{\huge \@ucbtitle}
    \end{doublespace}
    {\rule{\linewidth}{0.25mm}}
    
    \vspace{\fill}
    
    \ifdefined\@ucbgroup
        \textsc{Group: \@ucbgroup}
    \fi
    ~\\[0pt]
    {\rule{7.5cm}{0.25mm}}
    ~\\[5pt]
    \@ucbauthors
    {\rule{7.5cm}{0.25mm}}
    
    \vspace{\fill}
    
    \@ucblocation
    \\[5pt]
    \ifdefined\@ucbdate
        \monthdayyear{\displaydate{\@ucbdate}}
    \else
        \monthyear{\today}
    \fi
    
    
    \end{center}
    \end{titlepage}
}

\newcommand*{\ucbbib}{
    \printbibliography[heading = bibintoc]
}
