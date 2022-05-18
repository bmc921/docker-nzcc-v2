FROM --platform=linux/amd64  ubuntu:latest 

ENV PATH=/opt/miniconda/bin:$PATH

# add required packages
RUN apt-get update --fix-missing && \
    apt-get install -y apt-utils wget bzip2 ca-certificates curl git binutils vim make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/miniconda && \
    rm ~/miniconda.sh && \
    /opt/miniconda/bin/conda clean -tipsy && \
    ln -s /opt/miniconda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# add requirements file create env and activate environment when container is run
ADD requirements.txt /test/requirements.txt
RUN conda create --name nzcc-env-v2 --file /test/requirements.txt --channel au-eoed --channel conda-forge python=3.9 \
&& conda clean --all -y; sync \
&& conda clean -tipsy && sync 

RUN echo "conda activate nzcc-env-v2" >> ~/.bashrc