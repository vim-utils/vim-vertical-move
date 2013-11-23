# vim-paragraph-extended

![Build Status](https://travis-ci.org/bruno-/vim-paragraph-extended.png?branch=master)

Adds paragraph extended motions to vim. These move a cursor 'up' or 'down' as
many lines as possible **without changing the cursor position**. These are
especially useful in visual-block mode.

Paragraph extended is a bit hard to verbally explain, so be sure to check the
animated examples below.

### Added motions

* `<leader>[` - moves 'up' as many lines as possible without changing the
  cursor column
* `<leader>]` - moves 'down' as many lines as possible. Also doesn't change
  the cursor column

### Examples

* Selecting a block of text with paragraph movements. Notice how the cursor
  position is lost when using the original paragraph motion `}`.
  ![original paragraph motion example](/examples/block_select_without_paragraph_extended_motion.gif)

* By using `<leader>]`, the cursor moves 'down' as much as it cans, without
  changing the cursor column.
  ![paragraph extended motion example](/examples/paragraph_extended_block_operation.gif)

### Installation

This plugin is **not** available on `vim.org/scripts/`. Preferred installation is
via [vundle](https://github.com/gmarik/vundle) or
[pathogen](https://github.com/tpope/vim-pathogen).

* Vundle<br/>
`Bundle 'bruno-/vim-paragraph-extended'`

* Pathogen<br/>
`git clone git://github.com/bruno-/vim-paragraph-extended.git ~/.vim/bundle/vim-paragraph-extended`

### License

[MIT](LICENSE)

