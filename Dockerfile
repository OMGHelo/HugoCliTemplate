FROM teamhugox/hugo:main

# Set Timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set workfir
RUN mkdir /HugoCli
WORKDIR /HugoCli

# download the latest release from github
RUN ver=$(curl https://raw.githubusercontent.com/OMGHelo/HugoCli/main/version.txt) && curl -L -o hugo https://github.com/OMGHelo/HugoCli/releases/download/$ver/hugo-linux

# Give Permissions
RUN chmod u+x hugo

# Install Dependencies
RUN pip install -U pip \
    && pip install --no-cache-dir -r OMGHelo/requirements.txt \
    && pip install install av --no-binary av

# Run Hugo
CMD ["./hugo", "heroku"]
