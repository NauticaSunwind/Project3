data("iris")

test_that("the output is a list", {
  expect_is(my_knn_cv(iris[, 1:4], iris$Species, 1, 5), "list")
})

test_that("my_knn_cv shows an error message when input non-numeric k_nn or k_cv ", {
  expect_error(my_knn_cv(train, cl, 2020, "FGO"))
  expect_error(my_knn_cv(train, cl, "FGO", 2020))
})
