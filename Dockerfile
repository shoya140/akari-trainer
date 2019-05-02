FROM nvidia/cuda:9.2-cudnn7-devel

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update
RUN apt-get install -y git wget

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
RUN /bin/bash /tmp/miniconda.sh -b -p /opt/conda
RUN ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
ENV PATH /opt/conda/bin:$PATH

RUN conda create --name py36 python=3.6
RUN echo "conda activate py36" >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

COPY yukarin/requiremets.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN git clone https://github.com/yamachu/WORLD4py /tmp/WORLD4py
RUN cd /tmp/WORLD4py && python setup.py install

ENV PYTHONPATH /proj/yukarin/
WORKDIR /proj
