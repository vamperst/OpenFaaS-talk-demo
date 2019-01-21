#!/bin/bash
curl -sL cli.openfaas.com | sudo sh
git clone https://github.com/openfaas/faas
cd faas && \
  git checkout 0.9.14
./deploy_stack.sh

#####
#  username: admin
#  password: 097b9345f11be650dcdafb2628227a35342a2b14baca3c3dfe503d7bc35ccbf1
#mostrar o grafana
#127.0.0.1:8080

docker service create -d \
--name=func_grafana \
--publish=3000:3000 \
--network=func_functions \
stefanprodan/faas-grafana:4.6.3


#mostrar o grafana
#127.0.0.1:3000

faas-cli template pull

faas-cli new --list
cd ..
mkdir demo-func
cd demo-func
faas-cli new --lang python3 demo-html

# adicionar as linhas no arquivo demo-html.yml
# environment:
#       content_type: text/html
echo "requests" > ./demo-html/requirements.txt

## >>>>> copiar conteudo do demo-html.yml
## >>>>> copiar conteudo do getMeme.py para demo-html/handler.py

faas-cli login --username admin --password 097b9345f11be650dcdafb2628227a35342a2b14baca3c3dfe503d7bc35ccbf1

faas-cli build -f ./demo-html.yml
faas-cli deploy -f ./demo-html.yml


docker service logs -f demo-html


