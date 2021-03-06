
-- Copyright (C) 2001 Bill Billowitch.

-- Some of the work to develop this test suite was done with Air Force
-- support.  The Air Force and Bill Billowitch assume no
-- responsibilities for this software.

-- This file is part of VESTs (Vhdl tESTs).

-- VESTs is free software; you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the
-- Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version. 

-- VESTs is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for more details. 

-- You should have received a copy of the GNU General Public License
-- along with VESTs; if not, write to the Free Software Foundation,
-- Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 

-- ---------------------------------------------------------------------
--
-- $Id: tc1567.vhd,v 1.2 2001-10-26 16:29:42 paw Exp $
-- $Revision: 1.2 $
--
-- ---------------------------------------------------------------------

ENTITY c08s10b00x00p03n01i01567ent IS
END c08s10b00x00p03n01i01567ent;

ARCHITECTURE c08s10b00x00p03n01i01567arch OF c08s10b00x00p03n01i01567ent IS

BEGIN
  TESTING: PROCESS
    variable k : integer := 0;
    variable m : integer := 0;
  BEGIN
    L1: for i in boolean loop
      k := 5;
      L2: for j in 1 to 3 loop
        next L2;
        k := 3;
      end loop L2;
      m := m + 1;
    end loop L1;
    assert NOT(( k=5 ) and (m= boolean'Pos(boolean'High) - boolean'Pos(boolean'Low) + 1))
      report "***PASSED TEST: c08s10b00x00p03n01i01567"
      severity NOTE;
    assert (( k=5 ) and (m= boolean'Pos(boolean'High) - boolean'Pos(boolean'Low) + 1))
      report "***FAILED TEST: c08s10b00x00p03n01i01567 - A next statement with a loop label is only allowed within the labeled loop, and applies to that loop." 
      severity ERROR;
    wait;
  END PROCESS TESTING;

END c08s10b00x00p03n01i01567arch;
