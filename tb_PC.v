`timescale 1ns / 1ps

module tb_PC();

    // Inputs
    reg clk;
    reg loadPC;
    reg incPC;
    reg [11:0] address;

    // Outputs
    wire [11:0] execadd;

    // Instantiate the PC module
    PC dut (
        .clk(clk),
        .loadPC(loadPC),
        .incPC(incPC),
        .address(address),
        .execadd(execadd)
    );

    // Clock generation
    always begin
        clk = 0;
        #5;  // Adjust the period as needed
        clk = 1;
        #5;  // Adjust the period as needed
    end

    // Test case 1: Load new address
    initial begin
        $display("Test case 1: Load new address");
        loadPC = 1;
        address = 12'h123;  // Load address 0x123
        incPC = 0;
        #10;  // Wait for some time
        loadPC = 0;
        #10;  // Wait for some time
        loadPC = 0;
        #10;  // Wait for some time
        loadPC = 0;
        #10;  // Wait for some time
        $display("execadd = %h", execadd);  // Should print 123
        $finish;
    end

    // Test case 2: Increment PC
    initial begin
        #50;  // Wait for previous test case to finish
        $display("Test case 2: Increment PC");
        loadPC = 0;
        address = 0;
        incPC = 1;
        #10;  // Wait for some time
        incPC = 0;
        #10;  // Wait for some time
        incPC = 0;
        #10;  // Wait for some time
        $display("execadd = %h", execadd);  // Should print 1 (0x000 + 1)
        $finish;
    end

    // Add more test cases as needed

endmodule
