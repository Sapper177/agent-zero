# Use the pre-built base image for A0
# FROM agent-zero-base:local
# FROM agent0ai/agent-zero-base:testing
FROM jaredmerenuk/agent-zero-base:latest

ARG CACHE_DATE=none

# Check if the argument is provided, else throw an error
ARG BRANCH="main"
ENV BRANCH=$BRANCH

# Copy filesystem files to root
COPY ./fs/ /

# pre installation steps
RUN bash /ins/pre_install.sh $BRANCH \
    # install A0
    && bash /ins/install_A0.sh $BRANCH \
    # install additional software
    && bash /ins/install_additional.sh $BRANCH \
    # cleanup repo and install A0 without caching, this speeds up builds
    && echo "cache buster $CACHE_DATE" && bash /ins/install_A02.sh $BRANCH \
    # post installation steps
    && bash /ins/post_install.sh $BRANCH \
    && chmod +x /exe/initialize.sh /exe/run_A0.sh /exe/run_searxng.sh /exe/run_tunnel_api.sh

# Expose ports
EXPOSE 22 80 9000-9009

# initialize runtime and switch to supervisord
CMD ["/exe/initialize.sh", "$BRANCH"]
