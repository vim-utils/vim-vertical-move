# vim-vertical-move

![Build Status](https://travis-ci.org/bruno-/vim-vertical-move.png?branch=master)

Adds vertical move motions to vim. These move a cursor 'up' or 'down' as many
lines as possible **without changing the cursor column**. With these motions -
cursor **always** stays in the same column! These are especially useful in
 visual-block mode.

These motions are a bit hard to verbally explain, so be sure to check the
animated examples below.

### Added motions

* `<leader>[` - moves 'up' as many lines as possible without changing the
  cursor column
* `<leader>]` - moves 'down' as many lines as possible. Also doesn't change
  the cursor column

### Examples

* **Problem scenario** selecting a block of text with vertical movements with
  vanilla vim (vim-vertical-move not installed). Notice how the **cursor column
  position is lost** when using the original paragraph motion `}`.<br/>
  ![original paragraph motion example](/examples/block_select_original_paragraph_motion.gif)

* **Solution using vim-vertical-move**: pressing `<leader>]` the cursor moves
  'down' as many lines as possible, **without changing the cursor column**.<br/>
  ![vertical move motion example](/examples/vertical_move_block_operation.gif)

### Installation

This plugin is **not** available on `vim.org/scripts/`. Preferred installation is
via [vundle](https://github.com/gmarik/vundle) or
[pathogen](https://github.com/tpope/vim-pathogen).

* Vundle<br/>
`Bundle 'bruno-/vim-vertical-move`

* Pathogen<br/>
`git clone git://github.com/bruno-/vim-vertical-move.git ~/.vim/bundle/vim-vertical-move`

### Contributing and development

Patches are contributions are welcome. Since this plugin has a decent
[vspec](https://github.com/kana/vim-vspec) test coverage, if your patch is
non-trivial, providing tests in pull request is encouraged.

For instructions how to run and write tests see `:h vertical-move-contributing`.

### License

[MIT](LICENSE)

