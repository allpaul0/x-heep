set remotetimeout 2000
target remote localhost:3333
load 
break main.c:51
continue
commands
    print cycles
    print actions
    continue
end
continue