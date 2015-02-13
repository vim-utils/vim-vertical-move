source test/helpers.vim
source plugin/vertical_move.vim

describe 'vertical-move normal mode with virtual columns'

  before
    new
    read test/fixture3.txt
    set tabstop=2
  end

  after
    close!
  end

  it ']v takes displayed tab character width into account'
    normal gg$h
    Expect CharacterUnderCursor() == 'x'
    normal ]v
    Expect CharacterUnderCursor() == 'y'
  end

end
