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
revigo.data <- rbind(c("GO:0005793","endoplasmic reticulum-Golgi intermediate compartment",0.691,-6.075,3.125,2.117,-3.964,0.941,0.000),
c("GO:0044450","(obsolete) microtubule organizing center part",0.501,-6.566,-0.206,1.924,-1.371,1.000,0.000),
c("GO:0044451","(obsolete) nucleoplasm part",0.501,-6.219,-2.485,1.924,-0.544,1.000,0.000),
c("GO:0031089","platelet dense granule lumen",0.074,6.310,0.196,1.176,-3.228,0.710,0.028),
c("GO:0005814","centriole",0.755,-1.432,5.907,2.155,-1.595,0.838,0.029),
c("GO:0033116","endoplasmic reticulum-Golgi intermediate compartment membrane",0.399,-0.223,-0.304,1.881,-3.606,0.887,0.040),
c("GO:0048471","perinuclear region of cytoplasm",3.813,-5.177,1.067,2.856,-0.589,0.953,0.042),
c("GO:1990454","L-type voltage-gated calcium channel complex",0.064,-3.622,-3.881,1.114,-1.743,0.833,0.050),
c("GO:0044666","MLL3/4 complex",0.069,0.627,-5.983,1.146,-1.549,0.750,0.120),
c("GO:0043202","lysosomal lumen",0.510,4.703,-6.010,1.987,-0.697,0.870,0.144),
c("GO:0000781","chromosome, telomeric region",0.787,0.456,7.136,2.173,-0.613,0.915,0.187),
c("GO:0030134","COPII-coated ER to Golgi transport vesicle",0.495,5.679,3.414,1.973,-1.788,0.772,0.287),
c("GO:0005798","Golgi-associated vesicle",0.489,6.215,3.306,1.968,-0.853,0.791,0.338),
c("GO:0030173","integral component of Golgi membrane",0.324,2.973,-1.390,1.792,-1.004,0.807,0.342),
c("GO:0005686","U2 snRNP",0.106,-0.881,-6.349,1.322,-1.274,0.758,0.361),
c("GO:0030135","coated vesicle",1.574,6.418,2.757,2.473,-0.772,0.768,0.379),
c("GO:0005796","Golgi lumen",0.532,5.402,-3.095,2.004,-0.647,0.828,0.409),
c("GO:0042827","platelet dense granule",0.112,6.531,1.288,1.342,-2.870,0.748,0.423),
c("GO:0097431","mitotic spindle pole",0.181,-2.165,5.769,1.544,-1.200,0.833,0.446),
c("GO:0005871","kinesin complex",0.266,-2.069,4.055,1.708,-0.913,0.778,0.462),
c("GO:0005689","U12-type spliceosomal complex",0.154,-1.276,-6.196,1.477,-1.168,0.750,0.480),
c("GO:0035579","specific granule membrane",0.484,5.067,1.100,1.964,-0.675,0.678,0.488),
c("GO:0005819","spindle",2.026,-1.343,6.221,2.582,-0.414,0.825,0.569),
c("GO:1904813","ficolin-1-rich granule lumen",0.659,5.846,0.004,2.097,-0.561,0.687,0.572),
c("GO:0005681","spliceosomal complex",1.016,-1.456,-5.754,2.283,-0.589,0.736,0.578),
c("GO:0042581","specific granule",0.851,6.061,1.234,2.207,-0.466,0.704,0.605),
c("GO:0005775","vacuolar lumen",0.915,4.997,-5.777,2.238,-0.464,0.865,0.606),
c("GO:0032281","AMPA glutamate receptor complex",0.133,-3.213,-3.747,1.415,-1.339,0.812,0.628),
c("GO:0101002","ficolin-1-rich granule",0.984,5.907,1.502,2.270,-0.418,0.701,0.630),
c("GO:0072686","mitotic spindle",0.835,-1.856,5.954,2.199,-0.706,0.813,0.688));

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

ggsave("/home/aleix/Bioinfo/TFG/results/plots/BD1_CC.pdf", height = 7, width = 10);

