library(data.table);

loadData <- function(subjnr=NA){
  ## load up the data
  dataFolder = "../Data";
  folders = list.dirs(dataFolder);
  alldat = data.table()
  for(folder in folders){
    blocks = list.files(folder);
    for(block in blocks){
      path = paste0(folder,block);
      if(grepl("*.dat",path)){
        print(paste0("working on subject file ", block))
        tempdat = data.table(read.table(paste0(folder,"/",block),header=TRUE,sep=","))
        alldat = rbind(alldat,tempdat)
      }
    }
  }
  alldat = alldat[,':='(t1=as.vector(t1),
                        t2=as.vector(t2),
                        t1_response=as.vector(t1_response),
                        t2_response=as.vector(t2_response),
                        t1_position = as.factor(t1_position)
                        )]
  alldat = alldat[,':='(t1correct = t1 == t1_response,
                        t2correct = t2 == t2_response
                        )]
  
  if(is.numeric(subjnr)){
    print(paste0("getting subj ",subjnr))
    alldat = alldat[subj==subjnr]
  }
  return(alldat)
}

alldat = loadData(2)
alldat = loadData(9999)

alldatCorr = alldat[t1correct == TRUE && t2correct == TRUE]


alldat[estimated_lag < 1000,plot(lag,estimated_lag)]

