# MAT01092 - Algoritmos e Programação I

To run these applications you will need to install a Fortran compiler.
If you don't have one, use [Homebrew](http://brew.sh/) to get one.

```shell
brew update
brew install gfortran
```

And I expect that you use VIM, so...

**~/.vimrc**
```vim
:map <F5> <ESC>:w<CR>:!gfortran %:p && ./a.out<CR>
```

Then, just open an algorithm and hit `<F5>` in normal mode.
