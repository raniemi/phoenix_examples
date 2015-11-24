Phoenix Examples
================

This git repository is used (by me) to document things I have learned about the [Phoenix framework](http://www.phoenixframework.org/) and to test out new tools that support it.

### Prerequisites

If you want to use this then you'll need to install the [Docker Toolbox](https://www.docker.com/docker-toolbox) first.

### Getting Started

Create the Phoenix docker image:
```console
docker build -t raniemi/phoenix_examples .
```

### Background

This Phoenix project was created using [mix](http://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html) (relative to your current directory):
```console
docker run -it --rm -v "$PWD":/code -w /phoenix raniemi/phoenix_examples mix phoenix.new /code/phoenix_examples
```
### Usage

Run the docker image:
```console
docker run -it --rm --name phoenix_examples -p 4000:4000 -v "$PWD":/code/phoenix_examples -w /code/phoenix_examples raniemi/phoenix_examples npm cache clean && npm install && iex -S mix phoenix.server
```

### Notes

To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
