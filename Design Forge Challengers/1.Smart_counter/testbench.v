`timescale 1ns/1ps
module smartcounter_tb;

    reg clk, reset, enable, load;
    reg [7:0] data_in;
    wire [7:0] count;

    integer pass = 0, fail = 0;

    smartcounter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .load(load),
        .data_in(data_in),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Self-check task
    task check(input [7:0] expected, input [255:0] msg);
        begin
            #1; // small delay after clock
            if (count === expected) begin
                $display("PASS: %s | count=%0d", msg, count);
                pass = pass + 1;
            end else begin
                $display("FAIL: %s | got=%0d expected=%0d", msg, count, expected);
                fail = fail + 1;
            end
        end
    endtask

    initial begin
        $dumpfile("smartcounter.vcd");
        $dumpvars(0, smartcounter_tb);

        clk = 0; reset = 0; enable = 0; load = 0; data_in = 0;

        // ------------------------------
        // TEST 1: Reset should set to 0
        // ------------------------------
        reset = 1;
        @(posedge clk);
        reset = 0;
        check(8'd0, "Reset test");

        // ---------------------------------
        // TEST 2: Load a value
        // ---------------------------------
        data_in = 8'd100;
        load = 1;
        @(posedge clk);
        load = 0;
        check(8'd100, "Load value test");

        // ---------------------------------
        // TEST 3: Enable counting
        // ---------------------------------
        enable = 1;
        @(posedge clk); check(8'd101, "Enable count +1");
        @(posedge clk); check(8'd102, "Enable count +1 twice");

        // ---------------------------------
        // TEST 4: Disable count
        // ---------------------------------
        enable = 0;
        @(posedge clk);
        check(8'd102, "Disabled counter should hold value");

        // ---------------------------------
        // TEST 5: Load overrides enable
        // ---------------------------------
        enable = 1;
        data_in = 8'd200;
        load = 1;
        @(posedge clk);
        load = 0;
        check(8'd200, "Load overrides counting");

        // ---------------------------------
        // TEST 6: Saturation wrap test
        // ---------------------------------
        data_in = 8'hFE;
        load = 1;
        @(posedge clk);
        load = 0;

        @(posedge clk);  // FE -> FF
        check(8'hFF, "Counting to 255");
        @(posedge clk);  // FF -> 00
        check(8'h00, "Wrap around 255->0");

        // Final report
        $display("==== TEST SUMMARY ====");
        $display("PASSED: %0d", pass);
        $display("FAILED: %0d", fail);
        if (fail == 0) $display("ALL TESTS PASSED!");
        else $display("SOME TESTS FAILED");
        
        $finish;
    end

endmodule
