rule differential_expression:
    input:
        genome=,
        bam=,
        strands="R1,R2",
        merged_gtf=
    output:
        expand("{project}/cuffdiff_output/", project=config['project'])
    conda: "envs/differential_expression.yaml"
    threads: 8
    shell:
        "cuffdiff -o {output} -b {input.genome} -p {threads} -L {input.strands} -u {input.merged_gtf} {input.merged_bam}"