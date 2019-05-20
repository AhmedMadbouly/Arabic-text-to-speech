**DTTS**

Deep learning text to speech for Arabic and low-resourced languages based on Merlin toolkit

## Dependencies

**Perl 5** is required.

**Python 2.7** is required.

Use the ```pip``` package installer -- within a [Python ```virtualenv```](https://virtualenv.pypa.io/en/stable/) as necessary -- to get some necessary packages:

```
pip install numpy
pip install scipy
pip install configobj
pip install scikit-learn
pip install regex
pip install lxml
pip install argparse
```

We will use the Merlin toolkit to train neural networks, creating the following dependencies:

```
pip install bandmat 
pip install theano
pip install matplotlib
```

We will use `sox` to process speech data:

```
apt-get install sox
```


**Abstract**

We describe an open source text-to-speech (TTS) voice building strategy that uses tools from us or based on another open source tools that focuses on simplicity, flexibility, and collaboration to allow anyone with basic computer skills to run voice training experiments and listen to the resulting synthesized voice. We hope that this paper will reduce the barrier for creating new voices and accelerate TTS research, by making experimentation faster and interdisciplinary collaboration easier. We believe that this can help improve TTS research, especially for low-resourced languages, where more experimentations are often needed to get the most out of the limited language resources.

**Index Terms**   Speech synthesis, deep learning, neural network, Open Source

1. **Introduction**

There is growing demand for text-to-speech (TTS) in various industries as the world moves towards technologies that can interact with users more naturally. Many industries including gaming, film, appliances, and accessibility. As a result, there is a lot of needs to produce a variety of good quality voices in different languages. The TTS problem is challenging especially for low-resourced languages, because of the lack of data. Smaller text and audio corpora imply that more experiments might need to be done in order to get the most out of the available resources.

Tackling this problem for low-resourced languages usually requires close collaboration between computer scientists, who understand the algorithms and know how to utilize the tools, and linguists, who understand linguistic phenomena and can help provide linguistic resources required to improve the voices.

From our experience building voices for low-resourced languages, we have observed many pain points that prevent these researchers from conducting quick experiments and iterating on their existing baseline voices. These pain points include (i) the complexity of setting up initial voice building infrastructure, which often requires fairly strong technical background to setup and maintain (ii) the heterogeneous nature of different tools, which requires a non-trivial amount of effort to stitch the required pieces together to form a working pipeline for TTS research.

In this paper, we propose a text-to-speech voice building strategy, that enables researchers to quickly build voices and to iteratively improve them with ease.

1. **Design philosophy**

**Merlin**   Speech synthesis toolkit for neural network-based speech synthesis. The system takes linguistic features as input, and employs neural networks to predict acoustic features, which are then passed to a vocoder to produce the speech waveform. Various neural network architectures are implemented, including a standard feed forward neural network, mixture density neural network, recurrent neural network (RNN), long short-term memory (LSTM) recurrent neural network, amongst others. The toolkit is Open Source, written in Python, and is extensible. It is not intended to include all functions necessary to construct a text-to-speech system. It requires a front-end and a vocoder, but is not hardwired to any particular ones. To train a DNN also requires data with aligned labels.

**Phonemizer       ** The tool which converts each sentence to each equivalent set of phonemes this helps to improve the model accuracy with small and medium datasets, can be neglected with large datasets and it&#39;s the only language dependant part of the system.

**Front-end**  Merlin requires an external front-end, such as Festival or Ossian, to provide the input for the DNN. Any front-end can be used. Its output needs to be formatted as HTS-style labels with either phone-level or state-level alignment. The toolkit includes functions to convert such labels into sequences of vectors of binary and/or continuous features. These features are derived from the label files using HTS-style questions, with a small extension to enable continuously-valued features to be derived. It is also possible to directly provide already-vectorised input features if this HTS-like workflow is not convenient.

**Ossian**   is a python based tool for automatically building speech synthesis front-ends. The framework consists of a sequence of utterance processors, each of which accepts and enriches an XML representation of an utterance. The framework is designed to be flexible so that the nature and  number of processors and their roles can be configured by a user. A range of processors are supplied by the system, but it is also relatively easy to code new ones.

**Vocoder**  Currently, Merlin supports two vocoders STRAIGHT and WORLD.

**WORLD**   The Merlin distribution includes a modified version of the WORLD vocoder, with separate analysis and synthesis executables. Merlin supports both fixed and variable (e.g., pitch synchronous) frame rates.

**Data**   HTK or HTS can be used to obtain state-level alignments for the training data. Merlin can also use only phone level alignments, which can be found using other toolkits such as festvox clustergen.

**Arabic Speech Corpus**   This Speech corpus was used to train prototyping Arabic model. It has been developed as part of PhD work carried out by Nawar Halabi at the University of Southampton. The corpus was recorded in south Levantine Arabic (Damascian accent) using a professional studio. Synthesized speech as an output using this corpus has produced a high quality, natural voice. It is released under the non-commercial creative commons license.

**Duration modeling**  Merlin models duration using a separate DNN to the acoustic model. The duration model is trained on the aligned data, to predict phone- and/or state-level durations. At synthesis time, duration is predicted first, and is used as an input to the acoustic model to predict the speech parameters.

**Acoustic modeling**   Merlin includes implementations of several currently-popular acoustic models, each of which comes with an example &#39;recipe&#39; to demonstrate its use.

**Feed forward neural network** is the simplest type of network. With enough layers, this architecture is usually called a Deep Neural Network (DNN). The input is used to predict the output via several layers of hidden units.
