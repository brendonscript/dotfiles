import { map, rule } from 'karabiner.ts'

export const generalMappings = () => [
  rule('R_Command + L_Command → L_Opt').manipulators([
    map('right_command', 'left_command').to('left_option'),
  ]),
  // rule('R_Command → L_Opt').manipulators([
  //   map('right_command').to('left_option'),
  // ]),
]
