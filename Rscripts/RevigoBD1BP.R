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
revigo.data <- rbind(c("GO:0006022","aminoglycan metabolic process",0.931,-2.448,-6.224,2.223,-2.560,0.902,0.000),
c("GO:0042742","defense response to bacterium",1.906,1.666,-1.060,2.533,-1.606,0.996,0.000),
c("GO:0070269","pyroptosis",0.101,-1.739,-0.827,1.279,-3.531,0.997,0.000),
c("GO:2001257","regulation of cation channel activity",0.964,-3.682,5.116,2.238,-1.833,0.961,0.000),
c("GO:0048193","Golgi vesicle transport",2.052,5.207,-5.078,2.565,-2.271,0.865,0.003),
c("GO:0086016","AV node cell action potential",0.039,-0.309,6.167,0.903,-1.743,0.886,0.022),
c("GO:0048634","regulation of muscle organ development",0.241,1.171,-4.417,1.643,-1.686,0.973,0.026),
c("GO:0033148","positive regulation of intracellular estrogen receptor signaling pathway",0.056,2.887,6.723,1.041,-1.810,0.937,0.028),
c("GO:0007063","regulation of sister chromatid cohesion",0.123,2.894,-7.170,1.362,-1.512,0.984,0.030),
c("GO:0019216","regulation of lipid metabolic process",2.170,-6.577,1.373,2.589,-1.554,0.967,0.033),
c("GO:0009650","UV protection",0.067,0.637,-7.613,1.114,-1.590,0.996,0.072),
c("GO:0043217","myelin maintenance",0.090,6.379,1.947,1.230,-1.686,0.823,0.081),
c("GO:0046456","icosanoid biosynthetic process",0.252,-5.381,-3.687,1.663,-1.549,0.948,0.089),
c("GO:0051984","positive regulation of chromosome segregation",0.073,0.453,2.223,1.146,-1.549,0.968,0.110),
c("GO:2000303","regulation of ceramide biosynthetic process",0.095,-4.774,1.010,1.255,-1.549,0.973,0.139),
c("GO:0048477","oogenesis",0.432,4.368,3.844,1.892,-1.635,0.924,0.142),
c("GO:0035115","embryonic forelimb morphogenesis",0.163,5.782,4.602,1.477,-1.635,0.919,0.149),
c("GO:0065003","protein-containing complex assembly",7.200,7.254,-0.381,3.109,-1.884,0.925,0.165),
c("GO:0051315","attachment of mitotic spindle microtubules to kinetochore",0.067,6.258,-2.911,1.114,-1.549,0.855,0.180),
c("GO:1904526","regulation of microtubule binding",0.056,-5.016,4.473,1.041,-1.743,0.981,0.197),
c("GO:0080090","regulation of primary metabolic process",32.842,-6.567,0.374,3.768,-2.247,0.962,0.240),
c("GO:0007417","central nervous system development",5.299,5.730,3.253,2.976,-1.725,0.906,0.378),
c("GO:0006333","chromatin assembly or disassembly",0.948,6.835,-1.508,2.230,-1.478,0.921,0.446),
c("GO:0036109","alpha-linolenic acid metabolic process",0.073,-6.047,-3.041,1.146,-1.478,0.957,0.447),
c("GO:0030309","poly-N-acetyllactosamine metabolic process",0.079,-2.835,-6.039,1.176,-1.590,0.875,0.460),
c("GO:0006888","endoplasmic reticulum to Golgi vesicle-mediated transport",1.127,5.505,-4.609,2.305,-1.940,0.799,0.471),
c("GO:0031646","positive regulation of nervous system process",0.191,-0.618,6.465,1.544,-1.743,0.894,0.474),
c("GO:0098911","regulation of ventricular cardiac muscle cell action potential",0.067,-1.467,6.011,1.114,-1.549,0.902,0.564),
c("GO:0030208","dermatan sulfate biosynthetic process",0.067,-3.377,-5.497,1.114,-1.512,0.848,0.641));

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

ggsave("/home/aleix/Bioinfo/TFG/results/plots/BD1_BP.pdf", height = 7, width = 10);
