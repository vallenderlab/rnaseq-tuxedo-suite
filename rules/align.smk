import pandas as pd

samples_csv = pd.read_csv(config['samples']['list'])
SAMPLES = samples_csv['Samples'].to_list()

if config['samples']['paired']:
    READ1 = config['samples']['paired_end']['read1']
    READ2 = config['samples']['paired_end']['read2']

rule align_reads:
    input:
        gtf=config['gtf'],
        genome=config['genome'],
        reads=""
    output:
        expand("{project}/{sample}_tophat/", project=config['project'], sample=SAMPLES)
    conda: "envs/align.yaml"
    threads: 8
    shell:
        "tophat -G {input.gtf} -p {threads} -o {output} {input.genome} {input.reads}"