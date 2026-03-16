#!/bin/bash

# Ensure variables are present
if [ -z "$MOVIE_URL" ] || [ -z "$TELEGRAM_RTMPS" ]; then
    echo "Error: MOVIE_URL or TELEGRAM_RTMPS secret is missing!"
    exit 1
fi

while true
do
  echo "Fetching file and broadcasting to Telegram..."

  # -re: Read in real-time
  # -stream_loop -1: Restarts the movie automatically when it ends
  # -preset veryfast: Best balance for GitHub Runner CPUs
  
  ffmpeg -re -stream_loop -1 -i "$MOVIE_URL" \
    -c:v libx264 -preset veryfast -tune zerolatency \
    -b:v 3500k -maxrate 3500k -bufsize 7000k \
    -pix_fmt yuv420p -g 60 \
    -c:a aac -b:a 128k -ar 44100 \
    -f flv "$TELEGRAM_RTMPS"

  echo "Connection lost. Reconnecting in 5 seconds..."
  sleep 5
done
