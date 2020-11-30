
kernel.bin: kernel.asm diskmanage.asm std.asm
		nasm -fbin kernel.asm -o kernel.bin

clean:
		rm kernel.bin

run:
		qemu-system-x86_64 kernel.bin
		make clean
