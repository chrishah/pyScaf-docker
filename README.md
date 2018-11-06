# pyScaf-docker
Docker image containing a full pyScaf install

The image contains a full install of [pyScaf](https://github.com/lpryszcz/pyScaf), including all necessary dependencies. I am not part of the pyScaf team - I just made this image.

In detail, the image is set up with:
 - Ubuntu 16.04
 - Python 2.7.12
 - [LAST](http://last.cbrc.jp/) 959
 - [FastaIndex](https://github.com/lpryszcz/FastaIndex) 0.11c 
 - [pyScaf](https://github.com/lpryszcz/pyScaf) 0.12a

To run [pyScaf](https://github.com/lpryszcz/pyScaf) you can do the following (this will mount the directory `/home/working` of the container to the current working directory on your local machine):
```bash
$ docker run -it -v $(pwd):/home/working -w /home/working --rm chrishah/pyscaf-docker pyScaf.py
```

Example for scaffolding an existing assembly with long reads (genome is in file `./genome.illumina.fasta`; long reads are in `reads.fastq.gz`):
```bash
#run pyScaf
$ docker run -it -v $(pwd):/home/working -w /home/working --rm chrishah/pyscaf-docker pyScaf.py \
-t 6 -f genome.illumina.fasta -n reads.fastq.gz -o Illumina.MinION.pyscaf
```

You can also enter the container environment and work within it. All executables, e.g. `run_BUSCO.py`, `generate_plots.py`, are in the `PATH`.
```bash
$ docker run -it --rm --net=host -v $(pwd):/home/working -w /home/working chrishah/pyscaf-docker /bin/bash
```

