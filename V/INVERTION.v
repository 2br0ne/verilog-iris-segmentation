module INVERTION(
        oDVAL,
        oDATA_R,
		  oDATA_G,
		  oDATA_B,
		  iH_Cont,
		  iV_Cont,
        iRed,
        iGreen,
        iBlue,
        iCLK,
        iRST,
        iDVAL,
		);
		
`include "SEM_Param.h"
		
input			iDVAL;
input			iCLK;
input			iRST;
output reg[9:0]	oDATA_R;
output reg[9:0]	oDATA_G;
output reg[9:0]	oDATA_B;
output reg		oDVAL;

// coords
input		[12:0]	iH_Cont;
input		[12:0]	iV_Cont;

input		[9:0]	iRed;
input		[9:0]	iGreen;
input		[9:0]	iBlue;

always@(posedge iCLK or negedge iRST)
begin
  if(!iRST)
    begin
	  oDVAL   <= 0;
     oDATA_R   <= 10'b0;
	  oDATA_G   <= 10'b0;
	  oDATA_B   <= 10'b0;
    end
  else
    begin
	  if(iH_Cont > 10'b0011111111 && iH_Cont < 10'b1010000000)
	  begin
		oDVAL   <= iDVAL;
	   oDATA_R   <= iRed[9:0];
	   oDATA_G   <= iGreen[9:0];
	   oDATA_B   <= iBlue[9:0];
	  end
	  else
	  begin
	  	oDVAL   <= iDVAL;
	   oDATA_R   <= 0;
	   oDATA_G   <= 0;
	   oDATA_B   <= 0;
	  end
    end
end
endmodule