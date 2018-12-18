import pyaudio

from pocketsphinx_example import get_decoder

dec = get_decoder()

pa = pyaudio.PyAudio()
stream = pa.open(format=pyaudio.paInt16, channels=1, rate=16000, input=True, frames_per_buffer=1024)
stream.start_stream()

in_speech_bf = False
dec.start_utt()
while True:
    buf = stream.read(1024)
    if buf:
        dec.process_raw(buf, False, False)
        if dec.get_in_speech() != in_speech_bf:
            in_speech_bf = dec.get_in_speech()
            if not in_speech_bf:
                dec.end_utt()
                print 'Result:', dec.hyp().hypstr
                dec.start_utt()
    else:
        break
dec.end_utt()