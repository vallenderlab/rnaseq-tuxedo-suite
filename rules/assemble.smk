rule assemble_transcripts:
    input:
        bam=expand("{project}/{sample}_tophat/accepted_hits.bam", project=config['project'], sample=SAMPLES)
    output:
        expand("{project}/{sample}_cufflinks/", project=config['project'], sample=SAMPLES)
    conda: "envs/assemble.yaml"
    threads: 8
    shell:
        "cufflinks -p {threads} -o {output} {input.bam}"

rule merge_assemblies:
    input:
        gtf=,
        genome=,
        assemblies=,
    output:
        expand("{project}/{sample}_cufflinks/assemblies.txt", project=config['project'], sample=SAMPLES)
    conda: "envs/assemble.yaml"
    threads: 8
    shell:
        "cuffmerge -g {input.gtf} -s {input.genome} -p {threads} {input.assemblies}"