FROM elixir:1.9-alpine

ARG UID=1000
ARG GID=1000
ARG PLEROMA_VER=develop

ENV MIX_ENV prod
ENV USER pleroma
ENV HOME /app
WORKDIR $HOME

RUN apk add --no-cache \
       build-base git \
    && addgroup -S $USER -g $GID \
    && adduser -S -G $USER -u $UID -h $HOME $USER \
    && git clone -b develop https://git.pleroma.social/pleroma/pleroma.git $HOME \
    && git checkout ${PLEROMA_VER}

COPY config/secret.exs $HOME/config/prod.secret.exs
COPY entrypoint.sh $HOME/

RUN mix local.rebar --force \
    && mix local.hex --force \
    && mix deps.get \
    && mix compile

VOLUME /pleroma/uploads/

CMD ["mix", "phx.server"]
