import { map, rule } from 'karabiner.ts'

export const hyperMehRules = () => [
  rule('Caps Lock or Escape → Hyper').manipulators([
    map('caps_lock').toHyper().toIfAlone('escape'),
    map('escape').toHyper().toIfAlone('escape'),
  ]),
  rule('Tab → Meh').manipulators([map('tab').toMeh().toIfAlone('tab')]),
]
