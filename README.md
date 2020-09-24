# Python 3.7.5 alpine Development environment

## Python Version
- `3.7.5`

## Useing this contaier

### example
- build
    - `docker build -t dev-python .`
- run
    - `docker run -itd -v $(pwd)/src:usr/local/src --name dev-python dev-python `

## Python source code
- `./src` is mounting at `usr/local/src` on `alpine container` by docker

## Using python
- example
    - `python example.py`
  
## Auto set PYTHONPATH , if you use `python`
- It`s exported pythonpath by auto when use python
    - auto set shell is python 


