# 9. Rotator Unit

## Description
The `RotatorUnit` is a sequential module that can load an 8-bit value and then perform a bitwise rotation on that value. The direction of rotation (left or right) is controlled by an input signal.

### How it Works
- **Reset**: If `reset` is high, the internal register is cleared to `0`.
- **Load**: If `load` is high, the internal register is updated with the value from `data_in`.
- **Rotate**: If `load` is low, the module performs a rotation.
  - If `direction` is `0`, the register is rotated left.
  - If `direction` is `1`, the register is rotated right.

### Ports
| Port        | Direction | Width | Description                               |
|-------------|-----------|-------|-------------------------------------------|
| `clk`       | Input     | 1-bit | System clock                              |
| `reset`     | Input     | 1-bit | Active-high reset                         |
| `load`      | Input     | 1-bit | High to load `data_in` into the register  |
| `direction` | Input     | 1-bit | Rotation direction: `0`=Left, `1`=Right   |
| `data_in`   | Input     | 8-bit | The 8-bit value to load                   |
| `data_out`  | Output    | 8-bit | The current value of the internal register|
