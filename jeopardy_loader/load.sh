#$/bin/bash

brew install virtualenv
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
curl -L -o data.json https://drive.google.com/uc\?export\=download\&id\=1akqpLWBhYPXBguyLSZEFnHv9SRCxAO8h
python load.py --filename data.json --table JeopardyQuestions --prod