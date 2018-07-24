

#!/bin/bash
echo "###########################################################"
echo "    ####   ####   #   #               #  #### #    "
echo "    #   #  #   #  #   #              #  #     #"
echo "    #   #  # #    #   #   ####      #    ###  ####"
echo "    #  #   #  #   #   #            #       #  #   #"
echo "    ##     #   #  #####         # #    ###    #   #"
echo "###########################################################"
echo -e "               SORTING USING %MEM INFOS:"
echo""
echo -e "        PID       %MEM     PHYSICAL MEM    COMMAND"
ps aux | awk '{print "        "$2, "     "$4, "     "$6,"         "$11}' | sort -k2rn | head -n 20

