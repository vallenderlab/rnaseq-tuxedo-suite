rule align_reads:
    input:
        genome=gtf=config['gtf'],
        samples=gtf=config['samples']
    output:
    threads: 8
    shell:
        "bowtie {input.genome} {input.samples}"

rule build_index:
    input:
        genome=gtf=config['gtf'],
        samples=gtf=config['samples']
    output:
    threads: 8
    shell:
        "bowtie-build {input.genome} {input.samples}"


rule genome_align:
    input:
        gtf=config['gtf'],
        genome=gtf=config['gtf'],
        samples=gtf=config['samples']
    output:
    threads: 8
    shell:
        "tophat -G {input.gtf} -p {threads} -o {input.sample} {input.genome} {input.samples.left} {input.samples.right}"