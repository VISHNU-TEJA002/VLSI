# 10. Edge Highlighter

## Description
The `EdgeHighlighter` is a utility module used to detect transitions on a signal. It monitors an input signal and generates separate, single-cycle output pulses to indicate when a rising edge (`0` to `1`) or a falling edge (`1` to `0`) has occurred.

### How it Works
1.  A register (`signal_in_d1`) stores the value of `signal_in` from the previous clock cycle.
2.  The current value of `signal_in` is compared to its previous value (`signal_in_d1`).
3.  A **rising edge** is detected if `signal_in` is now `1` AND `signal_in_d1` was `0`.
4.  A **falling edge** is detected if `signal_in` is now `0` AND `signal_in_d1` was `1`.

The outputs `rising_edge` and `falling_edge` will be high for exactly one clock cycle when their respective events are detected.

### Ports
| Port           | Direction | Width | Description                                    |
|----------------|-----------|-------|------------------------------------------------|
| `clk`          | Input     | 1-bit | System clock                                   |
| `reset`        | Input     | 1-bit | Active-high reset                              |
| `signal_in`    | Input     | 1-bit | The input signal to monitor                    |
| `rising_edge`  | Output    | 1-bit | Pulses high for one cycle on a rising edge     |
| `falling_edge` | Output    | 1-bit | Pulses high for one cycle on a falling edge    |
