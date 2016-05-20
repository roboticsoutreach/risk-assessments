\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{riskassessment}

% Risk Assessments are landscape and A4
\LoadClass[a4paper,landscape]{article}

% Add packages
\RequirePackage{titlesec,array,calc,footnote}
\RequirePackage{hyperref,intcalc,longtable}
\RequirePackage{multicol}
\RequirePackage[margin=2cm]{geometry}

% Allow footnotes inside tables
\makesavenoteenv{tabular*}

% === CONFIGURE PAGE LAYOUT ===
\setlength{\parskip}{5pt}       % 5pt spacing between paragraphs
\setlength{\parindent}{0pt}     % No paragraph indentation
\setlength{\columnsep}{1.5cm}   % 1.5cm gutter between text columns


% === DEFINE COMMANDS ===

% Show an email address
\newcommand{\email}[1]{\href{mailto:#1}{#1}}

% Set the activity name as a title
\newcommand{\activityname}[1]{
    \title{\centering \Huge Risk Assessment: #1}
    \vspace{25pt}
}

% Details about the activity
% \activitydetails
%   {date}
%   {time}
%   {location}
%   {summary}
\newcommand{\activitydetails}[4]{
    \newcommand{\Dactdet}{
        \section*{Activity Details}
        \begin{tabular*}{\linewidth}[c]{p{2cm}p{\linewidth-2cm}}
            \textbf{Date:}      & #1 \\
            \textbf{Time:}      & #2 \\
            \textbf{Location:}  & #3 \\
            \textbf{Summary:}   & #4 \\
        \end{tabular*}
    }
}

% Details about the assessment
% \assessmentdetails
%   {group}
%   {assessor name}
%   {assessor email}
%   {assessment date}
\newcommand{\assessmentdetails}[4]{
    \newcommand{\Dassdet}{
        \section*{Assessment Details}
        \begin{tabular*}{\linewidth}[c]{p{3cm}p{\linewidth-3cm}}
            \textbf{Student group:}     & #1 \\
            \textbf{Assessor name:}     & #2 \\
            \textbf{Assessor email:}    & \email{#3} \\
            \textbf{Assessment date:}   & #4 \\
        \end{tabular*}
    }
}

% List of references
% Reference items of the form
% \item
%   {description}
%   {source}
\newenvironment{referencelist}{
    \newcommand{\Dreflist}{
        \section*{References}
        \textit{Additional documents or other sources of information that were referred to when preparing this risk assessment}

        \renewcommand\item[2]{
        ##1 \textit{##2}
            \medskip}
        {\bigskip}
    }
}

% List of risks
% Risk items of the form
% \item
%   {hazard}
%   {affected parties}
%   {current control measures}
%   {additional control measures}
%   {likelihood level}{impact level}
\newenvironment{risklist}{
    %\newcommand{\Drisklist}{
        \newpage
        \section*{Risks}

        \begin{longtable}{>{\raggedright}p{4cm}%
                          p{5cm}%
                          p{6cm}%
                          p{6cm}%
                          p{2.2cm}}
            \toprule
            Hazard &
            Who may be affected and how &
            Control measures in place &
            Additional control measures &
            Risk level (/9) \\
            \midrule
            \endhead

            \renewcommand{\item}[6]{
                ##1 &
                ##2 &
                \vspace{-6mm}
                \begin{itemize}
                    \setlength{\itemsep}{0pt plus 1pt}
                    ##3
                \end{itemize} &
                \vspace{-6mm}
                \begin{itemize}
                    \setlength{\itemsep}{0pt plus 1pt}
                    ##4
                \end{itemize} &
                \intcalcMul{##5}{##6} \\
            }

            \bottomrule
        \end{longtable}
    %}
}

% A table with spaces for up to three reviewers to sign and add comments

\newcommand{\Drevlist}{
    \newline
    \section*{Review}
    % A table with spaces for up to three reviewers to sign and add comments.
    \begin{tabular}{|p{6cm}|p{10cm}|p{4cm}|p{3cm}|}
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

\newcommand{\Drisktable}{
    \newline
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


% === Actual layout of file ===

\raggedcolumns
\begin{multicols*}{2}

\assessmentdetails
\Dreflist
\columnbreak
\Dactdet

\end{multicols*}

\risklist
\Drevlist
\Drisktable

% === PDF SETTINGS ===

\hypersetup
    pdftitle={\Dtitle},
    {unicode=true,
    pdfauthor={\Dauthor}}
