library( viridis )
library( MALDIquant )
library( MALDIquantForeign )

#Change to R script directory
#setwd( "~/TrIQ" )

#TrIQ algorithm, see
#Rosas-Román I, Winkler R. Contrast .optimization of mass spectrometry imaging (MSI) data visualization by threshold intensity quantization (TrIQ).
#PeerJ Comput Sci. 2021 Jun 9;7:e585. doi: 10.7717/peerj-cs.585. PMID: 34179452; PMCID: PMC8205298.

source( "TrIQ.R" )

#Data repository
#Robert Winkler. (2023). mzML mass spectrometry and imzML mass spectrometry imaging test data [Data set].
#Zenodo. https://doi.org/10.5281/zenodo.10084132

#The script assumes the following directory structure
#rob@uga-itx ~> tree julia* -L 1
#julia_example-data
#├── imzML_AP_SMALDI
#├── imzML_DESI
#├── imzML_LA-ESI
#├── imzML_LTP
#└── mzML
#TrIQ

spectra <- MALDIquantForeign::importImzMl( "../julia_example-data/imzML_DESI/ColAd_Individual/80TopL, 50TopR, 70BottomL, 60BottomR/80TopL, 50TopR, 70BottomL, 60BottomR-centroid.imzML", removeEmptySpectra = FALSE )

#DESI Carcinoma data by
#by Oetjen J, Veselkov K, Watrous J, McKenzie JS, Becker M, Hauberg-Lotte L, Kobarg JH, Strittmatter N, Mróz AK, Hoffmann F, Trede D, Palmer A, Schiffler S, Steinhorst K, Aichler M, Goldin R, Guntinas-Lichius O, von Eggeling F, Thiele H, Maedler K, Walch A, Maass P, Dorrestein PC, Takats Z, Alexandrov T. 2015.
#Benchmark datasets for 3D MALDI-and DESI-imaging mass spectrometry. GigaScience 4(1):2105 https://doi.org/10.1186/s13742-015-0059-4.

imgList  <- GetSlice( c( 885.55 ), spectra, 0.005 )
dim( imgList ) <- c(1, 1)
pdf("Carcinoma_DESI-MSI_TrIQ.pdf")
PlotSlices( GlobalTrIQ( imgList, 256, 0.98 ), 256 )
dev.off()
