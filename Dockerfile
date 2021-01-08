FROM continuumio/miniconda:latest

WORKDIR /home/docker_conda_template

COPY environment.yml ./
COPY test.py ./
COPY templates templates/
COPY static static/


COPY boot.sh ./


RUN chmod +x boot.sh

RUN conda env create -f environment.yml

# RUN echo "source activate testenv" < ~/.bashrc
ENV PATH /opt/conda/envs/testenv2/bin:$PATH

EXPOSE 3200

ENTRYPOINT ["./boot.sh"]