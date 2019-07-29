#define RECORD keyrecord_t *record
#define STATE  qk_tap_dance_state_t *state

void asterisk(STATE, void *user_data);
void base_layer(uint8_t defer);
bool chained_modifier(void);
void clear_events(void);
void clear_layers(void);
void colon(STATE, void *user_data);
void colon_reset(STATE, void *user_data);
void comma(STATE, void *user_data);
void dot(STATE, void *user_data);
void double_tap(uint8_t count, uint8_t shift, uint16_t keycode);
void equal(STATE, void *user_data);
void equal_reset(STATE, void *user_data);
void greater(STATE, void *user_data);
void greater_reset(STATE, void *user_data);
bool key_press(RECORD);
bool leader_cap(RECORD, uint8_t layer, uint8_t leadercap, uint16_t keycode);
void lesser(STATE, void *user_data);
void lesser_reset(STATE, void *user_data);
void lt(RECORD, uint8_t layer, uint8_t shift, uint16_t keycode);
bool map_leader(RECORD, uint8_t side, uint16_t shift_key, uint8_t shift, uint16_t keycode, uint8_t column);
bool map_shift(RECORD, uint16_t shift_key, uint8_t shift, uint16_t keycode);
bool mapc_shift(RECORD, uint16_t shift_key, uint8_t shift, uint16_t keycode);
void mod_all(void (*f)(uint8_t), uint8_t mask);
void mod_bits(RECORD, uint16_t keycode);
bool mod_down(uint16_t keycode);
void mod_key(uint16_t modifier, uint16_t keycode);
bool mod_roll(RECORD, uint8_t side, uint8_t shift, uint16_t modifier, uint16_t keycode, uint8_t col);
void mod_t(RECORD, uint16_t modifier, uint16_t keycode);
void mt_shift(RECORD, uint16_t modifier, uint16_t modifier2, uint16_t keycode);
void paste(STATE, void *user_data);
void paste_reset(STATE, void *user_data);
void percent(STATE, void *user_data);
void percent_reset(STATE, void *user_data);
void pound(STATE, void *user_data);
void private(STATE, void *user_data);
bool raise_layer(RECORD, uint8_t layer, uint8_t side, uint8_t toggle);
void register_modifier(uint16_t keycode);
void register_shift(uint16_t keycode);
void rolling_layer(RECORD, uint8_t side, uint8_t shift, uint16_t keycode, uint8_t layer, uint8_t facing);
void send(STATE, void *user_data);
void set_leader(RECORD, uint8_t side, uint16_t shift_key, uint8_t shift, uint16_t keycode, uint8_t column);
void space(STATE, void *user_data);
void space_reset(STATE, void *user_data);
void steno(RECORD);
void tap_key(uint16_t keycode);
void tap_layer(RECORD, uint8_t layer);
void tap_shift(uint16_t keycode);
void tilde(STATE, void *user_data);
void tilde_reset(STATE, void *user_data);
void toggle_plover(uint8_t state);
void tt_escape(RECORD, uint16_t keycode);
void unregister_modifier(uint16_t keycode);
void unregister_shift(uint16_t keycode);
void xpaste(STATE, void *user_data);
void xpaste_reset(STATE, void *user_data);
