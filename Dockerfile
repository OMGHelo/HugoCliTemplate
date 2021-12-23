# UltroidCli
# Copyright (C) 2021 Akash Pattnaik
#
# This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
# PLease read the GNU Affero General Public License in
# <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

FROM python:3.9

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
    && pip install --no-cache-dir -r TeamHugoX/requirements.txt \
    && pip install install av --no-binary av

# Run Hugo
CMD ["./hugo", "heroku"]
