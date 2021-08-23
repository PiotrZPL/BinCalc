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
def fltbin(number, places):
	whole, dec = str(number).split(".")
	whole = int(whole)
	dec = int (dec)
	res = bin(whole).lstrip("0b") + "."
	for x in range(places):
		if "." in str((dconv(dec)) * 2):
			whole, dec = str((dconv(dec)) * 2).split(".")
			dec = int(dec)
			res += whole
	return res

def dconv(num):
	while num > 1:
		num = num/10
	return num

def fltdec(number, places):
	whole, dec = str(number).split(".")
	whole = int(whole, 2)
	#dec = int (dec)
	res = float(whole)
	if places>len(dec):
		places = len(dec)
	for w in range(places):
		pl = int(dec[w])
		res += pl/2**(w+1)
	return res
