#' Different Datasets used in RnBeads Analysis
#'
#' Takes in a results directory and returns a list of different datasets used
#' @param rd A path to the rnbeads results repository
#' @return list of datasets
#' @export


datasets_list <- function(rd) {

  folders <- list.files(rd,full.names = FALSE)
  folders


    path.lists <- list()
    for (i in 1:length(folders)) {

      if ( file.exists( isolate({ paste(rd, folders[i],'data_import_data','annotation.csv',sep="/") }) ) ){

        filepath <- file.path(rd,folders[i],'data_import_data','annotation.csv')

        filepath= as.character(filepath)
        # #removing space
        # tmp <- gsub(" /", "/", tmp)
        path.lists[i] <- filepath

      }

    }

    if (length(path.lists) != 0){
      # this for loops store the combination of results folder that uses the same  dataset
      same.sample.list <- list()
      same.sample.list2 <- list()

      temp.list <- list()
      temp.counter <- 1

      counter <- 1
      for (i in 1:length(folders)) {

        if ( file.exists( isolate({ paste(rd, folders[i], 'data_import_data','annotation.csv',sep="/") }) ) ){

          A <- try(read.csv((toString(path.lists[i])))[ ,2:3])

          if(inherits(A, "try-error")){
            print ('error occured in try block of A')
          }

          else
          {

            for (j in i:length(folders)) {

              if ( file.exists( isolate({ paste(rd, folders[j], 'data_import_data','annotation.csv',sep="/") }) ) ){

                B <- try(read.csv((toString(path.lists[j])))[ ,2:3])

                if(inherits(B, "try-error")){
                  print ('error occured in try block of B')
                }

                else
                {

                  if (length(A) == length(B) && j != i){
                    comparison <- identical(A,B)
                    comparison
                    if (comparison == TRUE){

                      temp.list[temp.counter] <- folders[j]
                      temp.counter = temp.counter+1

                      if ((folders[i] %in% temp.list) & (folders[j] %in% temp.list) ){
                      }
                      else{
                        same.sample.list[counter] <- list(c(folders[i],folders[j]))
                        same.sample.list2[counter] <- folders[j]
                        counter = counter+1

                      }
                    }

                  }
                }# end of try block B

              }# end of file check by B

            }
          }# end of error block A

        }# end of if for file check A

      }


      # datastructure logic of storing the list of folders as a list that share the common folders
      temp.list <- list()
      actual.list <- list()
      actual.counter <- 1
      length(same.sample.list)

      increament <- 1
      k <- 1
      actual.list


      apath.lists <- list()
      apath.counter <- 1

      while (k <= length(same.sample.list)) {

        a <- unlist(same.sample.list[k], use.names = FALSE)
        temp.variable <- a[1]
        temp.list <- append(temp.list, temp.variable)

        # storing the path of annotation.csv file
        filepath <- file.path(rd, temp.variable,'data_import_data','annotation.csv')

        filepath= as.character(filepath)

        # #removing space
        # tmp <- gsub(" /", "/", tmp)
        apath.lists[apath.counter] <- filepath
        apath.counter <- apath.counter + 1


        for (l in k:length(same.sample.list)) {
          b <- unlist(same.sample.list[l], use.names = FALSE)
          b1 <- b[1]
          if (b1 == temp.variable){

            temp.list <- append(temp.list, b[2])

          }
          else{
            increament = l -1

            break
          }

        }

        #message(paste0("Value of K =  ", k))

        k <- k + increament

        temp.variable <- b

        actual.list[actual.counter] <- list(temp.list)
        temp.list <- list()


        actual.counter <- actual.counter + 1


      }

      return(apath.lists)

  }
  else{
    datasets_files <- list()

    return(datasets_files)

  }


}
