
context("operators")

test_that("paste", {
  
  expect_equal("01" %+% "jan" %+% "1970", "01jan1970")

})

test_that("file.path", {
  
  expect_equal("home" %//% "dir", "home/dir")
  
})

test_that("unmatch", {
  
  expect_true(4 %!in% 1:3)
  
})

test_that("nil", {
  
  expect_equal(1 %||% 2, 1)
  expect_equal(NULL %||% 2, 2)
  
})
