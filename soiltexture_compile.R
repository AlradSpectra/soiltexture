
rm(list=ls(all=TRUE)) 

pkgName     <- "soiltexture"
pkgDir      <- file.path( Sys.getenv(x = "rPackagesDir" ), 
    pkgName, "pkg" ) 


library( "inlinedocs" )


# Source some utility functions
source( file.path( pkgDir, "..", "packageUtilities.R" ) ) 


# Change the description file:
pkgDescription( # Done with R 3.2.0 RC
    pkgName     = pkgName, 
    pkgDir      = pkgDir, 
    pkgVersion  = "1.5.0", 
    pkgDepends  = NULL,  
    pkgSuggests = c( "xtable" ), 
    pkgImports  = c( "sp", "MASS", "tools", "tcltk", "utils" ), 
    RVersion    = NULL   
)   


#   install.packages(c("sp","xtable"))

package.skeleton.dx( # R version 3.2.0 (2015-04-16), with inlinedocs 2015.06.19 (installed from GitHub)
    pkgdir      = file.path( pkgDir, pkgName ), 
    namespace   = FALSE # Must be edited manually!  
)   


utils::promptPackage( package = pkgName, 
    filename = file.path( pkgDir, pkgName, "man", sprintf( "%s-package.Rd", pkgName ) ),
    final = TRUE )

file.copy(
    from      = file.path( pkgDir, "..", "prepare", "TT.env.Rd" ), 
    to        = file.path( pkgDir, pkgName, "man", "TT.env.Rd" ), 
    overwrite = TRUE  
)   #


pkgRemove( pkgName = pkgName ) 


