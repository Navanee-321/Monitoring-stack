#!/bin/bash
for ip in $(grep -oP '^\S+' /home/ubuntu/Nav/Observability-Nav/MonitoringStack/variables/ansible); do
    ssh -i /home/ubuntu/.ssh/id_rsa@$ip "sudo adduser --disabled-password --gecos '' navaneeth && \
    sudo mkdir -p /home/navaneeth/.ssh && \
    echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCn8PTDnLAC5BluBlwzNJFO+elwFc8rN+gK4d1SC8hmCbKW5dSZJW17l74LzbGQxf8vl+AsG1Pll7xHjL0eFbgILV7o4prawzQcMckSH00TzPrzgDsMM/SKUk9megmXeFayd+bieAsBQW1rwWDGEoBnoiA9Z+91UJIuDS+rCcsIIzHgeEiU/Xk6kI8Ax520cde8CPS+YN8s75MqFfzlZB/b9e5rLU6YNo3b7BJqa8Bh/TyaWvWRKbCp9AxdKkpA5Wjg9cjSM8i/aYU3s4CwnxmS3077QadPpHw4jenbdHWa7r2e7KJvCpobsuJx0Wyv3Cl2YIsKfvCEODrUYLQSEaktJe5Ev6TGxbZbzjE819BBjmmrMgTYM2G1EbRyyrudqG3bNWkC4Irs/SsVFGEuDmGdZJwB5LnDaEWXAmzqfv0a9Jqi5N5HtIzVToYfa7jOGF+UjX3Q4EPNTGwHbuPIRL4BXUWUxjlqjg2nAk97YYzILt4ECox6wJAPsPSwpQtX7H70caSYanmkQtn8B1Mk3MJ8L4iYdWRVCC1Jn6gKv/UUgQRNzxyomkGQDslS7b58zmaXQbP17rm3W8xPSuyqpz12lxwMV84ydLVIAGBBEeWTiXNwcwrd8JL1gb0NI5UUxcamWO0OETPhOIGUZnVqu976Ng5S1RKdXhhIFKa5u8j54w== kr5880341@gmail.com' | sudo tee /home/navaneeth/.ssh/authorized_keys && \
    sudo chown -R navaneeth:navaneeth /home/navaneeth/.ssh && \
    sudo chmod 700 /home/navaneeth/.ssh && \
    sudo chmod 600 /home/navaneeth/.ssh/authorized_keys"
done
