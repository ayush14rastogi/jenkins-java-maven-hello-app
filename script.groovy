def buildApp(){
  echo 'building the application from script'
}

def testApp(){
  echo 'Testing the application from script'
}

def deployApp(){
  echo 'delpoying the application from script'
  echo "delpoying the ${params.VERSION} from script"
}

return this
  
