import { map, rule } from 'karabiner.ts'

export const hyperMehRules = () => [
  rule('Caps Lock or Escape → Hyper').manipulators([
    map('caps_lock').toHyper().toIfAlone('escape'),
    map('escape').toHyper().toIfAlone('escape'),
  ]),
  rule('Tab → LOpt').manipulators([
    map('tab').to('left_option').toIfAlone('tab'),
  ]),
  rule('ROpt → Meh').manipulators([map('right_option').toMeh()]),
]
