module barrel_shifter(
  input wire [7:0] data_in,
  input wire [2:0] shift_amount,
  input wire [3:0] shift_function,
  output reg [7:0] data_out
);
  reg [7:0] shifted_data;
  always@(*) begin
    case(shift_function)
      4'b0000:shifted_data = data_in
      4'b0001:shifted_data = data_in << shift_amount;
      4'b0010:shifted_data = data_in >>> shift_amount;
      4'b0011:shifted_data = data_in << shift_amount;
      4'b0100:shifted_data = data_in >> shift_amount;
      4'b0101:shifted_data = (data_in << shift_amount) | (data_in >> (8-shift_amount));
      4'b0110:shifted_data = (data_in >> shift_amount) | (data_in << (8-shift_amount));
      4'b0111:shifted_data = data_in << shift_amount;
      4'b1000:shifted_data = data_in >> shift_amount;
      default:shifted_data =8'b0;
    endcase
  end
  assign data_out = shifted_data;
endmodule
  
