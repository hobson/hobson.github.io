import os

"""
>> import pocketsphinx.pocketsphinx
>> pocketsphinx.pocketsphinx.__file__
'/Users/hobsonlane/anaconda3/lib/python3.6/site-packages/pocketsphinx/pocketsphinx.py'
"""

from pocketsphinx.pocketsphinx import *
from sphinxbase.sphinxbase import *


LIBDIR = os.path.join(os.path.sep,
    *("/Users/hobsonlane/anaconda3/pkgs/pocketsphinx-python-0.1.3-py36h470a237_0/lib/python3.6/site-packages/pocketsphinx".split('/')))
MODELDIR = os.path.join(LIBDIR, 'model')
DATADIR = os.path.join(LIBDIR, 'test', 'data')

def get_decoder(libdir=None, modeldir=None, lang='en-us'):
    """ Create a decoder with the requested language model """
    modeldir = os.path.join(libdir, 'model') if libdir else (modeldir or MODELDIR)
    config = Decoder.default_config()
    config.set_string('-hmm', os.path.join(modeldir, lang))
    config.set_string('-lm', os.path.join(modeldir, lang, lang + '.lm.bin'))
    config.set_string('-dict', os.path.join(modeldir, lang, 'cmudict-' + lang + '.dict'))
    return Decoder(config)


def test(decoder, libdir=None, datadir=DATADIR):
    """ Decode streaming audio data from raw binary file on disk. """
    decoder = get_decoder()

    decoder.start_utt()
    stream = open(os.path.join(datadir, 'goforward.raw'), 'rb')
    while True:
        buf = stream.read(1024)
        if buf:
            decoder.process_raw(buf, False, False)
        else:
            break
    decoder.end_utt()
    return decoder


def evaluate_results(dec):
    hypothesis = dec.hyp()
    logmath = dec.get_logmath()
    report = dict(
        text=hypothesis.hypstr,
        score=hypothesis.best_score,
    	confidence=logmath.exp(hypothesis.prob),
        segments=tuple((seg.word for seg in dec.seg()))
        )
    return report


if __name__ == '__main__':
    dec = get_decoder()
    dec = test(dec)
    report = evaluate_results(dec)
    print(report)


    print('Decoder instance: ', str(dec))
