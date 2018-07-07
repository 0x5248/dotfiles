#!/usr/bin/env sh
VOLUMEN_DEFAULT="50%"
VOLUMEN_INCREASE="+5%"
VOLUMEN_DECREASE="-5%"

changeVolume(){
   for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`
   do
     pactl set-sink-volume $SINK $1
   done
}

toggleSound(){
   for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`
   do
     LINE=$(($SINK+1))
     MUTE_OPTION="$(pacmd list-sinks | grep 'muted' | awk "NR==$LINE" | cut -b9)"
     echo "${MUTE_OPTION}"
     
     if [ "${MUTE_OPTION}" = "y" ]
     then
       pacmd set-sink-mute $SINK 0
     else 
       pacmd set-sink-mute $SINK 1
     fi
   done
}

case "$1" in
   default) changeVolume $VOLUMEN_DEFAULT ;;
   increase|-i) changeVolume $VOLUMEN_INCREASE ;;
   decrease|-d) changeVolume $VOLUMEN_DECREASE ;;
   toggle|-t) toggleSound ;;
esac	



