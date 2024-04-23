function screen-agx () { sudo screen $@ /dev/ttyACM1 115200; }

function screen-nano () { sudo screen $@ /dev/ttyACM0 115200; }

function ssh-agx () {
	local IP="192.168.4.79"
	if [ $# -eq 1 ]; then
		IP="$1"
	fi
	ssh-nocheck "ubuntu@$IP"
}

function flash-agx-nvme () {
	boardctl recovery
	cd $TEGRA
	sudo ./tools/kernel_flash/l4t_initrd_flash.sh \
		--external-device nvme0n1p1 \
		-c tools/kernel_flash/flash_l4t_external.xml \
		-p '-c bootloader/generic/cfg/flash_t234_qspi.xml' \
		--showlogs --network usb0 \
		jetson-agx-orin-devkit internal
}

