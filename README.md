# MAVERICK

Marverick (pronounced as `/ˈmævrɪk/`), is the first firmware running on RTL8720DN BW16 kit with a TF screen.

This firmware was designed for Wireless testing purpose and education only.

# Introduction

`Maverick` is a combination of tools, library, script that combine ability of the RTL8720DN MCU and hardwares like a RGB TF screen.

# Wirings
| **RTL8720DN BW16** | **ST77x** |
| ------------------ | --------- |
| **GND**            | GND       |
| **5V**             | VDD       |
| **PA14**           | SCL       |
| **PA12**           | SDA       |
| **PA25**           | DC        |
| **PA26**           | RST       |
| **PA27**           | CS        |
| **PA30**           | BLK       |

| **RTL8720DN BW16** | **BUTTONS** | **DESCRIPTIONS**                |
| ------------------ | ------------ | --------------------------- |
| **GND**            | GND          |                             |
| **UP**             | PB1          | Move highlight option up    |
| **DOWN**           | PB2          | Move highlight option down  |
| **ENTER/OK**       | PB3          | Select item                 |
| **BACK/MENU**      | PA13         | Back or Return to main Menu |

![maverick wirings](./image/maverick.png)

# FLASHING / UPLOADING
Please see instruction bellow carefully to flash/upload firmware to your RTL8720DN BW16 kit.

Make sure buttons, TFT ST77xx screen and BW16 are connected and well joined.

## Download firmware
I am publishing the binary file so you can flash directly using your machine.

## Erase the BW16 kit
Follow this tutorial if you've just bought the RTL8720DN BW16 kit. [Step 4: Erase Flash](https://www.amebaiot.com/en/amebad-bw16-arduino-getting-started/)

## Upload firmware
To be updated, stay turn.
