\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{riskassessment}
\LoadClass{article}

\RequirePackage{titlesec}
\RequirePackage{hyperref}
\RequirePackage{tabularx}
\RequirePackage{calc}
\RequirePackage{intcalc}

\titleformat{\section}         
    {\Large\scshape\raggedright} 
    {}{0em}
    {}    
    [\titlerule]


\newcommand{\groupname}[1]{
    \newcommand{\group}{#1}
}

\newcommand{\activityname}[1]{
    \title{\Huge Risk Assessment: #1 \\
        \Large \group}
}

\newcommand{\assessor}[2]{
    \author{Assessed by: #1 (\href{mailto:#2}{#2})}
}


% Datetime, Location, Summary
\newcommand{\activitydetails}[3]{
    \section{Activity Details}

    \textbf{Date(s): } #1 \\ 
    \textbf{Location(s): } #2 \\ 
    \textbf{Summary: } #3 
}


\newenvironment{referencelist}{
    \section{References}
    \textit{Additional documents or other sources of information that were referred to when preparing this risk assessment}

    \renewcommand\item[2]{
    ##1 \textit{##2}
        \medskip}}
    {\bigskip}


\newenvironment{risklist}{
    \section{Risks}
    \renewcommand\item[6]{
        \textbf{Hazard: } ##1 \\
        \textbf{Affected Parties: } ##2 \\
        \textbf{Current Control Measures: } ##3 \\
        \textbf{Additional Control Measures: } ##4 \\
        \textbf{Risk: } \intcalcMul{##5}{##6}
        \medskip}}
    {\bigskip}

\newcommand{\review}{
    \section*{Review}
    % A table with spaces for up to three reviewers to sign and add comments.
    \begin{tabular}{|p{3cm}|p{3cm}|p{3cm}|p{3cm}|}
        \hline
        Reviewer name/role &
        Comments &
        Signed &
        Date \\
        \hline
        & & & \\[1.5cm]
        \hline
        & & & \\[1.5cm]
        \hline
        & & & \\[1.5cm]
        \hline
    \end{tabular}
}

\newcommand{\risktable}{
    \section*{Assessment Guidance}

    Each hazard is assigned a number between 1 and 3 indicating the likelihood of the hazard affecting a person:
    \begin{description}
        \item[Low (1):] May only occur in exceptional circumstances
        \item[Medium (2):] Might occur in some circumstances
        \item[High (3):] Will likely occur in most circumstances  
    \end{description}

    Similarly, each hazard is assigned a number between 1 and 3 indicating the magnitude of the impact that the hazard would have, if it did occur:
    \begin{description}
        \item[Low (1):] Superficial or minor injury. Can usually be handled by local first aid procedures.
        \item[Medium (2):] Serious injury, possibly resulting in hospitalisation for up to three days. Complete recovery/rehabilitation could take several months.
        \item[High (3):] Major or fatal injury. Requires extensive medical treatment, including at least three days in hospital.   
    \end{description}

    The hazard's \emph{risk level} is then calculated to be the likelihood rating multiplied by the impact rating. For example, a hazard that is likely to occur in almost all circumstances but only results in a minor injury would have a likelihood rating of $3$, an impact rating of $1$, and an overall risk level of $3 \times 1 = 3$.

    These guidelines are based on those provided in Union Southampton's risk assessment template.
}
