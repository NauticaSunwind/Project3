test_that("the output is a list", {
  expect_is(my_t_test(rnorm(10, 0, 1),"less", 5), "list")
})

test_that("my_t_test shows an error message when the input is incorrect", {
  expect_error(my_t_test("string"))
})
