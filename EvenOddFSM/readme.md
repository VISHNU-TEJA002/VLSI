# 4. Even/Odd Finite State Machine

## Description
`EvenOddFSM` is a simple Moore-type Finite State Machine (FSM) that determines if an 8-bit input number `data_in` is even or odd. The FSM has two states: `S_EVEN` and `S_ODD`.

On each positive clock edge, it checks the least significant bit (LSB) of `data_in`.
- If `data_in[0]` is `0`, the number is even, and the FSM transitions to the `S_EVEN` state.
- If `data_in[0]` is `1`, the number is odd, and the FSM transitions to the `S_ODD` state.

The output `is_odd` is a registered signal that reflects the machine's state (`is_odd` is high when the state is `S_ODD`).

### Ports
| Port      | Direction | Width | Description                                       |
|-----------|-----------|-------|---------------------------------------------------|
| `clk`     | Input     | 1-bit | Clock signal                                      |
| `reset`   | Input     | 1-bit | Active-high reset; sets state to `S_EVEN`         |
| `data_in` | Input     | 8-bit | The number to check                               |
| `is_odd`  | Output    | 1-bit | High if the last clocked number was odd           |
