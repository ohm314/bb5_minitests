#!/bin/bash

pushd hpl
./run.sh
popd
pushd ior
./run.sh
popd
pushd osu
./run.sh
popd
