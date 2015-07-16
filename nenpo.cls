\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{anct}
\LoadClass[10pt, a4paper, twocolumn]{jsarticle}

%用紙設定
%上下余白25mm・左右余白20mm・段間余白10mm・1ページ46行・1行24文字
%行数と文字数は行間隔と文字間隔で指定(本文最初にも記述)
\renewcommand{\baselinestretch}{0.95}
\setlength{\topmargin}{-0.4truemm}
\setlength{\oddsidemargin}{-5.4truemm}
\setlength{\evensidemargin}{-5.4truemm}
\setlength{\headheight}{0truemm}
\setlength{\headsep}{0truemm}
\setlength{\textwidth}{170truemm}
\setlength{\textheight}{247truemm}
\setlength{\columnsep}{10truemm}
\setlength{\footskip}{12truemm}
\setlength{\skip\footins}{3pt plus 5pt minus 2pt}

%定義変更
%セクションを年報スタイルに
\makeatletter
  \def\@seccntformat#1{% #1: <counter name>
    \@nameuse{@seccnt@prefix@#1}%
    \@nameuse{the#1}%
    \@nameuse{@seccnt@postfix@#1}%
    \@nameuse{@seccnt@afterskip@#1}}
  \def\@seccnt@postfix@section{.}
  \def\@seccnt@afterskip@section{\hskip 1em}
  \def\@seccnt@afterskip@subsection{\hskip 1em}
  \def\@seccnt@afterskip@subsubsection{\hskip 1em}
\makeatother
\renewcommand{\thesubsection}{\arabic{section}$\cdot$\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{section}$\cdot$\arabic{subsection}$\cdot$\arabic{subsubsection}}

%参考文献を年報スタイルに
\makeatletter
\renewcommand{\@cite}[1]{\textsuperscript{#1)}}
\renewcommand{\@biblabel}[1]{#1)}
\makeatother

%脚注の水平線を長くする
\renewcommand{\thefootnote}{*}
\renewcommand{\footnoterule}{%
  \kern 5pt
  \hrule width \columnwidth
  \kern 5pt
}

%脚注の開始位置を本文の頭とそろえる
\makeatletter
\renewcommand\@makefntext[1]{
\advance\leftskip 1zw
\parindent 1zw
\noindent
\llap{\@makefnmark\hskip0.3zw}#1}
\makeatother

%ページ先頭のセクションの上余白をなくす
\makeatletter
\def\@startsection#1#2#3#4#5#6{
\if@noskipsec \leavevmode \fi
\par
\@tempskipa #4\relax
\@afterindenttrue
\ifdim \@tempskipa <\z@
\@tempskipa -\@tempskipa \@afterindentfalse
\fi
\if@nobreak
\everypar{}
\else
\addpenalty\@secpenalty\addvspace\@tempskipa
\fi
\@ifstar
{\@ssect{#3}{#4}{#5}{#6}}
{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\makeatother

\makeatletter
  % sectionのfontsizeを普通に
  \renewcommand{\section}{
    \@startsection{section}{1}{\z@}%
    {0.6\Cvs}{\z@}%
    {\normalfont\normalsize\headfont\raggedright}}
  % subsectionを1字下げる
  \renewcommand{\subsection}{
    \@startsection{subsection}{2}{1em}%
    {\z@}{\z@}%
    {\normalfont\normalsize\headfont}}
  % subsectionを1字下げる
  \renewcommand{\subsubsection}{
    \@startsection{subsubsection}{3}{1em}%
    {\z@}{\z@}%
    {\normalfont\normalsize\headfont}}
\makeatother

%キャプションの様式をゴシックに
\makeatletter
\long\def\@makecaption#1#2{\sf
\vskip\abovecaptionskip
\iftdir\sbox\@tempboxa{#1\hskip1zw#2}
\else\sbox\@tempboxa{#1~ #2}
\fi
\ifdim \wd\@tempboxa >\hsize
\iftdir #1\hskip1zw#2\relax\par
\else #1~ #2\relax\par\fi
\else
\global \@minipagefalse
\hbox to\hsize{\hfil\box\@tempboxa\hfil}
\fi
\vskip\belowcaptionskip}
\makeatother

%アブストラクトの様式は引用で実現
\renewenvironment{quote}
{\list{}{
\rightmargin=10mm
\leftmargin=10mm
\topsep=0mm
}\item\relax}{\endlist}

% maketitle
\makeatletter
  \renewcommand{\maketitle}{\par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\advance\leftskip 3zw
        \parindent 1zw\noindent
        \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3zw}##1}%
      \if@twocolumn
        \ifnum \col@number=\@ne
          \@maketitle
        \else
          \twocolumn[\@maketitle]%
        \fi
      \else
        \newpage
        \global\@topnum\z@  % Prevents figures from going at top of page.
        \@maketitle
      \fi
      \plainifnotempty
      \@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\etitle\relax
    \global\let\@etitle\@empty
    \global\let\eauthor\relax
    \global\let\@eauthor\@empty
    \global\let\abstract\relax
    \global\let\@abstract\@empty
    \global\let\keywords\relax
    \global\let\@keywords\@empty
    \global\let\and\relax
  }
  \def\@maketitle{%
    \newpage\null
    \vskip 30pt
    \begin{center}%
      \let\footnote\thanks
      {\LARGE \sf \@title \par}%
      \vskip 10pt
      {
        \lineskip .5em
        \begin{tabular}[t]{c}%
          \@author
        \end{tabular}\par}%
      \vskip 10pt
      {\large \@etitle \par}%
      \vskip 10pt
      {
        \lineskip .5em
        \begin{tabular}[t]{c}%
          \@eauthor
        \end{tabular}\par}%
      \vskip 10pt
    \end{center}%
    \begin{center}
      {\bf ABSTRACT}%
      \vskip 10pt
    \end{center}
    \begin{quote}%
      \hskip 22pt
      {\@abstract \par}%
    \end{quote}%
    \vskip 10pt
    \begin{center}
      {\bf KEY WORDS} {\rm: \@keywords \par}%
    \end{center}
    \par\vskip 30pt
    \ifvoid\@abstractbox\else\centerline{\box\@abstractbox}\vskip1.5em\fi
  }
  \long\def\etitle#1{\long\gdef\@etitle{#1}}
  \long\def\eauthor#1{\long\gdef\@eauthor{#1}}
  \long\def\abstract#1{\long\gdef\@abstract{#1}}
  \long\def\keywords#1{\long\gdef\@keywords{#1}}
\makeatother

% 図と図の間のスペース
\setlength\floatsep{10pt}
% 本文と図の間のスペース
\setlength\textfloatsep{10pt}
% 本文中の図のスペース
\setlength\intextsep{3truemm}
% 図とキャプションの間のスペース
\setlength\abovecaptionskip{10pt}
