#include <ESP8266HTTPClient.h>
//#include <ArduinoJson.h>
#include<DHT.h>   //temperature library
#include <ESP8266WiFi.h>

const char *WIFI_SSID ="Yashu_310" ;  
const char *WIFI_PASSWORD ="9717433820";
const char* server= "api.thingspeak.com";

String apiKey ="HGZ01B2FQFSWMH3V" ;  //api key to upload sensor data 

WiFiClient client;

#define DHTPIN 0  ///digital pin to which dht sensor is connected
DHT dht(DHTPIN,DHT11);

const int PulseSensorHRWire = A0; //--> PulseSensor connected to ANALOG PIN 0 (A0 / ADC 0).
int Threshold = 600; //--> Determine which Signal to "count as a beat" and which to ignore.
int Signal;
unsigned long previousMillisGetHR = 0; //--> will store the last time Millis (to get Heartbeat) was updated.
unsigned long previousMillisHR = 0; //--> will store the last time Millis (to get BPM) was updated.

const long intervalGetHR = 10; //--> Interval for reading heart rate (Heartbeat) = 10ms.
const long intervalHR = 10000; //--> Interval for obtaining the BPM value based on the sample is 10 seconds.
int cntHB = 0; //--> Variable for counting the number of heartbeats.
boolean ThresholdStat = true; //--> Variable for triggers in calculating heartbeats.
int BPMval = 0; //--> Variable to hold the result of heartbeats calculation.


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600); //--> Set's up Serial Communication at certain speed.
  delay(10);
  dht.begin();

  Serial.print("Connecting to :");
  Serial.println(WIFI_SSID);

  WiFi.begin(WIFI_SSID,WIFI_PASSWORD);

  while(WiFi.status()!=WL_CONNECTED){
    delay(200);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi Connected");
}


void loop() 
{
  
   //float h = dht.readHumidity();
   float tem = dht.readTemperature(); ///reading temperature from sensor
   float t= 37;
   float temp = (t*9)/5 + 32;


  //----------------------------------------------------------------Process of reading heart rate.
  unsigned long currentMillisGetHR = millis();

  if (currentMillisGetHR - previousMillisGetHR >= intervalGetHR) {
    previousMillisGetHR = currentMillisGetHR;

    int PulseSensorHRVal = analogRead(PulseSensorHRWire);

    if (PulseSensorHRVal > Threshold && ThresholdStat == true) {
      cntHB++;
      ThresholdStat = false;
      
    }

    if (PulseSensorHRVal < Threshold) {
      ThresholdStat = true;
    }
  }
  //------------------------------------------------------------------The process for getting the BPM value.
  unsigned long currentMillisHR = millis();

  if (currentMillisHR - previousMillisHR >= intervalHR) {
    previousMillisHR = currentMillisHR;

    BPMval = cntHB * 6; //-------------> The taken heart rate is for 10 seconds. So to get the BPM value, the total heart rate in 10 seconds x 6.

      if (client.connect(server,80))   //   "184.106.153.149" or api.thingspeak.com
                      {  
                            
                             String postStr = apiKey;
                             postStr +="&field1=";
                             postStr += String(BPMval);
                             postStr +="&field2=";
                             postStr += String(temp);
                             postStr += "\r\n\r\n";
                             client.print("POST /update HTTP/1.1\n");
                             client.print("Host: api.thingspeak.com\n");
                             client.print("Connection: close\n");
                             client.print("X-THINGSPEAKAPIKEY: "+apiKey+"\n");
                             client.print("Content-Type: application/x-www-form-urlencoded\n");
                             client.print("Content-Length: ");
                             client.print(postStr.length());
                             client.print("\n\n");
                             client.print(postStr);

                             Serial.print("BPM: ");
                             Serial.print(BPMval);
                             Serial.print("Temperature: ");
                             Serial.print(temp);
                             

                             Serial.println(". Send to Thingspeak.");
                        }
          client.stop();
 
          Serial.println("Waiting...");
  // thingspeak needs minimum 15 sec delay between updates
  delay(1000);
    cntHB = 0; ////---->>>reseting cntHB value to get new pulse value
  }
}
