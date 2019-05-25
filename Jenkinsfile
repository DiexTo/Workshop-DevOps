pipeline{
    agent any
    environment{
	TOKEN = credentials('git-Diego-Token')
	LOGIN = sh script:"vault login -method=github token=${TOKEN}"
	DIGITALOCEAN_TOKEN= sh(script:'vault kv get -field=token workshop/DiexTo/DigitalOcean', returnStdout: true).trim()
    }
    stages{
        stage("init"){
            steps{
                echo "hola mundo"
            }
        }
        
        stage("validate"){
            steps{
                echo "bye con numero"
            }
        }
        
        stage("plan and create"){
            steps{
                echo "bye con numero"
            }
        }
        
        stage("apply"){
            steps{
                echo "bye con numero"
            }
        }
        
        stage("destroy"){
            steps{
                echo "bye con numero"
            }
        }
    }
}
