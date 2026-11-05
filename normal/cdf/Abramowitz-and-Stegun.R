# Gets the clean loop free R code for Abramowitz & Stegun (26.2.12) asymptotic approx
asymp_formula <- function(series_terms) {
  cf <- numeric(series_terms)
  cf[1] <- -1
  if (series_terms > 1) for (j in 2:series_terms) cf[j] <- cf[j - 1] * (-(2 * j - 1))
  leaf <- cf[series_terms]
  acc <- if (series_terms > 1 && leaf < 0) sprintf("(%d)", leaf) else as.character(leaf)
  if (series_terms > 1) {
    for (j in seq(series_terms - 1, 1)) {
      acc <- sprintf("%d + w * %s", cf[j], acc)
      if (j > 1) acc <- sprintf("(%s)", acc)
    }
  }
  sprintf("w * (%s)", acc)
}
