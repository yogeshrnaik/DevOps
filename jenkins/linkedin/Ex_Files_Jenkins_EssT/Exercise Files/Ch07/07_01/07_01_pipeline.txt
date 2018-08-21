pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                  echo This > app.sh
                  echo That >> app.sh
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                  grep This app.sh >> ${BUILD_ID}.cov
                  grep That app.sh >> ${BUILD_ID}.cov
                '''
            }
        }
        stage('Coverage'){
            steps {
                sh '''
                  app_lines=`cat app.sh | wc -l`
                  cov_lines=`cat ${BUILD_ID}.cov | wc -l`
                  echo The app has `expr $app_lines - $cov_lines` lines uncovered > ${BUILD_ID}.rpt
                  cat ${BUILD_ID}.rpt
                '''
                archiveArtifacts "${env.BUILD_ID}.rpt"
            }
        }
    }
}
