%%
%% This is file `ustcthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ustcthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2017-2019 by jiaopjie
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
  [2019/02/12 v1.1 USTC thesis template]
\newif\if@ustc@bachelor
\newif\if@ustc@chinese
\newif\if@ustc@professional
\newif\if@ustc@openright
\DeclareOption{doctor}{%
  \@ustc@bachelorfalse
  \def\ustc@thesisname{博士学位论文}
  \def\ustc@enthesisname{A dissertation for doctor's degree}
}
\DeclareOption{master}{%
  \@ustc@bachelorfalse
  \def\ustc@thesisname{硕士学位论文}
  \def\ustc@enthesisname{A dissertation for master's degree}
}
\DeclareOption{bachelor}{%
  \@ustc@bachelortrue
  \def\ustc@thesisname{学士学位论文}
  \def\ustc@enthesisname{A dissertation for bachelor's degree}
}
\DeclareOption{chinese}{\@ustc@chinesetrue}
\DeclareOption{english}{\@ustc@chinesefalse}
\DeclareOption{academic}{\@ustc@professionalfalse}
\DeclareOption{professional}{\@ustc@professionaltrue}
\DeclareOption{openany}{\@ustc@openrightfalse}
\DeclareOption{openright}{\@ustc@openrighttrue}
\ExecuteOptions{doctor, chinese, academic}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\if@ustc@openright
  \PassOptionsToClass{openright}{book}
\else
  \PassOptionsToClass{openany}{book}
\fi
\LoadClass{book}
\if@ustc@bachelor
  \@ustc@professionalfalse
\fi
\if@ustc@professional
  \edef\ustc@thesisname{专业\ustc@thesisname}
\fi
\PassOptionsToPackage{no-math}{fontspec}
\if@ustc@chinese
  \PassOptionsToPackage{linespread=1}{ctex}
\else
  \PassOptionsToPackage{scheme=plain}{ctex}
\fi
\RequirePackage[heading, zihao=-4]{ctex}[2014/03/06]
\AtBeginDocument{\ttfamily\rmfamily}
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\if@ustc@bachelor
  \renewcommand\normalsize{\fontsize{12bp}{22bp}\selectfont}
\else
  \renewcommand\normalsize{\fontsize{12bp}{20bp}\selectfont}
\fi
\if@ustc@chinese
  \newcommand\notationname{符号说明}
  \newcommand\acknowledgementsname{致谢}
  \newcommand\publicationsname{在读期间发表的学术论文与取得的研究成果}
  \newcommand\captionnotename{注：}
\else
  \newcommand\notationname{Notation}
  \newcommand\acknowledgementsname{Acknowledgements}
  \newcommand\publicationsname{Publications}
  \newcommand\captionnotename{Notes:\space}
\fi
\RequirePackage{geometry}
\geometry{
  paper      = a4paper,
  vmargin    = 25.4mm,
  hmargin    = 31.7mm,
  headsep    = 7mm,
  headheight = 3.4mm,
  footskip   = 7.9mm,
}
\RequirePackage{titleps}
\if@ustc@bachelor
  \newcommand\ustc@head@font{\fontsize{9bp}{14bp}\selectfont}
  \newcommand\ustc@head@header{中国科学技术大学本科毕业论文}
\else
  \newcommand\ustc@head@font{\fontsize{10.5bp}{16bp}\selectfont}
  \newcommand\ustc@head@header
    {\if@mainmatter\CTEXthechapter\quad\fi\chaptertitle}
\fi
\newcommand\ustc@head@footer{\thepage}
\newpagestyle{main}[\ustc@head@font]{%
  \sethead{}{\ustc@head@header}{}%
  \setfoot{}{\ustc@head@footer}{}%
  \headrule
}
\pagestyle{main}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}%
  \if@ustc@bachelor
    \renewcommand\ustc@head@footer{}%
  \fi
}
\let\ustc@save@cleardoublepage\cleardoublepage
\renewcommand\cleardoublepage{%
  \clearpage
  \begingroup
    \pagestyle{empty}%
    \ustc@save@cleardoublepage
  \endgroup
}
\RequirePackage{hyperref}
\hypersetup{
  bookmarksopen      = true,
  bookmarksopenlevel = 1,
  bookmarksnumbered  = true,
  linkcolor          = blue,
  linktoc            = all,
  hidelinks,
}
\AtBeginDocument{%
  \hypersetup{%
    pdftitle   = {\@title},
    pdfauthor  = {\@author},
    pdfsubject = {中国科学技术大学\ustc@thesisname},
  }%
}
\def\ustc@def@term#1{%
  \expandafter\def\csname #1\endcsname##1{%
    \expandafter\def\csname ustc@#1\endcsname{##1}%
  }%
  \csname #1\endcsname{}%
}%
\ustc@def@term{entitle}
\ustc@def@term{enauthor}
\ustc@def@term{endate}
\ustc@def@term{major}
\ustc@def@term{enmajor}
\ustc@def@term{supervisor}
\ustc@def@term{ensupervisor}
\ustc@def@term{secrettext}
\ustc@def@term{ensecrettext}
\ustc@def@term{professionaltype}
\ustc@def@term{enprofessionaltype}
\date{\ctexset{today=big}\today}
\endate{\ctexset{today=old}\today}
\newcommand\ustc@tabularcell[2][c]
  {\begin{tabular}[t]{@{}#1@{}}#2\end{tabular}}
\RequirePackage{graphicx}
\newcommand\ustc@make@title{%
  \begingroup
    \cleardoublepage
    \vspace*{-\topskip}\vspace*{4.6mm}%
    \centering\nointerlineskip
    \parbox[t][10mm][t]{\textwidth}
      {\raggedleft\fontsize{14bp}{21bp}\selectfont
      \fangsong\ustc@secrettext}\par
    \sffamily\nointerlineskip
    \includegraphics[height=36bp]{logo/ustc_logo_text}\par
    \vspace{-36bp}\vspace{23mm}\nointerlineskip
    \parbox[t][27mm][t]{\textwidth}
      {\centering\fontsize{56bp}{84bp}\selectfont
      \makebox[\textwidth][c]{\ustc@thesisname}}\par
    \nointerlineskip
    \if@ustc@professional
      \parbox[t][18mm][t]{\textwidth}
        {\centering\lishu\fontsize{26bp}{39bp}\selectfont
        （\ustc@professionaltype）}\par
      \nointerlineskip
      \includegraphics[height=42mm]{logo/ustc_logo_fig}\par
      \nointerlineskip
      \parbox[t][55mm][c]{\textwidth}
        {\centering\fontsize{26bp}{39bp}\selectfont
        \bfseries\@title}\par
    \else
      \vspace{12mm}%
      \includegraphics[height=42mm]{logo/ustc_logo_fig}\par
      \nointerlineskip
      \parbox[t][61mm][c]{\textwidth}
        {\centering\fontsize{26bp}{39bp}\selectfont
        \bfseries\@title}\par
    \fi
    \nointerlineskip\fontsize{16bp}{30bp}\selectfont
    \begin{tabular}{@{}lc@{}}%
      作者姓名：&\rmfamily\ustc@tabularcell{\@author}\\
      \if@ustc@professional 专业领域：\else 学科专业：\fi
                &\rmfamily\ustc@tabularcell{\ustc@major}\\
      导师姓名：&\rmfamily\ustc@tabularcell{\ustc@supervisor}\\
      完成时间：&\rmfamily\ustc@tabularcell{\@date}\\
    \end{tabular}\par
  \endgroup
}
\newcommand\ustc@make@entitle{%
  \begingroup
    \cleardoublepage
    \vspace*{-\topskip}\vspace*{4.6mm}%
    \centering\nointerlineskip
    \parbox[t][10mm][t]{\textwidth}
      {\raggedleft\fontsize{14bp}{21bp}\selectfont
      \ustc@ensecrettext}\par
    \nointerlineskip
    \parbox[t][10mm][t]{\textwidth}
      {\centering\sffamily\fontsize{20bp}{30bp}\selectfont
      University of Science and Technology of China}\par
    \nointerlineskip
    \parbox[t][13mm][t]{\textwidth}
      {\centering\sffamily\fontsize{26bp}{39bp}\selectfont
      \ustc@enthesisname}\par
    \nointerlineskip
    \if@ustc@professional
      \parbox[t][25mm][t]{\textwidth}
        {\centering\fontsize{16bp}{24bp}\selectfont
        (\ustc@enprofessionaltype)}\par
      \nointerlineskip
      \includegraphics[height=42mm]{logo/ustc_logo_fig}\par
      \nointerlineskip
      \parbox[t][75mm][c]{\textwidth}
        {\centering\fontsize{26bp}{39bp}\selectfont
        \sffamily\bfseries\ustc@entitle}\par
    \else
      \vspace{19mm}%
      \includegraphics[height=42mm]{logo/ustc_logo_fig}\par
      \nointerlineskip
      \parbox[t][81mm][c]{\textwidth}
        {\centering\fontsize{26bp}{39bp}\selectfont
        \sffamily\bfseries\ustc@entitle}\par
    \fi
    \nointerlineskip\fontsize{16bp}{30bp}\selectfont
    \begin{tabular}{@{}lc@{}}%
      Author:      &\ustc@tabularcell{\ustc@enauthor}\\
      Speciality:  &\ustc@tabularcell{\ustc@enmajor}\\
      Supervisors: &\ustc@tabularcell{\ustc@ensupervisor}\\
      Date:        &\ustc@tabularcell{\ustc@endate}\\
    \end{tabular}\par
  \endgroup
}
\newcommand\ustc@origindeclare{%
本人声明所呈交的学位论文，是本人在导师指导下进行研究工作所取得的成果。%
除已特别加以标注和致谢的地方外，论文中不包含任何他人已经发表或撰写过%
的研究成果。与我一同工作的同志对本研究所做的贡献均已在论文中作了明确%
的说明。%
}
\newcommand\ustc@authorization{%
作为申请学位的条件之一，学位论文著作权拥有者授权中国科学技术大学拥有%
学位论文的部分使用权，即：学校有权按有关规定向国家有关部门或机构送交%
论文的复印件和电子版，允许论文被查阅和借阅，可以将学位论文编入《中国%
学位论文全文数据库》等有关数据库进行检索，可以采用影印、缩印或扫描等%
复制手段保存、汇编学位论文。本人提交的电子文档的内容和纸质论文的内容%
相一致。\par
保密的学位论文在解密后也遵守此规定。%
}
\newcommand\ustc@make@declare{%
  \cleardoublepage
  \vspace*{7mm}%
  \begingroup
    \centering\sffamily\fontsize{16bp}{24bp}\selectfont
    中国科学技术大学学位论文原创性声明\par
  \endgroup
  \vspace{7mm}%
  \ustc@origindeclare\par
  \vspace{7mm}%
  作者签名：\underline{\hspace{8em}}\hfill
  签字日期：\underline{\hspace{8em}}\hspace*{2em}\par
  \vspace{28mm}%
  \begingroup
    \centering\sffamily\fontsize{16bp}{24bp}\selectfont
    中国科学技术大学学位论文授权使用声明\par
  \endgroup
  \vspace{7mm}%
  \ustc@authorization\par
  \vspace{7mm}%
  \setlength{\fboxsep}{0.05em}%
  \fbox{\rule[0.683em]{0.683em}{0em}} 公开\qquad
  \fbox{\rule[0.683em]{0.683em}{0em}} 保密%
  （\underline{\qquad}年）\par
  \vspace{7mm}%
  作者签名：\underline{\hspace{8em}}\hfill
  导师签名：\underline{\hspace{8em}}\hspace*{2em}\par
  \vspace{7mm}%
  签字日期：\underline{\hspace{8em}}\hfill
  签字日期：\underline{\hspace{8em}}\hspace*{2em}\par
}
\renewcommand\maketitle{%
  \begin{titlepage}%
    \pagenumbering{Alph}%
    \pagestyle{empty}%
    \normalfont\normalsize\parindent2em\relax
    \pdfbookmark[-1]{\@title}{title}%
    \ustc@make@title
    \ustc@make@entitle
    \if@ustc@bachelor\else
      \ustc@make@declare
    \fi
    \cleardoublepage
  \end{titlepage}%
}%
\let\ustc@save@tableofcontents\tableofcontents
\let\ustc@save@listoffigures\listoffigures
\let\ustc@save@listoftables\listoftables
\if@ustc@bachelor
  \renewcommand\tableofcontents{%
    \cleardoublepage
    \pagenumbering{arabic}%
    \renewcommand\ustc@head@footer{\thepage}%
    \pdfbookmark[0]{\contentsname}{contents}%
    \ustc@save@tableofcontents
  }
  \renewcommand\listoffigures{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \pdfbookmark[0]{\listfigurename}{listoffigures}%
    \ustc@save@listoffigures
  }
  \renewcommand\listoftables{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \pdfbookmark[0]{\listtablename}{listoftables}%
    \ustc@save@listoftables
  }
\else
  \renewcommand\tableofcontents{%
    \cleardoublepage
    \pdfbookmark[0]{\contentsname}{contents}%
    \ustc@save@tableofcontents
  }
  \renewcommand\listoffigures{%
    \cleardoublepage
    \pdfbookmark[0]{\listfigurename}{listoffigures}%
    \ustc@save@listoffigures
  }
  \renewcommand\listoftables{%
      \cleardoublepage
      \pdfbookmark[0]{\listtablename}{listoftables}%
      \ustc@save@listoftables
  }
\fi
\if@ustc@bachelor
  \let\ustc@save@chapter\chapter
  \let\ustc@save@appendix\appendix
  \renewcommand\chapter{%
    \if@mainmatter
      \addtocontents{toc}{\protect\addvspace{22bp}}%
    \fi
    \ustc@save@chapter
  }
  \renewcommand\mainmatter{%
    \clearpage
    \@mainmattertrue
    \renewcommand\ustc@head@footer{\thepage}%
  }
  \renewcommand\appendix{%
    \ustc@save@appendix
    \renewcommand\chapter{\ustc@save@chapter}%
  }
\fi
\RequirePackage{titletoc}
\if@ustc@bachelor
  \titlecontents{chapter}[0em]
    {\normalfont\fontsize{12bp}{22bp}\selectfont}
    {\thecontentslabel\hspace{0.5em}}{}
    {\titlerule*[12bp]{$\cdot$}\contentspage}
  \titlecontents{section}[1em]
    {\normalfont\fontsize{12bp}{22bp}\selectfont}
    {\thecontentslabel\hspace{0.5em}}{}
    {\titlerule*[12bp]{$\cdot$}\contentspage}
  \titlecontents{subsection}[2em]
    {\normalfont\fontsize{12bp}{22bp}\selectfont}
    {\thecontentslabel\hspace{0.5em}}{}
    {\titlerule*[12bp]{$\cdot$}\contentspage}
\else
  \titlecontents{chapter}[0em]
    {\addvspace{6bp}\normalfont\fontsize{14bp}{21bp}\selectfont}
    {\thecontentslabel\hspace{0.5em}}{}
    {\fontsize{12bp}{21bp}\selectfont
      \titlerule*[12bp]{$\cdot$}\contentspage}
  \titlecontents{section}[1em]
    {\addvspace{6bp}\normalfont\fontsize{12bp}{20bp}\selectfont}
    {\thecontentslabel\hspace{0.5em}}{}
    {\titlerule*[12bp]{$\cdot$}\contentspage}
  \titlecontents{subsection}[2em]
    {\addvspace{6bp}\normalfont\fontsize{10.5bp}{16bp}\selectfont}
    {\thecontentslabel\hspace{0.5em}}{}
    {\fontsize{12bp}{16bp}\selectfont
      \titlerule*[12bp]{$\cdot$}\contentspage}
\fi
\if@ustc@bachelor
  \titlecontents{figure}[1em]
    {\normalfont\fontsize{12bp}{22bp}\selectfont}
    {\thecontentslabel\hspace{0.5em}}{}
    {\titlerule*[12bp]{$\cdot$}\contentspage}
  \titlecontents{table}[1em]
    {\normalfont\fontsize{12bp}{22bp}\selectfont}
    {\thecontentslabel\hspace{0.5em}}{}
    {\titlerule*[12bp]{$\cdot$}\contentspage}
\else
  \titlecontents{figure}[1em]
    {\addvspace{6bp}\normalfont\fontsize{12bp}{20bp}\selectfont}
    {\thecontentslabel\hspace{0.5em}}{}
    {\titlerule*[12bp]{$\cdot$}\contentspage}
  \titlecontents{table}[1em]
    {\addvspace{6bp}\normalfont\fontsize{12bp}{20bp}\selectfont}
    {\thecontentslabel\hspace{0.5em}}{}
    {\titlerule*[12bp]{$\cdot$}\contentspage}
\fi
\setcounter{secnumdepth}{3}
\ctexset{
  chapter = {
    pagestyle   = main,
    number      = \arabic{chapter},
    aftername   = \quad,
    beforeskip  = 24bp,
    afterskip   = 18bp,
    format      = \centering\sffamily\bfseries
                  \fontsize{16bp}{24bp}\selectfont,
    nameformat  = {},
    titleformat = {},
  }
}
\@ifpackagelater{ctex}{2016/06/03}
  {\ctexset{chapter/fixskip=true}}
  {
    \ctexset{
      chapter = {
        beforeskip  = 24bp-\topskip,
        format     += \nointerlineskip,
        aftertitle += \nointerlineskip,
      }
    }
  }
\ctexset{
  section={
    beforeskip = 24bp,
    afterskip  = 6bp,
    format     = \sffamily\fontsize{14bp}{21bp}\selectfont,
  }
}
\ctexset{
  subsection={
    indent     = 2\ccwd,
    beforeskip = 12bp,
    afterskip  = 6bp,
    format     = \sffamily\fontsize{13bp}{20bp}\selectfont,
  }
}
\ctexset{
  subsubsection={
    indent     = 2\ccwd,
    number     = \arabic{subsubsection},
    aftername   = .\space,
    beforeskip = 12bp,
    afterskip  = 6bp,
    format     = \sffamily\fontsize{12bp}{20bp}\selectfont,
  }
}
\if@ustc@bachelor
  \ctexset{
    chapter/format       += \mdseries
                            \if@mainmatter\else
                              \fontsize{18bp}{27bp}\selectfont
                            \fi,
    section/format       += \centering
                            \fontsize{15bp}{22bp}\selectfont,
    subsection/format    += \fontsize{14bp}{22bp}\selectfont,
    subsubsection/format += \fontsize{12bp}{22bp}\selectfont,
  }
\fi
\RequirePackage{caption}
\if@ustc@bachelor
  \DeclareCaptionFont{captionfont}
    {\fontsize{12bp}{22bp}\selectfont}
\else
  \DeclareCaptionFont{captionfont}
    {\fontsize{10.5bp}{16bp}\selectfont\bfseries}
\fi
\captionsetup{
  format   = hang,
  labelsep = quad,
  font     = captionfont,
  skip     = 6bp,
}
\captionsetup[figure]{
  aboveskip = 6bp,
  belowskip = 12bp,
}
\captionsetup[table]{
  aboveskip = 6bp,
  belowskip = 6bp,
}
\newcommand\captionnote[1]
  {\caption*{\hangindent=2\ccwd\captionnotename\textnormal{#1}}}
\if@ustc@bachelor
  \newenvironment{notation}{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \pdfbookmark[0]{\notationname}{notation}%
    \chapter*{\notationname}%
  }{}
\else
  \newenvironment{notation}{%
    \cleardoublepage
    \pdfbookmark[0]{\notationname}{notation}%
    \chapter*{\notationname}%
    \renewcommand\ustc@head@header{\notationname}%
    \renewcommand\ustc@head@footer{}%
  }{\clearpage}
\fi
\RequirePackage[numbers,square,sort&compress]{natbib}%
\if@ustc@bachelor\else
  \renewcommand\bibfont{\fontsize{10.5bp}{16bp}\selectfont}%
\fi
\let\ustc@save@thebibliography\thebibliography
\let\ustc@save@endthebibliography\endthebibliography
\renewenvironment{thebibliography}[1]{%
  \clearpage
  \@mainmatterfalse
  \ustc@save@thebibliography{#1}%
  \addcontentsline{toc}{chapter}{\bibname}%
}{\ustc@save@endthebibliography\clearpage}%
\if@ustc@chinese
  \def\chapterautorefname~#1\null{第~#1~章\null}
  \def\sectionautorefname~#1\null{第~#1~节\null}
  \def\subsectionautorefname~#1\null{第~#1~小节\null}
  \def\equationautorefname~#1\null{方程~(#1)\null}
  \renewcommand*\figureautorefname{图}
  \renewcommand*\tableautorefname{表}
  \renewcommand*\appendixautorefname{附录}
  \renewcommand*\footnoteautorefname{脚注}
  \renewcommand*\theoremautorefname{定理}
\fi
\if@ustc@bachelor
  \newenvironment{abstract}{\chapter{中文内容摘要}}{}
\else
  \newenvironment{abstract}{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \pdfbookmark[0]{摘要}{abstract}%
    \chapter*{摘要}%
    \renewcommand{\ustc@head@header}{摘要}%
  }{\clearpage}
\fi
\newcommand\keywords[1]
  {\par\vspace{\baselineskip}\noindent\textbf{关键词：}#1}
\if@ustc@bachelor
  \newenvironment{enabstract}
    {\chapter[英文内容摘要]{Abstract}}{}
\else
  \newenvironment{enabstract}{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \pdfbookmark[0]{Abstract}{enabstract}%
    \chapter*{Abstract}%
    \renewcommand{\ustc@head@header}{Abstract}%
  }{\clearpage}
\fi
\newcommand\enkeywords[1]
  {\par\vspace{\baselineskip}\noindent\textbf{Key Words:}\space#1}%
\if@ustc@bachelor
  \newenvironment{acknowledgements}{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \pdfbookmark[0]{\acknowledgementsname}{acknowledgements}%
    \chapter*{\acknowledgementsname}%
    \renewcommand\ustc@head@footer{}%
  }{\clearpage}
\else
  \newenvironment{acknowledgements}
    {\chapter{\acknowledgementsname}}{}
\fi
\newenvironment{publications}{\chapter{\publicationsname}}{}
\endinput
%%
%% End of file `ustcthesis.cls'.
