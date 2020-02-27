OpenCL Thumnail Extractor
====================================
# Prerequisite
- OpenCL (>= 1.2)

# Download patched FFmpeg
```console
$ ./download.sh
```
# Build
```console
$ make
```

# Test
```console
$ make test
```
```console
ffmpeg version N-96834-g72b6c8c Copyright (c) 2000-2020 the FFmpeg developers
  built with gcc 5.4.0 (Ubuntu 5.4.0-6ubuntu1~16.04.12) 20160609
  configuration: --prefix=/home/wookhyun/ffmpeg/build --enable-opencl --disable-x86asm
  libavutil      56. 42.100 / 56. 42.100
  libavcodec     58. 73.102 / 58. 73.102
  libavformat    58. 39.101 / 58. 39.101
  libavdevice    58.  9.103 / 58.  9.103
  libavfilter     7. 77.100 /  7. 77.100
  libswscale      5.  6.100 /  5.  6.100
  libswresample   3.  6.100 /  3.  6.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'example/example.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf56.36.100
  Duration: 00:00:16.02, start: 0.000000, bitrate: 362 kb/s
    Stream #0:0(und): Video: h264 (High) (avc1 / 0x31637661), yuv420p, 320x240, 295 kb/s, 29.05 fps, 59.94 tbr, 11968 tbn, 59.84 tbc (default)
    Metadata:
      handler_name    : VideoHandler
    Stream #0:1(und): Audio: aac (LC) (mp4a / 0x6134706D), 22050 Hz, stereo, fltp, 63 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
Stream mapping:
  Stream #0:0 -> #0:0 (h264 (native) -> mjpeg (native))
Press [q] to stop, [?] for help
[swscaler @ 0x29b82c0] No accelerated colorspace conversion found from yuv420p to rgb24.
[swscaler @ 0x29cac80] deprecated pixel format used, make sure you did set range correctly
Output #0, image2, to 'example/thumbnail.jpg':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.39.101
    Stream #0:0(und): Video: mjpeg, yuvj444p(pc), 320x240, q=2-31, 200 kb/s, 29.92 fps, 29.92 tbn, 29.92 tbc (default)
    Metadata:
      handler_name    : VideoHandler
      encoder         : Lavc58.73.102 mjpeg
    Side data:
      cpb: bitrate max/min/avg: 0/0/200000 buffer size: 0 vbv_delay: N/A
[Parsed_thumbnail_opencl_0 @ 0x296b840] frame id #44 (pts_time=1.562584) selected from a set of 100 images
frame=    1 fps=0.0 q=4.1 Lsize=N/A time=00:00:00.03 bitrate=N/A dup=1 drop=1 speed=0.782x    
video:8kB audio:0kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: unknown
```
