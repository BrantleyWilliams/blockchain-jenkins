pipeline {
  agent any
  stages {
    stage('Test Smart Contracts') {
      steps {
        sh '''#!/bin/bash

testrpc &

sleep 2s'''
        sh '''#!/bin/bash

cd ethereum

rm truffle.js
mv truffle-jenkins.js truffle.js

truffle test
'''
      }
    }
  }
}
