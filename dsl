job('simpleJob') {
  scm {
    git('https://github.com/okomenda/my_repository.git')
  }
  parameters {
    stringParam('Name','DefaultName','FirstName')
  }
  
  steps {
    shell('echo $JOB_NAME')
    downstreamParameterized {
      trigger(paramJob){
        parameters{
          definedProp('Name', '$Name')
        }      
      }
    }
  }
}
