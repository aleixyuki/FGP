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
revigo.data <- rbind(c("GO:0031089","platelet dense granule lumen",0.074,4.511,-0.201,1.176,-2.794,0.785,0.000),
c("GO:0044450","(obsolete) microtubule organizing center part",0.505,-3.046,7.225,1.924,-0.377,1.000,0.000),
c("GO:0044451","(obsolete) nucleoplasm part",0.505,1.075,7.097,1.924,-1.007,1.000,0.000),
c("GO:1990454","L-type voltage-gated calcium channel complex",0.064,-0.017,-7.811,1.114,-1.527,0.900,0.000),
c("GO:0005793","endoplasmic reticulum-Golgi intermediate compartment",0.691,5.198,-5.672,2.117,-0.473,0.933,0.028),
c("GO:0033116","endoplasmic reticulum-Golgi intermediate compartment membrane",0.399,3.213,5.101,1.881,-0.736,0.886,0.050),
c("GO:0005739","mitochondrion",8.641,-0.964,7.008,3.211,-0.554,0.913,0.056),
c("GO:0070187","shelterin complex",0.037,-5.455,-3.077,0.903,-1.527,0.639,0.114),
c("GO:0005819","spindle",2.026,-5.725,2.182,2.582,-0.720,0.773,0.154),
c("GO:0016604","nuclear body",4.270,1.289,-4.064,2.905,-0.560,0.808,0.168),
c("GO:0043202","lysosomal lumen",0.510,2.802,-4.788,1.987,-0.508,0.878,0.214),
c("GO:0005796","Golgi lumen",0.532,3.483,-2.132,2.004,-0.462,0.843,0.215),
c("GO:0005694","chromosome",10.917,-6.261,1.108,3.313,-0.466,0.801,0.298),
c("GO:0030139","endocytic vesicle",1.627,5.698,1.564,2.487,-0.428,0.849,0.317),
c("GO:0000228","nuclear chromosome",1.212,-3.760,-0.436,2.360,-0.697,0.695,0.321),
c("GO:0044666","MLL3/4 complex",0.069,-1.984,-5.395,1.146,-1.334,0.689,0.336),
c("GO:0005741","mitochondrial outer membrane",1.042,2.271,4.248,2.294,-0.407,0.860,0.382),
c("GO:0070603","SWI/SNF superfamily-type complex",0.393,-4.883,-2.620,1.875,-1.151,0.587,0.398),
c("GO:0005884","actin filament",0.612,-5.132,2.970,2.064,-0.675,0.815,0.409),
c("GO:0005686","U2 snRNP",0.106,-3.933,-5.793,1.322,-1.063,0.675,0.412),
c("GO:0042827","platelet dense granule",0.112,5.455,0.715,1.342,-2.439,0.826,0.423),
c("GO:0098687","chromosomal region",1.787,-6.251,0.031,2.528,-0.553,0.768,0.468),
c("GO:0005763","mitochondrial small ribosomal subunit",0.149,-2.139,-2.215,1.462,-0.959,0.665,0.479),
c("GO:0035579","specific granule membrane",0.484,4.478,2.174,1.964,-1.233,0.764,0.488),
c("GO:0005689","U12-type spliceosomal complex",0.154,-3.511,-5.906,1.477,-0.959,0.664,0.493),
c("GO:0005814","centriole",0.755,-6.183,2.631,2.155,-0.473,0.792,0.569),
c("GO:0072686","mitotic spindle",0.835,-5.742,2.724,2.199,-0.517,0.778,0.575),
c("GO:0005681","spliceosomal complex",1.016,-3.183,-5.526,2.283,-0.410,0.637,0.578),
c("GO:0042581","specific granule",0.851,5.468,0.363,2.207,-0.821,0.797,0.586),
c("GO:0000781","chromosome, telomeric region",0.787,-6.627,-0.438,2.173,-1.110,0.755,0.621));

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

ggsave("/home/aleix/Bioinfo/TFG/results/plots/BIP_CC.pdf", height = 7, width = 10);

