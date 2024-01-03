rule run0:
    shell:
        "python src/run_mod0.py"

rule run1:
    shell:
        "python src/run_mod1.py"

rule run2:
    shell:
        "python src/run_mod2.py"

rule force_all:
    shell:
        """
        python src/run_mod0.py \
        && python src/run_mod1.py \
        && python src/run_mod2.py
        """

rule make_all_notebooks:
    shell:
        """
        jupytext src/*.py --to notebook
        """

rule run_all_notebooks:
    shell:
        """
        jupyter nbconvert --execute --to pdf src/*.ipynb \
        && mv src/*.ipynb notebooks \
        && mv src/*.pdf notebooks
        """
