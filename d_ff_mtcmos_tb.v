module d_ff_mtcmos_tb;
    reg D, clk, rst, sleep;
    wire Q;

    // Instantiate the d_ff_mtcmos module
    d_ff_mtcmos uut (
        .D(D),
        .clk(clk),
        .rst(rst),
        .sleep(sleep),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 0;D = 1;sleep = 0;#10;
        // Apply reset
        rst = 1;D = 0;#10;
        // Test normal operation
        rst = 0;D = 0;#10;
        D = 1;#10;
        // Test sleep mode
        sleep = 1;#10;
        sleep = 0;#10;
    end

    // Stop simulation after 1000 time units
    initial begin
        #1000 $finish;
    end

    // Dump waveforms for debugging
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1, d_ff_mtcmos_tb);  // Use 1 instead of 0 to limit scope
    end
endmodule