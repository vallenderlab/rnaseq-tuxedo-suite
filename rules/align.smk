

if config['samples']['paired_end']:
    FWD = config['samples']['paired_end']['forward']
    REV = config['samples']['paired_end']['reverse']

rule align_reads:
    input:
        gtf=config['gtf'],
        genome=config['genome'],
        forward=FWD,
        reverse=REV
    output:
    conda: "envs/align.yaml"
    threads: 8
    shell:
        "tophat -G {input.gtf} -p {threads} -o {input.sample} {input.genome} {input.forward} {input.reverse}"