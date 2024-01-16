library(clinfun)
library(GGally)

sink(snakemake@output[[1]])

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


MX1stat <- wilcox.test(unlist(norm_counts["MX1",]) ~ clindata$positivity, paired = FALSE)
MX1stat

#####

{
   p_trend_age <- jonckheere.test(x= log2(t(norm_counts["MX1",]+1))[clindata$positivity == "COVID19"],
                                  g= factor(clindata$age_cat[clindata$positivity == "COVID19"], ordered=TRUE),
                                  alternative = "decreasing",
                                  nperm = 500)
   p_trend_age
} 

#####

{
   pairwise_corr <- ggpairs(as.data.frame(log2(t(norm_counts+1))), columns = c("MX1", "MX2", "ACE2", "TMPRSS2"),
             upper = list(continuous = wrap('cor', method = "spearman", size = 3),
                          combo = "box_no_facet", discrete = "count",
                          na ="na"),
             ggplot2::aes(colour=clindata$positivity, shape=clindata$positivity, alpha = 0.01))
   
   pairwise_corr
}

#####
