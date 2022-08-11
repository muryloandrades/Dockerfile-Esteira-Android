FROM circleci/android:api-26-node

# RUN java -version
# ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip"
# ENV ANDROID_TOOLS_ROOT="/opt/android_sdk"
# ENV ANDROID_SDK_ARCHIVE="${ANDROID_TOOLS_ROOT}/archive"
# ENV PATH="${ANDROID_TOOLS_ROOT}/tools:${PATH}"
# ENV PATH="${ANDROID_TOOLS_ROOT}/tools/bin:${PATH}"

ENV FLUTTER_ROOT="/opt/flutter"
ENV PATH="${FLUTTER_ROOT}/bin:${PATH}"
ENV ANDROID_HOME="${ANDROID_TOOLS_ROOT}"
# USER rootdo
# RUN apt update -y
# RUN apt install -y \
#   git \
#   wget \
#   curl \
#   unzip \
#   lib32stdc++6 \
#   libglu1-mesa 

# RUN mkdir -p "${ANDROID_TOOLS_ROOT}"
# RUN wget -q "${ANDROID_SDK_URL}" -O "${ANDROID_SDK_ARCHIVE}"
# RUN unzip -q -d "${ANDROID_TOOLS_ROOT}" "${ANDROID_SDK_ARCHIVE}"
# RUN mkdir -p "${ANDROID_TOOLS_ROOT}/tools/bin/sdkmanager"
# RUN yes "y" | "${ANDROID_TOOLS_ROOT}/tools/bin/sdkmanager" "build-tools;28.0.0"
# RUN yes "y" | "${ANDROID_TOOLS_ROOT}/tools/bin/sdkmanager" "platforms;android-28"
# RUN yes "y" | "${ANDROID_TOOLS_ROOT}/tools/bin/sdkmanager" "platform-tools"
# RUN rm "${ANDROID_SDK_ARCHIVE}"


USER root
RUN git clone -b stable https://github.com/flutter/flutter "${FLUTTER_ROOT}"
#RUN flutter config  --no-analytics
RUN dart --version
#RUN flutter --version --machine
#RUN flutter precache
#RUN yes "y" | flutter doctor --android-licenses
RUN flutter upgrade
RUN flutter doctor -v

ENTRYPOINT [ "flutter" ]
