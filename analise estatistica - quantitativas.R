pacotes = c("dplyr", "ggplot2", "corrplot", "ggcorrplot", "FactoMineR",
            "factoextra", "purrr")
pacotesInstalados = installed.packages()[,"Package"]

currDataset = tde

for (i in pacotes){
  if (!(i %in% pacotesInstalados)){
    cat(i, "não está instalado\nInstalando")
    install.packages(i)
  }
  require(i, character.only = T)
}

cols <- colnames(currDataset)
colTypes <- sapply(currDataset, class)
uniqueCols = sapply(currDataset, n_distinct, na.rm=T)
tpAn = sapply(uniqueCols, function(x) if (x <= 5) "ct" else "qt")

df <-data.frame(
  nomeCol = cols,
  tipoCol = colTypes,
  qtUnico = uniqueCols,
  tipoAnalise = tpAn,
  row.names = NULL
)
df

colnames(tde[,df$tipoAnalise=="qt"])



colsP <- c("HDL", "VLDL", "VLDLS")
colsM <- c("COL", "LDL", "GLIC", "TRIGM", "GLICM")
colsG <- c("TRIG", "TRIGS")

cols_mgdL <- list(colsP, colsM, colsG)
cols_mgdL

dir.create("graficos", showWarnings = F)
par(mar = c(2,4,2,2))
for (col in cols_mgdL){
  #print(col)
  caminhoDownload <- file.path("graficos", paste0("grafico_", "a", ".png"))
  colunaAnalisada <- tde[,df$tipoAnalise == "qt"][col]
  png(filename = caminhoDownload, width=1200, height = 800)
  boxplot(colunaAnalisada[col], main="Variáveis Quantitativas", ylab="mg/dL")
  #boxplot(colunaAnalisada[col], main="Variáveis Quantitativas", ylab="mg/dL")
  dev.off()
}