/*
    Copyright (c) 2010, Santiago Reig

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    ArduBus is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with ArduBus.  If not, see <http://www.gnu.org/licenses/>.
*/

// Pin mappings:
// http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1241206933
// http://spreadsheets.google.com/ccc?key=roX9D5pGUrS4muSBJysz1QQ#gid=0
// http://spreadsheets.google.com/pub?key=0AtfNMvfWhA_ccnRId19SNmVWTDE0MEtTOV9HOEdQa0E&gid=0

void setup()
{
  startClock();
}

void loop(){

}

void startClock()
{
  // Fast PWM Mode with OCRA top
  // http://arduino.cc/en/Tutorial/SecretsOfArduinoPWM
  pinMode(10, OUTPUT); // Output A from Timer2 (OC2A)
  // TCCR2A explained in pg. 187
  // COM2A0=1: Toggle OC2A on Compare Match
  // WGM20,21,22=1: Mode 7, Fast PWM, TOP=OCR2A
  TCCR2A = _BV(COM2A0) | _BV(WGM21) | _BV(WGM20);
  // TCCR2B explained in pg. 190
  // CS20=1: No prescaler
  TCCR2B = _BV(WGM22) | _BV(CS20);
  // Fa = 16MHz/prescaler/(OCR2A+1)/2 = 0,5 MHz
  OCR2A = 15;
}
