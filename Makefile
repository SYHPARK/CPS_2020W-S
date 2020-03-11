BUILD_DIR=${CURDIR}/build
FFMPEG_DIR=${CURDIR}/FFmpeg

all: ffmpeg-build

test:
		${BUILD_DIR}/bin/ffmpeg -loglevel debug -an -init_hw_device opencl=ocl:0.0 \
		-filter_hw_device ocl -i example/example.mp4 -vf \
		"hwupload, thumbnail_opencl, hwdownload" example/thumb.avi

ffmpeg-build: ffmpeg-config
				(cd ${FFMPEG_DIR} && make -j && make install)

ffmpeg-config: ${BUILD_DIR}
				(cd ${FFMPEG_DIR} &&  \
./configure --prefix=${BUILD_DIR} --enable-opencl --disable-x86asm --enable-debug --disable-optimizations --disable-mmx --disable-stripping)

${BUILD_DIR}:
				mkdir -p ${BUILD_DIR}


clean:
				rm -rf ${BUILD_DIR}
