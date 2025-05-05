with(Book_Planilha1_, cor(COLS, COLM, method = "pearson", use = "complete.obs")) #-0.81
with(Book_Planilha1_, cor(GLICS, GLICM, method = "pearson", use = "complete.obs")) #-0.84
with(Book_Planilha1_, cor(`L/H-S`, `L/H-M`, method = "pearson", use = "complete.obs")) # -0.5778
with(Book_Planilha1_, cor(`HDLS`, `HDLM`, method = "pearson", use = "complete.obs")) # -0.70
with(Book_Planilha1_, cor(DIAB, GLIC, method = "pearson", use = "complete.obs")) # 0.6311919
with(Book_Planilha1_, cor(`C/H-M`, `C/H-S`, method = "pearson", use = "complete.obs")) # -0.677174
with(Book_Planilha1_, cor(COL, LDL, method = "pearson", use = "complete.obs")) # 0,7981
tabela_contingencia <- with(Book_Planilha1_, table(SELO,SEID))
coef_contingencia <- ContCoef(tabela_contingencia)
print(coef_contingencia) # 0.7150

install.packages("DescTools")
library(DescTools)

tabela_contingencia <- with(Book_Planilha1_, table(INFARTO,ANGINS))
coef_contingencia <- ContCoef(tabela_contingencia)
print(coef_contingencia)
with(Book_Planilha1_, cor(DIAB, GLIC, method = "pearson", use = "complete.obs"))
with(Book_Planilha1_, cor(TABAG4, IMA, method = "pearson", use = "complete.obs"))
with(Book_Planilha1_, cor(FIB, DIAB, method = "pearson", use = "complete.obs"))

library(ggplot2)

plot(Book_Planilha1_$COLS, Book_Planilha1_$COLM,
     main = "Correlação entre COLS e COLM",
     xlab = "COLS", ylab = "COLM",
     pch = 19, col = rgb(0.2, 0.4, 0.6, 0.6))

# Linha de regressão
abline(lm(Book_Planilha1_$COLM ~ Book_Planilha1_$COLS), col = "red", lwd = 2)

# Carregar o pacote
library(corrplot)

# Selecionar apenas as colunas numéricas do seu dataset
num_data <- Book_Planilha1_[, sapply(Book_Planilha1_, is.numeric)]

# Calcular a matriz de correlação com Pearson
cor_matrix <- cor(num_data, method = "pearson", use = "complete.obs")

# Gerar o heatmap
corrplot(cor_matrix,
         method = "color",        # cores preenchidas
         type = "upper",          # mostra só a parte superior
         tl.col = "black",        # cor dos rótulos
         tl.srt = 45,             # rotação dos nomes das variáveis
         addCoef.col = "black",   # mostra os coeficientes no gráfico
         col = colorRampPalette(c("red", "white", "blue"))(200))

library(ggplot2)

