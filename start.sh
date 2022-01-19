#!/bin/sh

cmd="ssh -o StrictHostKeyChecking=no -L $BIND_HOST:$BIND_PORT:$REMOTE_HOST:$REMOTE_PORT -N $SSH_HOST_USER@$SSH_HOST_NAME -p $SSH_HOST_PORT"

if [ -n "$SSH_HOST_PASSWORD" ]; then
    sshpass -p $SSH_HOST_PASSWORD $cmd
elif [ -n "$SSH_HOST_KEY" ]; then
    $cmd -i /$SSH_HOST_KEY
else
    $cmd
fi
