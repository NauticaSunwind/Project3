#' Sample t-test Function
#'
#' This function performs a one sample t-test.
#' @param x a numeric data vector
#' @param alternative  the alternative hypothesis, in a character string
#' @param mu  the null hypothesis mu
#' @keywords inference
#'
#' @return A list with the following elements:
#'   test_stat: the numeric test statistic
#'   df: the degrees of freedom.
#'   alternative: the value of the parameter `alternative`
#'   p_val: the numeric p-value.
#'
#' @examples
#' my_t_test(c(3.2, 5.5, 6.7, 6.7, 7.9, 8.4, 8.4, 8.4, 10.3, 11.2), "two.sided", 0)
#'
#' @import stats
#' @export
my_t_test <- function(x, alternative, mu) {
  if (alternative != "two.sided" & alternative != "less" & alternative != "greater") {
    ##Stop if improper alternative hypothesis
    stop("Input alternative must be either two.sided, less or greater!")
  } else {
    n <- length(x)
    ##Calculate the test stat
    t <- (mean(x) - mu) / (sd(x) / sqrt(n))
    ##Calculate df
    df <- n - 1
    ##Calculate pvalue based on different alternative hypothesis
    if (alternative == "less") {
      p = pt(-abs(t), df, lower.tail = FALSE)
      return(list("test_stat = ", t, "df = ", df, "alternative hypothesis: true mean is less than ", mu, "pval = ", p))
    } else if (alternative == "greater") {
      p = pt(-abs(t), df, lower.tail = TRUE)
      return(list("test_stat = ", t, "df = ", df, "alternative hypothesis: true mean is greater than ", mu, "pval = ", p))
    } else {
      p = 2 * pt(-abs(t), df, lower.tail = TRUE)
      return(list("test_stat = ", t, "df = ", df, "alternative hypothesis: true mean does not equal to ", mu, "pval = ", p))
    }
  }
}
