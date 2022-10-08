#!/bin/bash

TAG="v0.0.0"
cd commons
go mod edit -replace github.com/bots-garden/capsule-registry@${TAG}=../

cd ..
git add .
git commit -m "📦 updates modules for ${TAG}"

git tag ${TAG}
git tag commons/${TAG}

git push origin main ${TAG} commons/${TAG}
