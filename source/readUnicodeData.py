import math
import pandas as pd
import os
import csv
import sys

fp=os.path.dirname(os.path.realpath(__file__))+"/../UnicodeData.txt"
pd.set_option('display.max_rows', 500)
pd.set_option('display.max_columns', 500)
pd.set_option('display.width', 1000)

headerVal=["0:Code value", "1:Character name", "2:General Category", 
"3:Canonical Combining Classes", "4:Bidirectional Category", 
"5:Character Decomposition Mapping", "6:Decimal digit value", "7:Digit value",
"8:Numeric value", "9:Mirrored", "10:Unicode 1.0 Name", "11:10646 comment field",
"12:Uppercase Mapping", "13:Lowercase Mapping","14:Titlecase Mapping"]
df=pd.read_csv(fp, header= None, sep=';', 
	quoting=csv.QUOTE_NONE, na_values=[''])

print("Enter column 1 val in UnicodeData.txt")
print("Examples: 1EE5, 1EF1, etc.")
inp = input()
while(inp not in ["stop", "quit","q","exit"]):
	bt, btO, btd, splt = None, None, None, None
	print(headerVal)
	bt = df[df[0]== inp].to_string(index=False)
	btO = df[df[0]== inp][0].to_string(index=False)
	btd = df[df[0]== inp][5].to_string(index=False)
	btd=btd.strip()
	print(bt)
	print(btO,"⟶", btd)
	#print(type(bt), type(btO), type(btd))
	if btd !="NaN":
		splt=btd.split(" ")
	print(eval('u"\\u%s"' % btO.strip()),"⟶", end=" ")
	if splt !=None:
		for i in splt:
			if i != " " and i!="NaN" and i!="" and \
			not i.strip().startswith('<'):
				print(eval('u"\\u%s"'%i.strip()),"", end=" ")
	print()
	print("Enter column 1 val in UnicodeData.txt")
	inp = input()
