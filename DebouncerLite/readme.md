# 6. Signal Debouncer

## Description
Mechanical switches and buttons do not produce clean electrical signals when pressed. They "bounce," creating a series of rapid on-off transitions before settling into a stable state. The `Debouncer` module filters this noise to produce a single, clean output transition.

### How it Works
1.  **Synchronization**: The raw input `noisy_in` is first passed through a two-flop synchronizer to prevent metastability.
2.  **Counter Logic**: When the synchronized input differs from the current stable output `clean_out`, a counter starts.
3.  **Validation**: If the input remains stable for a pre-defined duration (e.g., 20ms), the counter will reach its maximum value. Only then is the `clean_out` signal updated to the new stable value. If the input bounces, the counter is reset, filtering out the noise.

### Ports
| Port        | Direction | Width | Description                             |
|-------------|-----------|-------|-----------------------------------------|
| `clk`       | Input     | 1-bit | System clock signal                     |
| `reset`     | Input     | 1-bit | Active-high reset                       |
| `noisy_in`  | Input     | 1-bit | The raw, noisy signal from a switch     |
| `clean_out` | Output    | 1-bit | The clean, debounced output signal      |
