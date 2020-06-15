# ABCI Environment Setup

## Install Conda for Virtual Environment

Access [conda page](https://docs.conda.io/en/latest/miniconda.html) and find latest version installer url.


```
wget [INSTALLER URL]
bash [INSTALLER.sh]
```

While installing conda, a following question appears.

```
Do you wish the installer to initialize Anaconda3 in your /home/user1/.bashrc ? [yes|no]
```

If you choose yes, conda automatically adds intializing script to .bachrc. If you choose no, you have to add some scripts to .bashrc manually.

## Create Virtual Environment

Create a new virtual environment with name and python version sepecification. About usage of conda, please refer [this url](https://minus9d.hatenablog.com/entry/2016/01/29/235916).

```
conda create --name nao python=3.7
```

Then, activaing new environment by a following script.

```
conda activate nao
```