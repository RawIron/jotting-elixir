[![Build Status](https://travis-ci.org/RawIron/jotting-elixir.svg)](https://travis-ci.org/RawIron/jotting-elixir)


## Elixir

### Setup
check installed elixir
```
elixir --version
```

check installed otp
```
erl
```

### Run Tests
```
mix test
```


## Haskell

### Setup
```
cabal update
cabal install text-conversions
cabal install quickcheck-instances
cabal install test-framework
cabal install test-framework-quickcheck
cabal install test-framework-quickcheck2
cabal install test-framework-hunit
```

### Run
```
runghc TextOperators.hs
```

### Run tests
```
runghc TextOperators
```
