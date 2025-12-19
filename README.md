# C/Odin/Zig Comparison Project

This project is an example project implemented in C, Odin, and Zig as a comparison between setting
up a project in each of the 3 languages. The project is very simple:

- Running the project starts a Raylib window with an FPS counter in the middle
- When the user clicks in the window, a red particle is spawned that fades out over 3 seconds

For each project, I use the most "simple" solution for the build system. That means:

- The C project relies on Raylib headers and libraries being somewhere in your system
- The Odin project just kinda works since Raylib ships with the language
- The Zig project uses the Zig build system, meaning `build.zig`, and re-uses the raylib headers
  from the C example
