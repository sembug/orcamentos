install:
	pip install -r requirements-dev.txt

migrate:
	./manage.py makemigrations crm proposal
	./manage.py migrate

test:
	python manage.py test -n

mer:
	./manage.py graph_models -a -g -o dev/orcamentos.png

createuser:
	./manage.py createsuperuser --username='admin' --email=''

shell_num_last_proposal:
	./manage.py shell < shell/shell_num_last_proposal.py

shell_occupation:
	./manage.py shell < shell/shell_occupation.py

shell_employee:
	./manage.py shell < shell/shell_employee.py

shell_person:
	./manage.py shell < shell/shell_person.py

shell_customer:
	./manage.py shell < shell/shell_customer.py

shell_work:
	./manage.py shell < shell/shell_work.py

shell_entry:
	./manage.py shell < shell/shell_entry.py

shell_proposal:
	./manage.py shell < shell/shell_proposal.py

shell_contract:
	./manage.py shell < shell/shell_contract.py

selenium_login:
	python selenium/selenium_login.py

selenium_entry:
	python selenium/selenium_entry.py

selenium_person:
	python selenium/selenium_person.py

selenium_customer:
	python selenium/selenium_customer.py

selenium_work:
	python selenium/selenium_work.py

selenium_registration:
	python selenium/selenium_registration.py

selenium_all_pages:
	python selenium/selenium_all_pages.py

backup:
	./manage.py dumpdata --format=json --indent=2 > fixtures.json

load:
	./manage.py loaddata fixtures.json

run:
	./manage.py runserver

initial: install migrate createuser load

initial2: install migrate createuser shell_employee shell_person shell_customer shell_work shell_entry shell_proposal shell_contract

createdata: shell_employee shell_person shell_customer shell_work shell_entry shell_proposal shell_contract