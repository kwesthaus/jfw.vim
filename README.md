# jfw.vim
A vim plugin to help me "Just Fucking Write" or it starts undoing every 5 seconds

With inspiration drawn from [koturn/vim-themostdangerouswritingapp](https://github.com/koturn/vim-themostdangerouswritingapp) and [Reikim/mdwa.vim](https://github.com/Reikim/mdwa.vim).

## Idea

I'm a perfectionist and a terribly slow writer. I want something that encourages me to stay focused and just get something down before I worry about editing it to perfection. [The Most Dangerous Writing App](https://www.squibler.io/dangerous-writing-prompt-app) certainly encourages you to keep writing without pause, but I wanted something less severe (i.e. with less risk of data loss) that just gets rid of the last written part which I'm struggling to continue from. So, I made this plugin which starts to repeatedly undo instead of delete everything at once.

## Usage

Call the `JFW` (Just Fucking Write) command to start. When you stop writing for 10 seconds, undo is called; every additional 5 seconds causes another undo. Start writing again to reset. When you are done, call the `IFW` (I Fucking Wrote) command.

Note that in vim you can manually control where undo groups are split by pressing `<C-g>u` while in insert mode.

## Installation

### Vundle

`Plugin 'kwesthaus/jfw.vim'`

### Vim 8 packages

Just make sure `jfw.vim` ends up under an appropriate `start` directory under `~/.vim/pack` as described in `:help package`.

## License

Public domain, under the [Unlicense](https://unlicense.org/). See LICENSE for details.
