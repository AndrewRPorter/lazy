[![Gem Version](https://badge.fury.io/rb/lazy_cli.svg)](https://badge.fury.io/rb/lazy_cli)

# lazy

Script used to analyze my systems shell history (ZSH in this case) and
print out the most frequent commands.

This can be used to identify potential aliases, allowing you to type less.

## Installation

```
gem install lazy_cli
```

## Usage

By default, running `lz` will yield the top 10 most used commands.

```
lazy
```

You can specify the number of commands you want to output by passing in a num (`-n` or `--num`).

```
lazy -n 1
```
