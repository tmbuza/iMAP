## Phylotype method

biom convert \
  -i data/mothur/phylotype/qced.trim.contigs.good.unique.good.filter.unique.precluster.pick.seed.wang.pick.pick.tx.1.biom \
  -o results/tables/phylotype/phylotype.biom.shared.tsv --to-tsv --header-key taxonomy

## OTU-based method

biom convert \
  -i data/mothur/otus/qced.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.pick.opti_mcc.0.03.biom \
  -o results/tables/phylotype/otucluster.0.03.biom.shared.tsv --to-tsv --header-key taxonomy

