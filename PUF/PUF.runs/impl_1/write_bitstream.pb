
c
Command: %s
53*	vivadotcl22
write_bitstream -force PUF.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35ti2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35ti2default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px? 
?
?Combinatorial Loop Allowed: 18 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. This loop has been identified in the constraints as being known and understood by use of the ALLOW_COMBINATORIAL_LOOPS property on a net in the loop. The cells in the loop are: %s.%s*DRC2?
 "b
%RO_A/SLICE_1/LUT_F/A_LUT_inferred_i_1	%RO_A/SLICE_1/LUT_F/A_LUT_inferred_i_12default:default"h
(RO_A/SLICE_2/LUT_F/A_LUT_inferred_i_1__0	(RO_A/SLICE_2/LUT_F/A_LUT_inferred_i_1__02default:default"h
(RO_A/SLICE_3/LUT_F/A_LUT_inferred_i_1__1	(RO_A/SLICE_3/LUT_F/A_LUT_inferred_i_1__12default:default"b
%RO_A/SLICE_1/LUT_F/B_LUT_inferred_i_1	%RO_A/SLICE_1/LUT_F/B_LUT_inferred_i_12default:default"h
(RO_A/SLICE_2/LUT_F/B_LUT_inferred_i_1__0	(RO_A/SLICE_2/LUT_F/B_LUT_inferred_i_1__02default:default"h
(RO_A/SLICE_3/LUT_F/B_LUT_inferred_i_1__1	(RO_A/SLICE_3/LUT_F/B_LUT_inferred_i_1__12default:default"b
%RO_A/SLICE_1/LUT_F/F_OUT_inferred_i_1	%RO_A/SLICE_1/LUT_F/F_OUT_inferred_i_12default:default"h
(RO_A/SLICE_2/LUT_F/F_OUT_inferred_i_1__0	(RO_A/SLICE_2/LUT_F/F_OUT_inferred_i_1__02default:default"h
(RO_A/SLICE_3/LUT_F/F_OUT_inferred_i_1__1	(RO_A/SLICE_3/LUT_F/F_OUT_inferred_i_1__12default:default"b
%RO_A/SLICE_1/LUT_G/G_OUT_inferred_i_1	%RO_A/SLICE_1/LUT_G/G_OUT_inferred_i_12default:default"h
(RO_A/SLICE_2/LUT_G/G_OUT_inferred_i_1__0	(RO_A/SLICE_2/LUT_G/G_OUT_inferred_i_1__02default:default"h
(RO_A/SLICE_3/LUT_G/G_OUT_inferred_i_1__1	(RO_A/SLICE_3/LUT_G/G_OUT_inferred_i_1__12default:default"Z
!RO_A/SLICE_1/MUX_OUT_inferred_i_1	!RO_A/SLICE_1/MUX_OUT_inferred_i_12default:default"`
$RO_A/SLICE_2/MUX_OUT_inferred_i_1__0	$RO_A/SLICE_2/MUX_OUT_inferred_i_1__02default:default"\
$RO_A/SLICE_3/MUX_OUT_inferred_i_1__1	$RO_A/SLICE_3/MUX_OUT_inferred_i_1__12default:..."/
(the first 15 of 18 listed)2default:default2default:default2C
 +DRC|Netlist|Design Level|Combinatorial Loop2default:default8ZLUTLP-2h px? 
?
?Combinatorial Loop Allowed: 18 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. This loop has been identified in the constraints as being known and understood by use of the ALLOW_COMBINATORIAL_LOOPS property on a net in the loop. The cells in the loop are: %s.%s*DRC2?
 "h
(RO_B/SLICE_1/LUT_F/A_LUT_inferred_i_1__2	(RO_B/SLICE_1/LUT_F/A_LUT_inferred_i_1__22default:default"h
(RO_B/SLICE_2/LUT_F/A_LUT_inferred_i_1__3	(RO_B/SLICE_2/LUT_F/A_LUT_inferred_i_1__32default:default"h
(RO_B/SLICE_3/LUT_F/A_LUT_inferred_i_1__4	(RO_B/SLICE_3/LUT_F/A_LUT_inferred_i_1__42default:default"h
(RO_B/SLICE_1/LUT_F/B_LUT_inferred_i_1__2	(RO_B/SLICE_1/LUT_F/B_LUT_inferred_i_1__22default:default"h
(RO_B/SLICE_2/LUT_F/B_LUT_inferred_i_1__3	(RO_B/SLICE_2/LUT_F/B_LUT_inferred_i_1__32default:default"h
(RO_B/SLICE_3/LUT_F/B_LUT_inferred_i_1__4	(RO_B/SLICE_3/LUT_F/B_LUT_inferred_i_1__42default:default"h
(RO_B/SLICE_1/LUT_F/F_OUT_inferred_i_1__2	(RO_B/SLICE_1/LUT_F/F_OUT_inferred_i_1__22default:default"h
(RO_B/SLICE_2/LUT_F/F_OUT_inferred_i_1__3	(RO_B/SLICE_2/LUT_F/F_OUT_inferred_i_1__32default:default"h
(RO_B/SLICE_3/LUT_F/F_OUT_inferred_i_1__4	(RO_B/SLICE_3/LUT_F/F_OUT_inferred_i_1__42default:default"h
(RO_B/SLICE_1/LUT_G/G_OUT_inferred_i_1__2	(RO_B/SLICE_1/LUT_G/G_OUT_inferred_i_1__22default:default"h
(RO_B/SLICE_2/LUT_G/G_OUT_inferred_i_1__3	(RO_B/SLICE_2/LUT_G/G_OUT_inferred_i_1__32default:default"h
(RO_B/SLICE_3/LUT_G/G_OUT_inferred_i_1__4	(RO_B/SLICE_3/LUT_G/G_OUT_inferred_i_1__42default:default"`
$RO_B/SLICE_1/MUX_OUT_inferred_i_1__2	$RO_B/SLICE_1/MUX_OUT_inferred_i_1__22default:default"`
$RO_B/SLICE_2/MUX_OUT_inferred_i_1__3	$RO_B/SLICE_2/MUX_OUT_inferred_i_1__32default:default"\
$RO_B/SLICE_3/MUX_OUT_inferred_i_1__4	$RO_B/SLICE_3/MUX_OUT_inferred_i_1__42default:..."/
(the first 15 of 18 listed)2default:default2default:default2C
 +DRC|Netlist|Design Level|Combinatorial Loop2default:default8ZLUTLP-2h px? 
?
?Combinatorial Loop Allowed: 18 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. This loop has been identified in the constraints as being known and understood by use of the ALLOW_COMBINATORIAL_LOOPS property on a net in the loop. The cells in the loop are: %s.%s*DRC2?
 "h
(RO_C/SLICE_1/LUT_F/A_LUT_inferred_i_1__5	(RO_C/SLICE_1/LUT_F/A_LUT_inferred_i_1__52default:default"h
(RO_C/SLICE_2/LUT_F/A_LUT_inferred_i_1__6	(RO_C/SLICE_2/LUT_F/A_LUT_inferred_i_1__62default:default"h
(RO_C/SLICE_3/LUT_F/A_LUT_inferred_i_1__7	(RO_C/SLICE_3/LUT_F/A_LUT_inferred_i_1__72default:default"h
(RO_C/SLICE_1/LUT_F/B_LUT_inferred_i_1__5	(RO_C/SLICE_1/LUT_F/B_LUT_inferred_i_1__52default:default"h
(RO_C/SLICE_2/LUT_F/B_LUT_inferred_i_1__6	(RO_C/SLICE_2/LUT_F/B_LUT_inferred_i_1__62default:default"h
(RO_C/SLICE_3/LUT_F/B_LUT_inferred_i_1__7	(RO_C/SLICE_3/LUT_F/B_LUT_inferred_i_1__72default:default"h
(RO_C/SLICE_1/LUT_F/F_OUT_inferred_i_1__5	(RO_C/SLICE_1/LUT_F/F_OUT_inferred_i_1__52default:default"h
(RO_C/SLICE_2/LUT_F/F_OUT_inferred_i_1__6	(RO_C/SLICE_2/LUT_F/F_OUT_inferred_i_1__62default:default"h
(RO_C/SLICE_3/LUT_F/F_OUT_inferred_i_1__7	(RO_C/SLICE_3/LUT_F/F_OUT_inferred_i_1__72default:default"h
(RO_C/SLICE_1/LUT_G/G_OUT_inferred_i_1__5	(RO_C/SLICE_1/LUT_G/G_OUT_inferred_i_1__52default:default"h
(RO_C/SLICE_2/LUT_G/G_OUT_inferred_i_1__6	(RO_C/SLICE_2/LUT_G/G_OUT_inferred_i_1__62default:default"h
(RO_C/SLICE_3/LUT_G/G_OUT_inferred_i_1__7	(RO_C/SLICE_3/LUT_G/G_OUT_inferred_i_1__72default:default"`
$RO_C/SLICE_1/MUX_OUT_inferred_i_1__5	$RO_C/SLICE_1/MUX_OUT_inferred_i_1__52default:default"`
$RO_C/SLICE_2/MUX_OUT_inferred_i_1__6	$RO_C/SLICE_2/MUX_OUT_inferred_i_1__62default:default"\
$RO_C/SLICE_3/MUX_OUT_inferred_i_1__7	$RO_C/SLICE_3/MUX_OUT_inferred_i_1__72default:..."/
(the first 15 of 18 listed)2default:default2default:default2C
 +DRC|Netlist|Design Level|Combinatorial Loop2default:default8ZLUTLP-2h px? 
?
?Combinatorial Loop Allowed: 18 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. This loop has been identified in the constraints as being known and understood by use of the ALLOW_COMBINATORIAL_LOOPS property on a net in the loop. The cells in the loop are: %s.%s*DRC2?
 "h
(RO_D/SLICE_1/LUT_F/A_LUT_inferred_i_1__8	(RO_D/SLICE_1/LUT_F/A_LUT_inferred_i_1__82default:default"h
(RO_D/SLICE_2/LUT_F/A_LUT_inferred_i_1__9	(RO_D/SLICE_2/LUT_F/A_LUT_inferred_i_1__92default:default"j
)RO_D/SLICE_3/LUT_F/A_LUT_inferred_i_1__10	)RO_D/SLICE_3/LUT_F/A_LUT_inferred_i_1__102default:default"h
(RO_D/SLICE_1/LUT_F/B_LUT_inferred_i_1__8	(RO_D/SLICE_1/LUT_F/B_LUT_inferred_i_1__82default:default"h
(RO_D/SLICE_2/LUT_F/B_LUT_inferred_i_1__9	(RO_D/SLICE_2/LUT_F/B_LUT_inferred_i_1__92default:default"j
)RO_D/SLICE_3/LUT_F/B_LUT_inferred_i_1__10	)RO_D/SLICE_3/LUT_F/B_LUT_inferred_i_1__102default:default"h
(RO_D/SLICE_1/LUT_F/F_OUT_inferred_i_1__8	(RO_D/SLICE_1/LUT_F/F_OUT_inferred_i_1__82default:default"h
(RO_D/SLICE_2/LUT_F/F_OUT_inferred_i_1__9	(RO_D/SLICE_2/LUT_F/F_OUT_inferred_i_1__92default:default"j
)RO_D/SLICE_3/LUT_F/F_OUT_inferred_i_1__10	)RO_D/SLICE_3/LUT_F/F_OUT_inferred_i_1__102default:default"h
(RO_D/SLICE_1/LUT_G/G_OUT_inferred_i_1__8	(RO_D/SLICE_1/LUT_G/G_OUT_inferred_i_1__82default:default"h
(RO_D/SLICE_2/LUT_G/G_OUT_inferred_i_1__9	(RO_D/SLICE_2/LUT_G/G_OUT_inferred_i_1__92default:default"j
)RO_D/SLICE_3/LUT_G/G_OUT_inferred_i_1__10	)RO_D/SLICE_3/LUT_G/G_OUT_inferred_i_1__102default:default"`
$RO_D/SLICE_1/MUX_OUT_inferred_i_1__8	$RO_D/SLICE_1/MUX_OUT_inferred_i_1__82default:default"`
$RO_D/SLICE_2/MUX_OUT_inferred_i_1__9	$RO_D/SLICE_2/MUX_OUT_inferred_i_1__92default:default"^
%RO_D/SLICE_3/MUX_OUT_inferred_i_1__10	%RO_D/SLICE_3/MUX_OUT_inferred_i_1__102default:..."/
(the first 15 of 18 listed)2default:default2default:default2C
 +DRC|Netlist|Design Level|Combinatorial Loop2default:default8ZLUTLP-2h px? 
?
_No routable loads: 8 net(s) have no routable loads. The problem bus(es) and/or net(s) are %s.%s*DRC2?
 "0
CH_REG_IN[8]CH_REG_IN[8]2default:default"0
CH_REG_IN[9]CH_REG_IN[9]2default:default"2
CH_REG_IN[10]CH_REG_IN[10]2default:default"2
CH_REG_IN[11]CH_REG_IN[11]2default:default"2
CH_REG_IN[12]CH_REG_IN[12]2default:default"2
CH_REG_IN[13]CH_REG_IN[13]2default:default"2
CH_REG_IN[14]CH_REG_IN[14]2default:default"2
CH_REG_IN[15]CH_REG_IN[15]2default:default2default:default2=
 %DRC|Implementation|Routing|Chip Level2default:default8Z	RTSTAT-10h px? 
?
?Resource utilization: LUT as Logic over-utilized in Pblock %s (Pblock pblock_RO_A_1 has 18 LUT as Logic(s) assigned to it, but only 8 LUT as Logic(s) are available in the area range defined. The placer will attempt to combine LUT as Logic(s) to make the assigned LUT as Logic(s) fit in the Pblock range. This may cause increased runtime and negative performance. It is highly encouraged that either the Pblock slice range is increased or fewer LUT as Logic(s) are assigned to the Pblock.)%s*DRC2H
 "2
pblock_RO_A_1pblock_RO_A_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: LUT as Logic over-utilized in Pblock %s (Pblock pblock_RO_B_1 has 17 LUT as Logic(s) assigned to it, but only 8 LUT as Logic(s) are available in the area range defined. The placer will attempt to combine LUT as Logic(s) to make the assigned LUT as Logic(s) fit in the Pblock range. This may cause increased runtime and negative performance. It is highly encouraged that either the Pblock slice range is increased or fewer LUT as Logic(s) are assigned to the Pblock.)%s*DRC2H
 "2
pblock_RO_B_1pblock_RO_B_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: LUT as Logic over-utilized in Pblock %s (Pblock pblock_RO_C_1 has 16 LUT as Logic(s) assigned to it, but only 8 LUT as Logic(s) are available in the area range defined. The placer will attempt to combine LUT as Logic(s) to make the assigned LUT as Logic(s) fit in the Pblock range. This may cause increased runtime and negative performance. It is highly encouraged that either the Pblock slice range is increased or fewer LUT as Logic(s) are assigned to the Pblock.)%s*DRC2H
 "2
pblock_RO_C_1pblock_RO_C_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: LUT1 and LUT3 over-utilized in Pblock %s (This design requires more LUT1 and LUT3 cells than are available in Pblock 'pblock_RO_A_1'. This design requires 18 of such cell types but only 16 compatible sites are available in Pblock 'pblock_RO_A_1'. Please consider increasing the span of Pblock 'pblock_RO_A_1' or removing cells from it.)%s*DRC2H
 "2
pblock_RO_A_1pblock_RO_A_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: LUT1 and LUT3 over-utilized in Pblock %s (This design requires more LUT1 and LUT3 cells than are available in Pblock 'pblock_RO_B_1'. This design requires 18 of such cell types but only 16 compatible sites are available in Pblock 'pblock_RO_B_1'. Please consider increasing the span of Pblock 'pblock_RO_B_1' or removing cells from it.)%s*DRC2H
 "2
pblock_RO_B_1pblock_RO_B_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: LUT1 and LUT3 over-utilized in Pblock %s (This design requires more LUT1 and LUT3 cells than are available in Pblock 'pblock_RO_C_1'. This design requires 18 of such cell types but only 16 compatible sites are available in Pblock 'pblock_RO_C_1'. Please consider increasing the span of Pblock 'pblock_RO_C_1' or removing cells from it.)%s*DRC2H
 "2
pblock_RO_C_1pblock_RO_C_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: Slice LUTs over-utilized in Pblock %s (Pblock pblock_RO_A_1 has 18 Slice LUTs(s) assigned to it, but only 8 Slice LUTs(s) are available in the area range defined. The placer will attempt to combine Slice LUTs(s) to make the assigned Slice LUTs(s) fit in the Pblock range. This may cause increased runtime and negative performance. It is highly encouraged that either the Pblock slice range is increased or fewer Slice LUTs(s) are assigned to the Pblock.)%s*DRC2H
 "2
pblock_RO_A_1pblock_RO_A_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: Slice LUTs over-utilized in Pblock %s (Pblock pblock_RO_B_1 has 17 Slice LUTs(s) assigned to it, but only 8 Slice LUTs(s) are available in the area range defined. The placer will attempt to combine Slice LUTs(s) to make the assigned Slice LUTs(s) fit in the Pblock range. This may cause increased runtime and negative performance. It is highly encouraged that either the Pblock slice range is increased or fewer Slice LUTs(s) are assigned to the Pblock.)%s*DRC2H
 "2
pblock_RO_B_1pblock_RO_B_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: Slice LUTs over-utilized in Pblock %s (Pblock pblock_RO_C_1 has 16 Slice LUTs(s) assigned to it, but only 8 Slice LUTs(s) are available in the area range defined. The placer will attempt to combine Slice LUTs(s) to make the assigned Slice LUTs(s) fit in the Pblock range. This may cause increased runtime and negative performance. It is highly encouraged that either the Pblock slice range is increased or fewer Slice LUTs(s) are assigned to the Pblock.)%s*DRC2H
 "2
pblock_RO_C_1pblock_RO_C_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: Slice over-utilized in Pblock %s (This design requires more Slice cells than are available in Pblock 'pblock_RO_A_1'. This design requires 5 of such cell types but only 2 compatible sites are available in Pblock 'pblock_RO_A_1'. Please consider increasing the span of Pblock 'pblock_RO_A_1' or removing cells from it.)%s*DRC2H
 "2
pblock_RO_A_1pblock_RO_A_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: Slice over-utilized in Pblock %s (This design requires more Slice cells than are available in Pblock 'pblock_RO_B_1'. This design requires 6 of such cell types but only 2 compatible sites are available in Pblock 'pblock_RO_B_1'. Please consider increasing the span of Pblock 'pblock_RO_B_1' or removing cells from it.)%s*DRC2H
 "2
pblock_RO_B_1pblock_RO_B_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: Slice over-utilized in Pblock %s (This design requires more Slice cells than are available in Pblock 'pblock_RO_C_1'. This design requires 4 of such cell types but only 2 compatible sites are available in Pblock 'pblock_RO_C_1'. Please consider increasing the span of Pblock 'pblock_RO_C_1' or removing cells from it.)%s*DRC2H
 "2
pblock_RO_C_1pblock_RO_C_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: pblock_RO_A_1 over-utilized in Pblock %s (Pblock pblock_RO_A_1 IS_SOFT property set. Ignoring capacity requirements for cells assigned to Pblock.)%s*DRC2H
 "2
pblock_RO_A_1pblock_RO_A_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: pblock_RO_B_1 over-utilized in Pblock %s (Pblock pblock_RO_B_1 IS_SOFT property set. Ignoring capacity requirements for cells assigned to Pblock.)%s*DRC2H
 "2
pblock_RO_B_1pblock_RO_B_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
?
?Resource utilization: pblock_RO_C_1 over-utilized in Pblock %s (Pblock pblock_RO_C_1 IS_SOFT property set. Ignoring capacity requirements for cells assigned to Pblock.)%s*DRC2H
 "2
pblock_RO_C_1pblock_RO_C_12default:default2default:default2,
 DRC|Floorplan|Pblock2default:default8ZUTLZ-3h px? 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 21 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
Z
Writing bitstream %s...
11*	bitstream2
	./PUF.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
?
?WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px? 
?
?'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2b
NC:/Users/alici/Desktop/CPE426/PUF/PUF.runs/impl_1/usage_statistics_webtalk.xml2default:default2,
Sat Jan 16 23:36:24 20212default:default2I
5C:/Xilinx/Vivado/2020.2/doc/webtalk_introduction.html2default:defaultZ17-186h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
132default:default2
212default:default2
02default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:192default:default2
00:00:182default:default2
2204.8092default:default2
457.0662default:defaultZ17-268h px? 


End Record