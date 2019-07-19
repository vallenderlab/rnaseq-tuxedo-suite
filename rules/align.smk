rule align_reads:
    input:
        gtf=config['gtf'],
        genome=config['genome'],
        forward=config['samples'],
        reverse=config['samples']
    output:
    threads: 8
    shell:
        "tophat -G {input.gtf} -p {threads} -o {input.sample} {input.genome} {input.forward} {input.reverse}"