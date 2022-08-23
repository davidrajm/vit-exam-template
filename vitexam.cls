\NeedsTeXFormat{LaTeX2e}

\def\fileversion{0.0}
\def\filedate{2022/03/30}

\ProvidesClass{vitexam}[\filedate\space Version \fileversion\space by
David Raj Micheal]


\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{exam}%
}

\ProcessOptions\relax
\LoadClass[addpoints]{exam}

%%%--- Basic Packages---
\RequirePackage{graphicx,amsmath,amssymb, amsfonts,enumitem,multirow,multicol,longtable,fullpage}

%%%%--- colors
\RequirePackage{xcolor}
\definecolor{primaryColor}{RGB}{35, 35, 35}
\definecolor{secondaryColor}{RGB}{194, 17, 100}

%%%--- Custom commands
\newcommand{\OR}{
	\begin{center}
		\bfseries \large OR
	\end{center}
}


%%%%--- points related
\bracketedpoints
\pointsinrightmargin

%%--Page setup
\footer{}{\thepage/\numpages }{}
\extraheadheight{-3em}

%%%---logo

\def\@logo{}
\newcommand{\logo}[1]{
	\def\@logo{\includegraphics[scale=.2]{#1} \\[1em]}
}

%%%----Titles ---

\def\@partmarks{}
\newcommand{\partmarks}[1]{
	\def\@partmarks{(#1)}
}
\renewcommand\thepart{\Alph{part}}
\def\@part[#1]#2{%
	\ifnum \c@secnumdepth >\m@ne
	\refstepcounter{part}%
	\addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
	\else
	\addcontentsline{toc}{part}{#1}%
	\fi
	{\fullwidth{\centering
			\Large\bfseries \partname\nobreakspace--\nobreakspace\thepart \space {\boldmath \@partmarks }
			\par\nobreak
			\large \bfseries #2%
			\markboth{}{}\par}}%
	\nobreak
	\vskip 3ex
	\@afterheading}

%%%--- modification of exam commands
\CorrectChoiceEmphasis{\bfseries\boldmath\color{red!90!black}}
\renewcommand{\choicelabel}{(\alph{choice})}


%%%%--- low level defs for exam top

\def\@exam{}
\newcommand{\exam}[1]{
	\def\@exam{#1}
}
\def\@examshortname{}
\newcommand{\examshortname}[1]{
	\def\@examshortname{#1}
}
\def\@programme{}
\newcommand{\programme}[1]{
	\def\@programme{#1}
}

\def\@semester{}
\newcommand{\semester}[1]{
	\def\@semester{#1}
}

\def\@coursecode{}
\newcommand{\coursecode}[1]{
	\def\@coursecode{#1}
}

\def\@course{}
\newcommand{\course}[1]{
	\def\@course{#1}
}

\def\@faculty{}
\newcommand{\faculty}[1]{
	\def\@faculty{#1}
}

\def\@classNumber{}
\newcommand{\classNumber}[1]{
	\def\@classNumber{#1}
}

\def\@slot{}
\newcommand{\slot}[1]{
	\def\@slot{#1}
}


\def\@duration{}
\newcommand{\duration}[1]{
	\def\@duration{#1}
}

\def\@maxmarks{}
\newcommand{\maxmarks}[1]{
	\def\@maxmarks{#1}
}

\def\@firstmoderatorname{}
\newcommand{\firstmoderatorname}[1]{
	\def\@firstmoderatorname{#1}
}

\def\@firstmoderatordesignation{}
\newcommand{\firstmoderatordesignation}[1]{
	\def\@firstmoderatordesignation{#1}
}


\def\@secondmoderatorname{}
\newcommand{\secondmoderatorname}[1]{
	\def\@secondmoderatorname{#1}
}

\def\@secondmoderatordesignation{}
\newcommand{\secondmoderatordesignation}[1]{
	\def\@secondmoderatordesignation{#1}
}

\newcommand{\makeparbox}[1]{%
	\parbox[t]{0.35\textwidth}{\raggedright #1}
}
\newcommand{\makeparboxSecond}[1]{%
	\parbox[t]{0.25\textwidth}{\raggedright #1}
}


\newcommand{\printexamtop}{
	%% --- Exam Top starts --- 
	\begin{flushright}
		\renewcommand*{\arraystretch}{1.5}
		\begin{tabular}{|p{.1\textwidth}c|p{.25\textwidth}|}
			\hline 
			\textbf{Reg.No} & & \\ \hline 
			\textbf{Name}  & &\\ \hline 
		\end{tabular}
	\end{flushright}
	
	\begin{center}
		\@logo
		\textbf{\Large \@exam}
	\end{center}
	
	\begin{center}
		\renewcommand{\arraystretch}{1.25}
		\small
		\begin{tabular}{|llp{.35\textwidth}|llp{.3\textwidth}|} \hline
			Programme &:& {\@programme}    & Semester &:& {\@semester}  \\ \hline
			\multirow[t]{2}{*}{Course}   &\multirow[t]{2}{*}{:}& \multirow[t]{2}{*}{ \makeparbox{{\@course}}} 
			& Code     &:& {\@coursecode}  \\ \cline{4-6}
			& &  & Slot & : & {\@slot} \\ \hline
			Faculty 	  &:& \makeparbox{{\@faculty}} & Class ID & : & \makeparboxSecond{{\@classNumber}}   \\ \hline 
			Time     & : & \@duration & Max.Marks & : & {\@maxmarks}  \\ \hline
		\end{tabular}
	\end{center}
	%% --- Exam Top ends ---
	
	\modifypdfmeta
}



\AtBeginDocument{\printexamtop}

%%%---- Instructions environment ---
\newenvironment{instructions}{
	\noindent\textbf{Instruction to Candidates:
}}{}




%%%--- For CO, Module mappings -----
%%%---------------------------------
%module
\def\@module{no module}
\newcommand{\module}[1]{
	\def\@module{\bf\textcolor{primaryColor}{#1}}
}

%co
\def\@co{no CO}
\newcommand{\co}[1]{
	\def\@co{\bf\textcolor{primaryColor}{#1}}
}

%difficultylevel
\def\@level{no level}
\newcommand{\level}[1]{
	\def\@level{\bf\textcolor{primaryColor}{#1}}
}

%difficultylevel
\def\@bl{no bl}
\newcommand{\bl}[1]{
	\def\@bl{\bf\textcolor{primaryColor}{#1}}
}


%Hots Question?
\def\@hots{No}
\newcommand{\hots}[1]{
	\def\@hots{\bf\textcolor{primaryColor}{#1}}
}




%%%%%-------For moderation only-----

\newcommand{\formoderation}{
	\qformat{
		\color{secondaryColor}
		\hspace{-.5\leftmargin}\textbf{ Q\thequestion.} 
		\hfill
		\textbf{Module:} \@module  
		\quad \textbf{CO:} \@co
		\quad \textbf{Level:} \@level
		\quad \textbf{BL:} \@bl
		\quad \textbf{Hots:} \@hots
		\quad \textbf{Marks:} \bf\textcolor{primaryColor}{\totalpoints}
		\vrule depth 0em width 0pt % Large depth to make space
	}
}


%%%--- To modify the pdf meta data--------

\RequirePackage{hyperref}
\newcommand{\modifypdfmeta}{
	\hypersetup{
		pdftitle={\@exam},
		pdfsubject={\@exam},
		pdfauthor={\@faculty},
		pdfkeywords={vit, vitcc, exam, question paper}
	}
}


%%%--- Pre-audit form---
\newcommand{\printauditform}{
	%%%--- Exam Top for pre-audit form
	\clearpage
	\thispagestyle{empty}
	
	\begin{footnotesize}
		\begin{center}
			\@logo
			\bfseries 
			\large Pre – Examination Audit of Question Papers For\\ 
			\@exam
		\end{center}
		\vspace*{-1em}
		\renewcommand{\arraystretch}{1.25}	\begin{longtable}[c]{|p{.11\textwidth}lp{.35\textwidth}|p{.1\textwidth}lp{.3\textwidth}|} \hline
			Programme &:& {\@programme}    & Semester &:& {\@semester}  \\ \hline
			\multirow[t]{2}{*}{Course}   &\multirow[t]{2}{*}{:}& \multirow[t]{2}{*}{ \makeparbox{{\@course}}} 
			& Class ID & : & \makeparboxSecond{{\@classNumber}}  \\ \cline{4-6}
			& &  & Slot & : & {\@slot}\\ \hline
			Faculties  	  &:& \makeparbox{{\@faculty}} & Code     &:& {\@coursecode}  \\ \hline 
		\end{longtable}
		\vspace*{-1em}
		%%%-- Form
		\begin{longtable}[c]{|p{.05\textwidth}|p{.8\textwidth}|p{.1\textwidth}|}
			\hline
			\multicolumn{1}{|c|}{\textbf{S. No}} &
			\multicolumn{1}{c|}{\textbf{Parameter}} &
			\multicolumn{1}{c|}{\textbf{Response}} \\ \hline
			\endfirsthead
			%
			\endhead
			%
			1.  & Are course codes, course title, programme, header data correct?             & Yes / No \\ \hline
			2.  & Are the questions evenly distributed to cover the syllabus?                 & Yes / No \\ \hline
			3.  & Are the questions complete with necessary data / diagrams / constants?      & Yes / No \\ \hline
			4.  & Does the number of questions match with offered choices?                    & Yes / No \\ \hline
			5. &
			Are the questions unique (i.e. no repetition) in various sections of the question Paper? &
			Yes / No \\ \hline
			6.  & Does the total marks tally with marks for individual questions?             & Yes / No \\ \hline
			7.  & Whether sufficient ‘HOTS’ Questions are included in the question paper?     & Yes / No \\ \hline
			8.  & Are the alternative questions are same level of ‘HOTS’?                     & Yes / No \\ \hline
			9. & Are multiple question papers (if any) across the slots for the same course significantly	 different? & 	Yes / No \\ \hline
			10. & Are the questions suitable for open book examinations?                      & Yes / No \\ \hline
			11. & Are the questions answerable within \@examshortname\space duration?                           & Yes / No \\ \hline
			12. & Are all the course objectives (COs) mapped with respective questions?       & Yes / No \\ \hline
			13. & Are all the questions mapped with respective course objectives (COs)?       & Yes / No \\ \hline
			14. & The standard of the question paper in a scale of 1 (lowest) to 10 (highest) &          \\ \hline
			&
			If rejected, the reasons for the same - S. No.:  \underline{\hspace{2cm}} &
			\\ \hline
			& Any other Reason:                                                           &          \\ \hline
		\end{longtable}
		\vspace*{-1em}
		Certified that the auditing of the above-mentioned question paper was carried out with the comments listed above. It is assured that the information on the questions / corrections / modification / rejection will be kept confidential. The question paper can be accepted / rejected.
		
		\renewcommand*{\arraystretch}{1.5}
		\begin{longtable}[c]{|l|l|l|l|}
			\hline
			\multicolumn{1}{|c|}{\textbf{Sl. No.}} &
			\multicolumn{1}{c|}{\textbf{Name of the Moderators}} &
			\multicolumn{1}{c|}{\textbf{Designation}} &
			\multicolumn{1}{c|}{\textbf{Signature with Date}} \\ \hline
			1. &
			\@firstmoderatorname & \@firstmoderatordesignation & 
			\\ \hline
				2. &
			\@secondmoderatorname & \@secondmoderatordesignation & 
			\\ \hline
		\end{longtable}
	
		\vfill
		A. Above mentioned changes (if any) have been carried out
		
		\begin{flushright}
			\vspace*{1cm}
			\textbf{Signature of the Course Faculty}
		\end{flushright}
		
	\end{footnotesize}
}

%%%--- For printing labels ----
\def\@classrooms{}
\newcommand{\classrooms}[1]{\def\@classrooms{#1}}

\def\@students{}
\newcommand{\students}[1]{\def\@students{#1}}

\def\@examdate{}
\newcommand{\examdate}[1]{\def\@examdate{#1}}

\def\@when{}
\newcommand{\when}[1]{\def\@when{#1}}

\RequirePackage{pgffor,pgfmath}

\newcommand{\printlabels}{
	\clearpage
	\thispagestyle{empty}
	\foreach \class [count=\c] in \@classrooms {
		\foreach \student [count=\s] in \@students{
			\ifnum\c=\s
			\begin{flushleft}
				\begin{tabular}{lcl}
					Exam Date & : & \@examdate \\
					Room Number & : & \class \\
					Course & : & \@course\\
					Course Code & : & \@coursecode \\
					Slot & : & \@slot \\
					Class Id & : & \@classNumber \\
					Exam Time & : & \@when
				\end{tabular}
			\end{flushleft}
			\fi
			
		}
	}
}



