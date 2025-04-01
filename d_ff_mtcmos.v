module d_ff_mtcmos(
    input D, clk, rst, sleep,
    output Q
);
    reg state;  // Internal state register

    always @(posedge clk or posedge rst)
    begin 
        if (rst)
            state <= 1'b0; // Reset the state
        else if (!sleep)
            state <= D; // Update the state if not in sleep mode
    end

    // Continuous assignment for Q
    assign Q = (sleep) ? 1'b0 : state;
endmodule