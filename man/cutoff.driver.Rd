% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cutoff.R
\name{cutoff.driver}
\alias{cutoff.driver}
\title{Calculation of suggested cut off for bayesian risk model}
\usage{
cutoff.driver(sample.mutations, bcgr.prob, n = 100, fdr = 0.1,
  simulation.quantile = 0.5, genes = NULL, prior.driver = NULL,
  gene.mut.driver = NULL, driver.genes = NULL, plot.save = FALSE,
  permutationResults.save = FALSE, Variant_Classification = NULL,
  Hugo_Symbol = NULL, Tumor_Sample_Barcode = NULL, CCF = NULL,
  Damage_score = NULL, mode = "MAX", epsilon = 0.05)
}
\arguments{
\item{sample.mutations}{data frame with SNVs and InDels in MAF like format.
Columns (with exactly same names) which \code{sample.mutations} should have are: 
\itemize{ 
     \item Variant_Classification column specifed by MAF format, used to distinguish between silent and nonsilent SNVs
     \item Hugo_Symbol column specifed by MAF format, which reports gene for each SNV.
     \item Tumor_Sample_Barcode column specifed by MAF format, reporting for each SNV in wich patient was found. 
     \item CCF numeric column produce by \code{CCF} function.
     \item Damage_score numeric column with values between 0 and 1, where 1 means very damaging SNV/IndDel and 0 not damaging SNV/InDel
}}

\item{bcgr.prob}{a numeric vector, same lenght as genes (should be same orderd also) which gives probability of gene having somatic mutation in healfy population.
There are functions for obtaining this vector: \code{bcgr}, \code{bcgr.lawrence} and \code{bcgr.combine}.}

\item{n}{a integer number indicating how many random genes mutations (by background probablity) tests will be done. Default is 100.}

\item{fdr}{expected false discover rate. Value can be between 0 and 1, while closer to 0 less false discoveries will be allowed. 
Default value is 0.1 (10\% of ranked genes before suggested cut off are expected to be false postives).}

\item{simulation.quantile}{represent numeric value between 0 and 1 that will take for each ranking that qunantile from n permutations. 
Default value is 0.5 (median).}

\item{genes}{vector of genes which were sequenced. 
They should be unique values of Hugo_Symbol column (with possibility of more additional genes which did not have any SNV/Indel. in given cohort). Default NULL.}

\item{prior.driver}{a numeric value representing prior probability that random gene is dirver. 
Default is set to \code{length(driver.genes)}/20000, as it assumed there is ~20000 protein goding genes.}

\item{gene.mut.driver}{a numeric value or named vector representing likelihood that gene is mutated if it is knowen to be driver. 
Gene does not need to be mutated if it is driver, as cancers are heterogenious. Default is set to NULL and driver.genes are considered as drivers.}

\item{driver.genes}{a character vector of genes which are considered as drivers for this cancer. If NULL then used set is \code{driver.genes.concensus}.}

\item{plot.save}{a boolean variable to indicate if plot should be saved}

\item{permutationResults.save}{a boolean variable to indicate if n permutations results should be saved}

\item{Variant_Classification}{(optional) integer/numeric value indicating column in \code{sample.mutations} which contain classification for SNV (Silent or not). 
Default is NULL value (in this case \code{sample.mutations} should already have this column)}

\item{Hugo_Symbol}{(optional) integer/numeric value indicating column in \code{sample.mutations} having gene names for reported SNVs/Indels.
Default is NULL value (in this case \code{sample.mutations} should already have this column)}

\item{Tumor_Sample_Barcode}{(optional) integer/numeric value indicating column in \code{sample.mutations} which have sample ids for SNVs/Indels. 
Default is NULL value (in this case \code{sample.mutations} should already have this column)}

\item{CCF}{(optional) integer/numeric value indicating column in \code{sample.mutations} which have cancer cell fraction information for SNVs/Indels. 
Default is NULL value (in this case \code{sample.mutations} should already have this column)}

\item{Damage_score}{(optional) integer/numeric value indicating column in \code{sample.mutations} which contain damage score for SNVs/Indels. 
Default is NULL value (in this case \code{sample.mutations} should already have this column)}

\item{mode}{a charechter value indicationg how to solve when in one gene sample pair there are multiple mutations. Options are SUM, MAX and ADVANCE}

\item{epsilon}{a numeric value. If mode is ADVANCE, epsilone value will be threshold for CCF difference to decide if they are in same or different clone.}
}
\value{
a integer value, where suggested cut off for ranking is.
}
\description{
\code{cutoff.driver} function runs Bayesian driver inference model n times, but with randomly generated gene names 
  (probablity of gene beeing mutated is taken from background model)
}
\examples{
\donttest{
# first calculate CCF
sample.genes.mutect <- CCF(sample.genes.mutect)
# then somatic background probability
bcgr.prob <- bcgr.combine(sample.genes.mutect)
# bayes risk model suggested cut off
suggested.cut.off <- cutoff.driver(sample.genes.mutect,  bcgr.prob) 
print(suggested.cut.off)  
}
}
\seealso{
\code{\link{CCF}}, \code{\link{bcgr}}, \code{\link{bcgr.lawrence}}, \code{\link{bcgr.combine}}   and \code{\link{bayes.driver}}
}
