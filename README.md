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

# The Comparison

As with any performance benchmarks, take them with a grain of salt. So many things can impact these
results! And, this example application isn't particularly demanding, so the overhead in each
language's build systems and toolchains and such are likely more prevalent than they would be in a
more sophisticated application.

## Hardware/OS

I ran all of these benchmarks on my main gaming desktop:

- AMD Ryzen 9 7900X
- AMD Radeon 7900 GRE
- 32GB DDR5 6000
- Windows using WSL 2 (Ubuntu)

## Configurations

I ran the following configurations with each language:

- C
  - No optimization flags (implicitly `-O0`)
  - "Standard" optimization (`-O2`)
  - "Beyond standard" (`-O3`)
  - Optimize for size (`-Os`)
  - Optimize for debug (`-Og`)
  - Optimize for speed (`-Ofast`)
- Zig
  - Debug (default)
  - Release fast (`--release=fast`)
  - Release safe (`--release=safe`)
  - Release small (`--release=small`)
- Odin
  - Release (default)
  - Debug (`-debug -o:none`)
  - Optimization, size (`-o:size`)
  - Optimization, speed (`-o:speed`)
  - Optimization, "aggressive" (`-o:aggressive`)
