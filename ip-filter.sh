
for i in `seq 1 255`
do
    for j in `seq 1 255`
    do
        for k in `seq 2 255`
        do
            for n in `seq 1 255`
            do
                nmap -Pn -p80 $i.$j.$k.$n -v | grep 'open  http'
                if [ $? -eq 0 ]; then
                    wget $i.$j.$k.$n -T 5 -t 1
                    if [ $? -eq 0 ]; then
                        echo "$i.$j.$k.$n 80: ACCESS"
                        echo "$i.$j.$k.$n" >> success.ip
                    else
                        echo "$i.$j.$k.$n 80: ACCESS DENIED"
                    fi
                else
                    echo "$1.$j.$k.$n is closed 80 port"
                fi
            done
        done
    done
done
