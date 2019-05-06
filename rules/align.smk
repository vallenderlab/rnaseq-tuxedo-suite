rule align:
    input:gtf=,genome=, samples=
    output:
    threads: 8
    shell:
        "tophat -G {input.gtf} -p {threads} -o {input.sample} {input.genome} {input.samples.left} {input.samples.right}"