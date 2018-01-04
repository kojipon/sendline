# sendline
This is a tool for sending messages with LINE.

# Synopsis

* Send message with argument.

  ```
  $ ./sendline.sh "How are you?"
  ```
  
* Send message with STDIN.

  ```
  $ echo "Hello.\nHow are you?" | ./sendline.sh
  ```
  
# Setup

1. Create your developper account. (https://developers.line.me)

1. Edit .env file.
    ```
    CHANNEL_ID=""
    CHANNEL_SECRET=""
    USER_ID=""
    ```

1. Install jq command. (yum install jq)

1. Run ./sendline.sh
