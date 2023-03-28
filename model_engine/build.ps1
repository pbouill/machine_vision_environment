$REQ_FILE_VER = curl -s "https://api.github.com/repos/pbouill/model_engine/commits?path=requirements.txt&page=1&per_page=1" | jq -r '.[0].sha'      
$REPO_VER = (git ls-remote https://github.com/pbouill/model_engine.git).split()[0]
echo "Preparing to build the image with arguments..."
echo "Last commit of requirements.txt: $REQ_FILE_VER"
echo "Last commit of model_engine app: $REPO_VER"
docker build --build-arg REQ_FILE_VER=$REQ_FILE_VER --build-arg REPO_VER=$REPO_VER -t pbouill/model_engine:latest $PSScriptRoot