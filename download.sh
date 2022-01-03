#!/bin/bash

#Get available files
availableFiles=$(ls channels/channels_to_download*)

#Get user selection
echo "Available files:"
select file in $availableFiles; do
    break
done

#Run yt-dlp to download
yt-dlp --download-archive downloaded_videos.txt --no-warning --progress \
-o "channel-dl/%(uploader)s [%(channel_id)s]/%(upload_date)s - %(title)s - (%(duration)ss) [%(id)s].%(ext)s" --merge-output mkv --check-formats \
--write-info-json --write-description --write-thumbnail --add-metadata --all-subs \
--batch-file="$file"
