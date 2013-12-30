Vagrant configuration for an OCaml and OPAM installation.

* Installs `utop`, `merlin`.
* Configures Vim with Synastic and sensible defaults.
* Listens on `http://localhost:8000` on the host machine to 
  serve the documentation.

Build a box using:

```
$ vagrant up
$ vagrant ssh
```

From this a checkout of this directory.
