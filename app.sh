#!/bin/bash

export DB_HOST=mongodb://10.0.3.169:27017/posts

cd /tech257_sparta_app/app

npm install

node seeds/seed.js

pm2 kill 

pm2 start app.js

