source t/helpers.vim
source plugin/paragraph_extended.vim

describe 'paragraph-extended normal mode'

  before
    new
    read t/fixture.txt
  end

  after
    close!
  end

  it '<leader>] jumps to the last line in current paragraph'
    normal gg$
    normal \]
    Expect CharacterUnderCursor() == '3'
  end

  it '<leader>[ jumps to the first line in current paragraph'
    call PositionToString('6')
    normal \[
    Expect CharacterUnderCursor() == '5'
  end

  it '<leader>] jumps over empty lines when invoked immediately near one'
    call PositionToString('3')
    normal \]
    Expect CharacterUnderCursor() == '6'

    normal \]
    Expect CharacterUnderCursor() == '8'
  end

  it '<leader>] jumps over empty lines when invoked immediately near one'
    call PositionToString('8')
    normal \[
    Expect CharacterUnderCursor() == '5'
    normal \[
    Expect CharacterUnderCursor() == '1'
  end

end
