#!/bin/bash

#copy scripts VERSION file to put it into the image
cp ../../VERSION ./

. ../../settings.bash
export IMAGE_NAME=${BASE_REGISTRY:+${BASE_REGISTRY}/}developmentimage/ros_kinetic_16.04

export BASE_IMAGE=nvidia/opengl:1.0-glvnd-devel-ubuntu16.04
export INSTALL_SCRIPT=install_ros_dependencies.bash
export INSTALL_ARGS=kinetic

docker pull $BASE_IMAGE
docker build --no-cache -f Dockerfile -t $IMAGE_NAME:base --build-arg BASE_IMAGE --build-arg INSTALL_SCRIPT --build-arg INSTALL_ARGS --label "base-image-name=$IMAGE_NAME:base" --label "base-image-created-from=${BASE_IMAGE} - $(docker inspect --format '{{.Id}}' $BASE_IMAGE)" --label "dockerfile_repo_commit=$(git rev-parse HEAD)" .

# remove VERSION file from here
rm -rf VERSION

echo
echo "don't forget to push the image if you wish:"
echo "docker push $IMAGE_NAME:base"
echo
