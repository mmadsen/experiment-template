Experiment Template
==============================

This set of directories is a template for performing a self-contained analysis and writing a subsequent paper or 

## Simulation Code ##



## Subdirectories ##

* paper:  contains Rmarkdown manuscript file and supporting LaTeX infrastructure
* explorations:  contains IPython notebooks, sample graphs, Mathematica notebooks, and other tests that inform the thinking behind the analysis performed here.  THESE ARE INCLUDED FOR INFORMATIONAL PURPOSES.  ALL ACTUAL ANALYSIS MUST BE IN THE ANALYSIS DIRECTORY.
* analysis:  contains R project file and R code for analyses of simulation data
* presentation:  currently empty since I've used different presentation software on each project.  I'm looking to standardize on something HTML5 based soon as it matures, though
* simulations:  configurations and control scripts used for any simulations or long code runs needed to generate data or analysis for the experiment. 
* outline:  LaTeX template for a simple and easy outline for papers or presentation.  

## Paper Manuscript ##

The paper manuscript is written in Rmarkdown, to simplify collaboration and embedding of R analyses, graphs, images, and tables.  The "Makefile" here governs the building of the actual paper, and is  capable of generating Microsoft Word or other formats, but Latex is the one I've tested here. 

The current LaTeX article template used here is the Springer article format, which uses few special classes and thus is easily adapted to many journals by switching classes.  

The Rmarkdown formatting contains NONE of the heavy LaTeX setup, which is contained instead in a file `author.tex`, which I recommend not editing except for title, abstract, or author contact details.  This template file follows `svmult` from Springer for edited volumes.

Citations in the Rmarkdown file refer to the Bibtex citation keys in the `paper.bib` file, and are made in Pandoc markdown format:  `[@Lipo1997]` is the in-text citation to Lipo, Madsen, Hunt, and Dunnell 1997, for example.  The bibliography is automatically built by Latex/XELatex itself.  Currently, the `model2-names.bst` bibliography file format is used to produce an author-date format which is close to many journals in the social sciences.   

Knitr is used to automatically turn the combination of Rmarkdown and R language chunks into LaTeX, which is then handed off to xelatex by the Makefile, generating a PDF.  You can re-run `make` or `make pdf` many times, and it'll pick up things that have changed (e.g., the manuscript, the bibliography, a figure or table, and recompile the whole thing.)  `make clean` is used to remove all of the temporary and intermediate files, which is good to do before running `git add` or `git commit`.  I have a fairly comprehensive set of rules in `.gitignore` for keeping Latex intermediate cruft out of Github, but occasionally some new temp file sneaks through.

You can also produce ePub by using `make epub`, and the Makefile is also set up to produce plain Markdown for a wiki or other content source, and with the addition of template files (which are currently missing, word or OpenOffice documents).


## Data Location ##

Data are located in this repository WHENEVER POSSIBLE.  What this means is that raw data files are often too big to be checked into Github, stored on Figshare, etc., and thus are held outside the version-controlled directory for post-processing.  Once the files become small enough to handle through summarization or subsetting, however, they are located in the `analysis/data` directory.  

IF DATA FILES ARE TOO BIG TO STORE HERE, there will be an entry in this README file, and in the `analysis` directory, pointing at a local where the primary data files can be retrieved.  This will often be an Amazon S3 or Glacier bucket, depending upon size and cost.  

Inside the `analysis` directory, there is a script called `data_preparation.r` which reads data files from the `analysis/data` directory and constructs appropriate data frames in R.  The analysis directory also has a Makefile which is used to script a complete reproduction run for the analysis nd results.  



