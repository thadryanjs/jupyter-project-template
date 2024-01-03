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

# convert all scripts to notebooks (doesn't run them)
rule make_all_notebooks:
    shell:
        """
        jupytext src/*.py --to notebook
        """

# execute and write pdfs for easy reading
rule run_all_notebooks:
    shell:
        """
        jupyter nbconvert --execute --to pdf src/*.ipynb \
        && mv src/*.ipynb notebooks \
        && mv src/*.pdf notebooks
        """

""" Housekeeping

Misc stuff to keep things tidy

"""

rule format_source:
    shell:
        "black src/"
