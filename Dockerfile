FROM ubuntu:18.04
WORKDIR /root

ARG VULKAN_VERSION

ENV PATH="/root/bin:${PATH}"

RUN apt-get update
RUN apt-get -y install wget
#RUN apt-get -y install git

RUN mkdir /root/applications
RUN mkdir /root/bin

# <crystal>
RUN apt-get -y install libxml2-dev libssl-dev libreadline-dev libgmp-dev libyaml-dev libpcre3-dev libevent-dev

RUN wget https://github.com/crystal-lang/crystal/releases/download/0.26.1/crystal-0.26.1-1-linux-x86_64.tar.gz
RUN tar -xvf crystal-0.26.1-1-linux-x86_64.tar.gz
RUN mv crystal-0.26.1-1 applications/crystal
RUN ln -s /root/applications/crystal/bin/crystal ./bin/crystal
RUN ln -s /root/applications/crystal/bin/shards ./bin/shards
RUN chmod +x ./bin/crystal
RUN chmod +x ./bin/shards
# </crystal>

# <crystal_lib>
RUN apt-get -y install llvm-6.0-dev clang libclang-6.0-dev
# </crystal_lib>

# <vulkan_sdk>
ENV VULKAN_SDK="/root/vulkan" \
    PATH=$VULKAN_SDK/bin:$PATH \
    LD_LIBRARY_PATH=$VULKAN_SDK/lib:$LD_LIBRARY_PATH \
    VK_LAYER_PATH=$VULKAN_SDK/etc/explicit_layer.d

ADD ./sdks/vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.gz .
RUN mv $VULKAN_VERSION $VULKAN_SDK
# </vulkan_sdk>

COPY . /root/self

# <crystal_lib>
RUN crystal build /root/self/crystal_lib/src/main.cr
# </crystal_lib>
