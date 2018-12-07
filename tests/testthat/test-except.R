
context("except")

test_that("except", {
  
  expect_equal(tryExcept(1), 1)
  expect_equal(tryExcept({1; stop()}, {2}), 2)
  
})
