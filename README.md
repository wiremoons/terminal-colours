[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE) 
![terminal-colours](https://github.com/wiremoons/terminal-colours/workflows/terminal-colours/badge.svg?branch=main) [![Alire](https://img.shields.io/endpoint?url=https://alire.ada.dev/badges/alire-badge.json)](https://alire.ada.dev/)
<a href="https://project-types.github.io/#toy">
  <img src="https://img.shields.io/badge/project%20type-toy-blue" alt="Toy Badge"/>
</a>

# What is 'terminal_colours'?

The repository contains a small command line (CLI) program that demonstrates displaying
terminal colours with the Ada language.

The program was written to learn more about using the *GNAT Collection 'Terminal'* 
package called: `GNATCOLL.Terminal`

The code is based on the AdaCore Gem published here: [https://docs.adacore.com/gnatcoll-docs/terminals.html](https://docs.adacore.com/gnatcoll-docs/terminals.html)


## Status

Demo code only for reference, shared in case is useful to others.


## Usage Examples

Once built the program can be found in the **bin** sub directory. It can be run 
from a Windows `cmd.exe` or `pwsh` prompt, or a Linux terminal. I have not tested 
it on macOS.


## Building the Application

An Ada language compiler will be needed to build the application. There are also a
few dependencies that will need to be met for a successful build of `terminal_colours`.
These steps are explained below.

### Dependencies

As `terminal_colours` uses GNATColl *Terminal* package, the following 
packages are used to provide the support required:

- [GNAT Collection - Core (GNATColl-Core)](https://github.com/AdaCore/gnatcoll-core)

There are two approaches to ensuring these are available when building `terminal_colours`:

1. **Use Alire** : Clone this GitHub repo, and then easily add the required packages by running the 
command: `alr with gnatcoll` (except the defaults) and then `alr build`. The program can also be executed 
with `alr run`.
2. **Use AdaCore GNAT Programing Studio (GPS) 2020** : *GNATColl-Core*' is included with an 
installation of '*AdaCore GNAT Programing Studio (GPS) 2020 Community Edition*' so the program 
should just build as outlined below.


### Install an Ada Compiler and Supporting Libraries

Install an Ada compiler and supporting libraries. More information on installing 
Ada can be found here: [Get Ada](http://www.getadanow.com/).

### Building 'terminal_colours'

To build `terminal_colours` from source, the following steps can be used:

Once Ada is installed on your system, you can clone this GitHub repo with 
the `git` command: `git clone https://github.com/wiremoons/terminal-colours.git`

To build and execute the program, the GNAT tool is required called: `gprbuild`.

Once install along with the other GNAT Ada compiler tools, the following commands 
can be run: 

- For a 'release' build (default) run: `gprbuild -XBUILD=release`

- For a 'debug' build run: `gprbuild -XBUILD=debug`

- To reset and clean up run: `gprclean`

- To format code file with Pretty Print (gnatpp) run: `gnatpp -P terminal_colours.gpr`


## Licenses

The following licenses apply to the `terminal_colours` source code, and resulting built
application, as described below.

#### License for 'terminal-colours'

This program `terminal-colours` is licensed under the **MIT License** see
http://opensource.org/licenses/mit for more details.
