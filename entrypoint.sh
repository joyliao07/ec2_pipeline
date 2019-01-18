#! /bin/bash

set -e

cd /src

python3 manage.py makemigrations --noinput && \
python3 manage.py migrate --noinput && \
python3 manage.py collectstatic --noinput && \

gunicorn kickstarter.wsgi:application -w 3 -b :8000
