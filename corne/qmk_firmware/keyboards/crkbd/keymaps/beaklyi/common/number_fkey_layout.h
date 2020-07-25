
// const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

// ....................................................... Numberic Keypad Layer

  [_NUMBER] = KEYMAP(
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
#ifdef UPPER_HEX
      ___x___ , _______ , S(KC_F) , ACT_E   , S(KC_D) , _______ ,                      KC_SLSH , KC_7    , KC_8    , KC_9    , KC_ASTR , ___x___ ,
#else
      ___x___ , _______ , KC_F    , ACT_E   , KC_D    , _______ ,                      KC_SLSH , KC_7    , KC_8    , KC_9    , KC_ASTR , ___x___ ,
#endif
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
      ___x___ , OS_GUI  , CT_C    , AT_B    , ST_A    , _______ ,                      TD_DOT  , KC_4    , KC_5    , KC_6    , KC_MINS , ___x___ ,
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
      ___x___ , _______ , KC_LBRC , AST_G   , KC_RBRC , _______ ,                      TD_COMM , KC_1    , KC_2    , KC_3    , KC_PLUS , ___x___ ,
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
                                              _______ , _______ , ___fn__ ,  KC_BSLS , KC_0    , KC_EQL 
  //                                         ---------+---------+---------  ---------+---------+--------- 
  ),

// .......................................................... Function Key Layer

  [_FNCKEY] = KEYMAP(
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
      ___x___ , _______ , _______ , _______ , _______ , _______ ,                      _______ , KC_F7 ,   KC_F8 ,   KC_F9 ,   KC_F12  , ___x___ ,
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
      ___x___ , OS_GUI ,  OS_CTL ,  OS_ALT ,  OS_SFT ,  _______ ,                      _______ , KC_F4 ,   KC_F5 ,   KC_F6 ,   KC_F11  , ___x___ ,
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
      ___x___ , _______ , _______ , _______ , _______ , _______ ,                      _______ , KC_F1 ,   KC_F2 ,   KC_F3 ,   KC_F10  , ___x___ ,
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
                                              ___fn__ , _______ , _______ ,  _______ , _______ , _______ 
  //                                         ---------+---------+---------  ---------+---------+--------- 
  ),
