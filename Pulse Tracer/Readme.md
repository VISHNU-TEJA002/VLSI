# 1. Pulse Detector

## Description
This Verilog module, `PulseDetector`, is designed to identify a clean, single-cycle high pulse from a potentially noisy input signal `data_in`. It uses a shift-register approach to look for a `0-1-0` pattern over three consecutive clock cycles. This method ensures that longer pulses (glitches) are ignored and only true single-cycle events trigger the `pulse_out` signal for one clock cycle.

### Ports
| Port        | Direction | Width | Description                             |
|-------------|-----------|-------|-----------------------------------------|
| `clk`       | Input     | 1-bit | Clock signal                            |
| `reset`     | Input     | 1-bit | Asynchronous reset, active high         |
| `data_in`   | Input     | 1-bit | The input signal to monitor             |
| `pulse_out` | Output    | 1-bit | Goes high for one cycle when a pulse is detected |


# Output
;
![Waveform](../images/1.png)
