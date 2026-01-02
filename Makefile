.PHONY: init serve latex

init:
	uv sync

serve:
	uv run mkdocs serve

latex:
	echo ${PWD}
	docker run -it --rm \
		-v ${PWD}/latex:/data:rw \
		texlive/texlive:latest-full \
		bash -c "echo start... \
			&& cp -rf /data/src/* /data/build \
			&& cd /data/build \
			&& xelatex main.tex"
	cp latex/build/main.pdf latex/
