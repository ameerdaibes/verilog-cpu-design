onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_ALU/A
add wave -noupdate -radix unsigned /tb_ALU/B
add wave -noupdate /tb_ALU/ALUControl
add wave -noupdate -radix unsigned /tb_ALU/Result
add wave -noupdate /tb_ALU/Zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {115 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 191
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {63 ps}
