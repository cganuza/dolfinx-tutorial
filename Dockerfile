FROM ubuntu:20.04
FROM dolfinx/lab
#FROM dolfinx/lab
# install the notebook package
RUN pip3 install --no-cache --upgrade pip && \
    pip3 install --no-cache notebook

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}


WORKDIR ${HOME}
COPY . ${HOME}
USER ${USER}

# FROM dolfinx/lab
# USER root
# ARG NB_USER=jovyan
# ARG NB_UID=1000
# ENV USER ${NB_USER}
# ENV NB_UID ${NB_UID}
# ENV HOME /home/${NB_USER}

# RUN adduser --disabled-password \
#     --gecos "Default user" \
#     --uid ${NB_UID} \
#     ${NB_USER}


# # Make sure the contents of our repo are in ${HOME}
# WORKDIR ${HOME}
# COPY . ${HOME}

# RUN chown -R ${NB_UID} ${HOME}
# USER ${NB_USER}
# ENTRYPOINT []