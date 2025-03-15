import { map, rule } from 'karabiner.ts'

export const generalMappings = () => [
  rule('R_Command → L_Opt').manipulators([
    map('right_command').to('left_option'),
  ]),
  rule('R_Opt → R_Command').manipulators([
    map('right_option').to('right_command'),
  ]),
]
