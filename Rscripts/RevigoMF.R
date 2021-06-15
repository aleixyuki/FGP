# A plotting R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );

# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0004674","protein serine/threonine kinase activity",2.414,5.073,4.133,2.641,-2.293,0.724,0.000),
c("GO:0004866","endopeptidase inhibitor activity",1.005,-1.887,-4.736,2.262,-1.914,0.836,0.000),
c("GO:0005540","hyaluronic acid binding",0.133,-5.026,-2.846,1.398,-2.573,0.979,0.000),
c("GO:0003691","double-stranded telomeric DNA binding",0.050,-2.758,7.419,1.000,-1.420,0.833,0.002),
c("GO:0031406","carboxylic acid binding",1.071,-5.936,1.285,2.290,-2.028,0.941,0.002),
c("GO:0070273","phosphatidylinositol-4-phosphate binding",0.160,-1.935,-1.557,1.477,-1.043,0.999,0.002),
c("GO:0042805","actinin binding",0.199,0.813,-5.390,1.568,-1.043,0.998,0.002),
c("GO:0015220","choline transmembrane transporter activity",0.028,4.162,-4.982,0.778,-1.527,0.912,0.003),
c("GO:0048256","flap endonuclease activity",0.050,5.842,0.183,1.000,-1.527,0.750,0.153),
c("GO:0000287","magnesium ion binding",1.193,-5.634,-0.012,2.336,-1.758,0.969,0.163),
c("GO:0048027","mRNA 5'-UTR binding",0.138,-3.452,5.083,1.415,-1.043,0.906,0.167),
c("GO:0016251","RNA polymerase II general transcription initiation factor activity",0.210,3.423,0.005,1.591,-1.083,0.857,0.268),
c("GO:0008479","queuine tRNA-ribosyltransferase activity",0.011,3.316,7.684,0.477,-1.527,0.880,0.281),
c("GO:0042800","histone methyltransferase activity (H3-K4 specific)",0.088,3.689,6.476,1.230,-1.176,0.855,0.335),
c("GO:0003690","double-stranded DNA binding",9.295,-3.714,6.231,3.226,-2.048,0.813,0.344),
c("GO:0008253","5'-nucleotidase activity",0.072,6.821,1.700,1.146,-1.232,0.795,0.406),
c("GO:0008331","high voltage-gated calcium channel activity",0.055,3.612,-5.082,1.041,-1.297,0.920,0.412),
c("GO:0030295","protein kinase activator activity",0.464,-2.305,-4.625,1.929,-1.630,0.847,0.499),
c("GO:0035639","purine ribonucleoside triphosphate binding",10.063,-4.882,3.510,3.261,-1.552,0.834,0.514),
c("GO:0003677","DNA binding",13.664,-4.110,5.796,3.394,-1.419,0.840,0.544),
c("GO:0008252","nucleotidase activity",0.083,6.849,2.049,1.204,-1.176,0.793,0.569),
c("GO:0004711","ribosomal protein S6 kinase activity",0.039,5.212,5.333,0.903,-1.527,0.793,0.575),
c("GO:0003964","RNA-directed DNA polymerase activity",0.094,4.027,3.484,1.255,-1.470,0.705,0.600),
c("GO:0008409","5'-3' exonuclease activity",0.105,6.144,-0.274,1.301,-1.203,0.787,0.600),
c("GO:0050321","tau-protein kinase activity",0.122,4.803,4.865,1.362,-1.375,0.777,0.639),
c("GO:0004712","protein serine/threonine/tyrosine kinase activity",0.243,5.265,4.607,1.653,-1.232,0.766,0.684),
c("GO:0000977","RNA polymerase II transcription regulatory region sequence-specific DNA binding",7.909,-3.445,6.447,3.156,-1.253,0.805,0.700));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$plot_size <- as.numeric( as.character(one.data$plot_size) );
one.data$value <- as.numeric( as.character(one.data$value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = value, size = plot_size), alpha = I(0.6) ) + scale_size_area();
p1 <- p1 + scale_colour_gradientn( colours = c("red", "yellow", "green", "blue"), limits = c( min(one.data$value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ];
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 2.3 );
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);


# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

ggsave("/home/aleix/Bioinfo/TFG/results/plots/BIP_MF.pdf", height = 7, width = 10);

