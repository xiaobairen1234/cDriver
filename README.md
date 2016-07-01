# cDriver
cDriver R package for finding candidate driver genes in cancers. To be able to use cDriver, user must have installed R programing language.

Current version is a Beta version. We will regularly improve this package based on a users comments.

And we are preapering wrapper so users will be able to use cDriver as blaxbox and run it with basic parameters without any R knowledge. 

# Installation from R

```Rscript
install.packages("devtools")

library(devtools)

install_github("hanasusak/cDriver")

library(cDriver)

# And now is read to use!
```

# Installation from Command line (terminal)
```Shell
curl -L https://api.github.com/repos/hanasusak/cDriver/tarball > cDriver.tar.gz

R CMD INSTALL cDriver.tar.gz

# cDriver package should be installed now.
```

or

Click at this [link](https://api.github.com/repos/hanasusak/cDriver/tarball) and download cDriver package.
Then you rename it as cDriver.tar.gz and you can install it from Shell as mentioned before:
```Shell
R CMD INSTALL cDriver.tar.gz

```