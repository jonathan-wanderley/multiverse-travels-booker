<p align="center">
    <img width=150 src="https://play-lh.googleusercontent.com/fXQVXTma1ENwAFjsxJ4IT6GntBr3RxWP3HMSLbNdvycl-0tscOQEeJIEAmehcNOt5hCp=w240-h480-rw" />
    <h1 align="center">Multiverse Travels Booker API</h1>
</p>

## Features

- [Jennifer](https://imdrasil.github.io/jennifer.cr/), ORM for Crystal.
- [rickandmortyapi.com](https://rickandmortyapi.com), API used to get Rick and Morty's locations data with GraphQL
- Database use PostgreSQL.

## Installation

```
$ shards install
```

## Database config

Change your database settings adding a database url in `config/database.cr and run:

```bash
$ crystal sam.cr db:create
```

After that you can run migrations:

```bash
$ crystal sam.cr db:migrate
```

##
[![Built with Crystal](https://img.shields.io/badge/built%20with-crystal-000000.svg?style=flat-square)](https://crystal-lang.org/) 
