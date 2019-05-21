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
