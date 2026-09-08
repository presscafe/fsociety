# Use Python 3.11 Slim
FROM python:3.11-slim

# Update Repos
RUN apt-get update \
  && apt-get install -qq -y --no-install-recommends build-essential sudo git wget curl nmap ruby \
  && apt-get clean

# Install Python dependecies
RUN pip install requests

# Install fsociety
RUN git clone https://github.com/Manisso/fsociety.git \
  && cd fsociety \
  && chmod +x install.sh \
  && ./install.sh

# Change workdir
WORKDIR /root/.fsociety/

# Keep container running with clean approach
CMD ["sleep", "infinity"]
