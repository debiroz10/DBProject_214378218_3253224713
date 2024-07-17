PL/SQL Developer Test script 3.0
5
begin
  -- Call the function
  :result := find_highest_priced_order(p_invitation_ids => :p_invitation_ids,
                                       p_prices => :p_prices);
end;
3
result
1
﻿Highest Price: $100000, Invitation ID: 1
5
p_invitation_ids
1
﻿1,2,3,4
5
p_prices
1
﻿100000,23456,76584,87659
5
0
