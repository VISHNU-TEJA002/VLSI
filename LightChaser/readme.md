# 7. Light Chaser

## Description
The `LightChaser` module generates a rotating light pattern. It outputs an 8-bit vector `leds` where a single bit is high ('1'), and this high bit shifts its position periodically.

### How it Works
- On reset, the pattern is initialized to `8'b00000001`.
- A counter is used to create a delay. The length of this delay is set by the `SHIFT_DELAY_CYCLES` parameter.
- When the `enable` signal is high, the counter increments. Once the counter reaches its max value, it resets, and the `leds` pattern is rotated left by one position.
- If `enable` is low, the counter and the pattern are frozen.

### Ports
| Port      | Direction | Width | Description                                       |
|-----------|-----------|-------|---------------------------------------------------|
| `clk`     | Input     | 1-bit | System clock                                      |
| `reset`   | Input     | 1-bit | Active-high reset, sets pattern to initial state  |
| `enable`  | Input     | 1-bit | Enables the shifting operation                    |
| `leds`    | Output    | 8-bit | The 8-bit LED pattern                             |
