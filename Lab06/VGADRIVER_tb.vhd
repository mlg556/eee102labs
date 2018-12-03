library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VGADRIVER_tb is
end entity;

architecture Behavioural of VGADRIVER_tb is

    constant c_WAIT : time := 20 ns ; -- for 25.17 MHz clock

    signal sim_25MHz : std_logic := '0';
    signal sim_RST : std_logic := '0';
    signal sim_HSYNC : std_logic := '0';
    signal sim_VSYNC : std_logic := '0';

    component VGADRIVER is
            Port (
            CLK : in STD_LOGIC ;
            RESET: in STD_LOGIC ;
            HSYNC : out STD_LOGIC ;
            VSYNC : out STD_LOGIC  ;

            RED0 : out STD_LOGIC ;
            RED1 : out STD_LOGIC ;
            RED2 : out STD_LOGIC ;
            RED3 : out STD_LOGIC ;

            GRN0 : out STD_LOGIC ;
            GRN1 : out STD_LOGIC ;
            GRN2 : out STD_LOGIC ;
            GRN3 : out STD_LOGIC ;


            BLU0 : out STD_LOGIC ;
            BLU1 : out STD_LOGIC ;
            BLU2 : out STD_LOGIC ;
            BLU3 : out STD_LOGIC
            );
        end component VGADRIVER;

        begin

            UUT : VGADRIVER

            port map(
            CLK => sim_25MHz,
            RESET => sim_RST,
            HSYNC => sim_HSYNC,
            VSYNC => sim_VSYNC
            );

            p_CLK_GEN : process is
                begin
                    wait for c_WAIT;
                    sim_25MHz <= '1';
                    wait for c_WAIT;
                    sim_25MHz <= '0';
                end process;

            end Behavioural;
