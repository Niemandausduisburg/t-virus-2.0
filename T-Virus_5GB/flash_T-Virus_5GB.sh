#!/bin/bash

echo "                                   ___          __      __   __      __                     "
echo "|  | _| _ _  _  _  |_ _   |_|_  _   |  __ \  /||__)/  \(_     _)    /  \  | _  _|_ _ || _ _ "
echo "|/\|(-|(_(_)|||(-  |_(_)  |_| )(-   |      \/ || \ \__/__)   /__.   \__/  || )_)|_(_|||(-|  "
echo ""                                                                                            
echo "This will flash the T-Virus modification in order to 'treble' your device for custom treble ROMs."
sleep 5s
clear
echo "WARNING!"
echo "MAKE A BACKUP OF YOUR DATA!"
echo "ALL DATA WILL BE LOST AFTER FLASHING (FACTORY RESET)!"
echo "WE ACCEPT NO LIABILITY IF YOU LOSE DATA OR USE THIS TOOL INCORRECTLY!"
sleep 10s
clear

read -N1 -p $"Are you ready to flash T-VIRUS 2.0? 
Yes [y]
No [n]" answer1
if [ "${answer1,,}" == "y" ]
then
clear
read -N1 -p $"Have you read the warnings and are you sure you want to proceed? 
Yes [y]
No [n]" answer2
if [ "${answer2,,}" == "y" ]
then
clear
read -N1 -p $"Boot your device into fastboot, bootloader or download mode and connect it to your PC. Enter [f] when your device is in fastboot-mode and connected to your PC to proceed." answer3
if [ "${answer3,}" == "f" ]
then
clear
echo "Let's flash and get you infected xD"
sleep 5s
clear
echo "Flashing T-VIRUS partition-table"
fastboot flash partition:0 gpt_both0.bin
clear
echo "Rebooting device into download mode. DO NOT disconnect your device!"
fastboot reboot bootloader
sleep 5s
clear
echo "Flashing T-VIRUS"
fastboot flash boot_a boot.img
fastboot flash boot_b boot.img
fastboot flash box box.bin
fastboot flash cda_a cda.img
fastboot flash cda_b cda.img
fastboot flash dsp_a dsp.bin
fastboot flash dsp_b dsp.bin
fastboot flash elabel elabel.bin
fastboot flash hidden_a hidden.img
fastboot flash hidden_b hidden.img
fastboot flash keystore keystore.bin
fastboot flash logdump logdump.bin
fastboot flash misc misc.bin
fastboot flash modem_a modem.img
fastboot flash modem_b modem.img
fastboot flash persist persist.bin
fastboot flash splash2 splash2.bin
fastboot flash ssd ssd.bin
fastboot flash sutinfo sutinfo.img
fastboot flash system_a system.img
fastboot flash system_b system.img
fastboot flash systeminfo_a systeminfo.img
fastboot flash systeminfo_b systeminfo.img
fastboot flash vendor_a vendor.img
fastboot flash vendor_b vendor.img
clear
echo "Done xD"
echo "Switching to Slot A"
fastboot --set-active=a
echo "Formatting data"
fastboot erase userdata
fastboot reboot
clear
echo "                ___-----------___"
echo "           __--~~                 ~~--__"
echo "       _-~~                             ~~-_"
echo "    _-~                                     ~-_"
echo "  /                                           \ "
echo "  |                                             |"
echo " |                                               |"
echo " |                                               |"
echo "|                                                 |"
echo "|                                                 |"
echo "|                                                 |"
echo " |                                               |"
echo " |  |    _-------_               _-------_    |  |"
echo " |  |  /~         ~\           /~         ~\  |  |"
echo "  ||  |             |         |             |  ||"
echo "  || |               |       |               | ||"
echo "  || |              |         |              | ||"
echo "  |   \_           /           \           _/   |"
echo " |      ~~--_____-~    /~V~\    ~-_____--~~      |"
echo " |                    |     |                    |"
echo "|                    |       |                    |"
echo "|                    |  /^\  |                    |"
echo " |                    ~~   ~~                    |"
echo "  \_         _                       _         _/"
echo "    ~--____-~ ~\                   /~ ~-____--~"
echo "         \     /\                 /\     /"
echo "          \    | ( ,           , ) |    /"
echo "           |   | (~(__(  |  )__)~) |   |"
echo "            |   \/ (  (~~|~~)  ) \/   |"
echo "            |   |  [ [  |  ] ]  /   |"
echo "              |                     |"
echo "               \                   /"
echo "                ~-_             _-~"
echo "                   ~--___-___--~"
echo ""
echo "\ / _       _  _ _   . _  |¯ _  __|_ _  _|   _    _ _ _  _ _ |¯   ||"   
echo " | (_)|_|  (_|| (/_  || |~|~(/_(_ | (/_(_|  _\|_|(_(_(/__\_\~|~|_|||\/."
echo "                                                                    /"  
echo ""
echo "Your device will boot into the ROM now. Enjoy xD"
sleep 5s

fi
fi
fi

if [ "${answer1,,}" == "n" ]
then
exit
if [ "${answer2,,}" == "n" ]
then
exit
if [ "${answer3,,}" == "n" ]
then
exit

fi
fi
fi