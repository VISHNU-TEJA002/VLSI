# 2. Bib Counter (Population Count)

## Description
The `BibCounter` module performs a population count, which means it counts the number of bits set to '1' within an 8-bit input vector `data_in`. The result is a 4-bit number `count_out` (ranging from 0 to 8). This module is implemented as a purely combinational circuit, so the output updates immediately in response to changes in the input.

### Ports
| Port        | Direction | Width | Description                             |
|-------------|-----------|-------|-----------------------------------------|
| `data_in`   | Input     | 8-bit | The input vector to be evaluated        |
| `count_out` | Output    | 4-bit | The number of '1's in `data_in`       |
