# TI-84Plus-Project

## What is this project?

This repository is a collection of some old (and hopefully new) projects I programmed for a TI-83+/TI-84+ calculator. I was previously using opcodes to create assembly programs on the calculator which was a very strenuous and time consuming process. I will be using the help of an assembler such like brass and TI84plus.inc for quick ROM calls and more clean/clear code. I also have included TI-BASIC programs as well.

## Assembly Setup

1. Install an emulator, [WabbitEmu](http://wabbitemu.org/) is the best choice but other calculator emulation will most likely work (but not guarantees).

    - A ROM image of your calculator will need to be loaded into the emulator on startup. The only legal way of doing this is loading the software from your calculator to your computer aka ROM Dumping. The following tool can be used [rom8x](http://www.ticalc.org/archives/files/fileinfo/373/37341.html). The image can also be found online, however this is not by an means legal.

    - To ensure you are using the most recent version go to your emulator or physical calculator and press 2nd + MEM + ENTER (Most recent version for TI-84+ is 2.55MP). You can get the latest version from [TI's website](https://education.ti.com/en/software/search/ti-84-plus-family-ti-83-plus-family) and can be installed with rom8x.

    > Programs can be directly loaded into a TI calculator but this will making debugging very difficult (later, we will see how easy it is in the emulator) and can cause issues such as bricking a device if assembly corrupts data.

2. Install an assembler, [Brass](http://benryves.com/bin/brass/Brass.exe) will be used here but TASM also works but is not longer maintained and files will be modified to work with it. Brass is supported on Windows but can be setup in other OSes by setting .NET as it relies on it.

    - The executable can be placed within this project and called directly, however setting up the file to be called can be much more convenient. This can be done by using the environmental PATH (this is specific to Windows).

3. Setting up your editor. [VSCode](https://code.visualstudio.com/) works best and a Z80 extension can be installed on VSCode. Other editors such as [Notepad++](https://notepad-plus-plus.org/), Notepad and vim can be used but aren't as friendly.

## TI-BASIC Setup

Follow steps 1 and 3 from [Assembly Setup](#assembly-setup). The Z80 extension for VSCode will also do highlighting for TI-BASIC code and other extension can further assist.

## Building

[//]: # (TODO setup CI for a easier build and decoupling of build/target files)

Once all the assembly setup is done, you can now build a program such as [hello.asm](asm/28day-tutorial/hello.asm). If you have not setup Brass.exe to your environmental path, move that file into the file/directory that you will be working in. In this case, 28day-tutorial. Open up PowerShell or CMD and make sure you are in the same directory as your program and run the following command replacing hello with your program name:

```PowerShell or CMD
> Brass.exe hello.asm hello.8xp
```

There should be a new file with .8xp as the extension. This is the file that is ready to be run on your calculator. Startup your emulator and drag your .8xp file into the calculator on the left screen. On the calculator, Press `2nd` + `CATALOG` -> `Asm(` -> `Enter`. Now find the program you just loaded by using the `PGRM` button and finding the program matching your .8xp name and pressing `Enter`. Press `Enter` once more and your program should run.

> If the screen went black, simply press the `ON` button and you will be greeted with a RAM cleared screen. This is due to an error in your program. When loading the programs onto your calculator, I will highly recommend archiving all other programs so they will not get deleted if the program crashes.

With TI-BASIC programs, you can simply drag them into the calculator on the left screen and go `PRGM` to find and run it by pressing `Enter` twice (No need for `Asm(`).

## Further Resources

[Learn IT 83+ assembly in 28 days](https://taricorp.gitlab.io/83pa28d/) - Beginner friendly tutorial
