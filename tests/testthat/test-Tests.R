## Unit Tests
#Testing Reactivity and Connectivity
load("data/test.rda")
load("data/MapUI_test.rda")
load("data/test.rda")
load("data/timeline_test.rda")
library("testthat")


test_that("test that test data is present",{
  expect_true(exists("test"))
})


##Test files
#timeline_test <- as.character(Biodiversity::TimelineUI("x"))
#usethis::use_data(timeline_test)




####Map UI

test_that("Check UI element(Map) behaves the same",{
  expect_equal(as.character(MapUI("x")), MapUI_test)
})


test_that("Check UI element() behaves the same",{
  expect_equal(as.character(TimelineUI("x")),Timeline_test)
})

### Since our entire UI is composed of the two above functions then our test /n
#Covers all of our UI structure


#test output of dataServer
test_that("Check if Module is reative and filters data by given search terms(Common Name)", {
  testServer(data_server, {
    dataset <- session$getReturned()
    
    session$setInputs(searchtype = "Common Name", 
                      common = "Grey Heron", 
                      sciname = "Parus major")
    
    expect_true((nrow(dataset()) < 10000)) #che
    test_common <<- nrow(dataset()) ##store as global variable to compare with "test common"
  })
})

###
test_that("Check that module is reactive and filters given search term (Scientific) ", {
  testServer(data_server, {
    dataset <- session$getReturned()
    
    session$setInputs(searchtype = "Scientific Name", 
                      common = "Grey Heron", 
                      sciname = "Parus major")
    
    expect_true((nrow(dataset()) < 10000))
    test_sci <<- nrow(dataset()) ##store as global variable to compare with "test common"
  })
})


### Make sure search logic doesn't clash
test_that("Distinct logic is implemented for different search terms", {
  expect_true(test_sci != test_common)
})