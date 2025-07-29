# 8. Sequence Check

## Description
The `SeqCheck` module detects when exactly three rising edges (`0` to `1` transitions) occur on the `signal_in` line within any 5-clock-cycle sliding window.

### How it Works
1.  **Edge Detection**: A flip-flop stores the previous state of `signal_in` to detect a rising edge.
2.  **Sliding Window**: A 5-bit shift register, `edge_history`, acts as the sliding window. Each cycle, it's loaded with a `1` if a rising edge occurred, or `0` otherwise.
3.  **Counting & Flagging**: Logic continuously adds the bits in the `edge_history` register. The output `flag_out` is asserted for one clock cycle at the exact moment the count of rising edges in the window becomes three.

### Ports
| Port        | Direction | Width | Description                                    |
|-------------|-----------|-------|------------------------------------------------|
| `clk`       | Input     | 1-bit | System clock                                   |
| `reset`     | Input     | 1-bit | Active-high reset                              |
| `signal_in` | Input     | 1-bit | The input signal to monitor for rising edges   |
| `flag_out`  | Output    | 1-bit | Asserted for one cycle when sequence is detected|
