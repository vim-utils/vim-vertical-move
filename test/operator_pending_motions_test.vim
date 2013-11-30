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
  it 'd<leader>] deletes the same text that would be selected with v<leader>]'
    normal gg0
    normal d\]
    Expect getline(1) == 'ine 3'
  end

  it 'c<leader>] deletes the same text that would be selected with v<leader>] and enters insert mode'
    normal gg0
    normal c\]abc
    Expect getline(1) == 'abcine 3'
  end

  it 'y<leader>] yanks the same text that would be selected with v<leader>]'
    normal gg0
    normal y\]
    Expect getreg('"') == "line 1\nline 2\nl"
    " when yanking, cursor doesn't move
    Expect line('.') == 1
    Expect col('.') == 1
  end

  " <leader>["
  it 'd<leader>[ deletes the same text that would be selected with v<leader>['
    call PositionToString('6')
    normal d\[
    Expect getline(5) == 'line '
    Expect getline(6) == 'l 7'
  end

  it 'c<leader>[ deletes the same text that would be selected with v<leader>[ and enters insert mode'
    call PositionToString('6')
    normal c\[abc
    Expect getline(5) == 'line abc'
  end

  it 'y<leader>[ yanks the same text that would be selected with v<leader>['
    call PositionToString('6')
    normal y\[
    Expect getreg('"') == "5\nline 6"
    " when yanking up, cursor moves, analog to `y{`
    Expect line('.') == 5
    Expect col('.') == 6
  end

  " describe 'multiple movements'
  it 'd2<leader>] deletes the same text that would be selected with v2<leader>]'
    normal gg0
    normal d2\]
    Expect getline(1) == 'ine 8'
  end

  it 'c3<leader>] deletes the same text that would be selected with v3<leader>] and enters insert mode'
    normal gg0
    normal c3\]abc
    Expect getline(1) == 'abc 11'
  end

  it 'y2<leader>] yanks the same text that would be selected with v2<leader>]'
    normal gg0
    normal y2\]
    Expect getreg('"') == "line 1\nline 2\nline 3\n\nline 5\nline 6\nl 7\nl"
    " when yanking, cursor doesn't move
    Expect line('.') == 1
    Expect col('.') == 1
  end

  " <leader>["
  it 'd2<leader>[ deletes the same text that would be selected with v2<leader>['
    call PositionToString('e 8')
    normal d2\[
    Expect getline(1) == 'lin 8'
  end

  it 'c3<leader>[ deletes the same text that would be selected with v3<leader>[ and enters insert mode'
    call PositionToString('11')
    normal c3\[abc
    Expect getline(1) == 'liabc1'
  end

  it 'y2<leader>[ yanks the same text that would be selected with v2<leader>['
    call PositionToString('e 8')
    normal y2\[
    Expect getreg('"') == "e 1\nline 2\nline 3\n\nline 5\nline 6\nl 7\nline"
    " when yanking upward, cursor moves (analog to y2{)
    Expect line('.') == 1
    Expect col('.') == 4
  end

end
