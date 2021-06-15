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
revigo.data <- rbind(c("GO:0033559","unsaturated fatty acid metabolic process",0.578,6.731,1.505,2.017,-3.048,0.789,0.000),
                     c("GO:0035136","forelimb morphogenesis",0.202,3.064,3.716,1.568,-3.095,0.871,0.000),
                     c("GO:2001252","positive regulation of chromosome organization",0.914,-6.098,-2.631,2.215,-2.526,0.815,0.000),
                     c("GO:2000772","regulation of cellular senescence",0.230,-3.932,4.503,1.623,-2.324,0.946,0.032),
                     c("GO:0086016","AV node cell action potential",0.039,-1.771,-3.453,0.903,-1.527,0.843,0.086),
                     c("GO:0006468","protein phosphorylation",3.919,5.237,-3.116,2.845,-2.385,0.842,0.126),
                     c("GO:0033235","positive regulation of protein sumoylation",0.067,-6.831,0.614,1.114,-1.420,0.927,0.134),
                     c("GO:0072044","collecting duct development",0.084,0.491,5.579,1.204,-1.593,0.931,0.147),
                     c("GO:0048477","oogenesis",0.432,3.660,5.090,1.892,-1.420,0.918,0.152),
                     c("GO:0031848","protection from non-homologous end joining at telomere",0.039,0.479,-6.464,0.903,-1.527,0.820,0.157),
                     c("GO:0035810","positive regulation of urine volume",0.073,-2.886,-7.184,1.146,-1.527,0.834,0.157),
                     c("GO:0043217","myelin maintenance",0.090,1.093,3.596,1.230,-1.470,0.891,0.159),
                     c("GO:0033148","positive regulation of intracellular estrogen receptor signaling pathway",0.056,-4.758,2.064,1.041,-1.593,0.940,0.167),
                     c("GO:0035904","aorta development",0.280,1.847,5.384,1.708,-1.470,0.925,0.174),
                     c("GO:0006022","aminoglycan metabolic process",0.931,5.871,-4.998,2.223,-2.134,0.898,0.223),
                     c("GO:0006465","signal peptide processing",0.067,3.535,-5.342,1.114,-2.289,0.886,0.223),
                     c("GO:0090276","regulation of peptide hormone secretion",1.172,-2.847,-5.506,2.322,-1.404,0.896,0.228),
                     c("GO:0048634","regulation of muscle organ development",0.241,-3.236,5.272,1.643,-1.470,0.956,0.288),
                     c("GO:0031098","stress-activated protein kinase signaling cascade",0.673,0.897,-8.703,2.083,-1.437,0.953,0.333),
                     c("GO:0030309","poly-N-acetyllactosamine metabolic process",0.079,5.731,-5.831,1.176,-1.375,0.908,0.460),
                     c("GO:0031646","positive regulation of nervous system process",0.191,-2.020,-0.209,1.544,-1.527,0.906,0.474),
                     c("GO:0045860","positive regulation of protein kinase activity",2.949,-6.204,-0.165,2.722,-1.419,0.909,0.494),
                     c("GO:0036109","alpha-linolenic acid metabolic process",0.073,6.736,2.152,1.146,-2.859,0.802,0.639),
                     c("GO:1904429","regulation of t-circle formation",0.034,-4.943,-4.616,0.845,-1.593,0.815,0.649),
                     c("GO:0016310","phosphorylation",5.775,6.462,-1.601,3.013,-2.862,0.881,0.656),
                     c("GO:0061820","telomeric D-loop disassembly",0.045,0.462,-5.487,0.954,-1.470,0.833,0.671),
                     c("GO:1904354","negative regulation of telomere capping",0.045,-4.852,-4.349,0.954,-1.527,0.812,0.689),
                     c("GO:0046777","protein autophosphorylation",1.077,5.529,-2.903,2.286,-1.401,0.859,0.692));

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

ggsave("/home/aleix/Bioinfo/TFG/results/plots/BIP_BP.pdf", height = 7, width = 10);


