```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity fixed_counter is
  generic (
    increment : integer := 1;  -- Allow generic increment value
    max_count : integer := 15 -- Allow generic max count value
  );
  port (
    clk : in std_logic;
    rst : in std_logic;
    count : out integer range 0 to max_count
  );
end entity;

architecture behavioral of fixed_counter is
  signal internal_count : integer range 0 to max_count := 0;
begin
  process (clk, rst)
  begin
    if rst = '1' then
      internal_count <= 0;
    elsif rising_edge(clk) then
      internal_count <= (internal_count + increment) mod (max_count + 1);
    end if;
  end process;
  count <= internal_count;
end architecture;
```