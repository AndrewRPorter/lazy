# lazy

Script used to analyze my systems shell history (ZSH in this case) and
print out the most frequent commands.

This can be used to identify potential aliases, allowing you to type less.

## Usage

By default, running `lazy` will yield the top 10 most used commands.

```
ruby main.rb
```

You can specify the number of commands you want to output by passing in a num (`-n` or `--num`).

```
ruby main.rb -n 1
```
