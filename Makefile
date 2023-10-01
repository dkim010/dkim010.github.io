init:
	pip install poetry==1.4.2
	poetry config installer.modern-installation false

requirements:
	poetry export -f requirements.txt --output requirements.txt --without-hashes

serve:
	poetry run mkdocs serve

latex:
	echo TBD
