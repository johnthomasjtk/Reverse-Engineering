import sys
import binascii

inp = raw_input()
if len(inp)!=6:
	print ("BOOM!!! BOMB EXPLODED")
else:
	out="giants"
	s="isrveawhobpnutfg"
	output=""
	for i in range(0,len(inp)):
		a=int(hex(ord(inp[i])),16)&15
		output=output+s[a]
	if(out==output):
		print("Good work!  On to the next...")
	else:
		print("BOOM!!! BOMB EXPLODED")
