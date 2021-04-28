function interrupt()
{
    echo "!!!<--Interrupted on `date`" | tee -a log.txt
    exit 1 
}

trap interrupt 1 2 3

echo >> log.txt
echo `date` | tee -a log.txt

start_message="Started pomodoro  $@  ... wait 25 minutes"
end_message="Pomodoro action $@ finished" 
echo "$start_message" | tee -a log.txt

sleep 1500 && notify-send "$end_message" && zenity --warning --text="$end_message" 2>/dev/null
echo "$end_message" | tee -a log.txt

