module hamming(ip,op);
input [3:0]ip;
output reg [6:0]op;

always@(*)
begin
op[2]=ip[0];
op[6:4]=ip[3:1];
case({ip[0],ip[1],ip[3]})
3'b011,3'b110,3'b101: op[0]=0;
default: op[0]=1;
endcase


case({ip[0],ip[2],ip[3]})
3'b011,3'b110,3'b101:
op[1]=0;
default: op[1]=1;
endcase

case({ip[2],ip[1],ip[3]})
3'b011,3'b110,3'b101:
op[3]=0;
default: op[3]=1;
endcase


end
endmodule

module test;
reg [3:0]ip;
wire [6:0]op;
hamming x1(ip,op);
initial
begin
ip=4'b1101; #5
$display("ip=%b,op=%b",ip,op);
ip=4'b1001; #5
$display("ip=%b,op=%b",ip,op);
ip=4'b1110; #5
$display("ip=%b,op=%b",ip,op);
$stop;
end
endmodule