BUILD_DIR=${CURDIR}/build
FFMPEG_DIR=${CURDIR}/FFmpeg

all: ffmpeg-build

ffmpeg-build: ffmpeg-config
				(cd ${FFMPEG_DIR} && make -j && make install)

ffmpeg-config: ${BUILD_DIR}
				(cd ${FFMPEG_DIR} && ./configure --prefix=${BUILD_DIR} \
																				 --enable-opencl       \
																				 --disable-x86asm)

${BUILD_DIR}:
				mkdir -p ${BUILD_DIR}

test:
				${BUILD_DIR}/bin/ffmpeg -i example/example.mp4 -vf "thumbnail_opencl" \
				-vframes 1 example/thumbnail.jpg

clean:
				rm -rf ${BUILD_DIR}