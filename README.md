# C/Odin/Zig Comparison Project

This project is an example project implemented in C, Odin, and Zig as a comparison between setting
up a project in each of the 3 languages. The project is very simple:

- Running the project starts a Raylib window with an FPS counter in the middle
- When the user clicks in the window, a red particle is spawned that fades out over 2 seconds

For each project, I use the most "simple" solution for the build system. That means:

- The C project relies on Raylib headers and libraries being somewhere in your system
- The Odin project just kinda works since Raylib ships with the language
- The Zig project uses the Zig build system, meaning `build.zig`, and re-uses the raylib headers
  from the C example

# Prerequisites

## C

To build and run the C example, you need to have `make` and `gcc` installed. On Ubuntu, this is as
easy as running `sudo apt install build-essential`. Other distros/OSes are left as an exercise to
the reader.

## Odin

To build and run the Odin example, you need to have [Odin](https://odin-lang.org/docs/install/)
installed.

## Zig

To build and run the Zig example, you can either [install Zig
manually](https://ziglang.org/download/) or use something like [mise](https://mise.jdx.dev) to
handle it for you.

# Running the Examples

## With `mise`

If you have [mise](https://mise.jdx.dev) installed, you can run from the repo root:

```sh
mise run run-c-example
mise run run-odin-example
mise run run-zig-example
```

## Without `mise`

Otherwise, you can run them with commands like:

```sh
# C example
@/c > make clean && make && ./main

# Odin example
@/odin > odin run .

# Zig example
@/zig > zig build run
```
