library(ggplot2)

pdf(snakemake@output[[1]])

norm_counts <- read.csv(snakemake@input[[1]],
   stringsAsFactors = FALSE,
   na.strings = c("NA", "", "undefined"),
   header = TRUE,
   row.names = 1
)

clindata <- read.csv(snakemake@input[[2]],
    stringsAsFactors = FALSE,
    na.strings = c("NA", "", "undefined"),
    header = TRUE
    )


{
  MX1_MX2 <- ggplot(NULL, aes(x = log2(t(norm_counts["MX1",]+1)[which(clindata$positivity=="COVID19" & clindata$ct != "Unknown")]),                                 
                              y = log2(t(norm_counts["MX2",]+1))[which(clindata$positivity=="COVID19"& clindata$ct != "Unknown")],
                              color = as.integer(clindata$ct[(which(clindata$positivity=="COVID19" & clindata$ct != "Unknown"))]))) +
    geom_point(size = 4, na.rm = TRUE) +
    scale_color_gradientn(colours=c("red","white","blue"), name = "Viral
    load (ct)") +
    ylab("MX2 expression RNA-seq \n log2 (norm counts +1)") +
    xlab("MX1 expression RNA-seq \n log2 (norm counts +1)") +
    theme(legend.position = "bottom") +
    theme_bw() +
    theme(axis.text = element_text(size = 15),
          axis.title = element_text(size = 15),
          plot.title =element_text(size = 25))
  
  MX1_MX2 
  
}

