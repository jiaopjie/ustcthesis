%%
%% This is file `ustcthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ustcthesis.dtx  (with options: `class')
%%
%% Copyright (C) 2017-2017 by jiaopjie
%%
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3 of this license or (at your option) any later
%% version. The latest version of this license is in:
%%
%% http://www.latex-project.org/lppl.txt
%%
%% and version 1.3 or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ustcthesis}
  [2017/01/21 v1.0 USTC thesis template]
\newif\if@ustc@bachelor
\DeclareOption{bachelor}{%
  \@ustc@bachelortrue
  \PassOptionsToClass{oneside}{book}
  \def\ustc@thesisname{学士学位论文}%
  \def\ustc@enthesisname{A dissertation for bachelor's degree}%
}
\DeclareOption{master}{%
  \@ustc@bachelorfalse
  \def\ustc@thesisname{硕士学位论文}%
  \def\ustc@enthesisname{A dissertation for master's degree}%
}
\DeclareOption{doctor}{%
  \@ustc@bachelorfalse
  \def\ustc@thesisname{博士学位论文}%
  \def\ustc@enthesisname{A dissertation for doctor's degree}%
}
\ExecuteOptions{doctor}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\PassOptionsToClass{12pt}{book}
\LoadClass{book}
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[heading,zihao=-4,linespread=1]{ctex}[2014/03/06]
\AtBeginDocument{\ttfamily\rmfamily}
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\if@ustc@bachelor
  \renewcommand\normalsize{\fontsize{12bp}{22bp}\selectfont}
\else
  \renewcommand\normalsize{\fontsize{12bp}{20bp}\selectfont}
\fi
\RequirePackage{geometry}
\geometry{paper=a4paper,
  top=25.4mm, bottom=25.4mm, left=31.7mm, right=31.7mm,
  footskip=7.9mm, headsep=7mm, headheight=3.4mm,
}
\if@ustc@bachelor
  \newcommand\ustc@header@head{中国科学技术大学本科毕业论文}
  \newcommand\ustc@header@size{\fontsize{9bp}{14bp}\selectfont}
\else
  \newcommand\ustc@header@head
    {\if@mainmatter\CTEXthechapter\quad\fi\chaptertitle}
  \newcommand\ustc@header@size{\fontsize{10.5bp}{16bp}\selectfont}
\fi
\newcommand*\ustc@header@foot{\thepage}
\RequirePackage{titleps}
\if@ustc@bachelor
  \newpagestyle{main}[\ustc@header@size]{%
    \sethead{}{\ustc@header@head}{}%
    \setfoot{}{\ustc@header@foot}{}%
    \headrule
  }%
\else
  \if@twoside
    \newpagestyle{main}[\ustc@header@size]{%
      \sethead{}{\ustc@header@head}{}%
      \setfoot[\ustc@header@foot][][]{}{}{\ustc@header@foot}%
      \headrule
    }%
  \else
    \newpagestyle{main}[\ustc@header@size]{%
      \sethead{}{\ustc@header@head}{}%
      \setfoot{}{\ustc@header@foot}{}%
      \headrule
    }%
  \fi
\fi
\pagestyle{main}
\RequirePackage{hyperref}
\hypersetup{
  bookmarksopen=true,
  bookmarksopenlevel=1,
  bookmarksnumbered=true,
  linkcolor=blue,
  hidelinks,
}
\AtBeginDocument{%
  \hypersetup{%
    pdftitle={\@title},
    pdfauthor={\@author},
    pdfsubject={中国科学技术大学\ustc@thesisname},
  }%
}
\renewcommand\maketitle{%
  \cleardoublepage
  \pagenumbering{Alph}%
  \pagestyle{empty}%
  \pdfbookmark[-1]{\@title}{title}%
  \ustc@make@title
  \ustc@make@entitle
  \if@ustc@bachelor
  \else
    \ustc@make@declare
  \fi
  \cleardoublepage
  \renewcommand*\thepage{\arabic{page}}%
  \pagestyle{main}%
}
\def\ustc@def@term#1{%
  \expandafter\def\csname #1\endcsname##1{%
    \expandafter\def\csname ustc@#1\endcsname{##1}%
  }%
  \csname #1\endcsname{}%
}
\ustc@def@term{major}
\ustc@def@term{advisor}
\ustc@def@term{coadvisor}
\ustc@def@term{secrettext}
\ustc@def@term{entitle}
\ustc@def@term{enauthor}
\ustc@def@term{enmajor}
\ustc@def@term{enadvisor}
\ustc@def@term{encoadvisor}
\ustc@def@term{endate}
\ustc@def@term{ensecrettext}
\newcommand\ustc@make@title{%
  \cleardoublepage
  \begin{center}
    \vspace*{-\topskip}\vspace*{14.6mm}\nointerlineskip
    \parbox[t][12mm][t]{\textwidth}
      {\raggedleft\fangsong
       \fontsize{14bp}{21bp}\selectfont\ustc@secrettext}%
    \par\nointerlineskip
    \sffamily
    \parbox[t][23mm][t]{\textwidth}
      {\centering\includegraphics[height=36bp]{logo/ustc_logo_text}}%
    \par\nointerlineskip
    \parbox[t][30mm][t]{\textwidth}
      {\centering\fontsize{56bp}{84bp}\selectfont\ustc@thesisname}%
    \par\nointerlineskip
    \parbox[t][53mm][c]{\textwidth}
      {\centering\includegraphics[height=48mm]{logo/ustc_logo_fig}}%
    \par\nointerlineskip
    \parbox[t][47mm][c]{\textwidth}
      {\centering\fontsize{26bp}{39bp}\selectfont\@title}%
    \par\nointerlineskip
    \parbox[t][42mm][c]{\textwidth}{%
      \fontsize{16bp}{30bp}\selectfont
      \begin{tabular}{@{\hspace*{28.3mm}}lc}
        作者姓名: &\textrm{\@author}\\
        学科专业: &\textrm{\ustc@major}\\
        导师姓名: &\textrm{\ustc@advisor}\\
        \ifx\@empty\ustc@coadvisor
        \else
          &\textrm{\ustc@coadvisor}\\
        \fi
        完成时间: &\textrm{\@date}
      \end{tabular}
    }%
  \end{center}
}
\newcommand\ustc@make@entitle{%
  \cleardoublepage
  \begin{center}
    \vspace*{-\topskip}\vspace*{14.6mm}\nointerlineskip
    \parbox[t][10mm][t]{\textwidth}
      {\raggedleft\normalfont
       \fontsize{14bp}{21bp}\selectfont\ustc@ensecrettext}%
    \par\nointerlineskip
    \sffamily
    \parbox[t][10mm][t]{\textwidth}
      {\centering\fontsize{20bp}{30bp}\selectfont
        University of Science and Technology of China}%
    \par\nointerlineskip
    \parbox[t][19mm][t]{\textwidth}
      {\centering\fontsize{26bp}{39bp}\selectfont\ustc@enthesisname}%
    \par\nointerlineskip
    \includegraphics[height=48mm]{logo/ustc_logo_fig}%
    \par\nointerlineskip
    \parbox[t][78mm][c]{\textwidth}
      {\centering\fontsize{26bp}{39bp}\selectfont\ustc@entitle}%
    \par\nointerlineskip
    \parbox[t][42mm][c]{\textwidth}{%
      \fontsize{16bp}{30bp}\selectfont\rmfamily
      \begin{tabular}{@{\hspace*{28.3mm}}lc}
        Author: &\textrm{\ustc@enauthor}\\
        Speciality: &\textrm{\ustc@enmajor}\\
        Advisor: &\textrm{\ustc@enadvisor}\\
        \ifx\@empty\ustc@encoadvisor
        \else
          &\textrm{\ustc@encoadvisor}\\
        \fi
        Date: &\textrm{\ustc@endate}
      \end{tabular}
    }%
  \end{center}
}
\newcommand\ustc@origindeclare{
本人声明所呈交的学位论文，是本人在导师指导下进行研究工作所取得的成果。
除已特别加以标注和致谢的地方外，论文中不包含任何他人已经发表或撰写过
的研究成果。与我一同工作的同志对本研究所做的贡献均已在论文中作了明确
的说明。
}
\newcommand\ustc@authorization{
作为申请学位的条件之一，学位论文著作权拥有者授权中国科学技术大学拥有
学位论文的部分使用权，即：学校有权按有关规定向国家有关部门或机构送交
论文的复印件和电子版，允许论文被查阅和借阅，可以将学位论文编入《中国
学位论文全文数据库》等有关数据库进行检索，可以采用影印、缩印或扫描等
复制手段保存、汇编学位论文。本人提交的电子文档的内容和纸质论文的内容
相一致。\par 保密的学位论文在解密后也遵守此规定。
}
\newcommand\ustc@make@declare{
  \cleardoublepage
  \begingroup
    \vspace*{0.5em}
    \begin{center}
      \sffamily\fontsize{16bp}{24bp}\selectfont
      中国科学技术大学学位论文原创性声明
    \end{center}
    \par\medskip
    \ustc@origindeclare
    \par\vskip 1.5em
    作者签名：\underline{\hspace{8em}}\hfill
    签字日期：\underline{\hspace{8em}}\hspace*{2em}
    \par\vskip 7em
    \begin{center}
      \sffamily\fontsize{16bp}{24bp}\selectfont
      中国科学技术大学学位论文授权使用声明
    \end{center}
    \par\medskip
    \ustc@authorization
    \par\vskip 1.5em
    \setlength{\fboxsep}{0.05em}
    \fbox{\rule[0.683em]{0.683em}{0em}} 公开\qquad
    \fbox{\rule[0.683em]{0.683em}{0em}} 保密
    （\underline{\qquad}年）
    \par\vskip 1.5em
    作者签名：\underline{\hspace{8em}}\hfill
    导师签名：\underline{\hspace{8em}}\hspace*{2em}
    \par\vskip 1.5em
    签字日期：\underline{\hspace{8em}}\hfill
    签字日期：\underline{\hspace{8em}}\hspace*{2em}
  \endgroup
}
\let\ustc@save@tableofcontents\tableofcontents
\renewcommand\tableofcontents{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \pdfbookmark[0]{\contentsname}{contents}%
  \ustc@save@tableofcontents
}
\RequirePackage{titletoc}
\titlecontents{chapter}[0em]
  {\addvspace{6bp}\fontsize{14bp}{21bp}\selectfont}
  {\thecontentslabel\hspace{0.5em}}{}
  {\fontsize{12bp}{21bp}\selectfont
    \titlerule*[12bp]{$\cdot$}\contentspage
  }
\titlecontents{section}[1em]
  {\addvspace{6bp}}
  {\thecontentslabel\hspace{0.5em}}{}
  {\titlerule*[12bp]{$\cdot$}\contentspage}
\titlecontents{subsection}[2em]
  {\addvspace{6bp}\fontsize{10.5bp}{16bp}\selectfont}
  {\thecontentslabel\hspace{0.5em}}{}
  {\fontsize{12bp}{16bp}\selectfont
    \titlerule*[12bp]{$\cdot$}\contentspage
  }
\titlecontents{figure}[1em]
  {\addvspace{6bp}}
  {\thecontentslabel\hspace{0.5em}}{}
  {\titlerule*[12bp]{$\cdot$}\contentspage}
\titlecontents{table}[1em]
  {\addvspace{6bp}}
  {\thecontentslabel\hspace{0.5em}}{}
  {\titlerule*[12bp]{$\cdot$}\contentspage}
\setcounter{secnumdepth}{3}
\RequirePackage{ctexheading}
\ctexset{
  chapter={
    pagestyle=main,
    name={第 , 章},
    number=\arabic{chapter},
    aftername={\quad},
    afterindent=true,
    beforeskip=24bp,
    afterskip=18bp,
    format=\centering\sffamily\fontsize{16bp}{24bp}\selectfont,
    nameformat={},
    titleformat={},
  },
  section={
    afterindent=true,
    beforeskip=24bp,
    afterskip=6bp,
    format=\sffamily\fontsize{14bp}{21bp}\selectfont,
  },
  subsection={
    afterindent=true,
    beforeskip=12bp,
    afterskip=6bp,
    format=\sffamily\fontsize{13bp}{20bp}\selectfont,
  },
  subsubsection={
    afterindent=true,
    beforeskip=12bp,
    afterskip=6bp,
    format=\sffamily,
  },
}
\if@ustc@bachelor
  \ctexset{
    section/format+=\centering\fontsize{15bp}{22bp}\selectfont,
    subsection/format+=\fontsize{14bp}{22bp}\selectfont,
  }
\fi
\let\ustc@save@cleardoublepage\cleardoublepage
\renewcommand\cleardoublepage
  {\clearpage{\pagestyle{empty}\ustc@save@cleardoublepage}}
\if@ustc@bachelor
  \let\ustc@save@chapter\chapter
  \let\ustc@save@appendix\appendix
  \renewcommand\chapter{%
    \if@mainmatter
      \addtocontents{toc}{\protect\addvspace{22bp}}%
    \fi
    \ustc@save@chapter
  }
  \renewcommand\tableofcontents{%
    \cleardoublepage
    \pagenumbering{arabic}%
    \renewcommand\ustc@header@foot{\thepage}%
    \pdfbookmark[0]{\contentsname}{contents}%
    \begingroup
      \ctexset{chapter/format+=\fontsize{18bp}{27bp}\selectfont}%
      \ustc@save@tableofcontents
    \endgroup
  }
  \renewcommand\frontmatter{%
    \cleardoublepage
    \@mainmatterfalse
    \pagenumbering{roman}%
    \renewcommand\ustc@header@foot{}%
  }
  \renewcommand\mainmatter{%
    \cleardoublepage
    \@mainmattertrue
    \renewcommand\ustc@header@foot{\thepage}%
  }
  \renewcommand\appendix{%
    \ustc@save@appendix
    \renewcommand\chapter{\ustc@save@chapter}%
  }
\fi
\RequirePackage{caption}
\if@ustc@bachelor
  \DeclareCaptionFont{captionfont}{}
\else
  \DeclareCaptionFont{captionfont}{\fontsize{10.5bp}{16bp}\selectfont}
\fi
\captionsetup{
  format = hang,
  labelsep = quad,
  font = captionfont,
  labelfont+={bf},
}
\captionsetup[figure]{
  position = bottom,
  aboveskip = 6bp,
  belowskip = 12bp,
}
\captionsetup[table]{
  position = top,
  aboveskip = 6bp,
  belowskip = 6bp,
}
\newcommand\captionnote[1]{%
  \captionsetup{position = bottom}%
  \caption*{\hangindent=2em\makebox[2em]{\textbf{注: }}#1}%
}
\newenvironment{notation}{%
  \ctexset{chapter/format=\centering}%
  \chapter{\notationname}%
  \fontsize{10.5bp}{16bp}\selectfont
}{}
\newcommand\notationname{符号说明}
\RequirePackage[numbers,sort]{natbib}
\renewcommand\bibfont{\fontsize{10.5bp}{16bp}\selectfont}
\let\ustc@save@thebibliography\thebibliography
\let\ustc@save@endthebibliography\endthebibliography
\renewenvironment{thebibliography}[1]{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \ustc@save@thebibliography{#1}%
  \addcontentsline{toc}{chapter}{\bibname}%
}{\ustc@save@endthebibliography\clearpage}
\def\chapterautorefname~#1\null{第#1章\null}
\def\sectionautorefname~#1\null{第#1节\null}
\def\subsectionautorefname~#1\null{第#1小节\null}
\def\equationautorefname~#1\null{方程~(#1)\null}
\renewcommand*\figureautorefname{图}
\renewcommand*\tableautorefname{表}
\renewcommand*\appendixautorefname{附录}
\renewcommand*\footnoteautorefname{脚注}
\renewcommand*\theoremautorefname{定理}
\newenvironment{abstract}{%
  \if@ustc@bachelor
    \ctexset{chapter/format+=\fontsize{18bp}{27bp}\selectfont}
  \fi
  \chapter{\abstractname}%
}{}
\def\abstractname{摘要}
\def\keywords#1
  {\par\vskip\baselineskip\noindent\textbf{关键词: }#1}
\newenvironment{enabstract}{%
  \if@ustc@bachelor
    \ctexset{chapter/format+=\fontsize{18bp}{27bp}\selectfont}
  \fi
  \chapter{\enabstractname}%
}{}
\def\enabstractname{Abstract}
\def\enkeywords#1
  {\par\vskip\baselineskip\noindent\textbf{Keywords: }#1}
\newenvironment{acknowledgements}{%
  \if@ustc@bachelor
    \ctexset{chapter/format+=\fontsize{18bp}{27bp}\selectfont}
    \chapter*{\acknowledgementsname}%
    \renewcommand\ustc@header@foot{}%
  \else
    \chapter{\acknowledgementsname}%
  \fi
}{}
\newcommand\acknowledgementsname{致谢}
\newenvironment{publications}{\chapter{\publicationsname}}{}
\newcommand\publicationsname{在读期间发表的学术论文与取得的研究成果}
\endinput
%%
%% End of file `ustcthesis.cls'.
