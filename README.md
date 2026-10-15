[![build images](https://github.com/panasaurus/images/actions/workflows/build.yml/badge.svg)](https://github.com/panasaurus/images/actions/workflows/build.yml)

## Registry layout

All images live in **one** repository on GHCR — `ghcr.io/panasaurus/images` — and are distinguished by tag. This keeps pulls, retention policies and access control simple, and it means eggs only ever reference a single image namespace.

```bash
docker pull ghcr.io/panasaurus/images:java_21
docker run ghcr.io/panasaurus/images:java_21
```

### Java

HotSpot (Temurin) and OpenJ9 (Semeru) JDKs, Java 8 through 26.

| tag | platforms | image |
|---|---|---|
| `:java_8` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_8` |
| `:java_8j9` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_8j9` |
| `:java_11` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_11` |
| `:java_11j9` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_11j9` |
| `:java_16` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_16` |
| `:java_16j9` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_16j9` |
| `:java_17` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_17` |
| `:java_17j9` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_17j9` |
| `:java_18` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_18` |
| `:java_18j9` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_18j9` |
| `:java_19` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_19` |
| `:java_19j9` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_19j9` |
| `:java_21` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_21` |
| `:java_22` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_22` |
| `:java_23` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_23` |
| `:java_24` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_24` |
| `:java_25` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_25` |
| `:java_26` · `:java_latest` | amd64 + arm64 | `ghcr.io/panasaurus/images:java_26` |

### Node.js

Node.js runtimes with the tools eggs commonly need.

| tag | platforms | image |
|---|---|---|
| `:nodejs_12` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_12` |
| `:nodejs_14` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_14` |
| `:nodejs_15` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_15` |
| `:nodejs_16` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_16` |
| `:nodejs_17` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_17` |
| `:nodejs_18` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_18` |
| `:nodejs_19` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_19` |
| `:nodejs_20` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_20` |
| `:nodejs_21` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_21` |
| `:nodejs_22` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_22` |
| `:nodejs_23` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_23` |
| `:nodejs_24` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_24` |
| `:nodejs_25` · `:nodejs_latest` | amd64 + arm64 | `ghcr.io/panasaurus/images:nodejs_25` |

### Python

CPython runtimes plus a build toolchain for source wheels.

| tag | platforms | image |
|---|---|---|
| `:python_3.7` | amd64 + arm64 | `ghcr.io/panasaurus/images:python_3.7` |
| `:python_3.8` | amd64 + arm64 | `ghcr.io/panasaurus/images:python_3.8` |
| `:python_3.9` | amd64 + arm64 | `ghcr.io/panasaurus/images:python_3.9` |
| `:python_3.10` | amd64 + arm64 | `ghcr.io/panasaurus/images:python_3.10` |
| `:python_3.11` | amd64 + arm64 | `ghcr.io/panasaurus/images:python_3.11` |
| `:python_3.12` | amd64 + arm64 | `ghcr.io/panasaurus/images:python_3.12` |
| `:python_3.13` · `:python_latest` | amd64 + arm64 | `ghcr.io/panasaurus/images:python_3.13` |
| `:python_3.14` | amd64 + arm64 | `ghcr.io/panasaurus/images:python_3.14` |

### Go

Full Go toolchains; generic images able to build and run Go programs.

| tag | platforms | image |
|---|---|---|
| `:go_1.14` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.14` |
| `:go_1.15` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.15` |
| `:go_1.16` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.16` |
| `:go_1.17` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.17` |
| `:go_1.18` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.18` |
| `:go_1.19` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.19` |
| `:go_1.20` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.20` |
| `:go_1.21` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.21` |
| `:go_1.22` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.22` |
| `:go_1.23` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.23` |
| `:go_1.24` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.24` |
| `:go_1.25` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.25` |
| `:go_1.26` · `:go_latest` | amd64 + arm64 | `ghcr.io/panasaurus/images:go_1.26` |

### .NET

Microsoft .NET SDK images for Terraria/TShock and friends.

| tag | platforms | image |
|---|---|---|
| `:dotnet_2.1` | amd64 + arm64 | `ghcr.io/panasaurus/images:dotnet_2.1` |
| `:dotnet_3.1` | amd64 + arm64 | `ghcr.io/panasaurus/images:dotnet_3.1` |
| `:dotnet_5` | amd64 + arm64 | `ghcr.io/panasaurus/images:dotnet_5` |
| `:dotnet_6` | amd64 + arm64 | `ghcr.io/panasaurus/images:dotnet_6` |
| `:dotnet_7` | amd64 + arm64 | `ghcr.io/panasaurus/images:dotnet_7` |
| `:dotnet_8` | amd64 + arm64 | `ghcr.io/panasaurus/images:dotnet_8` |
| `:dotnet_9` · `:dotnet_latest` | amd64 + arm64 | `ghcr.io/panasaurus/images:dotnet_9` |
| `:dotnet_10` | amd64 + arm64 | `ghcr.io/panasaurus/images:dotnet_10` |

### Base operating systems

Minimal OS images with the core packages a game server needs.

| tag | platforms | image |
|---|---|---|
| `:alpine` | amd64 + arm64 | `ghcr.io/panasaurus/images:alpine` |
| `:debian` | amd64 + arm64 | `ghcr.io/panasaurus/images:debian` |
| `:debian_bookworm` | amd64 + arm64 | `ghcr.io/panasaurus/images:debian_bookworm` |
| `:debian_trixie` | amd64 + arm64 | `ghcr.io/panasaurus/images:debian_trixie` |
| `:ubuntu_24.04` · `:ubuntu` | amd64 + arm64 | `ghcr.io/panasaurus/images:ubuntu_24.04` |

### Game servers

Purpose-built images for specific games or engines.

| tag | platforms | image |
|---|---|---|
| `:altv` | amd64 | `ghcr.io/panasaurus/images:altv` |
| `:arma3` | amd64 | `ghcr.io/panasaurus/images:arma3` |
| `:conan_exiles` | amd64 | `ghcr.io/panasaurus/images:conan_exiles` |
| `:dayz` | amd64 | `ghcr.io/panasaurus/images:dayz` |
| `:hytale` | amd64 | `ghcr.io/panasaurus/images:hytale` |
| `:minetest` | amd64 + arm64 | `ghcr.io/panasaurus/images:minetest` |
| `:mohaa` | amd64 | `ghcr.io/panasaurus/images:mohaa` |
| `:mta` | amd64 + arm64 | `ghcr.io/panasaurus/images:mta` |
| `:rust` | amd64 | `ghcr.io/panasaurus/images:rust` |
| `:samp` | amd64 | `ghcr.io/panasaurus/images:samp` |
| `:source` | amd64 | `ghcr.io/panasaurus/images:source` |
| `:thebattleforwesnoth` | amd64 | `ghcr.io/panasaurus/images:thebattleforwesnoth` |
| `:valheim` | amd64 | `ghcr.io/panasaurus/images:valheim` |

### Egg installers

Not for running servers — used by egg install scripts to pre-install common dependencies.

| tag | platforms | image |
|---|---|---|
| `:installer_alpine` | amd64 + arm64 | `ghcr.io/panasaurus/images:installer_alpine` |
| `:installer_debian` | amd64 | `ghcr.io/panasaurus/images:installer_debian` |
| `:installer_ubuntu` | amd64 + arm64 | `ghcr.io/panasaurus/images:installer_ubuntu` |

### Applications

| tag | platforms | image |
|---|---|---|
| `:uptimekuma` | amd64 + arm64 | `ghcr.io/panasaurus/images:uptimekuma` |

### Bots

| tag | platforms | image |
|---|---|---|
| `:bot_bastion` | amd64 + arm64 | `ghcr.io/panasaurus/images:bot_bastion` |
| `:bot_parkertron` | amd64 + arm64 | `ghcr.io/panasaurus/images:bot_parkertron` |
| `:bot_red` | amd64 + arm64 | `ghcr.io/panasaurus/images:bot_red` |
| `:bot_sinusbot` | amd64 + arm64 | `ghcr.io/panasaurus/images:bot_sinusbot` |

### Box64

| tag | platforms | image |
|---|---|---|
| `:box64` | arm64 | `ghcr.io/panasaurus/images:box64` |

### Bun

| tag | platforms | image |
|---|---|---|
| `:bun_latest` | amd64 + arm64 | `ghcr.io/panasaurus/images:bun_latest` |
| `:bun_canary` | amd64 + arm64 | `ghcr.io/panasaurus/images:bun_canary` |

### Cassandra

| tag | platforms | image |
|---|---|---|
| `:cassandra_java8_python2` | amd64 | `ghcr.io/panasaurus/images:cassandra_java8_python2` |
| `:cassandra_java11_python3` | amd64 | `ghcr.io/panasaurus/images:cassandra_java11_python3` |

### Dart

| tag | platforms | image |
|---|---|---|
| `:dart_2.17` | amd64 + arm64 | `ghcr.io/panasaurus/images:dart_2.17` |
| `:dart_2.18` | amd64 + arm64 | `ghcr.io/panasaurus/images:dart_2.18` |
| `:dart_2.19` | amd64 + arm64 | `ghcr.io/panasaurus/images:dart_2.19` |
| `:dart_3.3` | amd64 + arm64 | `ghcr.io/panasaurus/images:dart_3.3` |
| `:dart_stable` · `:dart_latest` | amd64 + arm64 | `ghcr.io/panasaurus/images:dart_stable` |

### Elixir

| tag | platforms | image |
|---|---|---|
| `:elixir_1.12` | amd64 + arm64 | `ghcr.io/panasaurus/images:elixir_1.12` |
| `:elixir_1.13` | amd64 + arm64 | `ghcr.io/panasaurus/images:elixir_1.13` |
| `:elixir_1.14` | amd64 + arm64 | `ghcr.io/panasaurus/images:elixir_1.14` |
| `:elixir_1.15` | amd64 + arm64 | `ghcr.io/panasaurus/images:elixir_1.15` |
| `:elixir_latest` | amd64 + arm64 | `ghcr.io/panasaurus/images:elixir_latest` |

### End of Life

| tag | platforms | image |
|---|---|---|
| `:end-of-life` | amd64 + arm64 | `ghcr.io/panasaurus/images:end-of-life` |

### Erlang

| tag | platforms | image |
|---|---|---|
| `:erlang_22` | amd64 + arm64 | `ghcr.io/panasaurus/images:erlang_22` |
| `:erlang_23` | amd64 + arm64 | `ghcr.io/panasaurus/images:erlang_23` |
| `:erlang_24` | amd64 + arm64 | `ghcr.io/panasaurus/images:erlang_24` |
| `:erlang_25` | amd64 + arm64 | `ghcr.io/panasaurus/images:erlang_25` |
| `:erlang_26` | amd64 + arm64 | `ghcr.io/panasaurus/images:erlang_26` |
| `:erlang_27` | amd64 + arm64 | `ghcr.io/panasaurus/images:erlang_27` |

### MariaDB

| tag | platforms | image |
|---|---|---|
| `:mariadb_10.5` | amd64 + arm64 | `ghcr.io/panasaurus/images:mariadb_10.5` |
| `:mariadb_10.6` | amd64 + arm64 | `ghcr.io/panasaurus/images:mariadb_10.6` |
| `:mariadb_10.11` | amd64 + arm64 | `ghcr.io/panasaurus/images:mariadb_10.11` |
| `:mariadb_11.4` | amd64 + arm64 | `ghcr.io/panasaurus/images:mariadb_11.4` |
| `:mariadb_11.6` | amd64 + arm64 | `ghcr.io/panasaurus/images:mariadb_11.6` |
| `:mariadb_11.8` | amd64 + arm64 | `ghcr.io/panasaurus/images:mariadb_11.8` |
| `:mariadb_12.0` | amd64 + arm64 | `ghcr.io/panasaurus/images:mariadb_12.0` |

### MongoDB

| tag | platforms | image |
|---|---|---|
| `:mongodb_5` | amd64 + arm64 | `ghcr.io/panasaurus/images:mongodb_5` |
| `:mongodb_6` | amd64 + arm64 | `ghcr.io/panasaurus/images:mongodb_6` |
| `:mongodb_7` | amd64 + arm64 | `ghcr.io/panasaurus/images:mongodb_7` |
| `:mongodb_8` | amd64 + arm64 | `ghcr.io/panasaurus/images:mongodb_8` |

### Mono

| tag | platforms | image |
|---|---|---|
| `:mono_latest` | amd64 + arm64 | `ghcr.io/panasaurus/images:mono_latest` |

### PostgreSQL

| tag | platforms | image |
|---|---|---|
| `:postgres_13` | amd64 + arm64 | `ghcr.io/panasaurus/images:postgres_13` |
| `:postgres_14` | amd64 + arm64 | `ghcr.io/panasaurus/images:postgres_14` |
| `:postgres_15` | amd64 + arm64 | `ghcr.io/panasaurus/images:postgres_15` |
| `:postgres_16` | amd64 + arm64 | `ghcr.io/panasaurus/images:postgres_16` |
| `:postgres_17` | amd64 + arm64 | `ghcr.io/panasaurus/images:postgres_17` |

### Redis

| tag | platforms | image |
|---|---|---|
| `:redis_6` | amd64 + arm64 | `ghcr.io/panasaurus/images:redis_6` |
| `:redis_7` | amd64 + arm64 | `ghcr.io/panasaurus/images:redis_7` |
| `:redis_8` | amd64 + arm64 | `ghcr.io/panasaurus/images:redis_8` |

### Rust

| tag | platforms | image |
|---|---|---|
| `:rust_1.56` | amd64 + arm64 | `ghcr.io/panasaurus/images:rust_1.56` |
| `:rust_1.60` | amd64 + arm64 | `ghcr.io/panasaurus/images:rust_1.60` |
| `:rust_latest` | amd64 + arm64 | `ghcr.io/panasaurus/images:rust_latest` |

### SteamCMD

| tag | platforms | image |
|---|---|---|
| `:steamcmd_debian` | amd64 | `ghcr.io/panasaurus/images:steamcmd_debian` |
| `:steamcmd_ubuntu` | amd64 | `ghcr.io/panasaurus/images:steamcmd_ubuntu` |
| `:steamcmd_ubuntu_24.04` | amd64 | `ghcr.io/panasaurus/images:steamcmd_ubuntu_24.04` |
| `:steamcmd_dotnet` | amd64 | `ghcr.io/panasaurus/images:steamcmd_dotnet` |
| `:steamcmd_proton` | amd64 | `ghcr.io/panasaurus/images:steamcmd_proton` |
| `:steamcmd_proton_8` | amd64 | `ghcr.io/panasaurus/images:steamcmd_proton_8` |
| `:steamcmd_sniper` | amd64 | `ghcr.io/panasaurus/images:steamcmd_sniper` |

### Voice

| tag | platforms | image |
|---|---|---|
| `:voice_teaspeak` | amd64 | `ghcr.io/panasaurus/images:voice_teaspeak` |
| `:voice_mumble` | amd64 + arm64 | `ghcr.io/panasaurus/images:voice_mumble` |

### Wine

| tag | platforms | image |
|---|---|---|
| `:wine_latest` | amd64 | `ghcr.io/panasaurus/images:wine_latest` |
| `:wine_devel` | amd64 | `ghcr.io/panasaurus/images:wine_devel` |
| `:wine_staging` | amd64 | `ghcr.io/panasaurus/images:wine_staging` |

## License & attribution

MIT — see [LICENSE.md](LICENSE.md). Panasaurus Images is a rework of the excellent [pterodactyl/yolks](https://github.com/pterodactyl/yolks) by Matthew Penner and the Pterodactyl Software team; their original copyright notice is preserved in the license file and in every Dockerfile header.
