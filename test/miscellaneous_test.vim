source test/helpers.vim
source plugin/vertical_move.vim

describe 'vertical-move miscellaneous'

  before
    new
    read test/fixture2.txt
  end

  after
    close!
  end

  it ']v does not change the current search string'
    normal gg_
    " do a search and check cursor position
    exe "normal /Foo\<CR>"
    Expect line('.') == 1
    Expect col('.') == 7
    " do vim-vertical-move motion
    exe "normal ]v"
    Expect line('.') == 5
    Expect col('.') == 7
    " performing the same search as before hitting ]v
    exe "normal /\<CR>"
    Expect line('.') == 7
    Expect col('.') == 11
  end

  it ']v does not change the current search string'
    normal gg_
    " do a search and check cursor position
    exe "normal /Bar\<CR>"
    Expect line('.') == 7
    Expect col('.') == 7
    " make vim-vertical-move motion
    exe "normal [v"
    Expect line('.') == 1
    Expect col('.') == 7
    " performing the same search as before hitting [v
    exe "normal /\<CR>"
    Expect line('.') == 7
    Expect col('.') == 7
  end

end
