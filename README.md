# This fork is now archived

Upstream https://github.com/purescript-halogen/purescript-halogen-template is  now using parcel as well, and looks actively maintained.

# purescript-halogen-template

This is a template for starting a fresh project using the [purescript-halogen](https://github.com/slamdata/purescript-halogen) library for declarative user interfaces.

## Prerequisites

This guide assumes you already have Git and Node.js installed with `npm` somewhere on your path. If you use `nvm`, the node version manager, you can do `nvm use` to get a working node version.

Unlike some other purescript libraries, we use psc-package, because bower has deprecated itself, and bower dependencies don't age well.

``` shell
npm install --global psc-package
```

## Getting started

First clone the repo and step into it:

``` shell
git clone https://github.com/slamdata/purescript-halogen-template.git my-halogen-project
cd my-halogen-project
```

If you don't already have a global installation of the PureScript compiler and [Pulp](https://github.com/bodil/pulp) (or you want a local installation with the appropriate versions) you can run:

``` shell
npm install
```

Finally you'll need to install the PureScript library dependencies for this project with Bower:

``` shell
psc-package update
```

## Building

The project can now be built with:

``` shell
npm run build
```

This will build the PureScript source code and produce a bundled JS file as `dist/app.js`.

This is an alias for the Pulp command:

``` shell
pulp build --to dist/app.js
```

If you open `dist/index.html` you should now have a basic working Halogen app.

You can also use the command:

``` shell
npm run watch
```

To start a process that will watch the source files and trigger a reload whenever they are modified. Alternatively...

## Fast watching with `purs ide`

If you're using an editor that supports `purs ide` or running [`pscid`](https://github.com/kRITZCREEK/pscid) there's an option for getting near-instant builds of the app while you work on it:

``` shell
npm run parcel:watch
```

This will start a watch process that uses [Parcel](https://parceljs.org) to rebundle the app whenever the _output_ files are changed. Since `purs ide` rebuilds modules on save, this means you can use this much faster bundle-only rebuild script.

:warning: `purs ide` only rebuilds one module at a time, so sometimes the bundle will end up in an inconsistent state, resulting in runtime errors. This occurs when a change is made in one module that breaks other modules that depend on it. The solution is to run a full build when a change like this is made, as the compiler will force you to resolve those errors.
