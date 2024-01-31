raindrops <- function(n) {
    df <- data.frame(
           d = c(3, 5, 7),
        word = c("Pling", "Plang", "Plong")
    )

    res <- paste(df[n %% df$d == 0,]$word, collapse="")

    if (res == "") as.character(n) else res
}
