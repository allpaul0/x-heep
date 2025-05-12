// Copyright EPFL contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdio.h>
#include <stdlib.h>
#include "core_v_mini_mcu.h"
#include "gpio.h"
#include "x-heep.h"

#define GPIO_TOGGLE1 1
#define GPIO_TOGGLE2 2
#define GPIO_TOGGLE3 3
#define GPIO_TOGGLE4 4

/* By default, printfs are activated for FPGA and disabled for simulation. */
#define PRINTF_IN_FPGA  1
#define PRINTF_IN_SIM   0

#if TARGET_SIM && PRINTF_IN_SIM
        #define PRINTF(fmt, ...)    printf(fmt, ## __VA_ARGS__)
#elif PRINTF_IN_FPGA && !TARGET_SIM
    #define PRINTF(fmt, ...)    printf(fmt, ## __VA_ARGS__)
#else
    #define PRINTF(...)
#endif

void init_gpio_pin(gpio_pin_number_t pin) {
    gpio_cfg_t pin_cfg = {
        .pin = pin,
        .mode = GpioModeOutPushPull
    };
    gpio_result_t res = gpio_config(pin_cfg);
    if (res != GpioOk) {
        PRINTF("Gpio initialization failed for pin %d!\n", pin);
    }
}

int main(int argc, char *argv[])
{
    
    init_gpio_pin(GPIO_TOGGLE1);
    init_gpio_pin(GPIO_TOGGLE2);
    init_gpio_pin(GPIO_TOGGLE3);
    init_gpio_pin(GPIO_TOGGLE4);

    gpio_write(GPIO_TOGGLE1, false);
    gpio_write(GPIO_TOGGLE2, false);
    gpio_write(GPIO_TOGGLE3, false);
    gpio_write(GPIO_TOGGLE4, false);

    for(int i=0;i<10;i++) {
        gpio_write(GPIO_TOGGLE4, false);
        gpio_write(GPIO_TOGGLE1, true);
        for(int i=0;i<1e6;i++) asm volatile("nop");
        gpio_write(GPIO_TOGGLE1, false);
        gpio_write(GPIO_TOGGLE2, true);
        for(int i=0;i<1e6;i++) asm volatile("nop");
        gpio_write(GPIO_TOGGLE2, false);
        gpio_write(GPIO_TOGGLE3, true);
        for(int i=0;i<1e6;i++) asm volatile("nop");
        gpio_write(GPIO_TOGGLE3, false);
        gpio_write(GPIO_TOGGLE4, true);
        for(int i=0;i<1e6;i++) asm volatile("nop");
    }

    PRINTF("Success.\n");
    return EXIT_SUCCESS;
}
