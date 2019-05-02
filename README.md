# akarin

```
$ git clone --recursive git@github.com:shoya140/akarin.git
```


## Notice: Using Jupyter Notebook in VCS

Please start jupyter notebook with this option

```
$ jupyter notebook --config=.ipynb_config.py
```

... or add the following code into ~/.jupyter/jupyter_notebook_config.py

```
def scrub_output_pre_save(model, **kwargs):
    """scrub output before saving notebooks"""
    # only run on notebooks
    if model['type'] != 'notebook':
        return
    # only run on nbformat v4
    if model['content']['nbformat'] != 4:
        return

    for cell in model['content']['cells']:
        if cell['cell_type'] != 'code':
            continue
        cell['execution_count'] = None

c.FileContentsManager.pre_save_hook = scrub_output_pre_save
```

