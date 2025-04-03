# Use Ubuntu as the base image
FROM ubuntu:18.04

# Set non-interactive installation mode (no prompts during installs)
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies for building and running the application
RUN apt-get update && \
    apt-get install -y \
    mono-complete \
    imagemagick \
    gnome-screenshot \
    wget \
    gtk-sharp2 \
    libgtk2.0-0 \
    xprintidle \
    xdotool \
    build-essential \
    gawk \
    gcc \
    make \
    x11-apps \
    autoconf \
    automake \
    pkg-config \
    libglib2.0-dev \
    libpango1.0-dev \
    libatk1.0-dev \
    libgtk2.0-dev \ 
    && apt-get clean



# Copy the local Screenshot Monitor executable into the container
RUN mkdir -p /usr/local/bin/Screenshot_Monitor
COPY ./* /usr/local/bin/Screenshot_Monitor

# Set the working directory
WORKDIR /usr/local/bin/Screenshot_Monitor

# Set the entrypoint to run Screenshot Monitor
RUN chmod +x "Screenshot Monitor.exe"

ENTRYPOINT ["/usr/bin/mono", "Screenshot Monitor.exe" ]

