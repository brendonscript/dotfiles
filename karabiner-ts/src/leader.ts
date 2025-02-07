import { hyperLayer, ifVar, map, rule, toApp } from 'karabiner.ts'

export const appLeader = () => [
  // rule('Sub Apps', ifVar('layer-b')).manipulators([
  //   map('t', 'left_shift').toApp('Todoist'),
  // ]),
  hyperLayer('b')
    .description('Apps')
    .leaderMode({
      sticky: false,
      escape: ['spacebar', 'return_or_enter', 'escape'],
    })
    .notification()
    .manipulators({
      t: toApp('Ghostty'),
      b: toApp('Safari'),
    }),
]

export const systemLeader = () => [
  hyperLayer('s')
    .description('System')
    .leaderMode({
      sticky: false,
      escape: ['spacebar', 'return_or_enter', 'escape'],
    })
    .notification()
    .manipulators([map('s').to('print_screen')]),
]
