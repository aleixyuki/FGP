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
revigo.data <- rbind(c("GO:0004866","endopeptidase inhibitor activity",1.005,6.405,-0.522,2.262,-2.520,0.870,0.000),
c("GO:0005540","hyaluronic acid binding",0.133,-3.819,-5.635,1.398,-3.005,0.947,0.000),
c("GO:0048256","flap endonuclease activity",0.050,-6.510,-2.074,1.000,-1.743,0.745,0.000),
c("GO:0070273","phosphatidylinositol-4-phosphate binding",0.160,1.993,-1.623,1.477,-2.829,0.863,0.002),
c("GO:0019894","kinesin binding",0.215,3.263,5.763,1.602,-2.620,0.909,0.002),
c("GO:0031406","carboxylic acid binding",1.071,-0.749,-6.403,2.290,-2.453,0.935,0.002),
c("GO:0003684","damaged DNA binding",0.370,3.406,-5.465,1.833,-0.947,0.959,0.002),
c("GO:0022843","voltage-gated cation channel activity",0.768,-2.167,8.015,2.146,-1.554,0.884,0.003),
c("GO:0004711","ribosomal protein S6 kinase activity",0.039,-5.050,3.874,0.903,-1.743,0.828,0.112),
c("GO:0042800","histone methyltransferase activity (H3-K4 specific)",0.088,-6.445,2.191,1.230,-1.389,0.833,0.242),
c("GO:0008146","sulfotransferase activity",0.287,-4.699,2.018,1.724,-1.015,0.851,0.280),
c("GO:0015459","potassium channel regulator activity",0.287,6.489,0.245,1.724,-0.975,0.935,0.340),
c("GO:0005525","GTP binding",2.093,-0.578,-5.427,2.580,-1.252,0.800,0.418),
c("GO:0051010","microtubule plus-end binding",0.110,2.383,5.958,1.322,-1.512,0.903,0.426),
c("GO:0051393","alpha-actinin binding",0.149,2.806,5.092,1.447,-1.138,0.911,0.436),
c("GO:0042805","actinin binding",0.199,3.495,5.181,1.568,-1.254,0.909,0.446),
c("GO:0043539","protein serine/threonine kinase activator activity",0.215,6.371,-1.054,1.602,-1.110,0.917,0.463),
c("GO:0015485","cholesterol binding",0.276,1.506,-3.373,1.708,-0.975,0.832,0.487),
c("GO:0016301","kinase activity",4.142,-5.545,2.225,2.876,-1.440,0.774,0.515),
c("GO:0050321","tau-protein kinase activity",0.122,-5.551,3.408,1.362,-1.590,0.814,0.575),
c("GO:0008409","5'-3' exonuclease activity",0.105,-6.287,-2.432,1.301,-1.417,0.763,0.600),
c("GO:0035639","purine ribonucleoside triphosphate binding",10.063,0.541,-5.827,3.261,-1.077,0.863,0.611),
c("GO:0004712","protein serine/threonine/tyrosine kinase activity",0.243,-5.260,2.975,1.653,-1.446,0.805,0.618),
c("GO:0008017","microtubule binding",1.491,2.713,5.698,2.433,-1.039,0.888,0.692));

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

ggsave("/home/aleix/Bioinfo/TFG/results/plots/BD1_MF.pdf", height = 7, width = 10);

