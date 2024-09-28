<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"><head>

<meta charset="utf-8">
<meta name="generator" content="quarto-1.4.555">

<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">

<meta name="author" content="Marcos Rodrigues and Pere Gelabert">
<meta name="dcterms.date" content="2024-09-28">

<title>INTROR - Introduction to spatial statistics: Spatial Analysis with R - 111019</title>
<style>
code{white-space: pre-wrap;}
span.smallcaps{font-variant: small-caps;}
div.columns{display: flex; gap: min(4vw, 1.5em);}
div.column{flex: auto; overflow-x: auto;}
div.hanging-indent{margin-left: 1.5em; text-indent: -1.5em;}
ul.task-list{list-style: none;}
ul.task-list li input[type="checkbox"] {
  width: 0.8em;
  margin: 0 0.8em 0.2em -1em; /* quarto-specific, see https://github.com/quarto-dev/quarto-cli/issues/4556 */ 
  vertical-align: middle;
}
/* CSS for syntax highlighting */
pre > code.sourceCode { white-space: pre; position: relative; }
pre > code.sourceCode > span { line-height: 1.25; }
pre > code.sourceCode > span:empty { height: 1.2em; }
.sourceCode { overflow: visible; }
code.sourceCode > span { color: inherit; text-decoration: inherit; }
div.sourceCode { margin: 1em 0; }
pre.sourceCode { margin: 0; }
@media screen {
div.sourceCode { overflow: auto; }
}
@media print {
pre > code.sourceCode { white-space: pre-wrap; }
pre > code.sourceCode > span { text-indent: -5em; padding-left: 5em; }
}
pre.numberSource code
  { counter-reset: source-line 0; }
pre.numberSource code > span
  { position: relative; left: -4em; counter-increment: source-line; }
pre.numberSource code > span > a:first-child::before
  { content: counter(source-line);
    position: relative; left: -1em; text-align: right; vertical-align: baseline;
    border: none; display: inline-block;
    -webkit-touch-callout: none; -webkit-user-select: none;
    -khtml-user-select: none; -moz-user-select: none;
    -ms-user-select: none; user-select: none;
    padding: 0 4px; width: 4em;
  }
pre.numberSource { margin-left: 3em;  padding-left: 4px; }
div.sourceCode
  {   }
@media screen {
pre > code.sourceCode > span > a:first-child::before { text-decoration: underline; }
}
</style>


<script src="site_libs/quarto-nav/quarto-nav.js"></script>
<script src="site_libs/quarto-nav/headroom.min.js"></script>
<script src="site_libs/clipboard/clipboard.min.js"></script>
<script src="site_libs/quarto-search/autocomplete.umd.js"></script>
<script src="site_libs/quarto-search/fuse.min.js"></script>
<script src="site_libs/quarto-search/quarto-search.js"></script>
<meta name="quarto:offset" content="./">
<script src="site_libs/quarto-html/quarto.js"></script>
<script src="site_libs/quarto-html/popper.min.js"></script>
<script src="site_libs/quarto-html/tippy.umd.min.js"></script>
<script src="site_libs/quarto-html/anchor.min.js"></script>
<link href="site_libs/quarto-html/tippy.css" rel="stylesheet">
<link href="site_libs/quarto-html/quarto-syntax-highlighting.css" rel="stylesheet" id="quarto-text-highlighting-styles">
<script src="site_libs/bootstrap/bootstrap.min.js"></script>
<link href="site_libs/bootstrap/bootstrap-icons.css" rel="stylesheet">
<link href="site_libs/bootstrap/bootstrap.min.css" rel="stylesheet" id="quarto-bootstrap" data-mode="light">
<script id="quarto-search-options" type="application/json">{
  "location": "navbar",
  "copy-button": false,
  "collapse-after": 3,
  "panel-placement": "end",
  "type": "overlay",
  "limit": 50,
  "keyboard-shortcut": [
    "f",
    "/",
    "s"
  ],
  "show-item-context": false,
  "language": {
    "search-no-results-text": "No results",
    "search-matching-documents-text": "matching documents",
    "search-copy-link-title": "Copy link to search",
    "search-hide-matches-text": "Hide additional matches",
    "search-more-match-text": "more match in this document",
    "search-more-matches-text": "more matches in this document",
    "search-clear-button-title": "Clear",
    "search-text-placeholder": "",
    "search-detached-cancel-button-title": "Cancel",
    "search-submit-button-title": "Submit",
    "search-label": "Search"
  }
}</script>
<link href="site_libs/htmltools-fill-0.5.8.1/fill.css" rel="stylesheet">

<script src="site_libs/htmlwidgets-1.6.4/htmlwidgets.js"></script>

<link href="site_libs/datatables-css-0.0.0/datatables-crosstalk.css" rel="stylesheet">

<script src="site_libs/datatables-binding-0.33/datatables.js"></script>

<script src="site_libs/jquery-3.6.0/jquery-3.6.0.min.js"></script>

<link href="site_libs/dt-core-1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">

<link href="site_libs/dt-core-1.13.6/css/jquery.dataTables.extra.css" rel="stylesheet">

<script src="site_libs/dt-core-1.13.6/js/jquery.dataTables.min.js"></script>

<link href="site_libs/crosstalk-1.2.1/css/crosstalk.min.css" rel="stylesheet">

<script src="site_libs/crosstalk-1.2.1/js/crosstalk.min.js"></script>


  <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
  <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml-full.js" type="text/javascript"></script>

<script type="text/javascript">
const typesetMath = (el) => {
  if (window.MathJax) {
    // MathJax Typeset
    window.MathJax.typeset([el]);
  } else if (window.katex) {
    // KaTeX Render
    var mathElements = el.getElementsByClassName("math");
    var macros = [];
    for (var i = 0; i < mathElements.length; i++) {
      var texText = mathElements[i].firstChild;
      if (mathElements[i].tagName == "SPAN") {
        window.katex.render(texText.data, mathElements[i], {
          displayMode: mathElements[i].classList.contains('display'),
          throwOnError: false,
          macros: macros,
          fleqn: false
        });
      }
    }
  }
}
window.Quarto = {
  typesetMath
};
</script>

<link rel="stylesheet" href="styles.css">
</head>

<body class="nav-fixed">

<div id="quarto-search-results"></div>
  <header id="quarto-header" class="headroom fixed-top">
    <nav class="navbar navbar-expand-lg " data-bs-theme="dark">
      <div class="navbar-container container-fluid">
      <div class="navbar-brand-container mx-auto">
    <a class="navbar-brand" href="./index.html">
    <span class="navbar-title">INTROR</span>
    </a>
  </div>
            <div id="quarto-search" class="" title="Search"></div>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation" onclick="if (window.quartoToggleHeadroom) { window.quartoToggleHeadroom(); }">
  <span class="navbar-toggler-icon"></span>
</button>
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav navbar-nav-scroll me-auto">
  <li class="nav-item">
    <a class="nav-link active" href="./index.html" aria-current="page"> 
<span class="menu-text">Home</span></a>
  </li>  
  <li class="nav-item">
    <a class="nav-link" href="./about.html"> 
<span class="menu-text">About</span></a>
  </li>  
</ul>
          </div> <!-- /navcollapse -->
          <div class="quarto-navbar-tools">
</div>
      </div> <!-- /container-fluid -->
    </nav>
</header>
<!-- content -->
<div id="quarto-content" class="quarto-container page-columns page-rows-contents page-layout-article page-navbar">
<!-- sidebar -->
<!-- margin-sidebar -->
    <div id="quarto-margin-sidebar" class="sidebar margin-sidebar">
        <nav id="TOC" role="doc-toc" class="toc-active">
    <h2 id="toc-title">On this page</h2>
   
  <ul>
  <li><a href="#module-1-a-brief-introduction-to-r" id="toc-module-1-a-brief-introduction-to-r" class="nav-link active" data-scroll-target="#module-1-a-brief-introduction-to-r"><span class="header-section-number">1</span> Module 1 A brief introduction to R</a></li>
  <li><a href="#module-1-a-brief-introduction-to-r-1" id="toc-module-1-a-brief-introduction-to-r-1" class="nav-link" data-scroll-target="#module-1-a-brief-introduction-to-r-1"><span class="header-section-number">2</span> Module 1 A brief introduction to R</a>
  <ul class="collapse">
  <li><a href="#what-is-r" id="toc-what-is-r" class="nav-link" data-scroll-target="#what-is-r"><span class="header-section-number">2.1</span> What is R?</a>
  <ul class="collapse">
  <li><a href="#getting-and-installing-r" id="toc-getting-and-installing-r" class="nav-link" data-scroll-target="#getting-and-installing-r"><span class="header-section-number">2.1.1</span> Getting and installing R</a></li>
  <li><a href="#documentation-manuals-and-help" id="toc-documentation-manuals-and-help" class="nav-link" data-scroll-target="#documentation-manuals-and-help"><span class="header-section-number">2.1.2</span> Documentation, manuals and help</a></li>
  </ul></li>
  <li><a href="#starting-with-r" id="toc-starting-with-r" class="nav-link" data-scroll-target="#starting-with-r"><span class="header-section-number">2.2</span> Starting with R</a>
  <ul class="collapse">
  <li><a href="#the-r-environment" id="toc-the-r-environment" class="nav-link" data-scroll-target="#the-r-environment"><span class="header-section-number">2.2.1</span> The R environment</a></li>
  </ul></li>
  <li><a href="#working-with-r" id="toc-working-with-r" class="nav-link" data-scroll-target="#working-with-r"><span class="header-section-number">2.3</span> Working with R</a></li>
  <li><a href="#objects-in-r" id="toc-objects-in-r" class="nav-link" data-scroll-target="#objects-in-r"><span class="header-section-number">2.4</span> Objects in R</a>
  <ul class="collapse">
  <li><a href="#creating-objects" id="toc-creating-objects" class="nav-link" data-scroll-target="#creating-objects"><span class="header-section-number">2.4.1</span> Creating objects</a></li>
  <li><a href="#vectors" id="toc-vectors" class="nav-link" data-scroll-target="#vectors"><span class="header-section-number">2.4.2</span> Vectors</a></li>
  <li><a href="#lists" id="toc-lists" class="nav-link" data-scroll-target="#lists"><span class="header-section-number">2.4.3</span> Lists</a></li>
  <li><a href="#arrays" id="toc-arrays" class="nav-link" data-scroll-target="#arrays"><span class="header-section-number">2.4.4</span> Arrays</a></li>
  <li><a href="#data.frame" id="toc-data.frame" class="nav-link" data-scroll-target="#data.frame"><span class="header-section-number">2.4.5</span> Data.frame</a></li>
  </ul></li>
  <li><a href="#object-management" id="toc-object-management" class="nav-link" data-scroll-target="#object-management"><span class="header-section-number">2.5</span> Object management</a></li>
  <li><a href="#functions-and-arguments" id="toc-functions-and-arguments" class="nav-link" data-scroll-target="#functions-and-arguments"><span class="header-section-number">2.6</span> Functions and arguments</a></li>
  <li><a href="#scripts-in-r" id="toc-scripts-in-r" class="nav-link" data-scroll-target="#scripts-in-r"><span class="header-section-number">2.7</span> Scripts in R</a></li>
  <li><a href="#working-with-files" id="toc-working-with-files" class="nav-link" data-scroll-target="#working-with-files"><span class="header-section-number">2.8</span> Working with files</a>
  <ul class="collapse">
  <li><a href="#the-working-directory" id="toc-the-working-directory" class="nav-link" data-scroll-target="#the-working-directory"><span class="header-section-number">2.8.1</span> The working directory</a></li>
  <li><a href="#reading-data-files" id="toc-reading-data-files" class="nav-link" data-scroll-target="#reading-data-files"><span class="header-section-number">2.8.2</span> Reading data files</a></li>
  <li><a href="#writing-text-files" id="toc-writing-text-files" class="nav-link" data-scroll-target="#writing-text-files"><span class="header-section-number">2.8.3</span> Writing text files</a></li>
  <li><a href="#data-manipulation" id="toc-data-manipulation" class="nav-link" data-scroll-target="#data-manipulation"><span class="header-section-number">2.8.4</span> Data manipulation</a></li>
  </ul></li>
  <li><a href="#basic-instructions" id="toc-basic-instructions" class="nav-link" data-scroll-target="#basic-instructions"><span class="header-section-number">2.9</span> Basic instructions</a>
  <ul class="collapse">
  <li><a href="#descriptive-statistics-and-summaries" id="toc-descriptive-statistics-and-summaries" class="nav-link" data-scroll-target="#descriptive-statistics-and-summaries"><span class="header-section-number">2.9.1</span> Descriptive statistics and summaries</a></li>
  <li><a href="#the-apply-function" id="toc-the-apply-function" class="nav-link" data-scroll-target="#the-apply-function"><span class="header-section-number">2.9.2</span> The <em>apply()</em> function</a></li>
  <li><a href="#installing-packages" id="toc-installing-packages" class="nav-link" data-scroll-target="#installing-packages"><span class="header-section-number">2.9.3</span> Installing packages</a></li>
  <li><a href="#installing-an-external-package" id="toc-installing-an-external-package" class="nav-link" data-scroll-target="#installing-an-external-package"><span class="header-section-number">2.9.4</span> Installing an external package</a></li>
  <li><a href="#create-a-function" id="toc-create-a-function" class="nav-link" data-scroll-target="#create-a-function"><span class="header-section-number">2.9.5</span> Create a function</a></li>
  </ul></li>
  <li><a href="#plotting-with-r" id="toc-plotting-with-r" class="nav-link" data-scroll-target="#plotting-with-r"><span class="header-section-number">2.10</span> Plotting with R</a>
  <ul class="collapse">
  <li><a href="#basic-plots" id="toc-basic-plots" class="nav-link" data-scroll-target="#basic-plots"><span class="header-section-number">2.10.1</span> Basic plots</a></li>
  <li><a href="#dot-or-point-plots" id="toc-dot-or-point-plots" class="nav-link" data-scroll-target="#dot-or-point-plots"><span class="header-section-number">2.10.2</span> Dot or point plots</a></li>
  <li><a href="#line-plots" id="toc-line-plots" class="nav-link" data-scroll-target="#line-plots"><span class="header-section-number">2.10.3</span> Line plots</a></li>
  <li><a href="#histograms" id="toc-histograms" class="nav-link" data-scroll-target="#histograms"><span class="header-section-number">2.10.4</span> Histograms</a></li>
  <li><a href="#scatterplots" id="toc-scatterplots" class="nav-link" data-scroll-target="#scatterplots"><span class="header-section-number">2.10.5</span> Scatterplots</a></li>
  <li><a href="#multiple-plots" id="toc-multiple-plots" class="nav-link" data-scroll-target="#multiple-plots"><span class="header-section-number">2.10.6</span> Multiple plots</a></li>
  <li><a href="#export-an-image-file" id="toc-export-an-image-file" class="nav-link" data-scroll-target="#export-an-image-file"><span class="header-section-number">2.10.7</span> Export an image file</a></li>
  </ul></li>
  </ul></li>
  <li><a href="#final-words-of-module-1" id="toc-final-words-of-module-1" class="nav-link" data-scroll-target="#final-words-of-module-1">Final Words of module 1</a>
  <ul class="collapse">
  <li><a href="#references" id="toc-references" class="nav-link" data-scroll-target="#references">References</a></li>
  </ul></li>
  </ul>
</nav>
    </div>
<!-- main -->
<main class="content" id="quarto-document-content">

<header id="title-block-header" class="quarto-title-block default">
<div class="quarto-title">
<h1 class="title">Introduction to spatial statistics: Spatial Analysis with R - 111019</h1>
<p class="subtitle lead">Msc in European Forestry</p>
</div>



<div class="quarto-title-meta">

    <div>
    <div class="quarto-title-meta-heading">Author</div>
    <div class="quarto-title-meta-contents">
             <p>Marcos Rodrigues and Pere Gelabert </p>
          </div>
  </div>
    
    <div>
    <div class="quarto-title-meta-heading">Published</div>
    <div class="quarto-title-meta-contents">
      <p class="date">September 28, 2024</p>
    </div>
  </div>
  
    
  </div>
  


</header>


<section id="module-1-a-brief-introduction-to-r" class="level1" data-number="1">
<h1 data-number="1"><span class="header-section-number">1</span> Module 1 A brief introduction to R</h1>
</section>
<section id="module-1-a-brief-introduction-to-r-1" class="level1" data-number="2">
<h1 data-number="2"><span class="header-section-number">2</span> Module 1 A brief introduction to R</h1>
<section id="what-is-r" class="level2" data-number="2.1">
<h2 data-number="2.1" class="anchored" data-anchor-id="what-is-r"><span class="header-section-number">2.1</span> What is R?</h2>
<p>R is an object-oriented programming language and environment for statistical computing that provides relatively simple access to a wide variety of statistical techniques (R Core Team 2016). R offers a complete programming language with which to add new methods by defining functions or automating iterative processes.</p>
<p>Many statistical techniques, from the classic to the latest methodologies, are available in R, with the user in charge of locating the package that best suits their needs.</p>
<p>R can be considered as an integrated set of programs for data manipulation, calculation and graphics. Among other features R allows:</p>
<ul>
<li>effective data storage and manipulation,</li>
<li>operators for calculation on indexed variables,</li>
<li>a comprehensive, coherent and integrated collection of data analysis tools,</li>
<li>plotting possibilities, which work directly on screen or printer, and</li>
<li>a well-developed, simple and effective programming language, including conditionals, loops, recursive functions and the possibility of inputs and outputs.</li>
</ul>
<p>R is distributed as open source software, so obtaining it is completely free.</p>
<p>R is also multiplatform software which means it can be installed and used in various operating systems (OS), mainly Windows and Linux. However, the available functions and packages syntax is practically the same in any OS. From an operational point of view, R consists of a base system and additional packages that extend its functionality. Among the main types of packages we found:</p>
<ul>
<li>Those that are part of the base system.</li>
<li>Those that are not part of the base system, but are recommended (survival, nlme). In GNU/Linux and Windows these packages are already part of the standard distribution.</li>
<li>Other packages such as UsingR, foreing, or Maptools. These must be selected and installed individually. We will see how to do this later.</li>
</ul>
<p>The functions included in the packages installed by default, that is, those that are predefined in the basic installation R, are available for use at any time. However, <strong>in order to use the functions of new packages, specific calls must be made to those packages</strong>.</p>
<section id="getting-and-installing-r" class="level3" data-number="2.1.1">
<h3 data-number="2.1.1" class="anchored" data-anchor-id="getting-and-installing-r"><span class="header-section-number">2.1.1</span> Getting and installing R</h3>
<p>The installation of R depends on the operating system to be used. You can find all the necessary information in:</p>
<ul>
<li><a href="http://cran.r-project.org/" class="uri">http://cran.r-project.org/</a></li>
<li>Windows: <a href="http://cran.r-project.org/bin/windows/" class="uri">http://cran.r-project.org/bin/windows/</a></li>
<li>Linux: <a href="http://cran.r-project.org/bin/linux/" class="uri">http://cran.r-project.org/bin/linux/</a></li>
</ul>
<p>For the development of this course we will use the Windows version but feel free to use whatever version fits your needs. The last version of R is downloadable from <a href="https://cran.r-project.org/bin/windows/base/">here</a>. We will install the latest version available. Remember that you have to install the version that corresponds to the architecture of your OS (32 or 64 bits). In case of doubt install both versions or at least the 32-bit version, which will always work on our computer.</p>
<p>Installation in Windows is very simple. Just run the executable (.exe) file and follow the installation steps (basically say Yes to everything). Once R is installed, we will install <strong>RStudio</strong> an integrated development environment (IDE) that is more user-friendly than the basic R interface. RStudio provides a more complete environment and some useful tools such as:</p>
<ul>
<li>Autocomplete instructions<a href="#fn1" class="footnote-ref" id="fnref1" role="doc-noteref"><sup>1</sup></a>.</li>
<li>Object management.</li>
<li>Data display and visualization.</li>
<li>Exporting plots and figures.</li>
</ul>
<p>We will install the latest version of <a href="https://www.rstudio.com/products/rstudio/download/">RStudio</a>. You can see the installation steps in the installation video tutorial.</p>
<ul>
<li>Note that RStudio is just an interface. Any code block or instruction will work in any other R environment.</li>
<li>Before installing RStudio you need to have already installed the standard R software.</li>
</ul>
</section>
<section id="documentation-manuals-and-help" class="level3" data-number="2.1.2">
<h3 data-number="2.1.2" class="anchored" data-anchor-id="documentation-manuals-and-help"><span class="header-section-number">2.1.2</span> Documentation, manuals and help</h3>
<p>Being an open source software and with a strong collaborative component R has a large amount of resources and documentation relative to the specific syntax of the language itself (control structures, function creation, calls to objects …) and to every single package available as well.</p>
<p>On the other hand, R counts on a series of manuals which are available right after installing the software. You can find them in the installation directory of R (C:Files-X.X.X). These manuals and many others can also be downloaded from the <a href="https://cran.r-project.org/">R project website</a>:</p>
<ul>
<li>Writing R extensions.</li>
<li>R data import / export.</li>
<li>The R language definition.</li>
<li>R installation and administration.</li>
<li>An introduction to R.</li>
</ul>
<p>Finally, in addition to the wide repertoire of manuals available, there is also a wide range of resources and online help including:</p>
<ul>
<li><a href="http://www.r-bloggers.com/" class="uri">http://www.r-bloggers.com/</a>. A website dedicated to R development of tutorials.</li>
<li><a href="http://www.r-project.org/mail.html" class="uri">http://www.r-project.org/mail.html</a>. R help mailing lists with various interest groups including the R (r-sig-geo) GIS user community.</li>
<li><a href="http://stackoverflow.com/" class="uri">http://stackoverflow.com/</a>. Website devoted to questions-and-answers on programming languages among which is R also available<a href="#fn2" class="footnote-ref" id="fnref2" role="doc-noteref"><sup>2</sup></a>.</li>
<li><a href="http://www.r-tutor.com/" class="uri">http://www.r-tutor.com/</a>. A website devoted to teach statistics. An useful one if yo<a href="#fn3" class="footnote-ref" id="fnref3" role="doc-noteref"><sup>3</sup></a>u are not much familiar with basic statistical methods.</li>
</ul>
<p>It is relatively important to become familiar from the beginning with the various alternatives for getting help. A key part of your success in using R lies in your ability to be self-relient and be able to get help and apply it to your own problems.</p>
</section>
</section>
<section id="starting-with-r" class="level2" data-number="2.2">
<h2 data-number="2.2" class="anchored" data-anchor-id="starting-with-r"><span class="header-section-number">2.2</span> Starting with R</h2>
<section id="the-r-environment" class="level3" data-number="2.2.1">
<h3 data-number="2.2.1" class="anchored" data-anchor-id="the-r-environment"><span class="header-section-number">2.2.1</span> The R environment</h3>
<p>R is basically a command line environment that allows the user to interact with the system to enter data, perform mathematical calculations or visualize results through plots and maps.</p>
<p>Figure 1.1 shows standard appearance of the R console, which can be considered as a windows cmd like terminal or console. We have also seen what the terminal and working environment looks like in RStudio at the end of the installation process (Figure 1.2). A third possibility is to work directly on the cmd terminal (Figure 1.3). The commands and instructions are the same regardless of the environment that we chose. In this course we will focus on the use of RStudio, since it is the simplest of them all.</p>
<div class="quarto-figure quarto-figure-center">
<figure class="figure">
<p><img src="images/fig1_1png.png" class="img-fluid figure-img"></p>
<figcaption>R standard terminal</figcaption>
</figure>
</div>
<div class="quarto-figure quarto-figure-center">
<figure class="figure">
<p><img src="images/fig1_2png.png" class="img-fluid figure-img"></p>
<figcaption>RStudio interface</figcaption>
</figure>
</div>
<div class="quarto-figure quarto-figure-center">
<figure class="figure">
<p><img src="images/fig1_3png.png" class="img-fluid figure-img"></p>
<figcaption>R code terminal</figcaption>
</figure>
</div>
<p>The terminal (regardless of the chosen option) is usually the main working window and is where we will introduce the necessary instructions to carry out our operations. It is in this window where we will visualize the results from most instructions and objects we generate. An exception to this are plots and maps which are displayed in a specifically-devoted window located in the bottom-right corner.</p>
</section>
</section>
<section id="working-with-r" class="level2" data-number="2.3">
<h2 data-number="2.3" class="anchored" data-anchor-id="working-with-r"><span class="header-section-number">2.3</span> Working with R</h2>
<p>Let’s get started and insert our first command in the R’s terminal. When R is ready or awaiting us to input an instruction the terminal shows a cursor right after a <em>&gt;</em> symbol to indicate it.</p>
<div class="cell" data-layout-align="center">
<div class="cell-output-display">
<div class="quarto-figure quarto-figure-center">
<figure class="figure">
<p><img src="./images/fig1_1png.png" class="img-fluid figure-img" style="width:100.0%"></p>
<figcaption>R waiting for sintructions</figcaption>
</figure>
</div>
</div>
</div>
<p>At this point it is necessary to take into account that R is an interpreted language, which means that the different instructions or functions that we specify are read and executed one by one. The procedure is more or less as follows. We introduce an instruction in the R console, the application interprets and executes it, and finally generates or returns the result.</p>
<p>To better understand this concept we will do a little test using the R console as a calculator. Open the working environment of RStudio if you did not already open it and enter the following statement and press enter:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb1"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb1-1"><a href="#cb1-1" aria-hidden="true" tabindex="-1"></a><span class="dv">10</span><span class="sc">+</span><span class="dv">2</span></span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 12</code></pre>
</div>
</div>
<p>What just happened is that the R interpreter has read the instruction, in this case a simple arithmetic operation, executed it and returned the result. This is the basic way to proceed to enter operations. However, it will not be necessary for us to always enter the instructions manually. Later we will see how to create scripts or introduce blocks of instructions.</p>
</section>
<section id="objects-in-r" class="level2" data-number="2.4">
<h2 data-number="2.4" class="anchored" data-anchor-id="objects-in-r"><span class="header-section-number">2.4</span> Objects in R</h2>
<p>We have previously mentioned some features of R such as that R is an object-oriented language. But, what does this mean? It basically means that to perform any type of task we use objects. Everything in R is an object (functions, variables, results …). Thus, entities that are created and manipulated in R are called objects, including data, functions and other structures.</p>
<p>Objects are stored and characterized by their name and content. Depending on the type of object we create that object will have a given set of characteristics. Generally the first objects one creates are those of variable type, in which we will be able to store a piece of data and information. The main objects of variable type in R are:</p>
<ul>
<li><p>Number: an integer or decimal number depending on whether we specify decimal figures.</p></li>
<li><p>Factor:a categorical variable or text.</p></li>
<li><p>Vector: a list of values of the same type.</p></li>
<li><p>Array: a vector of k dimensions.</p></li>
<li><p>Matrix: a particular case of array where k=2 (rows, cols).</p></li>
<li><p>Data.frame: table composed of vectors.</p></li>
<li><p>List: vector with values of different types.</p></li>
</ul>
<p>Obviously there are other types of objects in R. For example, another object with which we are going to familiarize ourselves is the <em>model</em> objects. We can create them by storing the output of executing some kind of model like a linear regression model for instance. Spatial data also fits in its particular variety of objects. Through the course we will see both models and spatial information (vector and raster).</p>
<section id="creating-objects" class="level3" data-number="2.4.1">
<h3 data-number="2.4.1" class="anchored" data-anchor-id="creating-objects"><span class="header-section-number">2.4.1</span> Creating objects</h3>
<p>Objects in R are created by declaring a variable by specifying its name and then assign it a value using the <code>&lt;-</code> operator. We can also use <code>=</code> but the <code>&lt;-</code> operator is most commonly found in examples and manuals.</p>
<p>So, to create an object and assign it a value the basic instruction is composed of <code>object name &lt;- value</code>.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb3"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb3-1"><a href="#cb3-1" aria-hidden="true" tabindex="-1"></a>n <span class="ot">&lt;-</span> <span class="dv">4</span></span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>Try to introduce the following instructions to create different kind of objects:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb4"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb4-1"><a href="#cb4-1" aria-hidden="true" tabindex="-1"></a>n <span class="ot">&lt;-</span> <span class="dv">15</span></span>
<span id="cb4-2"><a href="#cb4-2" aria-hidden="true" tabindex="-1"></a>x <span class="ot">&lt;-</span> <span class="fl">1.0</span></span>
<span id="cb4-3"><a href="#cb4-3" aria-hidden="true" tabindex="-1"></a>name <span class="ot">&lt;-</span> <span class="st">"Marcos"</span></span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>We can also store in an object the result form any operation:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb5"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb5-1"><a href="#cb5-1" aria-hidden="true" tabindex="-1"></a>n <span class="ot">&lt;-</span> <span class="dv">10</span><span class="sc">+</span><span class="dv">2</span></span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>So here is the thing. The type of object we create depends on the content that we assign. Therefor, if we assign a numeric value, we are creating an object of type number (integer or decimal) and if we assign a text string (any quoted text, either with single or double quotes), we are creating a text type object or string. Once created, the objects are visualized using calls using the name that we have assigned to the object. That is, we will write to the terminal in the name of the object and then its value will be shown.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb6"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb6-1"><a href="#cb6-1" aria-hidden="true" tabindex="-1"></a>n</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 12</code></pre>
</div>
<div class="sourceCode cell-code" id="cb8"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb8-1"><a href="#cb8-1" aria-hidden="true" tabindex="-1"></a>name</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] "Marcos"</code></pre>
</div>
</div>
<p>Some considerations to keep in mind when creating objects or working with R in general lines:</p>
<ol type="1">
<li><p>R is <strong>case-sensitive</strong> so radio ≠ Radio</p></li>
<li><p>If a new value is assigned to an object it is overwritten and <strong>deletes the previous value</strong>.</p></li>
<li><p>Textual information (also known as string or char) is entered between quotation marks, either single (<code>''</code>) or double (<code>""</code>).</p></li>
<li><p>The function <code>ls()</code> will show us in the terminal the objects created so far.</p></li>
<li><p>If the value obtained from an instruction is not assigned in an object it is only displayed in the terminal, it is not stored.</p></li>
</ol>
</section>
<section id="vectors" class="level3" data-number="2.4.2">
<h3 data-number="2.4.2" class="anchored" data-anchor-id="vectors"><span class="header-section-number">2.4.2</span> Vectors</h3>
<p>One of the most common objects in R is the vector. A vector can store several values, which must necessarily be of the same type (all numbers, all text, and so forth). There are several ways to create vectors. Try entering the following instructions and viewing the created objects.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb10"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb10-1"><a href="#cb10-1" aria-hidden="true" tabindex="-1"></a>v1 <span class="ot">&lt;-</span> <span class="fu">c</span>(<span class="dv">1</span>,<span class="dv">2</span>,<span class="dv">3</span>,<span class="dv">4</span>,<span class="dv">5</span>)</span>
<span id="cb10-2"><a href="#cb10-2" aria-hidden="true" tabindex="-1"></a>v1</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 1 2 3 4 5</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb12"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb12-1"><a href="#cb12-1" aria-hidden="true" tabindex="-1"></a>v2 <span class="ot">&lt;-</span> <span class="dv">1</span><span class="sc">:</span><span class="dv">10</span></span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb13"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb13-1"><a href="#cb13-1" aria-hidden="true" tabindex="-1"></a>v3 <span class="ot">&lt;-</span> <span class="sc">-</span><span class="dv">5</span><span class="sc">:</span><span class="dv">3</span></span>
<span id="cb13-2"><a href="#cb13-2" aria-hidden="true" tabindex="-1"></a>v3</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] -5 -4 -3 -2 -1  0  1  2  3</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb15"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb15-1"><a href="#cb15-1" aria-hidden="true" tabindex="-1"></a>v4 <span class="ot">&lt;-</span> <span class="fu">c</span>(<span class="st">'spatial'</span>,<span class="st">'statistics'</span>,<span class="st">'rules!!'</span>)</span>
<span id="cb15-2"><a href="#cb15-2" aria-hidden="true" tabindex="-1"></a>v4</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] "spatial"    "statistics" "rules!!"   </code></pre>
</div>
</div>
<p>We have just covered the basic methods for vector creation. The most common approach is use the function&nbsp;<code>c()</code>&nbsp;which allow as to introduce values manually by separatting them using&nbsp;<code>,</code>.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb17"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb17-1"><a href="#cb17-1" aria-hidden="true" tabindex="-1"></a>v1 <span class="ot">&lt;-</span> <span class="fu">c</span>(<span class="dv">1</span>, <span class="dv">2</span>, <span class="dv">3</span>, <span class="dv">4</span>, <span class="dv">5</span>)</span>
<span id="cb17-2"><a href="#cb17-2" aria-hidden="true" tabindex="-1"></a>v1</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 1 2 3 4 5</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb19"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb19-1"><a href="#cb19-1" aria-hidden="true" tabindex="-1"></a>v4 <span class="ot">&lt;-</span> <span class="fu">c</span>(<span class="st">'spatial'</span>,<span class="st">'statistics'</span>,<span class="st">'rules!!'</span>)</span>
<span id="cb19-2"><a href="#cb19-2" aria-hidden="true" tabindex="-1"></a>v4</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] "spatial"    "statistics" "rules!!"   </code></pre>
</div>
</div>
<p>Another option that only works for vectors containing integer values is the use of&nbsp;<code>:</code>&nbsp;which produces a ordered sequence of numbers by adding 1 starting from the first value and finishing in the last.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb21"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb21-1"><a href="#cb21-1" aria-hidden="true" tabindex="-1"></a>v2 <span class="ot">&lt;-</span> <span class="dv">1</span><span class="sc">:</span><span class="dv">10</span></span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb22"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb22-1"><a href="#cb22-1" aria-hidden="true" tabindex="-1"></a>v3 <span class="ot">&lt;-</span> <span class="sc">-</span><span class="dv">5</span><span class="sc">:</span><span class="dv">3</span></span>
<span id="cb22-2"><a href="#cb22-2" aria-hidden="true" tabindex="-1"></a>v3</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] -5 -4 -3 -2 -1  0  1  2  3</code></pre>
</div>
</div>
<p>Vectors, lists, arrays, and data frames are indexed objects. This means that they store several values and assign to each of them a numerical index that indicates their position within the object. We can access the information stored in each of the positions by using&nbsp;<code>name[position]</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb24"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb24-1"><a href="#cb24-1" aria-hidden="true" tabindex="-1"></a>v1[<span class="dv">1</span>]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 1</code></pre>
</div>
</div>
<p>Note that opposite to most of the other programming languages, the index for the first position in an indexed object is 1, whereas Python, C++ and others use 0.</p>
<p>As with an unindexed object, it is possible to modify the information of a particular position using the combination <code>name[position]</code> and the assignment operator <code>&lt;-</code>. For example:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb26"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb26-1"><a href="#cb26-1" aria-hidden="true" tabindex="-1"></a>v3[<span class="dv">9</span>] <span class="ot">&lt;-</span> <span class="dv">1000000</span></span>
<span id="cb26-2"><a href="#cb26-2" aria-hidden="true" tabindex="-1"></a>v3[<span class="dv">9</span>]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 1e+06</code></pre>
</div>
</div>
<p>Let’s see some specific functions and basic operations for vectors and other indexed objects:</p>
<ul>
<li><p><code>length(vector)</code>: Returns the number of positions of a vector.</p></li>
<li><p>Logical operators <code>&lt;,&gt;, ==,!=</code>: Applying these operators on a vector returns a new vector with values TRUE/FALSE for each of the positions of the vector, depending on whether the given values satisfies or not the condition.</p></li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb28"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb28-1"><a href="#cb28-1" aria-hidden="true" tabindex="-1"></a><span class="fu">length</span>(v3)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 9</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb30"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb30-1"><a href="#cb30-1" aria-hidden="true" tabindex="-1"></a>v4<span class="ot">&lt;-</span><span class="dv">1</span><span class="sc">:</span><span class="dv">5</span></span>
<span id="cb30-2"><a href="#cb30-2" aria-hidden="true" tabindex="-1"></a>v4<span class="sc">&gt;</span><span class="dv">3</span></span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] FALSE FALSE FALSE  TRUE  TRUE</code></pre>
</div>
</div>
</section>
<section id="lists" class="level3" data-number="2.4.3">
<h3 data-number="2.4.3" class="anchored" data-anchor-id="lists"><span class="header-section-number">2.4.3</span> Lists</h3>
<p>Once we have seen vectors we go to explore how objects of type list work. A list is an object similar to a vector with the difference that lists allow to store values of different type. Lists are created using the <code>list(value1, value2, ...)</code> function. For example:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb32"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb32-1"><a href="#cb32-1" aria-hidden="true" tabindex="-1"></a>list1 <span class="ot">&lt;-</span> <span class="fu">list</span>(<span class="dv">1</span>,<span class="dv">7</span>,<span class="st">"Marcos"</span>)</span>
<span id="cb32-2"><a href="#cb32-2" aria-hidden="true" tabindex="-1"></a>list1</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[[1]]
[1] 1

[[2]]
[1] 7

[[3]]
[1] "Marcos"</code></pre>
</div>
</div>
<p>To access the values stored in the different positions proceed in the same way we did with vectors, ie&nbsp;<code>name[position]</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb34"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb34-1"><a href="#cb34-1" aria-hidden="true" tabindex="-1"></a>list1[<span class="dv">3</span>]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[[1]]
[1] "Marcos"</code></pre>
</div>
</div>
<p>We can use the&nbsp;<code>length()</code>&nbsp;function with list too:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb36"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb36-1"><a href="#cb36-1" aria-hidden="true" tabindex="-1"></a><span class="fu">length</span>(list1)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 3</code></pre>
</div>
</div>
</section>
<section id="arrays" class="level3" data-number="2.4.4">
<h3 data-number="2.4.4" class="anchored" data-anchor-id="arrays"><span class="header-section-number">2.4.4</span> Arrays</h3>
<p>Arrays are an extension of vectors, which add additional dimensions to store information. The most common case is the 2-dimensional matrix (rows and columns). To create an array, we use <code>array(values, dimensions)</code>. Both <code>values</code> and <code>dimensions</code> are specified using vectors. In the following example we see how to create a matrix with 4 rows and 5 columns, thus containing 20 values, in this case correlative numbers from 1 to 20:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb38"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb38-1"><a href="#cb38-1" aria-hidden="true" tabindex="-1"></a>myarray<span class="ot">&lt;-</span> <span class="fu">array</span>(<span class="dv">1</span><span class="sc">:</span><span class="dv">20</span>,<span class="at">dim=</span><span class="fu">c</span>(<span class="dv">4</span>,<span class="dv">5</span>))</span>
<span id="cb38-2"><a href="#cb38-2" aria-hidden="true" tabindex="-1"></a>myarray</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>     [,1] [,2] [,3] [,4] [,5]
[1,]    1    5    9   13   17
[2,]    2    6   10   14   18
[3,]    3    7   11   15   19
[4,]    4    8   12   16   20</code></pre>
</div>
</div>
<p>To access the stored values we will use a combination of row-and-column positions like&nbsp;<code>matrix[row, col]</code>, where&nbsp;<code>row</code>&nbsp;indicates the row postition and&nbsp;<code>col</code>&nbsp;the column one. If we only assign value to one of the coordinates (<code>[row,]</code>&nbsp;or&nbsp;<code>[,col]</code>) we get the vector corresponding to the specified row or column.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb40"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb40-1"><a href="#cb40-1" aria-hidden="true" tabindex="-1"></a>myarray[<span class="dv">3</span>,<span class="dv">2</span>]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 7</code></pre>
</div>
<div class="sourceCode cell-code" id="cb42"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb42-1"><a href="#cb42-1" aria-hidden="true" tabindex="-1"></a>myarray[<span class="dv">3</span>,]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1]  3  7 11 15 19</code></pre>
</div>
<div class="sourceCode cell-code" id="cb44"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb44-1"><a href="#cb44-1" aria-hidden="true" tabindex="-1"></a>myarray[,<span class="dv">2</span>]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 5 6 7 8</code></pre>
</div>
</div>
</section>
<section id="data.frame" class="level3" data-number="2.4.5">
<h3 data-number="2.4.5" class="anchored" data-anchor-id="data.frame"><span class="header-section-number">2.4.5</span> Data.frame</h3>
<p>A data frame is used for storing data tables. It is a list of vectors of equal length. For example, the following variable df is a data frame containing three vectors <code>n</code>, <code>s</code>, <code>b</code>.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb46"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb46-1"><a href="#cb46-1" aria-hidden="true" tabindex="-1"></a>n <span class="ot">&lt;-</span> <span class="fu">c</span>(<span class="dv">2</span>, <span class="dv">3</span>, <span class="dv">5</span>) </span>
<span id="cb46-2"><a href="#cb46-2" aria-hidden="true" tabindex="-1"></a>s <span class="ot">&lt;-</span> <span class="fu">c</span>(<span class="st">"aa"</span>, <span class="st">"bb"</span>, <span class="st">"cc"</span>) </span>
<span id="cb46-3"><a href="#cb46-3" aria-hidden="true" tabindex="-1"></a>b <span class="ot">&lt;-</span> <span class="fu">c</span>(<span class="cn">TRUE</span>, <span class="cn">FALSE</span>, <span class="cn">TRUE</span>) </span>
<span id="cb46-4"><a href="#cb46-4" aria-hidden="true" tabindex="-1"></a>df <span class="ot">&lt;-</span> <span class="fu">data.frame</span>(n, s, b)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>As you can see, the function&nbsp;<code>data.frame()</code>&nbsp;is used to create the data.frame. However, we will seldom use these function to create objects or store data. Normally, we will call an instruction to read text files containing data or call data objects available in some packages.</p>
</section>
</section>
<section id="object-management" class="level2" data-number="2.5">
<h2 data-number="2.5" class="anchored" data-anchor-id="object-management"><span class="header-section-number">2.5</span> Object management</h2>
<p>We have seen so far aspects related to the creation of objects. However we should be also know how many objects we have created in our session and how to remove them if necessary. To display all created objects we use <code>ls()</code>. Deleting objects in R is done by the command <em>remove</em> <code>rm(object)</code> and then call to the <em>garbage collector</em> with <code>gc()</code> to free-up the occupied memory.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb47"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb47-1"><a href="#cb47-1" aria-hidden="true" tabindex="-1"></a><span class="fu">ls</span>()</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code> [1] "b"       "df"      "list1"   "myarray" "n"       "name"    "s"      
 [8] "v1"      "v2"      "v3"      "v4"      "x"      </code></pre>
</div>
</div>
<p>If we want to removal&nbsp;<strong>all</strong>&nbsp;the objects we have currently in our working session we can pass a&nbsp;<code>list</code>&nbsp;object containing the names of all objects to the&nbsp;<code>gc()</code>&nbsp;function. If you are thinking on combining&nbsp;<code>gc()</code>and&nbsp;<code>ls()</code>you are right. This would be the way:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb49"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb49-1"><a href="#cb49-1" aria-hidden="true" tabindex="-1"></a><span class="fu">rm</span>(<span class="at">list=</span><span class="fu">ls</span>())</span>
<span id="cb49-2"><a href="#cb49-2" aria-hidden="true" tabindex="-1"></a><span class="fu">gc</span>()</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>          used (Mb) gc trigger (Mb) max used (Mb)
Ncells  589897 31.6    1256704 67.2  1256704 67.2
Vcells 1106909  8.5    8388608 64.0  1794756 13.7</code></pre>
</div>
</div>
</section>
<section id="functions-and-arguments" class="level2" data-number="2.6">
<h2 data-number="2.6" class="anchored" data-anchor-id="functions-and-arguments"><span class="header-section-number">2.6</span> Functions and arguments</h2>
<p>Up to this point we have seen and executed some instructions in R, generally oriented to the creation of objects or realization of simple arithmetic operations.</p>
<p>However, we have also executed some function-type statements, such as the <code>length()</code> function. A function can be defined as a group of instructions that takes an input, uses this input to compute other values and returns a result or product. We will not go into very deep details, at least for now. It suffices to know that to execute a function it is enough to invoke the instruction that calls the desired function (<code>length</code>) and to specify the necessary inputs, also known as <em>arguments</em>. These inputs are always included between the parentheses of the instruction (<code>length(vector)</code>). If several arguments are needed we separate them using <code>,</code>.</p>
<p>Sometimes we can refer to a given argument by using the argument’s name as is the case of the example we saw to delete all the objects in a session <code>rm(list=ls())</code>.</p>
</section>
<section id="scripts-in-r" class="level2" data-number="2.7">
<h2 data-number="2.7" class="anchored" data-anchor-id="scripts-in-r"><span class="header-section-number">2.7</span> Scripts in R</h2>
<p>So far we have inserted instructions in the console but this is not the most efficient way to work. We will focus on the use of scripts which are an <strong>ordered set of instructions</strong>. This means we can write a text file with the instructions we want to insert and then run them at once.</p>
<p>RStudio has an script development environment which opens in the top-left window. We can access the scripting window pressing <em>File/New File/R script</em>.</p>
<p>For additional information visit the <a href="https://support.rstudio.com/hc/en-us/articles/200484448-Editing-and-Executing-Code">RStudio support site</a>.</p>
</section>
<section id="working-with-files" class="level2" data-number="2.8">
<h2 data-number="2.8" class="anchored" data-anchor-id="working-with-files"><span class="header-section-number">2.8</span> Working with files</h2>
<p>So far we have seen how to enter data and create objects manually, but it is also possible, and in fact is most common, to read data from files and store it in an object. If the target data file is properly structured, we will create a <code>matrix</code> or a ‘data.frame’ object which we can manipulated afterwards.</p>
<section id="the-working-directory" class="level3" data-number="2.8.1">
<h3 data-number="2.8.1" class="anchored" data-anchor-id="the-working-directory"><span class="header-section-number">2.8.1</span> The working directory</h3>
<p>Using data files normally requires us to specify the location of that file using <code>paths</code>. To avoid this, R has a tool that allow us to specify a target folder -the so-called <strong>working directory or folder</strong>- to work with.</p>
<p>The working directory is the default path for reading and writing files of any kind. We can know the path to the current working directory using the <code>getwd()</code> command. To set a new working directory, we use the command <code>setwd("path")</code>. Remember that <code>setwd()</code> requires a <code>string</code> argument (whereas <code>getwd()</code> does not) to specify the path to the working directory (“path”).</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb51"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb51-1"><a href="#cb51-1" aria-hidden="true" tabindex="-1"></a><span class="fu">getwd</span>()</span>
<span id="cb51-2"><a href="#cb51-2" aria-hidden="true" tabindex="-1"></a><span class="fu">setwd</span>(<span class="st">'C:/Users/Marcos/Desktop/'</span>)</span>
<span id="cb51-3"><a href="#cb51-3" aria-hidden="true" tabindex="-1"></a><span class="fu">getwd</span>()</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>By default, in Windows the working directory is set to the <strong>Documents</strong> folder.</p>
<p>Once the working directory is specified, everything we do in R (read files, export tables and/or graphics …) will be done in that directory. However, it is possible to work with other file system locations, specifying a different path through the arguments of some functions.</p>
</section>
<section id="reading-data-files" class="level3" data-number="2.8.2">
<h3 data-number="2.8.2" class="anchored" data-anchor-id="reading-data-files"><span class="header-section-number">2.8.2</span> Reading data files</h3>
<p>R allows you to read any type of file in ASCII format (text files). The most frequently used functions are:</p>
<ul>
<li><p><code>read.table()</code> and its different variations</p></li>
<li><p><code>scan()</code></p></li>
<li><p><code>read.fwf()</code></p></li>
</ul>
<p>For the development of this course we will focus on using the <code>read.table()</code> function as it is quite versatile and easy to use. Before starting to use a new function we should always take a look at the available documentation. we will take this opportunity to show you how to do this in R so that you begin to become familiar R help.</p>
<p>Any available function in R, regardless of being a standard one or belonging to an imported package has a documentation entry in the R help. R help describes us in detail the use of any function, providing information of the different arguments of the function, argument types, defaults, reference to the method (when applies) and even short code examples. To access the help we will use the <code>help()</code> function as follows:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb52"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb52-1"><a href="#cb52-1" aria-hidden="true" tabindex="-1"></a><span class="fu">help</span>(read.table)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>Entering the&nbsp;<code>help()</code>&nbsp;function we access the manual. In this case we can see a brief description of the function&nbsp;<code>read.table()</code>&nbsp;and its different variants (<code>read.csv()</code>, …). Below is the description of the arguments of the function, followed by some examples of application. This is the usual procedure for all functions available in R.</p>
<div class="quarto-figure quarto-figure-center">
<figure class="figure">
<p><img src="images/fig2_1png.png" class="img-fluid figure-img"></p>
<figcaption>Help example</figcaption>
</figure>
</div>
<p>In case we use the regular R interface or the <em>cmd</em> terminal, the help entry will open in our default web browser.</p>
<p>At first glance the <code>read.table()</code> function seems to require many arguments, while its variations seem simpler. As already mentioned, arguments are just parameters that we can specify or change to execute a function, thus <em>tunning</em> the operation of the functions and the result to be obtained.</p>
<p>Arguments are specified within the function separated by commas (“,”). However, it is not necessary to assign a value to each one of them, since in the case of omitting an argument it is assigned a default value (always reported in the help entry). In the case of <code>read.table()</code> <em>versus</em> other functions like <code>read.csv()</code> the main advantage of using the first is that we can manipulate any argument, whereas most of them are fixed in the later. <code>read.csv()</code> is desigend to open comma separate files following the north-american standard (<code>,</code> as field delimiter and <code>.</code> as decimal separator). On the other hand, <code>read.table()</code> can potentially open any text file regardless of the separator, encoding, decimal format and so on so forth. Most of the executions of <code>read.table()</code> consist of:</p>
<div class="alert alert-info">
<p><strong>💡read.table(file,header=TRUE, sep=“,”,dec=“.”)</strong></p>
</div>
<ul>
<li><p>file: path and name of the file to open.</p></li>
<li><p>header: TRUE/FALSE argument to determine whether the first row of the data file contains column names.</p></li>
<li><p>sep: field or column separator<a href="#fn4" class="footnote-ref" id="fnref4" role="doc-noteref"><sup>4</sup></a>.</p></li>
<li><p>dec: decimal separator.</p></li>
</ul>
<p>Let’s see an example of reading file. We will read the file <em>coordinates.txt</em>, located in the Data directory. The file is structured in 3 columns with heading and separated by “;”. Al data are integer so no decimal separator is needed. See Table 2.2.</p>
<div class="cell">
<div class="cell-output-display">
<table class="caption-top table table-sm table-striped small">
<caption>Structure of the coordinates.txt file.</caption>
<thead>
<tr class="header">
<th style="text-align: right;">FID_1</th>
<th style="text-align: right;">X_INDEX</th>
<th style="text-align: right;">Y_INDEX</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">364011</td>
<td style="text-align: right;">82500</td>
<td style="text-align: right;">4653500</td>
</tr>
<tr class="even">
<td style="text-align: right;">371655</td>
<td style="text-align: right;">110500</td>
<td style="text-align: right;">4661500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">487720</td>
<td style="text-align: right;">55500</td>
<td style="text-align: right;">4805500</td>
</tr>
<tr class="even">
<td style="text-align: right;">474504</td>
<td style="text-align: right;">28500</td>
<td style="text-align: right;">4783500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">436415</td>
<td style="text-align: right;">85500</td>
<td style="text-align: right;">4729500</td>
</tr>
<tr class="even">
<td style="text-align: right;">457549</td>
<td style="text-align: right;">38500</td>
<td style="text-align: right;">4757500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">469377</td>
<td style="text-align: right;">39500</td>
<td style="text-align: right;">4775500</td>
</tr>
<tr class="even">
<td style="text-align: right;">397162</td>
<td style="text-align: right;">124500</td>
<td style="text-align: right;">4687500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">434666</td>
<td style="text-align: right;">41500</td>
<td style="text-align: right;">4727500</td>
</tr>
<tr class="even">
<td style="text-align: right;">478383</td>
<td style="text-align: right;">49500</td>
<td style="text-align: right;">4789500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">488973</td>
<td style="text-align: right;">329500</td>
<td style="text-align: right;">4807500</td>
</tr>
<tr class="even">
<td style="text-align: right;">394153</td>
<td style="text-align: right;">77500</td>
<td style="text-align: right;">4684500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">426962</td>
<td style="text-align: right;">36500</td>
<td style="text-align: right;">4718500</td>
</tr>
<tr class="even">
<td style="text-align: right;">362216</td>
<td style="text-align: right;">148500</td>
<td style="text-align: right;">4651500</td>
</tr>
</tbody>
</table>
</div>
</div>
<p>The process to follow is:</p>
<ol type="1">
<li><p>Set working directory.</p></li>
<li><p>Use the function to save the data in an object.</p></li>
</ol>
<p>If we do…</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb53"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb53-1"><a href="#cb53-1" aria-hidden="true" tabindex="-1"></a><span class="fu">setwd</span>(<span class="st">'.C/Users/Pere/INTRO_R/'</span>)</span>
<span id="cb53-2"><a href="#cb53-2" aria-hidden="true" tabindex="-1"></a><span class="fu">read.table</span>(<span class="st">'./data/Module_1/coordinates.txt'</span>,<span class="at">header=</span><span class="cn">TRUE</span>,<span class="at">sep=</span><span class="st">';'</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>…as we have not specified any object in which to store the result of the function, the contents of the file are simply printed on the terminal. This is a usual mistake, don’t worry. To store and later access the contents of the file we will do the following:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb54"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb54-1"><a href="#cb54-1" aria-hidden="true" tabindex="-1"></a>table<span class="ot">&lt;-</span><span class="fu">read.table</span>(<span class="st">'./data/Module_1/coordinates.txt'</span>,<span class="at">header=</span><span class="cn">TRUE</span>,<span class="at">sep=</span><span class="st">';'</span>)</span>
<span id="cb54-2"><a href="#cb54-2" aria-hidden="true" tabindex="-1"></a>table</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>    FID_1 X_INDEX Y_INDEX
1  364011   82500 4653500
2  371655  110500 4661500
3  487720   55500 4805500
4  474504   28500 4783500
5  436415   85500 4729500
6  457549   38500 4757500
7  469377   39500 4775500
8  397162  124500 4687500
9  434666   41500 4727500
10 478383   49500 4789500
11 488973  329500 4807500
12 394153   77500 4684500
13 426962   36500 4718500
14 362216  148500 4651500</code></pre>
</div>
</div>
<p>Please note that:</p>
<ul>
<li><p>You have to specify your own working directory.</p></li>
<li><p>The path to the directory is specified in text format, so you type <strong>“in quotation marks”</strong>.</p></li>
<li><p>The name of the file to be read is also specified as text.</p></li>
<li><p>The header argument only accepts TRUE or FALSE values.</p></li>
<li><p>The <code>sep</code> argument also requires text values to enter the separator<a href="#fn5" class="footnote-ref" id="fnref5" role="doc-noteref"><sup>5</sup></a>.</p></li>
<li><p>It is advisable to save the data an object (table &lt;-).</p></li>
</ul>
<p>The result of <code>read.table()</code> is an <code>array</code> stored in an object named <code>table</code>. Since <code>read.table()</code> returns an <code>array</code> we can manipulate our <code>table</code> using the same procedure described in the @ref(arrays) section.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb56"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb56-1"><a href="#cb56-1" aria-hidden="true" tabindex="-1"></a>table[,<span class="dv">1</span>]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code> [1] 364011 371655 487720 474504 436415 457549 469377 397162 434666 478383
[11] 488973 394153 426962 362216</code></pre>
</div>
<div class="sourceCode cell-code" id="cb58"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb58-1"><a href="#cb58-1" aria-hidden="true" tabindex="-1"></a>table[<span class="dv">1</span>,<span class="dv">1</span>]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 364011</code></pre>
</div>
</div>
<p>Below we found some interesting functions to preview and verify the information, and to know the structure of the data we have just imported. These functions are normally used to take a quick look into the first and last rows of an <code>array</code> or <code>data.frame</code> object and also to describe the structure of a given object.</p>
<ul>
<li><p><code>head()</code>: displays the first rows of the array.</p></li>
<li><p><code>tail()</code>: displays the last rows of the array.</p></li>
<li><p><code>str()</code>: displays the structure and data type (factor or number).</p></li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb60"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb60-1"><a href="#cb60-1" aria-hidden="true" tabindex="-1"></a><span class="fu">head</span>(table)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>   FID_1 X_INDEX Y_INDEX
1 364011   82500 4653500
2 371655  110500 4661500
3 487720   55500 4805500
4 474504   28500 4783500
5 436415   85500 4729500
6 457549   38500 4757500</code></pre>
</div>
<div class="sourceCode cell-code" id="cb62"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb62-1"><a href="#cb62-1" aria-hidden="true" tabindex="-1"></a><span class="fu">tail</span>(table)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>    FID_1 X_INDEX Y_INDEX
9  434666   41500 4727500
10 478383   49500 4789500
11 488973  329500 4807500
12 394153   77500 4684500
13 426962   36500 4718500
14 362216  148500 4651500</code></pre>
</div>
<div class="sourceCode cell-code" id="cb64"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb64-1"><a href="#cb64-1" aria-hidden="true" tabindex="-1"></a><span class="fu">str</span>(table)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>'data.frame':   14 obs. of  3 variables:
 $ FID_1  : int  364011 371655 487720 474504 436415 457549 469377 397162 434666 478383 ...
 $ X_INDEX: int  82500 110500 55500 28500 85500 38500 39500 124500 41500 49500 ...
 $ Y_INDEX: int  4653500 4661500 4805500 4783500 4729500 4757500 4775500 4687500 4727500 4789500 ...</code></pre>
</div>
</div>
<p>As already mentioned, <code>read.table()</code> is adequate to start reading of files to incorporate data into our working session in R. In any case we must be aware that there are other possibilities such as the <code>read.csv()</code> and <code>read.csv2()</code> that we have already seen when accessing the <code>read.table()</code> description. These functions are variations that defaults some arguments such as the field separator (columns) or the decimal character. In the help of the function you have information about it.</p>
</section>
<section id="writing-text-files" class="level3" data-number="2.8.3">
<h3 data-number="2.8.3" class="anchored" data-anchor-id="writing-text-files"><span class="header-section-number">2.8.3</span> Writing text files</h3>
<p>Of course, we can also write text files from our data. The procedure is quite similar to read data but using <code>write.table()</code> instead of <code>read.table</code>. Remember that the created files are saved into the working directory, unless you specify an alternative path in the function arguments. As always, before starting the first thing is to consult the help of the function.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb66"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb66-1"><a href="#cb66-1" aria-hidden="true" tabindex="-1"></a><span class="fu">help</span>(<span class="st">"write.table"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>The arguments of the function are similar to those already seen in <code>read.table ()</code>:</p>
<div class="alert alert-info">
<p><strong>💡write.table(object,file,names,sep)</strong></p>
</div>
<ul>
<li><p><code>object</code>: object of type matrix (or dataframe) to write.</p></li>
<li><p><code>file</code>: name and path to the created file (in text format).</p></li>
<li><p><code>row.names</code>: add or not (TRUE or FALSE) queue names. FALSE is recommended.</p></li>
<li><p><code>sep</code>: column separator (in text format).</p></li>
<li><p><code>dec</code>: decimal separator (in text format).</p></li>
</ul>
<p>Try the following instructions<a href="#fn6" class="footnote-ref" id="fnref6" role="doc-noteref"><sup>6</sup></a> and observe the different results:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb67"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb67-1"><a href="#cb67-1" aria-hidden="true" tabindex="-1"></a><span class="fu">write.table</span>(table,<span class="st">'table1.txt'</span>,<span class="at">row.names=</span><span class="cn">TRUE</span>,<span class="at">sep=</span><span class="st">'</span><span class="sc">\t</span><span class="st">'</span>)</span>
<span id="cb67-2"><a href="#cb67-2" aria-hidden="true" tabindex="-1"></a><span class="fu">write.table</span>(table,<span class="st">'table2.txt'</span>,<span class="at">row.names=</span><span class="cn">FALSE</span>,<span class="at">sep=</span><span class="st">'</span><span class="sc">\t</span><span class="st">'</span>)</span>
<span id="cb67-3"><a href="#cb67-3" aria-hidden="true" tabindex="-1"></a><span class="fu">write.table</span>(table,<span class="st">'table3.txt'</span>,<span class="at">row.names=</span><span class="cn">FALSE</span>,<span class="at">sep=</span><span class="st">';'</span>)</span>
<span id="cb67-4"><a href="#cb67-4" aria-hidden="true" tabindex="-1"></a><span class="fu">write.table</span>(table,<span class="st">'your path/table4.txt'</span>,<span class="at">sep=</span><span class="st">';'</span>)</span>
<span id="cb67-5"><a href="#cb67-5" aria-hidden="true" tabindex="-1"></a><span class="fu">write.csv</span>(table,<span class="st">'your path/table5.csv'</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
</section>
<section id="data-manipulation" class="level3" data-number="2.8.4">
<h3 data-number="2.8.4" class="anchored" data-anchor-id="data-manipulation"><span class="header-section-number">2.8.4</span> Data manipulation</h3>
<p>Let’s see the most common instructions for manipulating and extracting information in R. Specifically we will see how to extract subsets of data from objects of type <code>vector</code>, <code>array</code> or <code>dataframe</code>. We will also see how to create new data sets from the aggregation of several objects. There are many commands that allow us to manipulate our data in R. Many things can be understood as <em>manipulation</em> but for the moment we will focus on:</p>
<ul>
<li><p>Select or extract information</p></li>
<li><p>Sort tables</p></li>
<li><p>Add rows or columns to a table</p></li>
</ul>
<p>As you might already guess, we will work with tabular data like <code>arrays</code> and <code>data.frames</code> which we further refer to as <strong>tables</strong>.</p>
<section id="working-with-columns" class="level4" data-number="2.8.4.1">
<h4 data-number="2.8.4.1" class="anchored" data-anchor-id="working-with-columns"><span class="header-section-number">2.8.4.1</span> Working with columns</h4>
<p>The first thing we will do is access the information stored in the column(s) of a given table object. There are two basic ways to do this:</p>
<ol type="1">
<li><p>Using the position index of the column.</p></li>
<li><p>Using the name (header) of the column.</p></li>
</ol>
<p>These two basic forms are not always interchangeable, so we will use one or the other depending on the case. It is recommended that you use the one that feels most comfortable for you. However, in most examples the column position index is used since it is a numerical value that is very easily integrated with loops and other iterative processes.</p>
<section id="extracting-columns" class="level5" data-number="2.8.4.1.1">
<h5 data-number="2.8.4.1.1" class="anchored" data-anchor-id="extracting-columns"><span class="header-section-number">2.8.4.1.1</span> Extracting columns</h5>
<p>To extract columns using the position index we will use a series of instructions similar to those already seen in extracting information from <a href="https://intro-r-module-1.netlify.app/intro#arrays">Arrays</a>, <a href="https://intro-r-module-1.netlify.app/intro#vectors">Vectors</a> and <a href="https://intro-r-module-1.netlify.app/intro#lists">Lists</a>. The following statement returns the information of the second column of the <code>array</code> object <code>table</code> and stores it in a new object that we called <code>col2</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb68"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb68-1"><a href="#cb68-1" aria-hidden="true" tabindex="-1"></a>col2 <span class="ot">&lt;-</span> table[,<span class="dv">2</span>]</span>
<span id="cb68-2"><a href="#cb68-2" aria-hidden="true" tabindex="-1"></a>col2</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code> [1]  82500 110500  55500  28500  85500  38500  39500 124500  41500  49500
[11] 329500  77500  36500 148500</code></pre>
</div>
</div>
<p>It is also possible to extract a range of columns, proceeding in a similar way to what has already been seen in the creation of vectors. The following statement extracts columns 2 and 3 from the&nbsp;<code>table</code>&nbsp;object and stores them in a new object called&nbsp;<code>cols</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb70"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb70-1"><a href="#cb70-1" aria-hidden="true" tabindex="-1"></a>cols <span class="ot">&lt;-</span> table[,<span class="dv">2</span><span class="sc">:</span><span class="dv">3</span>]</span>
<span id="cb70-2"><a href="#cb70-2" aria-hidden="true" tabindex="-1"></a>cols</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>   X_INDEX Y_INDEX
1    82500 4653500
2   110500 4661500
3    55500 4805500
4    28500 4783500
5    85500 4729500
6    38500 4757500
7    39500 4775500
8   124500 4687500
9    41500 4727500
10   49500 4789500
11  329500 4807500
12   77500 4684500
13   36500 4718500
14  148500 4651500</code></pre>
</div>
</div>
<p>Now let’s see how to select columns using their name. Name extraction is performed using a combination of object and column name object using&nbsp;<code>$</code>&nbsp;to separte&nbsp;<code>object</code>&nbsp;from&nbsp;<code>column name</code>. The following statement selects the column named&nbsp;<code>Y_INDEX</code>&nbsp;from the&nbsp;<code>array</code>&nbsp;object&nbsp;<code>table</code>&nbsp;and stores it in&nbsp;<code>col.Y_INDEX</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb72"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb72-1"><a href="#cb72-1" aria-hidden="true" tabindex="-1"></a>col.Y_INDEX <span class="ot">&lt;-</span> table<span class="sc">$</span>Y_INDEX</span>
<span id="cb72-2"><a href="#cb72-2" aria-hidden="true" tabindex="-1"></a>col.Y_INDEX</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code> [1] 4653500 4661500 4805500 4783500 4729500 4757500 4775500 4687500 4727500
[10] 4789500 4807500 4684500 4718500 4651500</code></pre>
</div>
</div>
<p>A key piece of information here is the name of the column which we need to know in advance. Well, we can check the original text file or inspect the object <code>table</code> using <code>str()</code>. We can also take look to the top-right window activaing the <em>Environment</em> sub-window and unwrap <code>table</code> but be aware this can be only accessed using RStudio.</p>
<p>The main difference between these two methods is that index selection makes it possible to extract column ranges easily. To do this using the name of the columns you have to use functions like <code>subset()</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb74"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb74-1"><a href="#cb74-1" aria-hidden="true" tabindex="-1"></a>cols2 <span class="ot">&lt;-</span> <span class="fu">subset</span>(table, <span class="at">select =</span> <span class="fu">c</span>(X_INDEX,Y_INDEX))</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>Using the argument&nbsp;<code>select</code>&nbsp;we can point the columns that we want to extract using a vector with column names. Using&nbsp;<code>subset()</code>&nbsp;it is also possible to specify the columns that we&nbsp;<strong>do NOT want to extract</strong>. To do this proceed as follows:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb75"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb75-1"><a href="#cb75-1" aria-hidden="true" tabindex="-1"></a>cols2 <span class="ot">&lt;-</span> <span class="fu">subset</span>(table, <span class="at">select =</span> <span class="sc">-</span><span class="fu">c</span>(X_INDEX,Y_INDEX))</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>In this way we would only extract the first column, excluding X_INDEX and Y_INDEX. Of cours, we can do this using the column index as well:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb76"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb76-1"><a href="#cb76-1" aria-hidden="true" tabindex="-1"></a>cols2 <span class="ot">&lt;-</span> table[,<span class="sc">-</span>(<span class="dv">2</span><span class="sc">:</span><span class="dv">3</span>)]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
</section>
<section id="merge-columns-and-tables" class="level5" data-number="2.8.4.1.2">
<h5 data-number="2.8.4.1.2" class="anchored" data-anchor-id="merge-columns-and-tables"><span class="header-section-number">2.8.4.1.2</span> Merge columns and tables</h5>
<p>The main reason why we are learning how to manipulate table columns is to be able to prepare our data for other purposes. It may be the case we need to join tables or columns that proceed from the same original table. The instruction <code>cbind()</code> allow us to merge together several tables and/or vectors <strong>provided they have the same number of rows</strong>. We can merge as many objects as we want to, by separating them using <code>,</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb77"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb77-1"><a href="#cb77-1" aria-hidden="true" tabindex="-1"></a>cols3 <span class="ot">&lt;-</span> <span class="fu">cbind</span>(col2,cols2)</span>
<span id="cb77-2"><a href="#cb77-2" aria-hidden="true" tabindex="-1"></a>cols3</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>        col2  cols2
 [1,]  82500 364011
 [2,] 110500 371655
 [3,]  55500 487720
 [4,]  28500 474504
 [5,]  85500 436415
 [6,]  38500 457549
 [7,]  39500 469377
 [8,] 124500 397162
 [9,]  41500 434666
[10,]  49500 478383
[11,] 329500 488973
[12,]  77500 394153
[13,]  36500 426962
[14,] 148500 362216</code></pre>
</div>
</div>
</section>
<section id="changing-column-names" class="level5" data-number="2.8.4.1.3">
<h5 data-number="2.8.4.1.3" class="anchored" data-anchor-id="changing-column-names"><span class="header-section-number">2.8.4.1.3</span> Changing column names</h5>
<p>It is often the case we need to alter or change the name of a table object. If we wanted to rename all the columns of an object we would to pass a <code>vector</code> with names to the function <code>colnames()</code> in case we are renaming an <code>array</code> or <code>names()</code> if we are dealing with a <code>data.frame</code>. Note that the <code>vector</code> should have the same length as the total number of columns. Lets rename our table <code>cols3</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb79"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb79-1"><a href="#cb79-1" aria-hidden="true" tabindex="-1"></a><span class="fu">colnames</span>(cols3)<span class="ot">&lt;-</span> <span class="fu">c</span>(<span class="st">"COL1"</span>,<span class="st">"COL2"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>What if we want to change only a given name. Then we just point to the column header using the position index like this:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb80"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb80-1"><a href="#cb80-1" aria-hidden="true" tabindex="-1"></a><span class="fu">colnames</span>(cols3)[<span class="dv">2</span>]<span class="ot">&lt;-</span> <span class="st">"RENAMED COLUMN"</span></span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>You may be wondering <em>How can we know what kind of object is my table?</em>. That is a very good question. Specially at the begining is quite difficult to be in control this stuff. If you use RStudio you already see a description of the objects in the top-right window. <code>array</code> or <code>matrix</code> objects show something like <code>[1:14,1:2]</code> indicating multiple dimensions, <code>vectors</code> are similar but with only 1 dimension <code>[1:14]</code> and <code>data.frames</code> show the word <code>data.frame</code> in their description. However, this is not the fancy way to deal with object types. Just for the record, when we mean <strong>type</strong> an actual code developer means <strong>class</strong>. Of course there is a function called <code>class()</code> that returns the class an object belongs to:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb81"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb81-1"><a href="#cb81-1" aria-hidden="true" tabindex="-1"></a><span class="fu">class</span>(cols3)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] "matrix" "array" </code></pre>
</div>
</div>
</section>
<section id="sorting-our-data" class="level5" data-number="2.8.4.1.4">
<h5 data-number="2.8.4.1.4" class="anchored" data-anchor-id="sorting-our-data"><span class="header-section-number">2.8.4.1.4</span> Sorting our data</h5>
<p>Finally, let’s look at how to sort columns and <code>arrays</code>. To sort a column in R, the <code>sort()</code> function is used. The general function of the function is:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb83"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb83-1"><a href="#cb83-1" aria-hidden="true" tabindex="-1"></a><span class="fu">sort</span>(cols3[,<span class="dv">1</span>])</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code> [1]  28500  36500  38500  39500  41500  49500  55500  77500  82500  85500
[11] 110500 124500 148500 329500</code></pre>
</div>
</div>
<p>If we want to reorder an array based on the values of one of its columns, we will use the order () function. The general operation of the function is:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb85"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb85-1"><a href="#cb85-1" aria-hidden="true" tabindex="-1"></a>table[<span class="fu">order</span>(table<span class="sc">$</span>X_INDEX),]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>    FID_1 X_INDEX Y_INDEX
4  474504   28500 4783500
13 426962   36500 4718500
6  457549   38500 4757500
7  469377   39500 4775500
9  434666   41500 4727500
10 478383   49500 4789500
3  487720   55500 4805500
12 394153   77500 4684500
1  364011   82500 4653500
5  436415   85500 4729500
2  371655  110500 4661500
8  397162  124500 4687500
14 362216  148500 4651500
11 488973  329500 4807500</code></pre>
</div>
</div>
<p>To be honest, in this last example we are actually working with rows. Take a look at the position of the <code>,</code>. The brackets are also something that we will use later to extract data from a table. But it feels right to bring here the <code>order()</code> command right after <code>sort()</code>.</p>
</section>
</section>
<section id="working-with-rows" class="level4" data-number="2.8.4.2">
<h4 data-number="2.8.4.2" class="anchored" data-anchor-id="working-with-rows"><span class="header-section-number">2.8.4.2</span> Working with rows</h4>
<p>Let us now turn to the manipulation of rows. The procedure is basically the same as in the case of columns, except for the fact that we normally do not work with names assigned to rows (although that’s a possibility), but we refer to a row using its position. To extract rows or combine several objects according to their rows we use the following expressions:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb87"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb87-1"><a href="#cb87-1" aria-hidden="true" tabindex="-1"></a>row1 <span class="ot">&lt;-</span> table[<span class="dv">1</span><span class="sc">:</span><span class="dv">5</span>,]</span>
<span id="cb87-2"><a href="#cb87-2" aria-hidden="true" tabindex="-1"></a>row2 <span class="ot">&lt;-</span> table[<span class="sc">-</span>(<span class="dv">6</span><span class="sc">:</span><span class="dv">7</span>),]</span>
<span id="cb87-3"><a href="#cb87-3" aria-hidden="true" tabindex="-1"></a>row3 <span class="ot">&lt;-</span> <span class="fu">rbind</span>(row1,row2)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>Same as with <a href="#arrays">Arrays</a> we point to rows instead of columns when we use the index value to the left of the <code>[row,col]</code>. So that’s the thing, we just change that and we are dealing with rows. We can join rows and tables using the <code>rbind()</code> function rather than <code>cbind()</code>. <code>r</code> stands for <code>row</code> and <code>c</code> for <code>column</code>.</p>
<p>We can extract a subsample of rows that meet a given criteria:</p>
<div class="alert alert-info">
<p><strong>💡table[criteria,]</strong></p>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb88"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb88-1"><a href="#cb88-1" aria-hidden="true" tabindex="-1"></a>table[table<span class="sc">$</span>X_INDEX<span class="sc">==</span><span class="dv">82500</span>,]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>   FID_1 X_INDEX Y_INDEX
1 364011   82500 4653500</code></pre>
</div>
<div class="sourceCode cell-code" id="cb90"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb90-1"><a href="#cb90-1" aria-hidden="true" tabindex="-1"></a>table[table<span class="sc">$</span>X_INDEX<span class="sc">&gt;</span><span class="dv">82500</span>,]</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>    FID_1 X_INDEX Y_INDEX
2  371655  110500 4661500
5  436415   85500 4729500
8  397162  124500 4687500
11 488973  329500 4807500
14 362216  148500 4651500</code></pre>
</div>
</div>
<p>Oh, we expect you to have found out this by yourself but evidently we can combine row and column manipulation if that fits our purpose.</p>
</section>
</section>
</section>
<section id="basic-instructions" class="level2" data-number="2.9">
<h2 data-number="2.9" class="anchored" data-anchor-id="basic-instructions"><span class="header-section-number">2.9</span> Basic instructions</h2>
<section id="descriptive-statistics-and-summaries" class="level3" data-number="2.9.1">
<h3 data-number="2.9.1" class="anchored" data-anchor-id="descriptive-statistics-and-summaries"><span class="header-section-number">2.9.1</span> Descriptive statistics and summaries</h3>
<p>There are a large number of functions in the basic installation of R. It would be practically impossible to see all of them so we will see some of the most used, although we must remember that not only is there the possibility of using predesigned functions, but R also offers the possibility to create your own functions.</p>
<p>Below are some of the basic statistical functions that we can find in R. These functions are generally applied <code>matrix-array</code> or <code>data.frame</code> data objects. Some of them can be applied to the whole table and others to single columns or rows.</p>
<ul>
<li><p><code>sum()</code> Add values.</p></li>
<li><p><code>max()</code> Returns the maximum value.</p></li>
<li><p><code>min()</code> Returns the minimum value.</p></li>
<li><p><code>mean()</code> Calculates the mean.</p></li>
<li><p><code>median()</code> Returns the median.</p></li>
<li><p><code>sd()</code> Calculates the standard deviation.</p></li>
<li><p><code>summary()</code> Returns a statistical summary of the columns.</p></li>
</ul>
<p>We are going to apply them using some example data. We will use the data stored in the file <em>fires.csv</em>, inside the <em>Data</em> folder (Table 3.1). This file contains data on the annual number of fires between 1985 and 2009 in several European countries.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb92"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb92-1"><a href="#cb92-1" aria-hidden="true" tabindex="-1"></a>fires <span class="ot">&lt;-</span> <span class="fu">read.csv2</span>(<span class="st">"./data/Module_1/fires.csv"</span>,<span class="at">header=</span><span class="cn">TRUE</span>)</span>
<span id="cb92-2"><a href="#cb92-2" aria-hidden="true" tabindex="-1"></a>knitr<span class="sc">::</span><span class="fu">kable</span>(coords,<span class="at">caption =</span> <span class="st">"Structure of the fires.csv file."</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<table class="caption-top table table-sm table-striped small">
<caption>Structure of the fires.csv file.</caption>
<thead>
<tr class="header">
<th style="text-align: right;">FID_1</th>
<th style="text-align: right;">X_INDEX</th>
<th style="text-align: right;">Y_INDEX</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">364011</td>
<td style="text-align: right;">82500</td>
<td style="text-align: right;">4653500</td>
</tr>
<tr class="even">
<td style="text-align: right;">371655</td>
<td style="text-align: right;">110500</td>
<td style="text-align: right;">4661500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">487720</td>
<td style="text-align: right;">55500</td>
<td style="text-align: right;">4805500</td>
</tr>
<tr class="even">
<td style="text-align: right;">474504</td>
<td style="text-align: right;">28500</td>
<td style="text-align: right;">4783500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">436415</td>
<td style="text-align: right;">85500</td>
<td style="text-align: right;">4729500</td>
</tr>
<tr class="even">
<td style="text-align: right;">457549</td>
<td style="text-align: right;">38500</td>
<td style="text-align: right;">4757500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">469377</td>
<td style="text-align: right;">39500</td>
<td style="text-align: right;">4775500</td>
</tr>
<tr class="even">
<td style="text-align: right;">397162</td>
<td style="text-align: right;">124500</td>
<td style="text-align: right;">4687500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">434666</td>
<td style="text-align: right;">41500</td>
<td style="text-align: right;">4727500</td>
</tr>
<tr class="even">
<td style="text-align: right;">478383</td>
<td style="text-align: right;">49500</td>
<td style="text-align: right;">4789500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">488973</td>
<td style="text-align: right;">329500</td>
<td style="text-align: right;">4807500</td>
</tr>
<tr class="even">
<td style="text-align: right;">394153</td>
<td style="text-align: right;">77500</td>
<td style="text-align: right;">4684500</td>
</tr>
<tr class="odd">
<td style="text-align: right;">426962</td>
<td style="text-align: right;">36500</td>
<td style="text-align: right;">4718500</td>
</tr>
<tr class="even">
<td style="text-align: right;">362216</td>
<td style="text-align: right;">148500</td>
<td style="text-align: right;">4651500</td>
</tr>
</tbody>
</table>
</div>
</div>
<p>The first thing is to import the file into a&nbsp;<code>table</code>.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb93"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb93-1"><a href="#cb93-1" aria-hidden="true" tabindex="-1"></a>fires <span class="ot">&lt;-</span> <span class="fu">read.table</span>(<span class="st">"./data/Module_1/fires.csv"</span>,<span class="at">header=</span><span class="cn">TRUE</span>,<span class="at">sep=</span><span class="st">','</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>Once data is imported we can take a look at the structure to make sure that everything went well. We should have integer values for each region:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb94"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb94-1"><a href="#cb94-1" aria-hidden="true" tabindex="-1"></a><span class="fu">str</span>(fires)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>'data.frame':   25 obs. of  7 variables:
 $ YEAR    : int  1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 ...
 $ PORTUGAL: int  8441 5036 7705 6131 21896 10745 14327 14954 16101 19983 ...
 $ SPAIN   : int  12238 7570 8679 9247 20811 12913 13531 15955 14254 19263 ...
 $ FRANCE  : int  6249 4353 3043 2837 6763 5881 3888 4002 4769 4618 ...
 $ ITALY   : int  18664 9398 11972 13588 9669 14477 11965 14641 14412 11588 ...
 $ GREECE  : int  1442 1082 1266 1898 1284 1322 858 2582 2406 1763 ...
 $ EUMED   : int  47034 27439 32665 33701 60423 45338 44569 52134 51942 57215 ...</code></pre>
</div>
</div>
<p>Now we will calculate some descriptive statistics for each column to have a first approximation to the <em>distribution</em> of our data. To do this we will use the function <code>summary()</code> that will return some basic statistical values such as:</p>
<ul>
<li><p>Quantile</p></li>
<li><p>Mean</p></li>
<li><p>Median</p></li>
<li><p>Maximum</p></li>
<li><p>Minimum</p></li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb96"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb96-1"><a href="#cb96-1" aria-hidden="true" tabindex="-1"></a><span class="fu">summary</span>(fires)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>      YEAR         PORTUGAL         SPAIN           FRANCE         ITALY      
 Min.   :1985   Min.   : 5036   Min.   : 7570   Min.   :2781   Min.   : 4601  
 1st Qu.:1991   1st Qu.:14327   1st Qu.:12913   1st Qu.:4002   1st Qu.: 7134  
 Median :1997   Median :21870   Median :16771   Median :4618   Median : 9540  
 Mean   :1997   Mean   :20848   Mean   :16937   Mean   :4907   Mean   : 9901  
 3rd Qu.:2003   3rd Qu.:26488   3rd Qu.:20811   3rd Qu.:6249   3rd Qu.:11965  
 Max.   :2009   Max.   :35697   Max.   :25827   Max.   :8005   Max.   :18664  
     GREECE         EUMED      
 Min.   : 858   Min.   :27439  
 1st Qu.:1322   1st Qu.:45623  
 Median :1486   Median :55215  
 Mean   :1656   Mean   :54249  
 3rd Qu.:1898   3rd Qu.:62399  
 Max.   :2582   Max.   :75382  </code></pre>
</div>
</div>
<p>The <code>summary()</code> function is not only used to obtain summaries of data through descriptive statistics, but can also be used in model type objects to obtain a statistical summary of the results, coefficients, significance … Later we will see an example of this applied on a linear regression model.</p>
<p>Let’s now see what happens if we apply some of the functions presented above. Try running the following instructions:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb98"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb98-1"><a href="#cb98-1" aria-hidden="true" tabindex="-1"></a><span class="fu">sum</span>(fires)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 2762377</code></pre>
</div>
<div class="sourceCode cell-code" id="cb100"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb100-1"><a href="#cb100-1" aria-hidden="true" tabindex="-1"></a><span class="fu">max</span>(fires)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 75382</code></pre>
</div>
<div class="sourceCode cell-code" id="cb102"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb102-1"><a href="#cb102-1" aria-hidden="true" tabindex="-1"></a><span class="fu">min</span>(fires)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 858</code></pre>
</div>
</div>
<p>As can be seen these 3 instructions work with a <code>table</code>but <code>mean()</code>, <code>median()</code> and <code>sd()</code> will not. We have to apply them to a single column:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb104"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb104-1"><a href="#cb104-1" aria-hidden="true" tabindex="-1"></a><span class="fu">mean</span>(fires<span class="sc">$</span>SPAIN)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 16937.24</code></pre>
</div>
<div class="sourceCode cell-code" id="cb106"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb106-1"><a href="#cb106-1" aria-hidden="true" tabindex="-1"></a><span class="fu">median</span>(fires<span class="sc">$</span>SPAIN)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 16771</code></pre>
</div>
<div class="sourceCode cell-code" id="cb108"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb108-1"><a href="#cb108-1" aria-hidden="true" tabindex="-1"></a><span class="fu">sd</span>(fires<span class="sc">$</span>SPAIN)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 5260.519</code></pre>
</div>
</div>
</section>
<section id="the-apply-function" class="level3" data-number="2.9.2">
<h3 data-number="2.9.2" class="anchored" data-anchor-id="the-apply-function"><span class="header-section-number">2.9.2</span> The <em>apply()</em> function</h3>
<p>So far we have seen how to apply some of the basic statistical functions to our data, applying those functions to the data contained in the matrix or some of its columns. In the case of columns we have manually specified which one to apply a function. However, we can apply functions to all elements of an <code>array</code> (columns or rows) using iteration functions.</p>
<p>The <code>apply()</code> function allows you to apply a function to all elements of a table. We can apply some of the functions before the rows or columns of an array. There are different variants of this function. First, as always, invoke the help of the function to make sure what we are doing.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb110"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb110-1"><a href="#cb110-1" aria-hidden="true" tabindex="-1"></a><span class="fu">help</span>(apply)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>According to the specified in the function help we can see that the apply () function works as follows:</p>
<div class="alert alert-info">
<p><strong>💡apply(x, margin, fun, …) </strong></p>
</div>
<p>Where:</p>
<ul>
<li><p>X: data matrix.</p></li>
<li><p>MARGIN: argument to specify whether the function is applied to rows (1) or columns (2).</p></li>
<li><p>FUN: function to be applied (<code>mean</code>,<code>sum</code>…)</p></li>
</ul>
<p>For example, if we want to sum the values of each country/region we will do as follows:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb111"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb111-1"><a href="#cb111-1" aria-hidden="true" tabindex="-1"></a><span class="fu">apply</span>(fires,<span class="dv">2</span>,mean)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>    YEAR PORTUGAL    SPAIN   FRANCE    ITALY   GREECE    EUMED 
 1997.00 20848.20 16937.24  4907.16  9900.64  1655.80 54249.04 </code></pre>
</div>
</div>
<p>Well, almost there. We have included the&nbsp;<em>YEAR</em>&nbsp;column which is the first one:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb113"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb113-1"><a href="#cb113-1" aria-hidden="true" tabindex="-1"></a><span class="fu">apply</span>(fires[,<span class="sc">-</span><span class="dv">1</span>],<span class="dv">2</span>,mean)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>PORTUGAL    SPAIN   FRANCE    ITALY   GREECE    EUMED 
20848.20 16937.24  4907.16  9900.64  1655.80 54249.04 </code></pre>
</div>
</div>
<div class="alert alert-warning">
<p><strong>📝EXERCISE 1: </strong>Calculate the total number of fires on a yearly basis.</p>
<p><b>Deliverable: </b></p>
<ol type="1">
<li>Write a text file (<em>.txt</em>) with the result.</li>
</ol>
</div>
<div class="alert alert-warning">
<p><strong>📝EXERCISE 2: </strong> Open the file “<em>barea.csv</em>” (<em>file containing Burned Area by year and country</em>) and save it in an object named “<em>barea</em>” - Select and store in a new matrix the data from the year 2000 to 2009. - Calculate descriptive statistics 2000-2009. - Calculate the&nbsp;<em>mean</em>,&nbsp;<em>standard deviation</em>,&nbsp;<em>minimum</em>&nbsp;and&nbsp;<em>maximum</em>&nbsp;of all columns and save it to a new object.</p>
<p><b>Deliverable: </b></p>
<ol type="1">
<li>Write a text file (<em>.txt</em>) with the result.</li>
</ol>
</div>
<div class="alert alert-success">
<p><strong> 🪄EXERCISE 2 HINT: </strong></p>
<p>Use the apply function to calculate each statistic, separately.</p>
</div>
</section>
<section id="installing-packages" class="level3" data-number="2.9.3">
<h3 data-number="2.9.3" class="anchored" data-anchor-id="installing-packages"><span class="header-section-number">2.9.3</span> Installing packages</h3>
<p>We have already seen how some of the basic functions of R. work. However, we have the possibility of extending the functionalities of R by importing new packages into our environment. These packages are developed by different research groups and/or individuals.</p>
<p>There are currently over 20015 packages available in the R project repository (<a href="https://cran.r-project.org/web/packages/available_packages_by_name.html">CRAN</a>). Obviously we do not need to know how each one of them works, but only focus on those that fit our needs.</p>
<div class="cell">
<div class="cell-output cell-output-stderr">
<pre><code>Warning: package 'rvest' was built under R version 4.3.3</code></pre>
</div>
<div class="cell-output cell-output-stderr">
<pre><code>Warning: package 'ggplot2' was built under R version 4.3.3</code></pre>
</div>
<div class="cell-output cell-output-stderr">
<pre><code>Warning: package 'tidyr' was built under R version 4.3.3</code></pre>
</div>
<div class="cell-output cell-output-stderr">
<pre><code>Warning: package 'dplyr' was built under R version 4.3.3</code></pre>
</div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-59-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>The import and installation of new packages is carried out in 2 stages:</p>
<ol type="1">
<li><p>obtaining and installing and internal call to the package.</p></li>
<li><p>Loading the package into our session.</p></li>
</ol>
</section>
<section id="installing-an-external-package" class="level3" data-number="2.9.4">
<h3 data-number="2.9.4" class="anchored" data-anchor-id="installing-an-external-package"><span class="header-section-number">2.9.4</span> Installing an external package</h3>
<p>We will install the “foreign” package. This package provides functions for reading and writing data stored in different statistical software formats such as Minitab, S, SAS, SPSS, Stata, Systat … and to read and write <em>dBase</em> files such as attribute tables of vector layers in format <em>shapefile</em>. The first thing we will do is get the package via download. This can be done from the menu of R:</p>
<ul>
<li><p>Packages / Install packages …</p></li>
<li><p>Select download directory (mirror)</p></li>
<li><p>Search for “foreing”</p></li>
</ul>
<p>If you are using RStudio simply go to the <em>Packages</em> tab in the lower right box and select the <em>Install</em> option. In the popup window select the <em>Repository (CRAN, CRANextra)</em> option in the drop-down menu and type the name of the package.</p>
<div class="cell" data-layout-align="center">
<div class="cell-output-display">
<div class="quarto-figure quarto-figure-center">
<figure class="figure">
<p><img src="./images/fig3_1.png" class="img-fluid figure-img" style="width:100.0%"></p>
<figcaption>Installing a package using RStudio</figcaption>
</figure>
</div>
</div>
</div>
<p>Another option is to obtain the package in <em>.zip</em> format directly from the webpage of project R and use the function <em>Install package (s) from local zip files …</em> (or <em>Package archives</em> in RStudio).</p>
<p>It is also possible to install packages through instructions in the R window, which is the most recommended method<a href="#fn7" class="footnote-ref" id="fnref7" role="doc-noteref"><sup>7</sup></a>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb119"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb119-1"><a href="#cb119-1" aria-hidden="true" tabindex="-1"></a><span class="fu">install.packages</span>(<span class="st">"foreign"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>At this point we would have installed the package in our personal library of R. However, in order to use the functions of the new package in our R environment it is necessary to make an internal call to the package. This is generally done using the&nbsp;<code>library()</code>&nbsp;function<a href="#fn8" class="footnote-ref" id="fnref8" role="doc-noteref"><sup>8</sup></a>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb120"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb120-1"><a href="#cb120-1" aria-hidden="true" tabindex="-1"></a><span class="fu">library</span>(foreign)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stderr">
<pre><code>Warning: package 'foreign' was built under R version 4.3.3</code></pre>
</div>
</div>
<p>Once this is done we have all the functions of the package ready to be used. All that is left is to learn how to use the functions of the package… which is easy to say but maybe not to do.</p>
</section>
<section id="create-a-function" class="level3" data-number="2.9.5">
<h3 data-number="2.9.5" class="anchored" data-anchor-id="create-a-function"><span class="header-section-number">2.9.5</span> Create a function</h3>
<p>So far we have mainly seen how to use pre-designed functions either in the default installation or from other packages. However, there is the possibility of creating our own functions.</p>
<p>A function is a group of instructions that takes an input or input data, and uses them to calculate other values, returning a result or product. For example, the <code>mean()</code> function takes as input a vector and returns as a result a numeric value that corresponds to the arithmetic mean.</p>
<p>To create our own functions we will use the object called function that constitute new functions. The usual syntax is:</p>
<div class="alert alert-info">
<p><strong>💡FunName &lt;- function(args){comands} </strong></p>
</div>
<p>Where:</p>
<ul>
<li><p><code>arguments</code> are the arguments we want to pass to our function.</p></li>
<li><p><code>commands</code> are the instructions needed to do whatever the function does.</p></li>
</ul>
<p>Let’s look at a simple example. We will create a function to calculate the <a href="https://en.wikipedia.org/wiki/Standard_deviation">standard deviation</a> of a vector with numerical data. The standard deviation formula looks like this:</p>
<p><span class="math display">\[
\text{SD} = \sqrt{\frac{1}{N} \sum_{i=1}^{N} (x_i - \bar{x})^2}
\]</span></p>
<p>Which is essentially the square root (<code>sqrt()</code>) of the variance (<code>var()</code>):</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb122"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb122-1"><a href="#cb122-1" aria-hidden="true" tabindex="-1"></a>desv <span class="ot">&lt;-</span> <span class="cf">function</span>(x){<span class="fu">sqrt</span>(<span class="fu">var</span>(x))}</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>The function name is&nbsp;<code>desv()</code>. This function requires a single argument (x) to be executed. Once the function is defined, it can be called and used as any other predefined function in the system.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb123"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb123-1"><a href="#cb123-1" aria-hidden="true" tabindex="-1"></a>data <span class="ot">&lt;-</span> <span class="dv">1</span><span class="sc">:</span><span class="dv">10</span></span>
<span id="cb123-2"><a href="#cb123-2" aria-hidden="true" tabindex="-1"></a><span class="fu">desv</span>(data)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 3.02765</code></pre>
</div>
</div>
<p>Let’s see an example with 2 arguments. We will create a function to calculate the NDVI. The function will take as arguments two objects of vector type corresponding to the sensor Landsat TM channels 3 and 4:</p>
<div class="alert alert-info">
<p><i>The normalized difference vegetation index (NDVI) is a simple graphical indicator that can be used to analyze remote sensing measurements, typically but not necessarily from a space platform, and assess whether the target being observed contains live green vegetation or not&nbsp;<a href="https://en.wikipedia.org/wiki/Normalized_Difference_Vegetation_Index">wikipedia.org</a>.</i></p>
</div>
<p><span class="math display">\[
NDVI=\frac{NIR-Red}{NIR+Red}
\]</span></p>
<p>Where&nbsp;<span class="math inline">\(NIR\)</span>(<em>y</em>) is the near-infrarred band and&nbsp;<span class="math inline">\(Red\)</span>(<em>x</em>) is the red band.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb125"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb125-1"><a href="#cb125-1" aria-hidden="true" tabindex="-1"></a>ndvi <span class="ot">&lt;-</span> <span class="cf">function</span>(x,y){(y<span class="sc">-</span>x)<span class="sc">/</span>(y<span class="sc">+</span>x)}</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<p>As we have said, once created we can use our functions in the same way as the rest of functions. This includes using the <code>apply()</code> function and its derived versions to iterate over rows and columns of an array or data frame.</p>
<p>Let’s see an example with the function <code>desv()</code>, previously created applied to the data of number of fires:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb126"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb126-1"><a href="#cb126-1" aria-hidden="true" tabindex="-1"></a><span class="fu">apply</span>(fires,<span class="dv">2</span>,desv)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>        YEAR     PORTUGAL        SPAIN       FRANCE        ITALY       GREECE 
    7.359801  9187.114305  5260.519400  1393.670265  3467.510729   496.662025 
       EUMED 
13547.393887 </code></pre>
</div>
</div>
</section>
</section>
<section id="plotting-with-r" class="level2" data-number="2.10">
<h2 data-number="2.10" class="anchored" data-anchor-id="plotting-with-r"><span class="header-section-number">2.10</span> Plotting with R</h2>
<section id="basic-plots" class="level3" data-number="2.10.1">
<h3 data-number="2.10.1" class="anchored" data-anchor-id="basic-plots"><span class="header-section-number">2.10.1</span> Basic plots</h3>
<p>R is not just an environment for the implementation and use of functions for statistical calculation but it is also a powerful environment for generating and displaying plots. Creating plots is besides an effective and quick way to visualize our data. By doing so we can verify whether data was correctly imported or not. However, creating graphics is also done by command-line instructions, which can sometimes be a bit tricky, especially at the beginning.</p>
<p>In R we can create many types of plots. With some packages it is also possible to generate maps similar to those created by GIS, although for the moment we will only see some basic types such as:</p>
<ul>
<li><p>Dot charts</p></li>
<li><p>Line charts</p></li>
<li><p>Barplots</p></li>
<li><p>Histograms</p></li>
<li><p>Scatterplots</p></li>
</ul>
<p>Before going into detail with the specific types of graphics we will see some general concepts which apply to the majority of plots:</p>
<ol type="1">
<li><p>All graphics always require an object that contains the data to be drawn. This object is usually specified in the first argument of the function corresponding to each type of chart.</p></li>
<li><p>There are a number of arguments to manipulate axis labels or the chart title:</p></li>
</ol>
<ul>
<li><p><code>main</code>: text with the title of our plot.</p></li>
<li><p><code>xlab</code>: text for x axis label.</p></li>
<li><p><code>ylab</code>: text for y axis label.</p></li>
<li><p><code>xlim</code>: vector with upper and low range for the x-axis.</p></li>
<li><p><code>ylim</code>: vector with upper and low range for the y-axis.</p></li>
<li><p><code>cex</code>: number indicating the aspect ratio between plot elements and text. 1 by default.</p></li>
<li><p><code>col</code>: changes de color the plotted element. See <a href="http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf" class="uri">http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf</a></p></li>
<li><p><code>legend()</code>: adds a legend element describing symbology.</p></li>
</ul>
</section>
<section id="dot-or-point-plots" class="level3" data-number="2.10.2">
<h3 data-number="2.10.2" class="anchored" data-anchor-id="dot-or-point-plots"><span class="header-section-number">2.10.2</span> Dot or point plots</h3>
<p>This is one of the most basic types of graphics if not the most basic one we can create. To create such a graph we will use the <code>plot()</code> function. Let’s look at a simple example using data from <em>fires.csv</em><a href="#fn9" class="footnote-ref" id="fnref9" role="doc-noteref"><sup>9</sup></a>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb128"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb128-1"><a href="#cb128-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb128-2"><a href="#cb128-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-67-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>As you can see, we are plotting data from the <em>SPAIN</em> column, ie, yearly fire occurrence data in Spain.</p>
<p>Remember RStudio displays plots in the right-bottom window. In addition, if you need to take closer look use the <em>Zoom</em> button to pop-up a new plot window.</p>
<p>Le’s tune up and enhance our plot. We can change the symbol type using the <code>pch</code> argument. You’ll find a list of symbol types (not just dot charts) at <a href="http://www.statmethods.net/advgraphs/parameters.html" class="uri">http://www.statmethods.net/advgraphs/parameters.html</a>.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb129"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb129-1"><a href="#cb129-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb129-2"><a href="#cb129-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">4</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-68-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>We can change symbol size using&nbsp;<code>cex</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb130"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb130-1"><a href="#cb130-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb130-2"><a href="#cb130-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">4</span>,<span class="at">cex=</span><span class="dv">2</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-69-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>And we can change the color of the symbol with <code>col</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb131"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb131-1"><a href="#cb131-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb131-2"><a href="#cb131-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">4</span>,<span class="at">cex=</span><span class="dv">2</span>,<span class="at">col=</span><span class="st">'red'</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-70-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>The col argument can be specified either using the color name as in the example or using its code number, hexadecimal or RGB so that&nbsp;<code>col = 1</code>,&nbsp;<code>col = "white"</code>, and&nbsp;<code>col = "#FFFFFF"</code>&nbsp;are equivalent. In some types of symbols we can also change the color of the symbol background in addition to the symbol itself using the argument&nbsp;<code>bg</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb132"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb132-1"><a href="#cb132-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb132-2"><a href="#cb132-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">21</span>,<span class="at">cex=</span><span class="dv">1</span>,<span class="at">col=</span><span class="st">'black'</span>,<span class="at">bg=</span><span class="st">'red'</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-71-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>The finish our plot we will modify axis labels, add a title and a legend:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb133"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb133-1"><a href="#cb133-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb133-2"><a href="#cb133-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">21</span>,<span class="at">cex=</span><span class="dv">1</span>,<span class="at">col=</span><span class="st">'black'</span>,<span class="at">bg=</span><span class="st">'red'</span>,</span>
<span id="cb133-3"><a href="#cb133-3" aria-hidden="true" tabindex="-1"></a>     <span class="at">main=</span><span class="st">'Number of fires in Spain'</span>,<span class="at">ylab =</span> <span class="st">'Number of fires'</span>,<span class="at">xlab =</span> <span class="st">''</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-72-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>Note that we have used the&nbsp;<code>xlab</code>&nbsp;argument to leave the x-axis label&nbsp;<em>blank</em>. Now we add the legend. It is important you bear in mind that the legend is added with an additional command right after the plot statement. Legends in basic plots are just an image we add to an existing plot by emulating the symbol used in that plot using the&nbsp;<code>legend()</code>&nbsp;function:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb134"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb134-1"><a href="#cb134-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb134-2"><a href="#cb134-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">21</span>,<span class="at">cex=</span><span class="dv">1</span>,<span class="at">col=</span><span class="st">'black'</span>,<span class="at">bg=</span><span class="st">'red'</span>,</span>
<span id="cb134-3"><a href="#cb134-3" aria-hidden="true" tabindex="-1"></a>     <span class="at">main=</span><span class="st">'Number of fires in Spain'</span>,<span class="at">ylab =</span> <span class="st">'Number of fires'</span>,<span class="at">xlab =</span> <span class="st">''</span>)</span>
<span id="cb134-4"><a href="#cb134-4" aria-hidden="true" tabindex="-1"></a><span class="fu">legend</span>( <span class="st">"topleft"</span> , <span class="at">cex =</span> <span class="fl">1.3</span>, <span class="at">bty =</span> <span class="st">"n"</span>, <span class="at">legend =</span> <span class="fu">c</span>(<span class="st">"Spain"</span>), , <span class="at">text.col =</span> <span class="fu">c</span>(<span class="st">"black"</span>), <span class="at">col =</span> <span class="fu">c</span>(<span class="st">"red"</span>) , <span class="at">pt.bg =</span> <span class="fu">c</span>(<span class="st">"red"</span>) , <span class="at">pch =</span> <span class="fu">c</span>(<span class="dv">21</span>) )</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-73-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>But, what if we want to add a second series of data? Then we proceed in a way similar to the&nbsp;<code>legend()</code>&nbsp;statement, but using the function&nbsp;<code>points()</code>&nbsp;similar to what we have seen in the&nbsp;<code>plot()</code>&nbsp;example. In the following code we add a second point data series with portugal:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb135"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb135-1"><a href="#cb135-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb135-2"><a href="#cb135-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">21</span>,<span class="at">cex=</span><span class="dv">1</span>,<span class="at">col=</span><span class="st">'black'</span>,<span class="at">bg=</span><span class="st">'red'</span>,</span>
<span id="cb135-3"><a href="#cb135-3" aria-hidden="true" tabindex="-1"></a>     <span class="at">main=</span><span class="st">'Number of fires in Spain'</span>,<span class="at">ylab =</span> <span class="st">'Number of fires'</span>,<span class="at">xlab =</span> <span class="st">''</span>)</span>
<span id="cb135-4"><a href="#cb135-4" aria-hidden="true" tabindex="-1"></a><span class="fu">points</span>(fires<span class="sc">$</span>PORTUGAL,<span class="at">pch=</span><span class="dv">21</span>,<span class="at">cex=</span><span class="dv">1</span>,<span class="at">col=</span><span class="st">"blue"</span>,<span class="at">bg=</span><span class="st">"blue"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-74-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>Finally, we update the legend to fit the new plot with the second series of data. To do that we simply include a second value on each argument using a vector:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb136"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb136-1"><a href="#cb136-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb136-2"><a href="#cb136-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">21</span>,<span class="at">cex=</span><span class="dv">1</span>,<span class="at">col=</span><span class="st">'black'</span>,<span class="at">bg=</span><span class="st">'red'</span>,</span>
<span id="cb136-3"><a href="#cb136-3" aria-hidden="true" tabindex="-1"></a>     <span class="at">main=</span><span class="st">'Number of fires in Spain'</span>,<span class="at">ylab =</span> <span class="st">'Number of fires'</span>,<span class="at">xlab =</span> <span class="st">''</span>)</span>
<span id="cb136-4"><a href="#cb136-4" aria-hidden="true" tabindex="-1"></a><span class="fu">points</span>(fires<span class="sc">$</span>PORTUGAL,<span class="at">pch=</span><span class="dv">21</span>,<span class="at">cex=</span><span class="dv">1</span>,<span class="at">col=</span><span class="st">"blue"</span>,<span class="at">bg=</span><span class="st">"blue"</span>)</span>
<span id="cb136-5"><a href="#cb136-5" aria-hidden="true" tabindex="-1"></a><span class="fu">legend</span>( <span class="st">"topleft"</span> , <span class="at">cex =</span> <span class="fl">1.3</span>, <span class="at">bty =</span> <span class="st">"n"</span>, <span class="at">legend =</span> <span class="fu">c</span>(<span class="st">"Spain"</span>,<span class="st">"Portugal"</span>), , <span class="at">text.col =</span> <span class="fu">c</span>(<span class="st">"black"</span>), <span class="at">col =</span> <span class="fu">c</span>(<span class="st">"red"</span>,<span class="st">"blue"</span>) , <span class="at">pt.bg =</span> <span class="fu">c</span>(<span class="st">"red"</span>,<span class="st">"blue"</span>) , <span class="at">pch =</span> <span class="fu">c</span>(<span class="dv">21</span>) )</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-75-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>The problem we are now experiencing is that data for Portugal doesn’t fit in the extent of the plot as it is. We should modify this using the&nbsp;<code>xlim</code>&nbsp;and&nbsp;<code>ylim</code>&nbsp;arguments. At this point x-axis works fine, so we’ll leave it as it is. The problem comes from y-axis. We can solve it by passing the&nbsp;<code>ylim</code>&nbsp;argument passing the minimum and maximum values of the&nbsp;<code>fires</code>&nbsp;data. We bring here some functions from&nbsp;<a href="#descriptive-statistics-and-summaries">Descriptive statistics and summaries</a>.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb137"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb137-1"><a href="#cb137-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb137-2"><a href="#cb137-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">21</span>,<span class="at">cex=</span><span class="dv">1</span>,<span class="at">col=</span><span class="st">'black'</span>,<span class="at">bg=</span><span class="st">'red'</span>,</span>
<span id="cb137-3"><a href="#cb137-3" aria-hidden="true" tabindex="-1"></a>     <span class="at">main=</span><span class="st">'Number of fires in Spain'</span>,<span class="at">ylab =</span> <span class="st">'Number of fires'</span>,<span class="at">xlab =</span> <span class="st">''</span>,</span>
<span id="cb137-4"><a href="#cb137-4" aria-hidden="true" tabindex="-1"></a>     <span class="at">ylim =</span> <span class="fu">c</span>(<span class="fu">min</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>]),<span class="fu">max</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>])))</span>
<span id="cb137-5"><a href="#cb137-5" aria-hidden="true" tabindex="-1"></a>     </span>
<span id="cb137-6"><a href="#cb137-6" aria-hidden="true" tabindex="-1"></a><span class="fu">points</span>(fires<span class="sc">$</span>PORTUGAL,<span class="at">pch=</span><span class="dv">21</span>,<span class="at">cex=</span><span class="dv">1</span>,<span class="at">col=</span><span class="st">"blue"</span>,<span class="at">bg=</span><span class="st">"blue"</span>)</span>
<span id="cb137-7"><a href="#cb137-7" aria-hidden="true" tabindex="-1"></a><span class="fu">legend</span>( <span class="st">"topleft"</span> , <span class="at">cex =</span> <span class="fl">1.3</span>, <span class="at">bty =</span> <span class="st">"n"</span>, <span class="at">legend =</span> <span class="fu">c</span>(<span class="st">"Spain"</span>,<span class="st">"Portugal"</span>), , <span class="at">text.col =</span> <span class="fu">c</span>(<span class="st">"black"</span>), <span class="at">col =</span> <span class="fu">c</span>(<span class="st">"red"</span>,<span class="st">"blue"</span>) , <span class="at">pt.bg =</span> <span class="fu">c</span>(<span class="st">"red"</span>,<span class="st">"blue"</span>) , <span class="at">pch =</span> <span class="fu">c</span>(<span class="dv">21</span>) )</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-76-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<div class="alert alert-warning">
<p><strong>📝EXERCISE 3: </strong> Explain in detail how the statement&nbsp;<code>ylim = c(min(fires[,2:6]),max(fires[,2:6]))</code>&nbsp;works in terms of the&nbsp;<code>max()</code>&nbsp;and&nbsp;<code>min()</code>&nbsp;functions and its interaction with the&nbsp;<code>fires</code>object.</p>
<p><b>Deliverable: </b></p>
<ol type="1">
<li>Write a brief report describing the working procedure of the aforementioned instruction.</li>
</ol>
</div>
</section>
<section id="line-plots" class="level3" data-number="2.10.3">
<h3 data-number="2.10.3" class="anchored" data-anchor-id="line-plots"><span class="header-section-number">2.10.3</span> Line plots</h3>
<p>Well, this is quite easy. In line plots we use lines to represent our data series instead of points which are the default symbol. How do we do that? Just adding an additionla argument to specify we want to use lines with <code>type = 'l'</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb138"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb138-1"><a href="#cb138-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb138-2"><a href="#cb138-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">4</span>,<span class="at">type=</span><span class="st">'l'</span>,<span class="at">col=</span><span class="st">'red'</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-77-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>Of course we can change the line&nbsp;<a href="http://www.statmethods.net/advgraphs/parameters.html">style</a>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb139"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb139-1"><a href="#cb139-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb139-2"><a href="#cb139-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">4</span>,<span class="at">type=</span><span class="st">'l'</span>, <span class="at">lty=</span><span class="dv">2</span>, <span class="at">col=</span><span class="st">'red'</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-78-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>Adding a second (or third, fourth,…,$n$) series is done with&nbsp;<code>lines()</code>:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb140"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb140-1"><a href="#cb140-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb140-2"><a href="#cb140-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">4</span>,<span class="at">type=</span><span class="st">'l'</span>, <span class="at">col=</span><span class="st">'red'</span>,</span>
<span id="cb140-3"><a href="#cb140-3" aria-hidden="true" tabindex="-1"></a>     <span class="at">ylim =</span> <span class="fu">c</span>(<span class="fu">min</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>]),<span class="fu">max</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>])))</span>
<span id="cb140-4"><a href="#cb140-4" aria-hidden="true" tabindex="-1"></a><span class="fu">lines</span>(fires<span class="sc">$</span>PORTUGAL,<span class="at">cex=</span><span class="dv">1</span>,<span class="at">col=</span><span class="st">"blue"</span>,<span class="at">lty=</span><span class="dv">2</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-79-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>We now adapt the legend and add some titles and we are good to go:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb141"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb141-1"><a href="#cb141-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb141-2"><a href="#cb141-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">4</span>,<span class="at">type=</span><span class="st">'l'</span>, <span class="at">col=</span><span class="st">'red'</span>,</span>
<span id="cb141-3"><a href="#cb141-3" aria-hidden="true" tabindex="-1"></a>     <span class="at">main=</span><span class="st">'Number of fires in Spain'</span>,<span class="at">ylab =</span> <span class="st">'Number of fires'</span>,<span class="at">xlab =</span> <span class="st">''</span>,</span>
<span id="cb141-4"><a href="#cb141-4" aria-hidden="true" tabindex="-1"></a>     <span class="at">ylim =</span> <span class="fu">c</span>(<span class="fu">min</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>]),<span class="fu">max</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>])))</span>
<span id="cb141-5"><a href="#cb141-5" aria-hidden="true" tabindex="-1"></a><span class="fu">lines</span>(fires<span class="sc">$</span>PORTUGAL,<span class="at">cex=</span><span class="dv">1</span>,<span class="at">col=</span><span class="st">"blue"</span>,<span class="at">lty=</span><span class="dv">2</span>)</span>
<span id="cb141-6"><a href="#cb141-6" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb141-7"><a href="#cb141-7" aria-hidden="true" tabindex="-1"></a><span class="fu">legend</span>( <span class="st">"topleft"</span> , <span class="at">cex =</span> <span class="fl">1.3</span>, , <span class="at">lty =</span> <span class="fu">c</span>(<span class="dv">1</span>,<span class="dv">2</span>), <span class="at">legend =</span> <span class="fu">c</span>(<span class="st">"Spain"</span>,<span class="st">"Portugal"</span>), <span class="at">text.col =</span> <span class="fu">c</span>(<span class="st">"black"</span>), <span class="at">col =</span> <span class="fu">c</span>(<span class="st">"red"</span>,<span class="st">"blue"</span>))</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-80-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
</section>
<section id="histograms" class="level3" data-number="2.10.4">
<h3 data-number="2.10.4" class="anchored" data-anchor-id="histograms"><span class="header-section-number">2.10.4</span> Histograms</h3>
<p>The next type of chart we will see is the frequency histogram. It is a bar chart that represents the number of elements of a sample (frequency) that we find within a certain range of values.</p>
<p>To draw this type of plot R uses the function <code>hist()</code>, which requires as a mandatory argument a vector (or column/row of an array) with the data to be represented. As with all other chart types we have seen, we can use <code>main,</code> <code>xlab</code>… Let’s see at an example using the example data from the <em>regression.txt</em> file<a href="#fn10" class="footnote-ref" id="fnref10" role="doc-noteref"><sup>10</sup></a> (See Table 4.1):</p>
<div class="cell">
<div class="cell-output-display">
<div class="datatables html-widget html-fill-item" id="htmlwidget-8e051aadf465eed12e03" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-8e051aadf465eed12e03">{"x":{"filter":"none","vertical":false,"caption":"<caption>Table 4.1 Structure of the regression.txt file.<\/caption>","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234"],[20.3,23.8,24.4,20.1,20.3,21.9,24.4,20.9,21.2,24,26.8,28.1,26.5,26.9,27.4,26.8,27.3,23.1,26,20.4,23,24.3,22.6,22.9,20.7,18.2,29.3,26.3,21.8,26.1,22.2,27.1,26.1,25.4,26.8,25.6,27.8,20.3,26.5,24.6,26,23.2,18.4,20.9,24.2,23.3,25.2,26.9,20.4,21.1,21.8,22.8,23.7,21.9,23.8,24.1,24,21,22.1,22.4,22,24.2,24.6,19.7,23.3,21.4,24.2,23.2,19.3,21.4,24,23.7,24.7,25.1,23.2,23.1,24,25.4,21.6,21,21,23.1,22,24,21.9,23.4,23.7,21.1,23,18.8,19,23.2,24.9,25.1,25.5,25.6,24.9,25.6,22.8,25.3,24.9,25.9,24.4,25.2,25.1,26.3,22.8,26.8,28.1,22.3,26.3,26.9,26.7,27.9,25,23.2,25.4,25,23.8,21.9,21.5,22,25.5,27.1,23.2,23.9,25.9,25.5,25.2,28.2,23.7,27.9,28.4,21.1,21.7,24.7,22.7,24.3,21.3,23.8,23.5,26.4,25.6,26,25.8,24.9,26.5,26.9,26.1,27.1,25.8,27.5,27.3,27.1,27.7,22.1,21.7,24.8,23.7,23,25.4,27,29.1,28,22.5,21.5,22.1,22.2,18.8,25.2,26.9,26.2,29.5,28.5,27.7,27.6,30.5,29.4,29.3,28.4,23,26.2,26,25.8,25.9,21.2,28.5,26.8,26.2,27.8,27.2,28.1,28.4,24,29,26.6,25.8,27.8,25.4,27.7,26.6,26.9,21.8,27.2,24.7,25.5,27.8,28,27.3,26.5,27.9,27.6,28.6,28,28.3,25.4,24.4,25.5,27.3,25.9,28.4,26.9,29.6,25,29.3,27.2,28.9,27.7,29.3,19.9,23,23.9,24.4,22.4],[14.55,16.1,18.15,14.05,13.85,16.2,17.35,15.45,15.2,17.3,19.8,21.65,20.7,21.6,22.05,22.75,21.95,18.55,21,14.15,16.35,16.9,17.45,17.05,15.2,14.45,21.5,21.45,16,20.7,16.65,22.5,21.6,21.35,21.7,21.1,22.75,15.25,20.75,18.7,20.05,18.1,13.9,16,17.95,18.25,19.3,20.15,15.35,15.1,16.2,15.55,16.15,15.2,16.8,17.3,16.35,14.5,15,16.45,17.35,18.35,18.45,15.35,17.95,17.05,17.7,17.15,14.15,15.9,17.05,17.6,18.8,19.25,17.85,17.25,19.1,19.65,15.55,15.8,15.85,17,17.2,18.2,17.05,17.85,17.9,16.3,17.7,15,14.7,18.65,19,19.9,19.45,19.5,18.9,19.55,16.95,19.55,19.65,19.55,18.5,19.45,19.3,20.65,16.75,20.7,22.05,16.7,18.65,20.45,20.7,21.5,17.8,16.35,18.7,18,17.45,16.65,15.85,15.8,18.85,19.35,18.1,18,19.55,19.85,18.8,21.9,16.8,22.15,22.15,14.7,15.05,17.5,16.2,16,16.55,16.6,17.2,20.7,19.35,19.05,19.5,18.6,19.85,20.1,19.85,20.6,20.3,20.55,20.9,20.55,20.9,16.15,16.4,19.6,17.25,17,19,20.65,22.3,20.6,17.9,15.6,17.1,17.05,14.45,17.45,19.9,19.9,23.5,22.3,20.15,18.8,23.45,21.2,22.1,21.75,15.45,18.15,19,19.2,18.45,15.2,20.6,19.7,20,21.25,20.4,20.9,21.4,17.15,21.65,20.25,19.5,20.45,18.85,20.7,20.05,19.9,15.05,20.4,18.7,19.45,20.35,20.95,20,20.2,21,19.8,21.1,20.9,21.7,18.9,18.8,19.75,20.8,19.75,22.15,20.8,23.35,19.15,22.95,21.3,21.65,22.75,23.2,13.95,16.1,17.3,16.25,16.3],[614350,593950,567250,609150,629450,666750,659450,654050,666850,654150,668050,671750,727150,735350,735350,738650,743350,728850,750750,681950,680050,682450,686050,699550,704450,702350,714950,735750,732850,751050,737450,754850,766550,772450,774150,788050,791050,767550,790450,566050,578050,575150,568050,581950,574850,575250,584350,594750,703150,703250,701750,700350,704650,700750,701250,700950,693750,694750,669450,667650,649850,648350,646350,641750,633350,626950,637450,643150,646650,655550,654250,634950,641850,634350,622950,611050,610650,611050,620550,620550,622050,616650,622150,611350,620250,607450,598750,566850,595450,593350,589650,596850,596350,599250,606450,600050,606450,600050,574850,594550,600950,603250,605750,608550,608550,628750,600250,622050,631850,669950,642250,643350,627150,644150,574950,614350,601550,601450,644950,646350,620750,666150,633450,619550,600550,648050,636650,640150,657550,665850,660050,675250,676550,719950,719650,719950,723450,723250,698550,702750,686050,685250,690550,690950,684050,695850,692650,699550,698050,685550,677250,682050,707750,715150,701950,670350,660450,678650,681350,686250,693950,708850,714550,714950,720250,685750,708750,745250,738450,717850,749650,740550,748050,748350,755450,805350,796950,802150,807950,798050,763350,758750,760550,763950,760350,790750,775350,790450,771250,755150,759250,757850,761850,779550,764050,762950,748450,738150,724850,736350,736350,721150,711050,715350,712450,704650,718550,726850,721850,721850,732050,743750,781050,773150,780050,765050,758850,758950,763750,778850,779150,786150,796250,806850,799250,812450,814450,813650,794450,817550,619450,631650,626550,620150],[305753,271251,279823,319257,306673,317312,335694,347119,359349,369714,398728,402740,421822,425054,425054,414343,412801,405732,408039,332530,343668,374395,364932,363062,358716,381123,381190,394184,349952,388380,389140,407282,393532,388679,380209,376458,366962,340220,364794,79245,101727,70507,51076,57307,76584,88890,89365,118062,126920,127168,129987,130734,135971,132841,136787,137274,128954,124660,92720,93705,98424,99094,100043,66466,75356,76553,84209,82210,73096,82872,93670,94392,118343,100644,90978,83017,94892,110912,52280,52280,56364,59436,77137,66134,69377,51479,58747,43783,45142,54551,50846,71817,91605,102210,123809,124672,123809,124672,134948,137488,132472,125740,155086,150883,150883,154307,162508,167966,163916,132084,127156,158066,176676,171488,220931,245808,225940,217704,321170,294051,281585,293600,247638,209348,190862,227572,212133,207704,206815,199569,235313,206211,206702,140885,143390,148049,160019,166439,142067,150688,141714,145704,154563,154092,167048,153735,170184,181122,201545,188039,194717,200282,217590,225827,228112,258064,244919,245946,292842,292450,278711,271712,269211,264702,289323,305529,318825,336752,345740,299409,303295,292482,279850,280515,260316,246847,257694,273818,285549,292280,184588,192612,198661,202936,208432,211460,220446,231784,217740,211716,218774,219974,226380,234857,231833,232507,217315,206805,187935,223578,223578,189330,163711,180922,189156,188980,199613,206713,216580,216580,228736,231343,247955,242353,273227,322405,325086,313935,298726,322308,297121,311692,308132,304141,314116,316865,332049,334792,343039,231591,258238,263710,266989,270064],[152147,183121,204123,150357,138390,103530,102739,101473,85698,91221,71861,67917,12440,4242,4242,7045,4143,18170,1700,84895,82444,66619,68622,59927,56815,48958,39560,18878,43355,8516,19863,854,670,1969,4428,761,3661,32376,5437,304122,281338,302263,320160,306223,298700,290962,283908,259546,228384,228076,222813,220955,216107,218307,213368,212626,220341,226290,256766,254860,248652,248179,247609,280540,271987,271955,263327,264708,274001,264544,253093,254717,232976,249610,261159,272327,264194,253368,294909,294909,290961,289022,272524,284916,279581,298037,296149,325945,307830,302179,306646,287924,274649,266059,248195,252029,248195,252029,266723,249215,247043,249200,231788,231747,231747,215642,232762,213217,208199,215065,226013,204203,205230,195728,224503,180184,201356,206678,119986,130174,156050,117083,166640,198883,221589,168473,183161,181753,168308,166119,155758,156532,155464,220932,216190,208828,193523,184706,206090,197161,205085,201075,192219,192676,181324,193209,177086,166149,149029,163653,162437,156383,133337,124455,128382,137661,151554,136687,108647,106010,110788,103878,99872,101190,89030,97986,76361,46505,43302,84274,61370,71717,72492,71926,86479,133965,105571,86089,74079,57854,194118,172360,164064,160416,148728,183239,143219,141049,143626,140809,133594,131333,124947,124636,118972,117662,131189,140905,159580,123220,123220,157736,184103,166127,157612,158277,147162,140122,130722,130722,118324,115634,106867,109762,74558,45153,46663,51333,52849,32095,49647,35232,38906,47326,32893,34076,15730,12314,15891,194923,169248,157542,159171,162237],[4489750,4522150,4512650,4475450,4491350,4489850,4468550,4455350,4446050,4432150,4405650,4402450,4399450,4399050,4399050,4411850,4415450,4417250,4423850,4478450,4466250,4434950,4445850,4452050,4458350,4433950,4438250,4432450,4479550,4445650,4438650,4426550,4447650,4456350,4467050,4479950,4493350,4509850,4495550,4713350,4690950,4722050,4741450,4736150,4715950,4703650,4704050,4676750,4735950,4735650,4728550,4725450,4722450,4722550,4716950,4715850,4720250,4728150,4747650,4743950,4722050,4720150,4717650,4756350,4738650,4732950,4730750,4737350,4751850,4746850,4731350,4716850,4693050,4709150,4714050,4717750,4705150,4688650,4757850,4757850,4753950,4746650,4729250,4736050,4737150,4750450,4739350,4748850,4752550,4742450,4745050,4725350,4704350,4694150,4673750,4671150,4673750,4671150,4657550,4656950,4663350,4670850,4641250,4646250,4646250,4648550,4632550,4632350,4639450,4695050,4683250,4649750,4624850,4635650,4571550,4550450,4568550,4576850,4479850,4508150,4515250,4514350,4552750,4588750,4603850,4577850,4590650,4596250,4602950,4614250,4573550,4611350,4611450,4736750,4731250,4723050,4707450,4697050,4706150,4698150,4695250,4689550,4682450,4683350,4662250,4687750,4664450,4655950,4630150,4638050,4625350,4621650,4617350,4612350,4601050,4553050,4563550,4569250,4520050,4522250,4540150,4554950,4560850,4566250,4541050,4508150,4502850,4500650,4486950,4528450,4542250,4549250,4569350,4568750,4598950,4673150,4642950,4624150,4613050,4593350,4725550,4700950,4692750,4690150,4676050,4720850,4675950,4677850,4674950,4664750,4658750,4655450,4650350,4657750,4644750,4642650,4649650,4654350,4667750,4630650,4630650,4662550,4688050,4668650,4655650,4649950,4647150,4644650,4628350,4628350,4620850,4626650,4639350,4639050,4602650,4529550,4522250,4535650,4557250,4539050,4570750,4557750,4570450,4585350,4565150,4573150,4554550,4550250,4524750,4734950,4538750,4535750,4531250,4526850],[1423,1100,1229,1610,1402,1022,882,828,1308,1186,589,522,119,22,22,80,21,816,24,1353,1146,1026,993,959,1335,1294,417,193,1134,247,261,2,35,13,158,20,87,1149,111,436,282,517,866,804,575,410,427,284,1214,1183,946,889,893,874,807,802,1017,989,774,700,718,485,437,724,507,631,456,583,1027,708,641,527,478,429,608,519,371,292,621,621,552,508,549,444,580,526,522,500,485,888,876,327,301,279,261,281,261,281,711,412,346,283,459,391,391,227,794,432,275,754,427,281,434,211,744,1107,730,610,1013,1300,1188,1243,757,428,863,595,384,345,597,231,618,207,208,1335,1053,846,863,769,892,681,513,482,550,558,384,775,379,360,387,264,243,217,379,382,152,840,857,551,949,947,578,311,278,213,603,1266,1092,1021,1220,653,456,309,132,145,267,516,339,198,186,281,1082,516,530,502,566,1585,490,640,598,432,328,336,324,745,247,237,465,381,541,244,244,532,1022,437,360,363,305,379,370,370,320,239,309,276,134,471,714,524,296,504,184,443,30,494,33,361,224,296,55,1161,1016,1024,1003,1129]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>TavgMAX<\/th>\n      <th>Tavg<\/th>\n      <th>long<\/th>\n      <th>d_atl<\/th>\n      <th>d_medit<\/th>\n      <th>lat<\/th>\n      <th>elevation<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":12,"columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5,6,7]},{"orderable":false,"targets":0},{"name":" ","targets":0},{"name":"TavgMAX","targets":1},{"name":"Tavg","targets":2},{"name":"long","targets":3},{"name":"d_atl","targets":4},{"name":"d_medit","targets":5},{"name":"lat","targets":6},{"name":"elevation","targets":7}],"order":[],"autoWidth":false,"orderClasses":false,"lengthMenu":[10,12,25,50,100]}},"evals":[],"jsHooks":[]}</script>
</div>
</div>
<ul>
<li><p><strong>Tavg_max:</strong> maximum average temperature in June.</p></li>
<li><p><strong>Tavg:</strong> average temperature in June.</p></li>
<li><p><strong>long:</strong> longitude in UTM values EPSG:23030.</p></li>
<li><p><strong>lot:</strong> latitude in UTM values EPSG:23030.</p></li>
<li><p><strong>d_atl:</strong> distance in meters to the Atlantic sea.</p></li>
<li><p><strong>d_medit:</strong> distance in meters to the Mediterranean sea.</p></li>
<li><p><strong>elevation:</strong> elevation above sea level in meters.</p></li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb142"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb142-1"><a href="#cb142-1" aria-hidden="true" tabindex="-1"></a><span class="fu">hist</span>(regression<span class="sc">$</span>elevation)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-82-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>Then we use the arguments we have seen to customize the plot:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb143"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb143-1"><a href="#cb143-1" aria-hidden="true" tabindex="-1"></a><span class="fu">hist</span>(regression<span class="sc">$</span>elevation,<span class="at">breaks=</span><span class="dv">15</span>,<span class="at">main=</span><span class="st">"Elevation frecuency distribution"</span>,<span class="at">xlab=</span><span class="st">"Elevation"</span>,<span class="at">ylab=</span><span class="st">"Frecuency"</span>,<span class="at">col=</span><span class="st">"blue"</span>,<span class="at">border=</span><span class="st">"white"</span>,<span class="at">ylim=</span><span class="fu">c</span>(<span class="dv">0</span>,<span class="dv">40</span>),<span class="at">xlim=</span><span class="fu">c</span>(<span class="dv">0</span>,<span class="dv">2000</span>))</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-83-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>The only new parameters are:</p>
<ul>
<li><p><code>breaks</code>, used to specify the number of bars in the <code>histrogram</code>.</p></li>
<li><p><code>border</code>, used the change the color of bar’s borders.</p></li>
</ul>
</section>
<section id="scatterplots" class="level3" data-number="2.10.5">
<h3 data-number="2.10.5" class="anchored" data-anchor-id="scatterplots"><span class="header-section-number">2.10.5</span> Scatterplots</h3>
<p>So far we have seen how to construct univariate graphs, ie, represent a single variable or data series. Next we will see a type of bivariate graph, the scatterplot. This type of chart is interesting to visualize relations between two variables, almost mandatory to explore correlation or collinearity in regression analysis. Let’s look at an example with our fire data.</p>
<p>In this case we introduce in the function <code>plot()</code> a second data argument (<span class="math inline">\(y\)</span>) with a second vector with the data right after the first data argument (<span class="math inline">\(x\)</span>):</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb144"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb144-1"><a href="#cb144-1" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(regression<span class="sc">$</span>Tavg,regression<span class="sc">$</span>elevation)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-84-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>Note that the first data series goes to <span class="math inline">\(x-axis\)</span> and the second to the&nbsp;<span class="math inline">\(y\)</span>. Again, we can customize the appearnce and symbols similar to the regural do plot:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb145"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb145-1"><a href="#cb145-1" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(regression<span class="sc">$</span>elevation, regression<span class="sc">$</span>Tavg,</span>
<span id="cb145-2"><a href="#cb145-2" aria-hidden="true" tabindex="-1"></a>     <span class="at">main=</span><span class="st">'Average temperature vs elevation'</span>,<span class="at">ylab =</span> <span class="st">'Temperature (Celsius)'</span>, <span class="at">xlab =</span> <span class="st">'Elevation (m)'</span>,</span>
<span id="cb145-3"><a href="#cb145-3" aria-hidden="true" tabindex="-1"></a>     <span class="at">pch=</span><span class="dv">21</span>, <span class="at">col=</span><span class="st">'black'</span>, <span class="at">bg=</span><span class="st">'steelblue'</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-85-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>A particularly useful function in combination with&nbsp;<code>scatterplots</code>&nbsp;is&nbsp;<code>abline()</code>&nbsp;which allows to incorporate a&nbsp;<em>trend line</em>&nbsp;to the plot. We will further explore this later.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb146"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb146-1"><a href="#cb146-1" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(regression<span class="sc">$</span>elevation, regression<span class="sc">$</span>Tavg,</span>
<span id="cb146-2"><a href="#cb146-2" aria-hidden="true" tabindex="-1"></a>     <span class="at">main=</span><span class="st">'Average temperature vs elevation'</span>,<span class="at">ylab =</span> <span class="st">'Temperature (Celsius)'</span>, <span class="at">xlab =</span> <span class="st">'Elevation (m)'</span>,</span>
<span id="cb146-3"><a href="#cb146-3" aria-hidden="true" tabindex="-1"></a>     <span class="at">pch=</span><span class="dv">21</span>, <span class="at">col=</span><span class="st">'black'</span>, <span class="at">bg=</span><span class="st">'steelblue'</span>)</span>
<span id="cb146-4"><a href="#cb146-4" aria-hidden="true" tabindex="-1"></a><span class="fu">abline</span>(<span class="fu">lm</span>(regression<span class="sc">$</span>Tavg<span class="sc">~</span>regression<span class="sc">$</span>elevation), <span class="at">lty=</span><span class="dv">2</span>, <span class="at">col=</span><span class="st">'gray20'</span>,<span class="at">lwd=</span><span class="dv">3</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-86-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
<p>Pay attention to the order in which we have introduced the <span class="math inline">\(x\)</span> and <span class="math inline">\(y\)</span> data in&nbsp;<code>plot()</code>&nbsp;and&nbsp;<code>abline()</code>. It is the opposite!!.</p>
</section>
<section id="multiple-plots" class="level3" data-number="2.10.6">
<h3 data-number="2.10.6" class="anchored" data-anchor-id="multiple-plots"><span class="header-section-number">2.10.6</span> Multiple plots</h3>
<p>To finish with plot creation we will see two last possibilities. The first one is how to combine several charts in a single figure and the second how to export an image file from our graphics.</p>
<section id="create-a-combined-plot" class="level4" data-number="2.10.6.1">
<h4 data-number="2.10.6.1" class="anchored" data-anchor-id="create-a-combined-plot"><span class="header-section-number">2.10.6.1</span> Create a combined plot</h4>
<p>Combining several graphs in R is possible thanks to the function <code>par(mfrow = c(rows, columns))</code>. Using this function we prepare the display window to include several graphs simultaneously:</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb147"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb147-1"><a href="#cb147-1" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mfrow =</span> <span class="fu">c</span>(<span class="dv">2</span>, <span class="dv">1</span>),<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb147-2"><a href="#cb147-2" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">4</span>,<span class="at">type=</span><span class="st">'l'</span>, <span class="at">col=</span><span class="st">'red'</span>,</span>
<span id="cb147-3"><a href="#cb147-3" aria-hidden="true" tabindex="-1"></a>     <span class="at">ylim =</span> <span class="fu">c</span>(<span class="fu">min</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>]),<span class="fu">max</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>])))</span>
<span id="cb147-4"><a href="#cb147-4" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>PORTUGAL,<span class="at">type=</span><span class="st">'l'</span>,<span class="at">col=</span><span class="st">"blue"</span>,<span class="at">lty=</span><span class="dv">2</span>,</span>
<span id="cb147-5"><a href="#cb147-5" aria-hidden="true" tabindex="-1"></a>     <span class="at">ylim =</span> <span class="fu">c</span>(<span class="fu">min</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>]),<span class="fu">max</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>])))</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="index_files/figure-html/unnamed-chunk-87-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>
</section>
</section>
<section id="export-an-image-file" class="level3" data-number="2.10.7">
<h3 data-number="2.10.7" class="anchored" data-anchor-id="export-an-image-file"><span class="header-section-number">2.10.7</span> Export an image file</h3>
<p>Since R runs on so many different operating systems, and supports so many different graphics formats, it’s not surprising that there are a variety of ways of saving your plots, depending on what operating system you are using, what you plan to do with the graph, and whether you’re connecting locally or remotely.</p>
<p>The first step in deciding how to save plots is to decide on the output format that you want to use. The following table lists some of the available formats, along with guidance as to when they may be useful.</p>
<p>Here’s a general method<a href="#fn11" class="footnote-ref" id="fnref11" role="doc-noteref"><sup>11</sup></a> that will work on any computer with R, regardless of operating system or the way that you are connecting.</p>
<ol type="1">
<li><p>Choose the format that you want to use. In this example, I’ll save a plot as a JPG file, so I’ll use the jpeg driver.</p></li>
<li><p>The only argument that the device drivers need is the name of the file that you will use to save your graph. Remember that your plot will be stored relative to the current directory. You can find the current directory by typing <code>getwd()</code> at the R prompt. You may want to make adjustments to the size of the plot before saving it. Consult the help file for your selected driver to learn how.</p></li>
<li><p>Now enter your plotting commands as you normally would. You will not actually see the plot - the commands are being saved to a file instead.</p></li>
<li><p>When you’re done with your plotting commands, enter the <code>dev.off()</code> command. This is very important - without it you’ll get a partial plot or nothing at all. So if we wanted to save a jpg file called “rplot.jpg” containing a plot of x and y, we would type the following commands:</p></li>
</ol>
<div class="cell">
<div class="sourceCode cell-code" id="cb148"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb148-1"><a href="#cb148-1" aria-hidden="true" tabindex="-1"></a><span class="fu">jpeg</span>(<span class="st">'rplot.jpg'</span>, <span class="at">width =</span> <span class="dv">800</span>, <span class="at">height =</span> <span class="dv">600</span>, <span class="at">res=</span><span class="dv">100</span>)</span>
<span id="cb148-2"><a href="#cb148-2" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb148-3"><a href="#cb148-3" aria-hidden="true" tabindex="-1"></a><span class="co"># Here goes the plot</span></span>
<span id="cb148-4"><a href="#cb148-4" aria-hidden="true" tabindex="-1"></a><span class="fu">par</span>(<span class="at">mfrow =</span> <span class="fu">c</span>(<span class="dv">2</span>,<span class="dv">1</span>),<span class="at">mar=</span><span class="fu">c</span>(<span class="fl">3.5</span>, <span class="fl">3.5</span>, <span class="dv">2</span>, <span class="dv">1</span>), <span class="at">mgp=</span><span class="fu">c</span>(<span class="fl">2.4</span>, <span class="fl">0.8</span>, <span class="dv">0</span>))</span>
<span id="cb148-5"><a href="#cb148-5" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>SPAIN,<span class="at">pch=</span><span class="dv">4</span>,<span class="at">type=</span><span class="st">'l'</span>, <span class="at">col=</span><span class="st">'red'</span>,</span>
<span id="cb148-6"><a href="#cb148-6" aria-hidden="true" tabindex="-1"></a>     <span class="at">ylim =</span> <span class="fu">c</span>(<span class="fu">min</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>]),<span class="fu">max</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>])))</span>
<span id="cb148-7"><a href="#cb148-7" aria-hidden="true" tabindex="-1"></a><span class="fu">plot</span>(fires<span class="sc">$</span>PORTUGAL,<span class="at">type=</span><span class="st">'l'</span>,<span class="at">col=</span><span class="st">"blue"</span>,<span class="at">lty=</span><span class="dv">2</span>,</span>
<span id="cb148-8"><a href="#cb148-8" aria-hidden="true" tabindex="-1"></a>     <span class="at">ylim =</span> <span class="fu">c</span>(<span class="fu">min</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>]),<span class="fu">max</span>(fires[,<span class="dv">2</span><span class="sc">:</span><span class="dv">6</span>])))</span>
<span id="cb148-9"><a href="#cb148-9" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb148-10"><a href="#cb148-10" aria-hidden="true" tabindex="-1"></a><span class="fu">dev.off</span>()</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>png 
  2 </code></pre>
</div>
</div>
</section>
</section>
</section>
<section id="final-words-of-module-1" class="level1 unnumbered">
<h1 class="unnumbered">Final Words of module 1</h1>
<p>Before finishing the module we would like to give you some insights into the main concepts you should have become familiar with.</p>
<ol type="1">
<li><p>You must have mastered object creation and manipulation, mainly table-like objects (<code>array</code> and <code>data.frame</code>) and vectors.</p></li>
<li><p>It is not that important to remember the specific syntax of the functions we have covered here but to realize the we can combine objects with function arguments.</p></li>
<li><p>We can create scripts to do specific tasks, we do not need to insert instructions one by one manually.</p></li>
</ol>
<section id="references" class="level2 unnumbered">
<h2 class="unnumbered anchored" data-anchor-id="references">References</h2>
<p>R Core Team. 2021. <em>R: A Language and Environment for Statistical Computing</em>. Vienna, Austria: R Foundation for Statistical Computing. <a href="https://www.r-project.org/">https://www.R-project.org/</a>.</p>


</section>
</section>


<div id="quarto-appendix" class="default"><section id="footnotes" class="footnotes footnotes-end-of-document" role="doc-endnotes"><h2 class="anchored quarto-appendix-heading">Footnotes</h2>

<ol>
<li id="fn1"><p>This is probably the most useful one. The IDE will suggest the function name instead of fully typing it<a href="https://intro-r-module-1.netlify.app/intro#fnref1">↩︎</a><a href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn2"><p>Just for the record, this is my favourite one<a href="https://intro-r-module-1.netlify.app/intro#fnref2">↩︎</a><a href="#fnref2" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn3"><p>Do not mistake it with the R vector object, they are quite different!<a href="#fnref3" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn4"><p>use&nbsp;<code>\t</code>&nbsp;for tab<a href="#fnref4" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn5"><p>the same applies for&nbsp;<code>dec</code><a href="#fnref5" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn6"><p>Remember to adapt the path to your own folder structure<a href="#fnref6" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn7"><p>Do not forget quotes sorrounding the name of the package<a href="#fnref7" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn8"><p>Note that quotes are not needed<a href="#fnref8" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn9"><p>please, ignore the&nbsp;<code>par()</code>&nbsp;statement at this time<a href="#fnref9" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn10"><p>Remember to import the file properly, setting the adequate parameters for field and decimal separator<a href="#fnref10" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn11"><p>Taken from&nbsp;<a href="https://www.stat.berkeley.edu/classes/s133/saving.html" class="uri">https://www.stat.berkeley.edu/classes/s133/saving.html</a><a href="#fnref11" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
</ol>
</section></div></main> <!-- /main -->
<script id="quarto-html-after-body" type="application/javascript">
window.document.addEventListener("DOMContentLoaded", function (event) {
  const toggleBodyColorMode = (bsSheetEl) => {
    const mode = bsSheetEl.getAttribute("data-mode");
    const bodyEl = window.document.querySelector("body");
    if (mode === "dark") {
      bodyEl.classList.add("quarto-dark");
      bodyEl.classList.remove("quarto-light");
    } else {
      bodyEl.classList.add("quarto-light");
      bodyEl.classList.remove("quarto-dark");
    }
  }
  const toggleBodyColorPrimary = () => {
    const bsSheetEl = window.document.querySelector("link#quarto-bootstrap");
    if (bsSheetEl) {
      toggleBodyColorMode(bsSheetEl);
    }
  }
  toggleBodyColorPrimary();  
  const icon = "";
  const anchorJS = new window.AnchorJS();
  anchorJS.options = {
    placement: 'right',
    icon: icon
  };
  anchorJS.add('.anchored');
  const isCodeAnnotation = (el) => {
    for (const clz of el.classList) {
      if (clz.startsWith('code-annotation-')) {                     
        return true;
      }
    }
    return false;
  }
  const clipboard = new window.ClipboardJS('.code-copy-button', {
    text: function(trigger) {
      const codeEl = trigger.previousElementSibling.cloneNode(true);
      for (const childEl of codeEl.children) {
        if (isCodeAnnotation(childEl)) {
          childEl.remove();
        }
      }
      return codeEl.innerText;
    }
  });
  clipboard.on('success', function(e) {
    // button target
    const button = e.trigger;
    // don't keep focus
    button.blur();
    // flash "checked"
    button.classList.add('code-copy-button-checked');
    var currentTitle = button.getAttribute("title");
    button.setAttribute("title", "Copied!");
    let tooltip;
    if (window.bootstrap) {
      button.setAttribute("data-bs-toggle", "tooltip");
      button.setAttribute("data-bs-placement", "left");
      button.setAttribute("data-bs-title", "Copied!");
      tooltip = new bootstrap.Tooltip(button, 
        { trigger: "manual", 
          customClass: "code-copy-button-tooltip",
          offset: [0, -8]});
      tooltip.show();    
    }
    setTimeout(function() {
      if (tooltip) {
        tooltip.hide();
        button.removeAttribute("data-bs-title");
        button.removeAttribute("data-bs-toggle");
        button.removeAttribute("data-bs-placement");
      }
      button.setAttribute("title", currentTitle);
      button.classList.remove('code-copy-button-checked');
    }, 1000);
    // clear code selection
    e.clearSelection();
  });
    var localhostRegex = new RegExp(/^(?:http|https):\/\/localhost\:?[0-9]*\//);
    var mailtoRegex = new RegExp(/^mailto:/);
      var filterRegex = new RegExp('/' + window.location.host + '/');
    var isInternal = (href) => {
        return filterRegex.test(href) || localhostRegex.test(href) || mailtoRegex.test(href);
    }
    // Inspect non-navigation links and adorn them if external
 	var links = window.document.querySelectorAll('a[href]:not(.nav-link):not(.navbar-brand):not(.toc-action):not(.sidebar-link):not(.sidebar-item-toggle):not(.pagination-link):not(.no-external):not([aria-hidden]):not(.dropdown-item):not(.quarto-navigation-tool)');
    for (var i=0; i<links.length; i++) {
      const link = links[i];
      if (!isInternal(link.href)) {
        // undo the damage that might have been done by quarto-nav.js in the case of
        // links that we want to consider external
        if (link.dataset.originalHref !== undefined) {
          link.href = link.dataset.originalHref;
        }
      }
    }
  function tippyHover(el, contentFn, onTriggerFn, onUntriggerFn) {
    const config = {
      allowHTML: true,
      maxWidth: 500,
      delay: 100,
      arrow: false,
      appendTo: function(el) {
          return el.parentElement;
      },
      interactive: true,
      interactiveBorder: 10,
      theme: 'quarto',
      placement: 'bottom-start',
    };
    if (contentFn) {
      config.content = contentFn;
    }
    if (onTriggerFn) {
      config.onTrigger = onTriggerFn;
    }
    if (onUntriggerFn) {
      config.onUntrigger = onUntriggerFn;
    }
    window.tippy(el, config); 
  }
  const noterefs = window.document.querySelectorAll('a[role="doc-noteref"]');
  for (var i=0; i<noterefs.length; i++) {
    const ref = noterefs[i];
    tippyHover(ref, function() {
      // use id or data attribute instead here
      let href = ref.getAttribute('data-footnote-href') || ref.getAttribute('href');
      try { href = new URL(href).hash; } catch {}
      const id = href.replace(/^#\/?/, "");
      const note = window.document.getElementById(id);
      if (note) {
        return note.innerHTML;
      } else {
        return "";
      }
    });
  }
  const xrefs = window.document.querySelectorAll('a.quarto-xref');
  const processXRef = (id, note) => {
    // Strip column container classes
    const stripColumnClz = (el) => {
      el.classList.remove("page-full", "page-columns");
      if (el.children) {
        for (const child of el.children) {
          stripColumnClz(child);
        }
      }
    }
    stripColumnClz(note)
    if (id === null || id.startsWith('sec-')) {
      // Special case sections, only their first couple elements
      const container = document.createElement("div");
      if (note.children && note.children.length > 2) {
        container.appendChild(note.children[0].cloneNode(true));
        for (let i = 1; i < note.children.length; i++) {
          const child = note.children[i];
          if (child.tagName === "P" && child.innerText === "") {
            continue;
          } else {
            container.appendChild(child.cloneNode(true));
            break;
          }
        }
        if (window.Quarto?.typesetMath) {
          window.Quarto.typesetMath(container);
        }
        return container.innerHTML
      } else {
        if (window.Quarto?.typesetMath) {
          window.Quarto.typesetMath(note);
        }
        return note.innerHTML;
      }
    } else {
      // Remove any anchor links if they are present
      const anchorLink = note.querySelector('a.anchorjs-link');
      if (anchorLink) {
        anchorLink.remove();
      }
      if (window.Quarto?.typesetMath) {
        window.Quarto.typesetMath(note);
      }
      // TODO in 1.5, we should make sure this works without a callout special case
      if (note.classList.contains("callout")) {
        return note.outerHTML;
      } else {
        return note.innerHTML;
      }
    }
  }
  for (var i=0; i<xrefs.length; i++) {
    const xref = xrefs[i];
    tippyHover(xref, undefined, function(instance) {
      instance.disable();
      let url = xref.getAttribute('href');
      let hash = undefined; 
      if (url.startsWith('#')) {
        hash = url;
      } else {
        try { hash = new URL(url).hash; } catch {}
      }
      if (hash) {
        const id = hash.replace(/^#\/?/, "");
        const note = window.document.getElementById(id);
        if (note !== null) {
          try {
            const html = processXRef(id, note.cloneNode(true));
            instance.setContent(html);
          } finally {
            instance.enable();
            instance.show();
          }
        } else {
          // See if we can fetch this
          fetch(url.split('#')[0])
          .then(res => res.text())
          .then(html => {
            const parser = new DOMParser();
            const htmlDoc = parser.parseFromString(html, "text/html");
            const note = htmlDoc.getElementById(id);
            if (note !== null) {
              const html = processXRef(id, note);
              instance.setContent(html);
            } 
          }).finally(() => {
            instance.enable();
            instance.show();
          });
        }
      } else {
        // See if we can fetch a full url (with no hash to target)
        // This is a special case and we should probably do some content thinning / targeting
        fetch(url)
        .then(res => res.text())
        .then(html => {
          const parser = new DOMParser();
          const htmlDoc = parser.parseFromString(html, "text/html");
          const note = htmlDoc.querySelector('main.content');
          if (note !== null) {
            // This should only happen for chapter cross references
            // (since there is no id in the URL)
            // remove the first header
            if (note.children.length > 0 && note.children[0].tagName === "HEADER") {
              note.children[0].remove();
            }
            const html = processXRef(null, note);
            instance.setContent(html);
          } 
        }).finally(() => {
          instance.enable();
          instance.show();
        });
      }
    }, function(instance) {
    });
  }
      let selectedAnnoteEl;
      const selectorForAnnotation = ( cell, annotation) => {
        let cellAttr = 'data-code-cell="' + cell + '"';
        let lineAttr = 'data-code-annotation="' +  annotation + '"';
        const selector = 'span[' + cellAttr + '][' + lineAttr + ']';
        return selector;
      }
      const selectCodeLines = (annoteEl) => {
        const doc = window.document;
        const targetCell = annoteEl.getAttribute("data-target-cell");
        const targetAnnotation = annoteEl.getAttribute("data-target-annotation");
        const annoteSpan = window.document.querySelector(selectorForAnnotation(targetCell, targetAnnotation));
        const lines = annoteSpan.getAttribute("data-code-lines").split(",");
        const lineIds = lines.map((line) => {
          return targetCell + "-" + line;
        })
        let top = null;
        let height = null;
        let parent = null;
        if (lineIds.length > 0) {
            //compute the position of the single el (top and bottom and make a div)
            const el = window.document.getElementById(lineIds[0]);
            top = el.offsetTop;
            height = el.offsetHeight;
            parent = el.parentElement.parentElement;
          if (lineIds.length > 1) {
            const lastEl = window.document.getElementById(lineIds[lineIds.length - 1]);
            const bottom = lastEl.offsetTop + lastEl.offsetHeight;
            height = bottom - top;
          }
          if (top !== null && height !== null && parent !== null) {
            // cook up a div (if necessary) and position it 
            let div = window.document.getElementById("code-annotation-line-highlight");
            if (div === null) {
              div = window.document.createElement("div");
              div.setAttribute("id", "code-annotation-line-highlight");
              div.style.position = 'absolute';
              parent.appendChild(div);
            }
            div.style.top = top - 2 + "px";
            div.style.height = height + 4 + "px";
            div.style.left = 0;
            let gutterDiv = window.document.getElementById("code-annotation-line-highlight-gutter");
            if (gutterDiv === null) {
              gutterDiv = window.document.createElement("div");
              gutterDiv.setAttribute("id", "code-annotation-line-highlight-gutter");
              gutterDiv.style.position = 'absolute';
              const codeCell = window.document.getElementById(targetCell);
              const gutter = codeCell.querySelector('.code-annotation-gutter');
              gutter.appendChild(gutterDiv);
            }
            gutterDiv.style.top = top - 2 + "px";
            gutterDiv.style.height = height + 4 + "px";
          }
          selectedAnnoteEl = annoteEl;
        }
      };
      const unselectCodeLines = () => {
        const elementsIds = ["code-annotation-line-highlight", "code-annotation-line-highlight-gutter"];
        elementsIds.forEach((elId) => {
          const div = window.document.getElementById(elId);
          if (div) {
            div.remove();
          }
        });
        selectedAnnoteEl = undefined;
      };
        // Handle positioning of the toggle
    window.addEventListener(
      "resize",
      throttle(() => {
        elRect = undefined;
        if (selectedAnnoteEl) {
          selectCodeLines(selectedAnnoteEl);
        }
      }, 10)
    );
    function throttle(fn, ms) {
    let throttle = false;
    let timer;
      return (...args) => {
        if(!throttle) { // first call gets through
            fn.apply(this, args);
            throttle = true;
        } else { // all the others get throttled
            if(timer) clearTimeout(timer); // cancel #2
            timer = setTimeout(() => {
              fn.apply(this, args);
              timer = throttle = false;
            }, ms);
        }
      };
    }
      // Attach click handler to the DT
      const annoteDls = window.document.querySelectorAll('dt[data-target-cell]');
      for (const annoteDlNode of annoteDls) {
        annoteDlNode.addEventListener('click', (event) => {
          const clickedEl = event.target;
          if (clickedEl !== selectedAnnoteEl) {
            unselectCodeLines();
            const activeEl = window.document.querySelector('dt[data-target-cell].code-annotation-active');
            if (activeEl) {
              activeEl.classList.remove('code-annotation-active');
            }
            selectCodeLines(clickedEl);
            clickedEl.classList.add('code-annotation-active');
          } else {
            // Unselect the line
            unselectCodeLines();
            clickedEl.classList.remove('code-annotation-active');
          }
        });
      }
  const findCites = (el) => {
    const parentEl = el.parentElement;
    if (parentEl) {
      const cites = parentEl.dataset.cites;
      if (cites) {
        return {
          el,
          cites: cites.split(' ')
        };
      } else {
        return findCites(el.parentElement)
      }
    } else {
      return undefined;
    }
  };
  var bibliorefs = window.document.querySelectorAll('a[role="doc-biblioref"]');
  for (var i=0; i<bibliorefs.length; i++) {
    const ref = bibliorefs[i];
    const citeInfo = findCites(ref);
    if (citeInfo) {
      tippyHover(citeInfo.el, function() {
        var popup = window.document.createElement('div');
        citeInfo.cites.forEach(function(cite) {
          var citeDiv = window.document.createElement('div');
          citeDiv.classList.add('hanging-indent');
          citeDiv.classList.add('csl-entry');
          var biblioDiv = window.document.getElementById('ref-' + cite);
          if (biblioDiv) {
            citeDiv.innerHTML = biblioDiv.innerHTML;
          }
          popup.appendChild(citeDiv);
        });
        return popup.innerHTML;
      });
    }
  }
});
</script>
</div> <!-- /content -->




</body></html>
