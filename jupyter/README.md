: jupyter notebook
```bash
jupyter notebook --ip=0.0.0.0 --allow-root --no-browser
```

: jupyter-lab
```bash
# in Docker
jupyter-lab --allow-root --no-browser --ip=0.0.0.0 --port=8888 --NotebookApp.token='SOME_TOKEN' --notebook-dir=DIR_NAME
```
