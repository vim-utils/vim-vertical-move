source test/helpers.vim
source plugin/vertical_move.vim

describe 'vertical-move visual block mode'

  before
    new
    read test/fixture.txt
  end

  after
    close!
  end

  it ']v works with deletion'
    normal gg$
    exe "normal \<C-V>]vrx"
    Expect getline(1) == 'line x'
    Expect getline(2) == 'line x'
    Expect getline(3) == 'line x'
  end

  it ']v skips gaps'
    normal gg$
    exe "normal \<C-V>]v]vrx"
    Expect getline(1) == 'line x'
    Expect getline(2) == 'line x'
    Expect getline(3) == 'line x'
    Expect getline(4) == ''
    Expect getline(5) == 'line x'
    Expect getline(6) == 'line x'
  end

  it '[v works with deletion'
    call PositionToString('3')
    exe "normal \<C-V>[vrx"
    Expect getline(1) == 'line x'
    Expect getline(2) == 'line x'
    Expect getline(3) == 'line x'
  end

  it '[v skips gaps'
    call PositionToString('6')
    exe "normal \<C-V>[v[vrx"
    Expect getline(1) == 'line x'
    Expect getline(2) == 'line x'
    Expect getline(3) == 'line x'
    Expect getline(4) == ''
    Expect getline(5) == 'line x'
    Expect getline(6) == 'line x'
  end

end
