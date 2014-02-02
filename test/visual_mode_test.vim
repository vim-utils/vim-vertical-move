source test/helpers.vim
source plugin/vertical_move.vim

describe 'vertical-move visual mode'

  before
    new
    read test/fixture.txt
  end

  after
    close!
  end

  it ']v works with deletion'
    normal ggg_
    exe "normal v]vd"
    Expect getline(1) == 'line '
    Expect getline(2) == ''
    Expect getline(3) == 'line 5'
  end

  it ']v skips gaps'
    normal ggg_
    exe "normal v]v]vd"
    Expect getline(1) == 'line '
    Expect getline(2) == 'l 7'
  end

  it '[v works with deletion'
    call PositionToString('3')
    exe "normal v[vd"
    Expect getline(1) == 'line '
    Expect getline(2) == ''
    Expect getline(3) == 'line 5'
  end

  it '[v skips gaps'
    call PositionToString('6')
    exe "normal v[v[vd"
    Expect getline(1) == 'line '
    Expect getline(2) == 'l 7'
  end

end
