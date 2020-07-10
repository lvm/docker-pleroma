#!/bin/sh
mix ecto.create \
    && mix ecto.migrate \
    && mix web_push.gen.keypair
