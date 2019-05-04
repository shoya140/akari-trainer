docker run -it --rm -v $PWD:/proj akarin python yukarin/scripts/extract_acoustic_feature.py --input_glob data/input/shoya_503/v_\*.wav --output data/working/shoya_npy/ --sampling_rate 44100
docker run -it --rm -v $PWD:/proj akarin python yukarin/scripts/extract_acoustic_feature.py --input_glob data/input/akari_503/v_\*.wav --output data/working/akari_npy/ --sampling_rate 44100

docker run -it --rm -v $PWD:/proj akarin python yukarin/scripts/extract_align_indexes.py --input_glob1 data/working/shoya_npy/v_\*.npy --input_glob2 data/working/akari_npy/v_\*.npy --output data/working/indexes

# docker run -it --rm -v $PWD:/proj akarin python yukarin/scripts/extract_f0_statistics.py --input_glob data/working/shoya_npy/v_\*.npy --output data/working/shoya_f0
# docker run -it --rm -v $PWD:/proj akarin python yukarin/scripts/extract_f0_statistics.py --input_glob data/working/akari_npy/v_\*.npy --output data/working/akari_f0