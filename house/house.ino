const int pinsGroups[][4] = {{12, 11}, {10, 9}, {8, -1}, {7, -1}};
const int pinCounts[] = {2, 2, 1, 1};
const int groupCount = 4;

void setup() {
  // initialize serial communication:
  Serial.begin(9600);

  for(int i = 0; i < groupCount; i++) {
    const int *pins = pinsGroups[i];
    int count = pinCounts[i];
    for(int j = 0; j < count; j++) {
      pinMode(pins[j], OUTPUT);
    }
  }


//  pinMode(13, OUTPUT);
}

void loop() {
//  digitalWrite(13, HIGH);
  // see if there's incoming serial data:
  if (Serial.available() > 1) {
    int g = Serial.read();
    int v = Serial.read();
    const int *pins = pinsGroups[g];
    int count = pinCounts[g];
    
    for(int i = 0; i < count; i++) {
      int p = pins[i];
      if(v == 'H') {
        digitalWrite(p, HIGH);
      } else if(v == 'L') {
        digitalWrite(p, LOW);
      }
    }
  }
}

