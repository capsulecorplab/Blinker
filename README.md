# Blinker

Blinker example from ["PharoIOT: Lesson 3 – Intro to Pharo OOP"](http://www.pharoiot.org/lesson-3-intro-to-pharo-oop/).

This package has been tested to work on PharoThings v0.3.1 running Pharo 7.0 32bit.

## Installation instructions

You'll need to install the Blinker package on a local Pharo image, then copy the image contents to your Raspberry Pi.

### Install Blinker package

Download PharoIoT using the Zeroconf server:

```shell
wget -O - get.pharoiot.org/multi | bash
unzip multi.zip
```

Run the 32bit Pharo image that came with PharoIoT

```shell
cd pharoiot-multi
./vm/linux32/pharo PharoThings32.image
```

In the Pharo-UI, open a playground window (`Ctrl+O+W`) and evaluate:

```smalltalk
Metacello new baseline: 'Blinker';
   repository: 'github://capsulecorplab/Blinker:main/src';
   load.
```

Note: Evaluate by highlighting the text, then either right-click on the highlighted text and click `Do it` or press `Ctrl+D`.

Once the Blinker package is loaded into the Pharo image, save (Ctrl+Shift+S) & close the image.

Zip the contents of the pharoiot-multi/ folder:

```shell
cd ..
zip blinker-pharoiot-multi.zip -r pharoiot-multi/
```

SSH into your pi and copy the zip file over to your Raspberry Pi, such as using sftp:

```shell
ssh pi@192.168.1.200
sftp mylaptop@192.168.1.125:blinker-pharoiot-multi.zip
```

Unzip the contents of the zip file, then run the pharo-server on your Raspberry Pi:

```shell
unzip blinker-pharoiot-multi.zip
cd pharoiot-multi/
./pharo-server
```

## Connect to Pi

Once the Pharo image containing the `Blinker` package has been copied over to your Raspberry Pi and the pharo-server is running, connect to the pharo-server and open a remote Playground window via a local Pharo image (Pharo 7 recommended):

```smalltalk
remotePharo := TlpRemoteIDE connectTo: (TCPAddress ip: #[192 168 1 200] port: 40423).
remotePharo openPlayground.
```

## Run Blinker

With an LED connected to the GPIO4 pin on the Raspberry Pi, evaluate the following to run the blinker example in a remote Playground window:

```smalltalk
|blinker|
blinker := Blinker new. 
blinker timesRepeat: 10 waitForSeconds: 1.

