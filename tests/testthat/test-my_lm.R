test_that("the output is a table", {
  expect_is(my_lm(formula = lifeExp ~ gdpPercap + continent,
                  data = my_gapminder), "table")
})

test_that("my_lm shows an error message when the input is incorrect", {
  expect_error(my_lm("string"))
})
