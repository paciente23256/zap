stage('OWASP ZAP setup'){
    sh "docker pull owasp/zap2docker-stable"
    sh "docker run --rm -d -u zap --name zap -p 4449:4449 -i 
        owasp/zap2docker-stable 
        zap.sh # A start up script provided by ZAP
        -daemon # Inicia em modo de configuração headless
        -host 0.0.0.0 # ZAP host
        -port 4449 # ZAP port 
        -config api.addrs.addr.name=.*
        -config api.addrs.addr.regex=true # permite a ligação de qualquer IP
        -config api.key=testypon" # Api key a ser usada
