/*
    Copyright (c) 2010, Santiago Reig

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#define CLK 3      // Clock source pin
#define SI 8       // 'Start integration' pin
#define INT_TIME 8 // Integration time (around 1÷8)
#define PIXELS 64  // Number of pixels

void setup(){
  pinMode(CLK, OUTPUT);
  pinMode(SI, OUTPUT);
}

void loop(){
  unsigned long startTime = millis();
  digitalWrite(SI, HIGH);
  for (int i=0;i<=PIXELS;i++){
    digitalWrite(CLK, HIGH);
    delayMicroseconds(2);
    digitalWrite(CLK, LOW);
    delayMicroseconds(2);
    if (i==1) digitalWrite(SI, LOW);
  }
  while (millis() - startTime < INT_TIME);
}
