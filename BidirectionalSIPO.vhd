library ieee;
use ieee.std_logic_1164.all;
use work.all;
entity SIPOBidireccional is
port( CLK,CLR,SI,Dir : in std_logic;
                 PO  : out std_logic_vector(7 downto 0)
);
end SIPOBidireccional;

architecture behavioral of SIPOBidireccional is
signal temp:std_logic_vector(7 downto 0);
begin
process(CLK,CLR,temp)
begin
if(CLR = '1')then 
temp <= (others => '0');
elsif(CLK'event and CLK = '1') then
if(Dir = '0') then
temp(6 downto 0) <= temp(7 downto 1);
temp(7) <= SI;
else 
temp(7 downto 1) <= temp(6 downto 0);
temp(0) <= SI;
end if;
end if;
PO <= temp;
end process;
end behavioral;
