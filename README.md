# VHDL Counter with Potential Overflow

This repository demonstrates a common but subtle bug in VHDL counters. The provided code implements a simple counter that increments on each rising clock edge. However, the current implementation only correctly handles an increment of 1. If the intended increment is greater than 1, an overflow condition will not be handled properly and could lead to unexpected behavior.

## Bug Description

The `buggy_counter.vhdl` file contains the buggy code.  The `if internal_count = 15 then` statement only handles the case where the counter increments by 1.  If the increment value is larger than 1, the counter will incorrectly wrap around.

## Solution

The `fixed_counter.vhdl` file shows the solution which uses modulo operator to solve the overflow issue regardless of the increment value.  This ensures the counter always correctly wraps around to 0 after reaching the maximum value.