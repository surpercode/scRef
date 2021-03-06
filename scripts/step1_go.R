source('scRef.R')

exp_sc_mat=read.table('Zeisel_exp_sc_mat.txt',header=T,row.names=1,'\t')
exp_ref_mat=read.table('Reference_expression.txt',header=T,row.names=1,sep='\t')

#KENDALL
out=.get_cor(exp_sc_mat, exp_ref_mat, method='kendall',CPU=4, print_step=10)
tag=.get_tag_max(out)
cat('kendall finished!!!')
write.table(tag,file='TAG.txt',quote=F,row.names=F,col.names=T,sep='\t')

#SEMI-SUPERVISED
out=.get_cor(exp_sc_mat, exp_ref_mat, method='kendall',CPU=4, print_step=10)
tag=.get_tag_max(out)
LocalRef=.generate_ref(exp_sc_mat, tag, min_cell=1)
out=.get_log_p_sc_given_ref(exp_sc_mat, LocalRef, CPU=4, print_step=10)
tag=.get_tag_max(out)
cat('semi finished!!!')
write.table(tag,file='TAG_SEMI.txt',quote=F,row.names=F,col.names=T,sep='\t')
  






