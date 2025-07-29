# 5. Binary to Gray Code Converter

## Description
The `GrayCoder` module converts a 4-bit binary number `bin_in` into its corresponding 4-bit Gray code representation `gray_out`. Gray codes are sequences where two successive values differ in only one bit.

The conversion formula is:
- $G_i = B_i \oplus B_{i+1}$
- For the Most Significant Bit (MSB), $G_{MSB} = B_{MSB}$

In Verilog, this is efficiently implemented as `gray_out = bin_in ^ (bin_in >> 1)`. To save power, the module only updates the `gray_out` value on a clock edge if the `bin_in` value has changed.

### Ports
| Port       | Direction | Width | Description                                    |
|------------|-----------|-------|------------------------------------------------|
| `clk`      | Input     | 1-bit | Clock signal                                   |
| `reset`    | Input     | 1-bit | Active-high reset                              |
| `bin_in`   | Input     | 4-bit | The binary input value                         |
| `gray_out` | Output    | 4-bit | The Gray code equivalent of `bin_in`           |
