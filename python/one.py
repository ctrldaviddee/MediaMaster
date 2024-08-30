import os
import re
import yt_dlp
from yt_dlp.utils import DownloadError

def sanitize_filename(title: str) -> str:
    """Sanitize the video title to create a valid directory name."""
    return re.sub(r'\W+', '-', title)

def create_directory(video_name: str) -> str:
    """Create a directory for the video if it does not exist."""
    if not os.path.exists(video_name):
        os.mkdir(video_name)
    return video_name

def check_existing_file(video_path: str) -> bool:
    """Check if the video file already exists."""
    return os.path.exists(video_path)

def download_video(video_url: str, resolution: str):
    """Download the video from YouTube with the given resolution."""
    try:
        ydl_opts = {
            'format': f'bestvideo[height<={resolution}]+bestaudio/best[height<={resolution}]',
            'outtmpl': '%(title)s.%(ext)s',
            'noplaylist': True,
            # 'quiet': True
        }
        
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            info_dict = ydl.extract_info(video_url, download=False)
            video_title = info_dict.get('title', None)
            video_name = sanitize_filename(video_title)
            create_directory(video_name)
            
            video_path = os.path.join(video_name, f"{video_name}.mp4")
            
            if check_existing_file(video_path):
                print(f'[INFO]: {video_name}.mp4 already exists.')
                return

            # Update the outtmpl to save in the created directory
            ydl_opts['outtmpl'] = os.path.join(video_name, '%(title)s.%(ext)s')
            
            print(f"[INFO]: Downloading video for {video_title} in {resolution}p resolution")
            with yt_dlp.YoutubeDL(ydl_opts) as ydl:
                ydl.download([video_url])
        
        print(f"[INFO]: Download completed and saved to {video_path}")
        print("---------------------------------- \n")
    
    except DownloadError as e:
        print(f"An error occurred with yt-dlp: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == '__main__':
    while True:
        url = input("Please Enter the URL of the video (or type 'exit' to quit): ").strip()
        if url.lower() == 'exit':
            break
        else:
            resolutions = ["240", "360", "480", "720", "1080", "1440", "2160"]
            resolution = input(f"Please choose a video resolution {resolutions}: ").strip()
            if resolution in resolutions:
                download_video(url, resolution)
            else:
                print(f"[INFO]: Invalid resolution. Please choose from {resolutions}.")
