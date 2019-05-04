# akarin

## How to use

Set up

```
$ git clone --recursive git@github.com:shoya140/akarin.git
$ cd akarin
$ docker build . -t akarin
```

### Step 1: Convert acoustic feature

Feature calculation

```
$ docker run -it --rm -v $PWD:/proj akarin \
    python yukarin/scripts/extract_acoustic_feature.py \
    --input_glob data/sample/speaker_1/v_\*.wav \
    --output data/working/speaker_1_npy/ \
    --sampling_rate 44100
$ docker run -it --rm -v $PWD:/proj akarin \
    python yukarin/scripts/extract_acoustic_feature.py \
    --input_glob data/sample/speaker_2/v_\*.wav \
    --output data/working/speaker_2_npy/ \
    --sampling_rate 44100

$ docker run -it --rm -v $PWD:/proj akarin \
    python yukarin/scripts/extract_align_indexes.py \
    --input_glob1 data/working/speaker_1_npy/v_\*.npy \
    --input_glob2 data/working/speaker_2_npy/v_\*.npy \
    --output data/working/indexes_sample
```

Train

```
$ docker run -it --rm -v $PWD:/proj akarin \
    python yukarin/train.py \
    data/sample/config.json \
    data/working/model_sample/
```

Test

```
WIP!
$ docker run -it --rm -v $PWD:/proj akarin \
    python convert_acoustic_feature.py \
    --input_glob data/sample/test/v_\*.wav \
    --output data/output/sample \
    --vc_model data/working/model_sample \
    --vc_config ???
```

### Step 2: Apply pix2pix

WIP

## Notice: Using Jupyter Notebook in VCS

Please start jupyter notebook with this option

```
$ jupyter notebook --config=.ipynb_config.py
```

or add the following code into ~/.jupyter/jupyter_notebook_config.py

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

