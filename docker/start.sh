#!/bin/bash

git clone https://github.com/francisbesset/spksrc.git
cd spksrc

make setup

cd spk/inotify-tools
make arch-88f6281
