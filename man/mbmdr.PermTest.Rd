\name{mbmdr.PermTest}
\alias{mbmdr.PermTest}
\alias{print.mbmdr.PermTest}

\title{
  Permutation Test for exploring significance of MB-MDR result. 
}

\description{
  Performs a permutation test for specified interaction models from \code{mbmdr} object.
}

\usage{
  mbmdr.PermTest(x, n, model = NULL, sig.level=1)
}

\arguments{
  \item{x}{A mbmdr object returned by \code{mbmdr} function.}
  \item{n}{Number of permutations.}
  \item{model}{Vector specifiying an interaction model or matrix wich rows are the interaction models 
  	to perform the permutation test. If \code{model=NULL} (default), permutation test is performed for 
  	the best model on \code{x} object.}
  \item{sig.level}{Significance level for the confidence intervals of the permuted p-values, based
  	on a normal approximation (Nettleton, 2000).\cr
  	If \code{sig.level=1} (as default), confidence intervals are not computed. \cr
  	When the permutation p-value is too small with respect to \code{n}, the normal aproximation is not
  	appropiated and the C.I. are not provided (Nettleton, 2000).}
}

\details{
	A permutation test is performed for each specified model by permuting the outcome variable an calling
  the \code{mbmdr} function.
	The call to the \code{mbmdr} function is made by recovering the call from \code{mbmdr} object and replacing 
	the outcome (by a permutation) and SNP data (by the subset of the specified model). All other arguments in the 
	initial	call to \code{mbmdr} are transfered to \code{mbmdr.PermTest}.
}

\value{
  An object is returned of a new class, \code{mbmdr.PermTest}, with following attributes:
  \item{n}{
  The number of permutations.
  }
  \item{mbmdr}{
  The \code{mbmdr} object used.
  }
  \item{PermTest}{
  A \code{data.frame} with results of the permutation tests. The following information is returned:\cr
       
  \tabular{lll}{
    \code{SNP1...SNPx}\tab  \tab Names of snps for each specified interaction models.             \cr
    \code{NH   }      \tab  \tab Number of significant High risk genotypes in the interaction.    \cr
    \code{WH   }      \tab  \tab Wald statistic for High risk category.                           \cr
    \code{NL   }      \tab  \tab Number of significant Low risk genotypes in the interaction.     \cr
    \code{WL   }      \tab  \tab Wald statistic for Low risk category.                            \cr
    \code{Wmax}       \tab  \tab Maximun Wald statistic for the interaction model.                \cr
    \code{Perm.P}     \tab  \tab Permutation p-value for the interaction model.                   \cr
    \code{IC.lower}   \tab  \tab Lower limit of the confidence interval for permutation p-value.  \cr
    \code{IC.upper}   \tab  \tab Upper limit of the confidence interval for permutation p-value.  \cr
  }
  }
  
}


\references{
  Nettleton D., Doerge R.W. (2000) \emph{Accounting for Variability in the Use of Permutation Testing to 
  Detect Quantitative Trait Loci.} Biometrics, Vol. 56, No. 1, pp. 52-58.

}

\seealso{
  \code{\link{mbmdr}}
}

\examples{
  data(simSNP)
  fit <- mbmdr(y=simSNP$Y,data=simSNP[,3:12],order=2,list.models=c(2,1),
             family=binomial(link=logit))
             
  #Single model permutation test
  mbmdr.PermTest(fit,100)
  
  #Next stpes takes some time
  
  #Permutation test for all models with MIN.P <= 0.05
  #order <- 2
  #models <- subset(fit$result, MIN.P <= 0.05, select = 1:order)
  #mbmdr.PermTest(fit,100,models)
  
  #Permutation test and confidence interval for all models with MIN.P <= 0.05 
  #mbmdr.PermTest(fit,100,models,sig.level=0.05)

}

