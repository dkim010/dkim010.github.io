.PHONY: init requirements serve cv-build-image cv-push-image cv

init:
	pip install poetry==1.4.2
	poetry config installer.modern-installation false

requirements:
	poetry export -f requirements.txt --output requirements.txt --without-hashes

serve:
	poetry run mkdocs serve

cv-build-image:
	cd latex && docker build -t dkim010/mycv .
cv-push-image:
	docker push dkim010/mycv
cv:
	docker run -it --rm -v "${PWD}/latex/src:/data" dkim010/mycv bash -lc "( \
			echo hello; \
			cd /data; \
			xelatex -fmt=xelatex -interaction=nonstopmode main.tex; \
		); echo done"
