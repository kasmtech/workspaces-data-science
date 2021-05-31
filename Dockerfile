FROM kasmweb/core-cuda-bionic:develop-rolling

USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
WORKDIR $HOME

######### START CUSTOMIZATION ########

RUN apt-get update && apt-get install -y \
        libasound2 \
        libegl1-mesa \
        libgl1-mesa-glx \
        libxcomposite1 \
        libxcursor1 \
        libxi6 \
        libxrandr2 \
        libxrandr2 \
        libxss1 \
        libxtst6 \
    && cd /tmp/ && wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh \
    && bash Anaconda3-20*-Linux-x86_64.sh -b -p /opt/anaconda3 \
    && rm -r /tmp/Anaconda3-20*-Linux-x86_64.sh \
    && echo 'source /opt/anaconda3/bin/activate' >> /etc/bash.bashrc \
    # Update all the conad things
    && bash -c "source /opt/anaconda3/bin/activate \
        && conda update -n root conda  \
        && conda update --all \
        && conda clean --all" \
    && /opt/anaconda3/bin/conda config --set ssl_verify /etc/ssl/certs/ca-certificates.crt \
    && /opt/anaconda3/bin/conda install pip \
    && mkdir -p /home/kasm-user/.pip \
    && chown -R 1000:1000 /opt/anaconda3 /home/kasm-default-profile/.conda/ 

#RStudio Server
RUN apt-get update && apt-get -y install \
        software-properties-common \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
    && add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' \
    && apt-get update && apt-get install -y \
        gdebi-core \
        r-base \
    && cd /tmp && wget https://download2.rstudio.org/server/xenial/amd64/rstudio-server-1.4.1106-amd64.deb \
    && gdebi --n rstudio-server-*-amd64.deb \
    && rm -f rstudio-server-*-amd64.deb 

#RStudio
RUN apt-get update && apt-get -y install \
        software-properties-common \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
    && add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' \
    && apt-get update && apt-get install -y \
        gdebi-core \
        r-base \
    && cd /tmp && wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.4.1106-amd64.deb \
    && gdebi --n rstudio-*-amd64.deb \
    && rm -f rstudio-*-amd64.deb \
    && cp /usr/share/applications/rstudio.desktop $HOME/Desktop/ \
    && chmod +x $HOME/Desktop/*.desktop

# Install Chrome
COPY resources/install_chrome.sh /tmp/
RUN bash /tmp/install_chrome.sh

# Install MS Edge
COPY resources/install_edge.sh /tmp/
RUN bash /tmp/install_edge.sh

COPY resources/RStudio.desktop $HOME/Desktop/
COPY resources/spyder.desktop $HOME/Desktop/
COPY resources/jupyter.desktop $HOME/Desktop/

# Install example packages in the conda environment
USER 1000
RUN bash -c "source /opt/anaconda3/bin/activate \
    && conda activate \
    && pip install \
        folium \
        pgeocode \
    && conda install -c conda-forge \
        basemap \
        matplotlib" 
    
USER root

COPY resources/post_run_root.sh /dockerstartup/kasm_post_run_root.sh

######### END CUSTOMIZATIONS ########

RUN chown -R 1000:0 $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000

CMD ["--tail-log"]
