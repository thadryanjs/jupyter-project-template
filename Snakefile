""" Scripts

Running the base scripts that make up the project

"""
rule run0:
    shell:
        "python src/run_mod0.py"

rule run1:
    shell:
        "python src/run_mod1.py"

rule force_all:
    shell:
        """
        python src/run_mod0.py \
        && python src/run_mod1.py
        """


""" Notebooks

Convert the scripts to notebooks (using the jupytext method)

"""

# creates ipynbs from source files, executes them, write pdfs for easy reading
rule run_notebooks_pdf:
    shell:
        """
        jupytext src/*.py --to notebook \
        && jupyter nbconvert --execute --to pdf src/*.ipynb \
        && mv src/*.ipynb notebooks \
        && mv src/*.pdf notebooks
        """


""" Housekeeping

Misc stuff to keep things tidy

"""

rule format_source:
    shell:
        "black src/"
