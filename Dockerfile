# ========
# Stage 1: Base image including OS and key packages
# ========
FROM ubuntu:20.04 AS nix-base

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends \
      software-properties-common \
      wget \
      curl \
      sudo \
      vim \
      xz-utils \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*


# DOCKER_USER for the Docker user
ENV DOCKER_USER=ubuntu

# Setup default user
RUN useradd --create-home -s /bin/bash -m $DOCKER_USER && echo "$DOCKER_USER:Portland" | chpasswd && adduser $DOCKER_USER sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# COPY bash_profile /home/$DOCKER_USER/.bash_profile
# RUN chown $DOCKER_USER:$DOCKER_USER /home/$DOCKER_USER/.bash_profile


# ========
# Stage 2: Nix image
# ========
FROM nix-base AS nix-tool

WORKDIR /home/$DOCKER_USER
USER $DOCKER_USER

# Install nix
RUN curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
RUN mkdir -p /home/$DOCKER_USER/.config/nix/
RUN echo 'experimental-features = nix-command flakes' >> /home/$DOCKER_USER/.config/nix/nix.conf

ENV PATH="/home/$DOCKER_USER/.nix-profile/bin:$PATH"

CMD ["bash", "-l"]
