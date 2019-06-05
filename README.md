# rpi-mangadl
Docker for **Raspberry Pi** with Manga downloader

### But what does it do?
When you run the container, it looks at the **URL** **variable** and downloads the last chapter of the given URL.
Supported websites: *TMOFANS*
### How To run
Mount in /Downloads folder the path where you want.
```
docker run --rm \ 
-e URL=https://tmofans.com/library/manga/00000/manga) \
-v `pwd`/YOUR_FOLDER:/Downloads \ 
vitharme/rpi-mangadl
