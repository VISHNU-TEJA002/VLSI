# 3. Nibble Swapper

## Description
The `NibbleSwapper` module conditionally swaps the upper 4 bits (nibble) and lower 4 bits of an 8-bit input `data_in`. The operation is controlled by the `enable` signal.
- If `enable` is high (1), the output `data_out` will have the nibbles swapped.
- If `enable` is low (0), the output `data_out` will be identical to the input `data_in`.

This is a combinational module.

### Ports
| Port      | Direction | Width | Description                                       |
|-----------|-----------|-------|---------------------------------------------------|
| `enable`  | Input     | 1-bit | Controls the swap operation                       |
| `data_in` | Input     | 8-bit | The original 8-bit data                           |
| `data_out`| Output    | 8-bit | The potentially swapped 8-bit data                |
