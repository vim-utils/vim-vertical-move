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

  it '<leader>] jumps to the last line in current paragraph'
    normal gg$
    normal \]
    Expect CharacterUnderCursor() == '3'
  end

  it '<leader>] jumps over empty lines when invoked immediately near one'
    call PositionToString('3')
    normal \]
    Expect CharacterUnderCursor() == '6'

    normal \]
    Expect CharacterUnderCursor() == '8'
  end

  it '<leader>] takes a count'
    normal ggg_
    normal 1\]
    Expect CharacterUnderCursor() == '3'

    normal ggg_
    normal 2\]
    Expect CharacterUnderCursor() == '6'

    normal ggg_
    normal 3\]
    Expect CharacterUnderCursor() == '8'
  end

  it '<leader>[ jumps to the first line in current paragraph'
    call PositionToString('6')
    normal \[
    Expect CharacterUnderCursor() == '5'
  end

  it '<leader>[ jumps over empty lines when invoked immediately near one'
    call PositionToString('8')
    normal \[
    Expect CharacterUnderCursor() == '5'
    normal \[
    Expect CharacterUnderCursor() == '1'
  end

  it '<leader>[ takes a count'
    call PositionToString('10')
    normal 1\[
    Expect CharacterUnderCursor() == '8'

    call PositionToString('10')
    normal 2\[
    Expect CharacterUnderCursor() == '5'

    call PositionToString('10')
    normal 3\[
    Expect CharacterUnderCursor() == '1'
  end

end
