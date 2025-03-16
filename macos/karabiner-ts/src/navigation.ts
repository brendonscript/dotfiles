import { map, rule } from 'karabiner.ts'

export const navigationRules = () => [
  rule('Vim Navigation').manipulators([
    map('h', ['left_shift', 'right_shift']).to('left_arrow'),
    map('j', ['left_shift', 'right_shift']).to('down_arrow'),
    map('k', ['left_shift', 'right_shift']).to('up_arrow'),
    map('l', ['left_shift', 'right_shift']).to('right_arrow'),
  ]),
]
