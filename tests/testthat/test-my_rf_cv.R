data("iris")

test_that("the output is numeric", {
  expect_is(my_rf_cv(k = 5), "numeric")
})

test_that(" my_rf_cv shows an error message when the input is non-numeric", {
  expect_error(my_rf_cv("FGO"))
})
