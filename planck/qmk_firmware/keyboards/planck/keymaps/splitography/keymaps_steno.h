
// const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

// ...................................................................... Qwerty
//
// http://www.keyboard-layout-editor.com/#/gists/1b04ce6be0cee6e5d2998b2a8efb8b09

  // ,-----------------------------------------------------------------------------------.
  // |  Esc |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  | Bksp |
  // -------|------+------+------+------+------+------+------+------+------+-------------|
  // |  Alt |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  |   '  |
  // -------|------+------+------+------+------+------+------+------+------+-------------|
  // | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  |  GUI |
  // |------+------+------+------+------+------+------+------+------+------+------+------|
  // |      |      |      | Blue |Orange|      |      | Space| Ctrl |      |      |      |
  // `-----------------------------------------------------------------------------------'

  [_QWERTY] = {
    {KC_ESC,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_BSPC},
    {OS_ALT,  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT},
    {OS_SFT,  KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, OS_GUI },
    {_______, _______, _______, BLUE,    ORANGE,  _______, _______, KC_SPC,  OS_CTL,  _______, _______, _______},
  },

// .................................................................. Blue Layer
//
// http://www.keyboard-layout-editor.com/#/gists/054b8bc0e31971bb962ea1c781232e0b

  // .-----------------------------------------------------------------------------------.
  // |   `  |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  |      |
  // |-----------------------------------------------------------------------------------|
  // |  Alt | Stop | Prev | Play | Next | +Vol |      |      |      |   [  |   ]  | Enter|
  // |-----------------------------------------------------------------------------------|
  // | Shift| Undo |  Cut | Copy | Paste| -Vol | Mute |      |      |   -  |   =  |  GUI |
  // |-----------------------------------------------------------------------------------|
  // |      |      |      |  f() |      |       |     | Bksp | Ctrl |      |      |      |
  // '-----------------------------------------------------------------------------------'

  [_BLUE] = {
    {TD_TILD, KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    _______},
    {OS_ALT,  KC_MSTP, KC_MPRV, KC_MPLY, KC_MNXT, KC_VOLU, _______, _______, _______, KC_LBRC, KC_RBRC, KC_ENT },
    {OS_SFT,  KC_UNDO, KC_CUT,  KC_COPY, KC_PSTE, KC_VOLD, KC_MUTE, _______, _______, KC_MINS, KC_EQL,  OS_GUI },
    {_______, _______, _______, ___fn__, _______, _______, _______, KC_BSPC, OS_CTL,  _______, _______, _______},
  },

// ................................................................ Orange Layer
//
// http://www.keyboard-layout-editor.com/#/gists/83ccc7c3faa78b1f67f6fef65063a248

  // .-----------------------------------------------------------------------------------.
  // |Plover|  F1  |  F2  |  F3  |  F4  |      |  App | PrScr|ScrLck| Pause|      |      |
  // |-----------------------------------------------------------------------------------|
  // |  Alt |  F5  |  F6  |  F7  |  F8  |      |      |Insert| Home | PgUp |      | Enter|
  // |-----------------------------------------------------------------------------------|
  // | Shift|  F9  |  F10 |  F11 |  F12 |      |      |  Del |  End | PgDn |   \  |  GUI |
  // |-----------------------------------------------------------------------------------|
  // |      |      |      |      |  f() |       |     |  Del | Ctrl |      |      |      |
  // '-----------------------------------------------------------------------------------'

  [_ORANGE] = {
    {PLOVER,  KC_F1,   KC_F2,   KC_F3,   KC_F4,   _______, KC_APP,  KC_PSCR, KC_SLCK, KC_PAUS, _______, _______},
    {OS_ALT,  KC_F5,   KC_F6,   KC_F7,   KC_F8,   _______, _______, KC_INS,  KC_HOME, KC_PGUP, _______, KC_ENT },
    {OS_SFT,  KC_F9,   KC_F10,  KC_F11,  KC_F12,  _______, _______, KC_DEL,  KC_END,  KC_PGDN, KC_BSLS, OS_GUI },
    {_______, _______, _______, _______, ___fn__, _______, _______, KC_DEL,  OS_CTL,  _______, _______, _______},
  },

// ................................................................. Green Layer
//
// http://www.keyboard-layout-editor.com/#/gists/bc7902f1eada4d7d34d3445aa1eccdab

  // .-----------------------------------------------------------------------------------.
  // |TxBolt|      |      |      |      |Scroll|   /  |   7  |   8  |   9  |   -  |      |
  // |-----------------------------------------------------------------------------------|
  // |  Alt | Home |  Up  |  End | PgUp | Caps |   *  |   4  |   5  |   6  |   +  | Enter|
  // |-----------------------------------------------------------------------------------|
  // | Shift| Left | Down | Right| PgDn |  Num |   0  |   1  |   2  |   3  |      |  GUI |
  // |-----------------------------------------------------------------------------------|
  // |      |      |      |      |  f() |       |     |  Del | Ctrl |      |      |      |
  // '-----------------------------------------------------------------------------------'

  [_GREEN] = {
    {TXBOLT,  _______, _______, _______, _______, KC_SLCK, KC_PSLS, KC_P7,   KC_P8,   KC_P9,   KC_PMNS  _______},
    {OS_ALT,  HOME,    UP,      END,     PGUP,    KC_CAPS, KC_PAST, KC_P4,   KC_P5,   KC_P6,   KC_PPLS, KC_ENT },
    {OS_SFT,  LEFT,    DOWN,    RIGHT,   PGDN,    NUM,     KC_P0,   KC_P1,   KC_P2,   KC_P3,   _______, OS_GUI },
    {_______, _______, _______, ___fn__, ___fn__, _______, _______, _______, OS_CTL,  _______, _______, _______},
  },

// ................................................................... Num Layer
//
// http://www.keyboard-layout-editor.com/#/gists/bc7902f1eada4d7d34d3445aa1eccdab

  // .-----------------------------------------------------------------------------------.
  // |      |      |      |      |      |Scroll|   /  |   7  |   8  |   9  |   -  |      |
  // |-----------------------------------------------------------------------------------|
  // |  Alt | Home |  Up  |  End | PgUp | Caps |   *  |   4  |   5  |   6  |   +  | Enter|
  // |-----------------------------------------------------------------------------------|
  // | Shift| Left | Down | Right| PgDn |  Num |   0  |   1  |   2  |   3  |      |  GUI |
  // |-----------------------------------------------------------------------------------|
  // |      |      |      |      |  f() |       |     |  Del | Ctrl |      |      |      |
  // '-----------------------------------------------------------------------------------'

  [_NUM] = {
    {_______, _______, _______, _______, _______, KC_SLCK, KC_PSLS, KC_P7,   KC_P8,   KC_P9,   KC_PMNS  _______},
    {OS_ALT,  HOME,    UP,      END,     PGUP,    KC_CAPS, KC_PAST, KC_P4,   KC_P5,   KC_P6,   KC_PPLS, KC_ENT },
    {OS_SFT,  LEFT,    DOWN,    RIGHT,   PGDN,    ___fn__, KC_P0,   KC_P1,   KC_P2,   KC_P3,   _______, OS_GUI },
    {_______, _______, _______, _______, _______, _______, _______, _______, OS_CTL,  _______, _______, _______},
  },

// ...................................................................... Plover
//
// http://www.keyboard-layout-editor.com/#/gists/27b8f8649393a8ba4071ba946a9306f4

  // ,-----------------------------------------------------------------------------------.
  // |   1  |   1  |   1  |   1  |   1  |   1  |   1  |   1  |   1  |   1  |   1  |   1  |
  // +-------------+------+------+------+------+------+------+------+------+------+------|
  // |Qwerty|   S  |   T  |   P  |   H  |   *  |   *  |   F  |   P  |   L  |   T  |   D  |
  // +------|------+------+------+------+------+------+------+------+------+------+------|
  // |      |   S  |   K  |   W  |   R  |   *  |   *  |   R  |   B  |   G  |   S  |   Z  |
  // +------+------+------+------+------+------+------+------+------+------+------+------|
  // |      |      |      |   A  |   O  |      |      |   E  |   U  |      |      |      |
  // `-----------------------------------------------------------------------------------'

  [_PLOVER] = {
    {KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1,    KC_1   },
    {PS_BASE, KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC},
    {_______, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT},
    {_______, _______, _______, KC_C,    KC_V,    _______, _______, KC_N,    KC_M,    _______, _______, _______},
  },


// ...................................................................... TxBolt
//
// http://www.keyboard-layout-editor.com/#/gists/27b8f8649393a8ba4071ba946a9306f4

  // ,-----------------------------------------------------------------------------------.
  // |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |
  // |------+------+------+------+------+-------------+------+------+------+------+------|
  // |Qwerty|   S  |   T  |   P  |   H  |   *  |   *  |   F  |   P  |   L  |   T  |   D  |
  // |------+------+------+------+------+------|------+------+------+------+------+------|
  // |      |   S  |   K  |   W  |   R  |   *  |   *  |   R  |   B  |   G  |   S  |   Z  |
  // |------+------+------+------+------+------+------+------+------+------+------+------|
  // |      |      |      |   A  |   O  |      |      |   E  |   U  |      |      |      |
  // `-----------------------------------------------------------------------------------'

  [_TXBOLT] = {
    {STN_NUM, STN_NUM, STN_NUM, STN_NUM, STN_NUM, STN_NUM, STN_NUM, STN_NUM, STN_NUM, STN_NUM, STN_NUM, STN_NUM},
    {PS_BASE, STN_SL,  STN_TL,  STN_PL,  STN_HL,  STN_STR, STN_STR, STN_FR,  STN_PR,  STN_LR,  STN_TR,  STN_DR },
    {_______, STN_SL,  STN_KL,  STN_WL,  STN_RL,  STN_STR, STN_STR, STN_RR,  STN_BR,  STN_GR,  STN_SR,  STN_ZR },
    {_______, _______, _______, PS_STNA, PS_STNO, _______, _______, PS_STNE, PS_STNU, _______, _______, _______}
  },

// };