# vim-vertical-move

![Build Status](https://travis-ci.org/bruno-/vim-vertical-move.png?branch=master)

Adds vertical move motions to vim. These move a cursor 'up' or 'down' as many
lines as possible **without changing the cursor column**. With these motions -
cursor **always** stays in the same column! These are especially useful in
 visual-block mode.

These motions are a bit hard to verbally explain, so be sure to check the
animated examples below.

### Motions

* `[v` - moves 'up' as many lines as possible without changing the
  cursor column
* `]v` - moves 'down' as many lines as possible. Also doesn't change
  the cursor column

### Examples

* Problem scenario: selecting a block of text with vertical movements with
  vanilla vim (vim-vertical-move not installed). Notice how the **cursor column
  position is lost** when using the original paragraph motion `}`.<br/>
  ![original paragraph motion example](/examples/block_select_original_paragraph_motion.gif)

* Solution using vim-vertical-move: pressing `]v` the cursor moves
  'down' as many lines as possible, without changing the cursor column.<br/>
  ![vertical move motion example](/examples/vertical_move_block_operation.gif)

### Installation

* Pathogen<br/>
`git clone git://github.com/bruno-/vim-vertical-move.git ~/.vim/bundle/vim-vertical-move`

* Vundle<br/>
`Plugin 'bruno-/vim-vertical-move`

* vim-plug<br/>
`Plug 'bruno-/vim-vertical-move`

### Contributing and development

Patches are contributions are welcome.

This plugin has a decent [vspec](https://github.com/kana/vim-vspec) test
coverage. If your patch is non-trivial, please write tests for it.

For instructions how to run and write tests see `:h vertical-move-contributing`.

### License

[MIT](LICENSE)
