Docker MBED
====

This is a docker image source for compiling mbed code. https://hub.docker.com/r/ukitomato/mbed 

## Description
- Compiler: [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm)
- cli: [mbed-cli](https://github.com/ARMmbed/mbed-cli)

## Install
```
$ docker pull ukitomato/mbed
$ echo 'alias mbed='docker run --rm -ti -v $(pwd):/working -w /working ukitomato/mbed mbed' >> ~/.zshrc
```

## Usage (Example of using LPC1768)
1. if you want to create new project
```
$ mbed new mbed-os-program
$ cd mbed-os-program
$ vi main.cpp

#include "mbed.h"

int main()
{
    // Initialise the digital pin LED1 as an output
    DigitalOut led(LED1);

    while (true) {
        led = !led;
        thread_sleep_for(BLINKING_RATE_MS);
    }
}

$ mbed compile -m LPC1768 -t GCC_ARM
$ cp BUILD/BUILD/LPC1768/GCC_ARM/mbed-os-example-blinky.bin /Volumes/MBED/

```
2. if you want to add exist project
```
$ mbed add .
$ cd project-floder
$ mbed compile -m LPC1768 -t GCC_ARM
$ cp BUILD/BUILD/LPC1768/GCC_ARM/mbed-os-example-blinky.bin /Volumes/MBED/

```

3. if you want to import exist project
```
$ mbed import https://github.com/ARMmbed/mbed-os-example-blinky
$ cd mbed-os-example-blinky
$ mbed compile -m LPC1768 -t GCC_ARM
$ cp BUILD/BUILD/LPC1768/GCC_ARM/mbed-os-example-blinky.bin /Volumes/MBED/

```

## Version

| Version | Description |
| --- | --- |
| 1.0.0 | create docker mbed image |

## Licence

[MIT](https://github.com/ukitomato/docker-mbed/blob/master/LICENSE)

## Author
Yuki Yamato [[ukitomato](https://github.com/ukitomato)]
