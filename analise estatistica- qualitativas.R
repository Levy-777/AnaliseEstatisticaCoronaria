install.packages("e1071")
library(e1071)
install.packages("ggplot2")
library(ggplot2)
install.packages("DescTools")
library(DescTools)

vetor_nomes <- c("HA", "DIAB", "TABAG", "ASS", "ANGEST", "ANGINS", "IMP", "ICC", 
                 "IMA", "ARRRIT", "ARTER", "CD", "DA", "DI", "CX", "SEXO", "IDA55", 
                 "SEID", "LO3", "OBESO", "SELO", "AH2", "AH3", "IDA60", "SEID6", "INFARTO")

grafos <- "grafos"

for (nome in vetor_nomes) {
  # Cria a tabela, ignorando NAs
  tabela <- table(na.omit(Book_Planilha1_[[nome]]))
  
  if (length(tabela) > 0) {
    cat("\nTabela de", nome, ":\n")
    print(tabela)
    
    # Define o caminho do arquivo PNG
    caminho_arquivo <- file.path(grafos, paste0("grafico_", nome, ".png"))
    
    # Abre o dispositivo gráfico PNG
    png(filename = caminho_arquivo, width = 800, height = 600)
    
    # Cria o gráfico com barras vermelhas
    barplot(tabela,
            main = nome,
            ylab = "Quantidade",
            horiz = FALSE,
            col = "red",
            border = "black")
    
    # Fecha o dispositivo gráfico (salva o PNG)
    dev.off()
    
    cat("Gráfico salvo em:", caminho_arquivo, "\n")
  } else {
    cat("\nColuna", nome, "está vazia ou só tem NAs. Nenhum gráfico salvo.\n")
  }
}
