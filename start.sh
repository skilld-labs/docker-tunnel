cmd=""
if [ -n "$SSH_HOST_PASSWORD" ]
then
    cmd="$cmd sshpass -p $SSH_HOST_PASSWORD"
fi
cmd="$cmd ssh -o StrictHostKeyChecking=no -L $BIND_HOST:$BIND_PORT:$REMOTE_HOST:$REMOTE_PORT -N $SSH_HOST_USER@$SSH_HOST_NAME -p $SSH_HOST_PORT"
$cmd
