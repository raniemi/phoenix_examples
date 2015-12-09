Phoenix Examples
================

This git repository is used (by me) to document things I have learned about the [Phoenix framework](http://www.phoenixframework.org/) and to test out new tools that support it.

### Prerequisites

If you want to use this then you'll need to have the [Docker Toolbox](https://www.docker.com/docker-toolbox) installed.  After that, you will also need to build the [elixir_examples](https://github.com/raniemi/elixir_examples) docker image in order to build the phoenix_examples docker image.

### Background

This Phoenix project was created using [mix](http://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html) (relative to your current directory):
```console
docker run -it --rm -v "$PWD":/code -w /phoenix raniemi/phoenix_examples mix phoenix.new /code/phoenix_examples
```

### Usage

To use this repository:
```console
git clone https://github.com/raniemi/phoenix_examples.git
cd phoenix_examples
```

If you already have Elixir, mix, etc. installed on your host then you could forgo [Docker](https://www.docker.com/) all together and invoke the mix commands directly as follows:
```console
mix do deps.get, compile
```

If you decide to use [Docker](https://www.docker.com/) then you will need to build the docker image as follows:

```console
docker build -t raniemi/phoenix_examples .
```

Or alternatively:

```console
./bin/docker-build
```

Following on the earlier mix example, all you have to do to use the tools installed on [Docker](https://www.docker.com/) is to prefix the same command with `./bin/docker-run`.  For example:
```console
./bin/docker-run mix do deps.get, compile
```

### Helpful Commands

As I started working with this project and docker, I quickly became tired typing `docker-run` the prefix constantly (think `bundle exec`), knowing when to specify a MIX_ENV, and having to run post-commands after the fact (i.e. I just ran code coverage and so I now want to see the HTML report).  As a means of convenience, I created some bash scripts in the `mix/` directory. For example:

Run the phoenix.server (on port 4000):
```console
./mix/phoenix.server
```

NOTE: if you are using docker and not the [Docker Toolbox](https://www.docker.com/docker-toolbox) then you may have to manually port forward 4000 on your VM; otherwise, you won't get the Phoenix landing page.

### Notes

NOTE: the following was generated at the time of project creation (need to revisit)

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
