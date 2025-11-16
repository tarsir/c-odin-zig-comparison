# Steps for C Example

This document is an attempt to record the steps I took to setup the C project. Enjoy!

## Dependencies

Note that all links are for Linux and any steps I include here will be for Ubuntu, since that's what
my WSL install is.

You need to install:

- [Raylib](https://github.com/raysan5/raylib/releases/tag/5.5) (latest release at time of writing)
  - Roughly, you would: download the archive (`.tar.gz` or `.zip`); extract (`tar -xzf`); put it
    somewhere if you want it in a specific location
- `make`, `gcc`, and probably some other things, via `sudo apt install build-essential`

In order to use the Raylib libraries in GCC (for compilation) and your editor, you may need to do
some file or environment variable changes. The easiest thing to do would simply be moving or copying
the `include` and `lib` directories in the Raylib archive to the appropriate system directories:

```sh
sudo cp raylib_extracted/include/* /usr/local/include
sudo cp raylib_extracted/lib/* /usr/local/lib
```

And then everything should just work.

An alternative is to use environment variables, specifically `LD_LIBRARY_PATH` and `C_INCLUDE_PATH`
and do something like:

```sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/full/path/to/raylib_extracted/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/full/path/to/raylib_extracted/include
```

### Which Option Is Better?

It depends! If you'll be working a lot with Raylib in the future, I'd highly recommend having a copy
of them in your system directories, so you don't have to deal with both remembering to do this and
also remembering how to do it every time you have a new project in Raylib.

## Running the Example

Once you've done all that, and you have the project, you can just run:

```sh
make && ./main
```

And it should work!

## Notes

- I don't know the reasons, but `printf` doesn't work once Raylib has started drawing the window, so
  to debug you need to use `TraceLog` instead
