import pandas as pd

samples_csv = pd.read_csv(config['samples']['list'])
SAMPLES = samples_csv['Samples'].to_list()

if config['samples']['paired']:
    FWD = config['samples']['paired_end']['forward']
    REV = config['samples']['paired_end']['reverse']

rule align_reads:
    input:
        gtf=config['gtf'],
        genome=config['genome'],
        forward=FWD,
        reverse=REV
    output:
        expand("{project}/{sample}_tophat/", project=config['project'], sample=SAMPLES)
    conda: "envs/align.yaml"
    threads: 8
    shell:
        "tophat -G {input.gtf} -p {threads} -o {output} {input.genome} {input.forward} {input.reverse}"