source test/helpers.vim
source plugin/vertical_move.vim

describe 'vertical-move operator pending mappings'

  before
    new
    read test/fixture.txt
  end

  after
    close!
  end

  " describe 'single movement'
  it 'd]v deletes the same text that would be selected with v]v'
    normal gg0
    normal d]v
    Expect getline(1) == 'ine 3'
  end

  it 'c]v deletes the same text that would be selected with v]v and enters insert mode'
    normal gg0
    normal c]vabc
    Expect getline(1) == 'abcine 3'
  end

  it 'y]v yanks the same text that would be selected with v]v'
    normal gg0
    normal y]v
    Expect getreg('"') == "line 1\nline 2\nl"
    " when yanking, cursor doesn't move
    Expect line('.') == 1
    Expect col('.') == 1
  end

  " [v"
  it 'd[v deletes the same text that would be selected with v[v'
    call PositionToString('6')
    normal d[v
    Expect getline(5) == 'line '
    Expect getline(6) == 'l 7'
  end

  it 'c[v deletes the same text that would be selected with v[v and enters insert mode'
    call PositionToString('6')
    normal c[vabc
    Expect getline(5) == 'line abc'
  end

  it 'y[v yanks the same text that would be selected with v[v'
    call PositionToString('6')
    normal y[v
    Expect getreg('"') == "5\nline 6"
    " when yanking up, cursor moves, analog to `y{`
    Expect line('.') == 5
    Expect col('.') == 6
  end

  " describe 'multiple movements'
  it 'd2]v deletes the same text that would be selected with v2]v'
    normal gg0
    normal d2]v
    Expect getline(1) == 'ine 8'
  end

  it 'c3]v deletes the same text that would be selected with v3]v and enters insert mode'
    normal gg0
    normal c3]vabc
    Expect getline(1) == 'abc 11'
  end

  it 'y2]v yanks the same text that would be selected with v2]v'
    normal gg0
    normal y2]v
    Expect getreg('"') == "line 1\nline 2\nline 3\n\nline 5\nline 6\nl 7\nl"
    " when yanking, cursor doesn't move
    Expect line('.') == 1
    Expect col('.') == 1
  end

  " [v"
  it 'd2[v deletes the same text that would be selected with v2[v'
    call PositionToString('e 8')
    normal d2[v
    Expect getline(1) == 'lin 8'
  end

  it 'c3[v deletes the same text that would be selected with v3[v and enters insert mode'
    call PositionToString('11')
    normal c3[vabc
    Expect getline(1) == 'liabc1'
  end

  it 'y2[v yanks the same text that would be selected with v2[v'
    call PositionToString('e 8')
    normal y2[v
    Expect getreg('"') == "e 1\nline 2\nline 3\n\nline 5\nline 6\nl 7\nline"
    " when yanking upward, cursor moves (analog to y2{)
    Expect line('.') == 1
    Expect col('.') == 4
  end

end
