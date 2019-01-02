import pyaudio

from pocketsphinx_example import get_decoder

dec = get_decoder()

RATE = 16000
BUFSIZE = 1024
SECONDS = 5

pa = pyaudio.PyAudio()
stream = pa.open(format=pyaudio.paInt16, channels=1, rate=RATE, input=True, frames_per_buffer=BUFSIZE)
stream.start_stream()

in_speech_bf = False
dec.start_utt()
import numpy as np

recording = []
for i in range(int(RATE / BUFSIZE * SECONDS)):
    buf = stream.read(BUFSIZE, exception_on_overflow=False)

    if buf:
        # recording += list(np.array(buf))
        # print(np.array(buf).std())
        dec.process_raw(buf, False, False)
        if dec.get_in_speech() != in_speech_bf:
            in_speech_bf = dec.get_in_speech()
            if not in_speech_bf:
                dec.end_utt()
                print('Result:', dec.hyp().hypstr)
                dec.start_utt()
    else:
        break
dec.end_utt()

import pandas as pd
df = pd.DataFrame(recording)
