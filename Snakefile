# other files for small rules to keep this file tidy
include: "snakemake/data.smk"
include: "snakemake/notebooks.smk"
include: "snakemake/housekeeping.smk"


# TODO: switch to using input and output directives to take advantage of snakemake's caching
# TODO: pass the data file as a parameter to the pipeline to the notebooks
""" Pipeline

The "official" pipeline

"""
rule run_on_subset:
    shell:
        """
        black src/ \
        && jupytext src/*.py --to notebook \
        && jupyter nbconvert --execute --to pdf src/*.ipynb \
        && mv src/*.ipynb notebooks \
        && mv src/*.pdf notebooks
        """


rule run_on_full:
    shell:
        """
        black src/ \
        && jupytext src/*.py --to notebook \
        && jupyter nbconvert --execute --to pdf src/*.ipynb \
        && mv src/*.ipynb notebooks \
        && mv src/*.pdf notebooks
        """








