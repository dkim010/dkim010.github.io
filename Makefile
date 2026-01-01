.PHONY: init serve cv-build-image cv-push-image cv

init:
	uv sync

serve:
	uv run mkdocs serve

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
