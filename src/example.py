'''
 Copyright (C) 2021  Piotr Lange

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; version 3.

 BinCalc is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
'''

from math import *
from dectobin import fltbin, fltdec

def calculate(expression):
	try:
		newe = expression.replace("/", "<$$$>").replace("*", "<$$$>").replace("-", "<$$$>").replace("+", "<$$$>")
		newb = ""
		oldb = expression.replace("0", "").replace("1", "").replace(".", "")
		newew = newe.split("<$$$>")
		schema = expression.replace("/", "d").replace("*", "d").replace("-", "d").replace("+", "d").replace("0", "b").replace("1", "b").replace(".", "b")
		setofb = []
		setofd = []
		for iii in range(len(newew)):
			wyr = newew[iii]
			if "." in str(wyr):
				wyrd = str(fltdec(wyr.strip(), 6))
			else:
				wyrd = str(int(wyr.strip(), 2))
			setofb += [wyrd]
		for iii in oldb:
			setofd += [iii]
		rrr = True
		sobi = 0
		sodi = 0
		for jjj in range(len(schema)):
			if rrr and schema[jjj] == "b":
				newb += setofb[sobi]
				sobi += 1
				rrr = False
			if schema[jjj] == "d":
				newb += setofd[sodi]
				sodi += 1
				rrr = True
			
		wynik = float(eval(newb, globals()))
		if "." in str(wynik):
			wynik = fltbin(wynik, 6).replace("0b","")
		else:
			wynik = bin(wynik).replace("0b", "")
		if str(wynik).endswith("."):
			wynik = str(wynik).replace(".", "")
		if str(wynik) == "":
			wynik = "0"
		return (True, wynik)
	except:
		return (False, 0)
