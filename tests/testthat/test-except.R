
context("except")

test_that("except", {
  
  expect_equal(tryExcept(1), 1)
  expect_equal({1; stop()} %except% {2}, 2)
  
})
