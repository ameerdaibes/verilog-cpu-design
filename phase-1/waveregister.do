onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_RegisterFile/clk
add wave -noupdate /tb_RegisterFile/RegWrite
add wave -noupdate -radix unsigned /tb_RegisterFile/rs
add wave -noupdate -radix unsigned /tb_RegisterFile/rt
add wave -noupdate -radix unsigned /tb_RegisterFile/rd
add wave -noupdate -radix unsigned /tb_RegisterFile/WriteData
add wave -noupdate -radix unsigned /tb_RegisterFile/ReadData1
add wave -noupdate -radix unsigned /tb_RegisterFile/ReadData2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 234
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
WaveRestoreZoom {0 ps} {73500 ps}
