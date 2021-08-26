'''
 Copyright (C) 2021  Piotr Lange

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; version 3.

 PrimeCheck is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
'''
def isPrime(num):
	num = int(num)
	ppp = True
	if num > 1:
		for i in range(2, num//2):
			if (num % i) == 0:
				ppp = False
				break
	else:
		return False

	if ppp:
		return True
	else:
		return False
