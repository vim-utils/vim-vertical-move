source test/helpers.vim
source plugin/vertical_move.vim

describe 'vertical-move normal mode'

  before
    new
    read test/fixture.txt
  end

  after
    close!
  end

  it ']v jumps to the last line in current paragraph'
    normal gg$
    normal ]v
    Expect CharacterUnderCursor() == '3'
  end

  it ']v jumps over empty lines when invoked immediately near one'
    call PositionToString('3')
    normal ]v
    Expect CharacterUnderCursor() == '6'

    normal ]v
    Expect CharacterUnderCursor() == '8'
  end

  it ']v takes a count'
    normal ggg_
    normal 1]v
    Expect CharacterUnderCursor() == '3'

    normal ggg_
    normal 2]v
    Expect CharacterUnderCursor() == '6'

    normal ggg_
    normal 3]v
    Expect CharacterUnderCursor() == '8'
  end

  it '[v jumps to the first line in current paragraph'
    call PositionToString('6')
    normal [v
    Expect CharacterUnderCursor() == '5'
  end

  it '[v jumps over empty lines when invoked immediately near one'
    call PositionToString('8')
    normal [v
    Expect CharacterUnderCursor() == '5'
    normal [v
    Expect CharacterUnderCursor() == '1'
  end

  it '[v takes a count'
    call PositionToString('10')
    normal 1[v
    Expect CharacterUnderCursor() == '8'

    call PositionToString('10')
    normal 2[v
    Expect CharacterUnderCursor() == '5'

    call PositionToString('10')
    normal 3[v
    Expect CharacterUnderCursor() == '1'
  end

end
