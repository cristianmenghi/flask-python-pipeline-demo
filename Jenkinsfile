node {
   stage('Get Source') {
      deleteDir()
    checkout([$class: 'GitSCM',
         branches: [[name: '*/main']],
         userRemoteConfigs: [[url: 'https://github.com/cristianmenghi/flask-python-pipeline-demo.git']]])
   }
   stage('Unit Test') {
      // run the unit tests
      dir(".") {
         sh "virtualenv .env"
         sh "source .env/bin/activate"
         sh "pip install -r requirements.txt"
         sh "python3 -m pytest tests/test_app.py"
      }
   }
   stage('Build & publish Docker') {
       dir(".") {
         //sh "docker build -t demopipeline-${BUILD_ID} ."
         sh '''
         IMAGE_NAME=$(uuidgen)
         docker build -t ttl.sh/${IMAGE_NAME}:1h .
         docker push ttl.sh/${IMAGE_NAME}:1h
         '''
       }
   }
}