function dependent_run
	set pid $argv[1]
    set cmd $argv[2]
	while kill -0 $pid 2> /dev/null;
		set time (date)
		echo "At $time, process is still running, sleep..."
		sleep 3600
    end
	echo "Now run command:"
	echo $cmd
	echo ""
	eval $cmd
end
