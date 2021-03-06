% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SumTool.r
\name{LDprune}
\alias{LDprune}
\title{LD pruning}
\usage{
LDprune(geno = NULL, map = NULL, w = 1e+06, b = 5e+05,
  r2.cutoff = 0.25, verbose = TRUE, threads = 1)
}
\arguments{
\item{geno}{bigmemory (n * m), genotype coded as 0, 1, 2}

\item{map}{data.frame, the genomic information of SNPs. The columns should be in the order of c("SNP", "Chr", "Pos", "A1", "A2")}

\item{w}{int, size of windows in bp. Default is 1e6}

\item{b}{int, set the buffer size in bp of each window, default 125000}

\item{r2.cutoff}{double, the threshold of r2, smaller cutoff results in less remaining SNPs, default 0.25}

\item{verbose}{logical, whether to print the log information}

\item{threads}{int, the number of used threads for parallel process}
}
\description{
To remove high correlated SNPs on base of r2 and MAF
}
\examples{
ref_bfile_path <- system.file("extdata", "ref_geno", package = "SumTool")

# load data
data <- read_plink(bfile=ref_bfile_path, threads=1, verbose=FALSE)
geno <- data$geno
map <- data$map
snp <- LDprune(geno = geno, map = map, w = 100000, b=50000, threads = 1, verbose=FALSE)
}
