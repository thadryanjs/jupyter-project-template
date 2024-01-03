# other files for small rules to keep this file tidy
include: "snakemake/data.smk"
include: "snakemake/notebooks.smk"
include: "snakemake/housekeeping.smk"


# TODO: switch to using input and output directives to take advantage of snakemake's caching
# TODO: pass the data file as a parameter to the pipeline to the notebooks
# TODO: can I make the whole shell command a string, then interpolate into it so I don't have to update it in each rule?
""" Pipeline

The "official" pipeline

"""
rule run_on_subset:
    shell:
        """
        black src/ \
        && jupytext src/*.py --to notebook \
        && jupyter nbconvert --execute --to pdf src/run_mod0.ipynb \
        && arg1=1 arg2="Hello World" \
            jupyter nbconvert --execute --to pdf src/run_mod1.ipynb \
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








