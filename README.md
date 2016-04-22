# luaucdn
Lua bindings for [ucdn](https://github.com/grigorig/ucdn).

## Installing

```
luarocks install luaucdn
```

## Documentation

* [API Docs](http://deepakjois.github.io/luaucdn/api/)

## Coverage

luaucdn does not implement all the API methods from ucdn yet. If you require a specific method to be implemented, please [open a github issue][luaucdn-issues]

## Development

#### Building
It is possible to build luaucdn using the Makefile provided in the distribution. Running `make` will build the library `luaucdn.so` in the root directory of the repo. The Lua source files are located under the `src` directory. To use them with Lua, you will need to update your `package.path` and `package.cpath` approrpriately.

#### Testing and Linting
In order to make changes to the code and run the tests, the following dependencies need to be installed:

* [Busted](http://olivinelabs.com/busted/) – `luarocks install busted`
* [luacheck](http://luacheck.readthedocs.org) – `luarocks install luacheck`

Run the test suite:
```
make spec
```

Lint the codebase:
```
make lint
```

## Contact
[Open a Github issue][luaucdn-issues], or email me at <deepak.jois@gmail.com>.

[luaucdn-issues]: https://github.com/deepakjois/luaucdn/issues

