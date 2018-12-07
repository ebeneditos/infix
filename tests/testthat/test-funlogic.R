
context("funlogic")

test_that("and", {
  
  expect_false((is.null %&% is.na)(NA))
  
})

test_that("or", {
  
  expect_true((is.null %|% is.na)(NA))
  
})

test_that("xor", {
  
  expect_true((is.null %xor% is.na)(NA))
  
})
