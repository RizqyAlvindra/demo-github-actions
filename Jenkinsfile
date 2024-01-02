def credential = 'github'
def server = 'aimingds@103.127.97.24'
def directory = '/home/aimingds/wayshub-frontend'
def branch = 'main'
def service = frontend
def image =  alvindra/amanda

pipeline {
    agent any 
    stages {
	stage('pulling new code'){
	    steps {
		sshagent([credential]) {
		   ssh """ssh -o StrictHostKeyChecking=no ${server} << EOF
		   docker compose down ${service}
                   cd ${directory} 
		   git pull origin ${branch}
		   exit
		   EOF"""

		}	
	    }
        }

        stage('building application'){
            steps {
                sshagent([credential]) {
                   ssh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                   cd ${directory}
                   docker compose build ${service}
                   exit
                   EOF"""

		}
	    }
	}

        stage('deploy application'){
            steps {
                sshagent([credential]) {
                   ssh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                   docker compose up -d
                   exit
                   EOF"""

		}	
	    }    
	}	
    }
}
