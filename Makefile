.PHONY: init serve latex

init:
	uv sync

serve:
	uv run mkdocs serve

latex:
	echo ${PWD}
	docker run -it --rm \
		-v ${PWD}:/data:rw \
		texlive/texlive:latest-full \
		bash -c "echo start... \
			&& mkdir -p /data/latex-build \
			&& cp -rf /data/latex/* /data/latex-build \
			&& cd /data/latex-build \
			&& xelatex main.tex"
	cp latex-build/main.pdf latex/
