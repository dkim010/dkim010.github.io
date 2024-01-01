FROM sharelatex/sharelatex:4.2

RUN bash -lc " \
    apt-get update \
    && apt-get install -y texlive-fonts-extra \
    && apt-get clean"
RUN bash -lc " \
    tlmgr update --self; \
    tlmgr install array enumitem ragged2e geometry fancyhdr xcolor ifxetex xifthen etoolbox setspace fontspec \
		unicode-math fontawesome sourcesanspro tcolorbox parskip hyperref ifmtarg xkeyval pgf environ tikzfill; \
	texhash;"
ENTRYPOINT []
