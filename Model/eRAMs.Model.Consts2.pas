unit eRAMs.Model.Consts2;

interface

uses
  System.SysUtils;

Const

 SQL_PERIODOS : string = 'Select Num_per from tbperiodos Where Num_per <> ''9999/9'' order by Num_per Desc';
 SQL_LISTA_TURMAS1  : string = 'SELECT DISTINCT Niv.Sgl_niv & ''.'' & cint(Tur.Num_tur) as Turma from tbNiveis Niv, tbTurmas Tur ';
 SQL_LISTA_TURMAS2  : string = 'WHERE ((niv.Cod_cur = tur.cod_cur) and (niv.num_niv = tur.num_niv)) and (tur.Cod_pro is not null) and (tur.num_per = :periodo) ORDER BY Niv.Sgl_niv & ''.'' & cint(Tur.Num_tur)';
 SQL_TURMAS1        : string = 'SELECT DISTINCT Tur.Cod_cur, tur.num_niv, tur.Num_tur, tur.hor_ini, tur.hor_fim, tur.flg_diaAul, niv.Not_Apr, prof.Nom_cop from tbTurmas Tur, tbNiveis Niv, tbProfessor prof ';
 SQL_TURMAS2        : string = 'WHERE ((niv.Cod_cur = tur.cod_cur) and (niv.num_niv = tur.num_niv)) and (prof.Cod_pro = tur.Cod_pro) and (tur.num_per = :periodo) and (Niv.Sgl_niv & ''.'' & cint(Tur.Num_tur) = :turma)';
 SQL_LISTA_ALUNOS1  : string = 'SELECT DISTINCT Alu.Nom_alu from tbAlunos alu, tbMatricula Mat WHERE (Mat.Cod_cur = :cod_cur) and (mat.Num_niv = :num_niv) and (mat.num_tur = :num_tur) and (Mat.num_per = :periodo) ';
 SQL_LISTA_ALUNOS2  : string = 'and ((Mat.flg_Mat = ''MP'') or (Mat.flg_mat = ''PM'')) and (Alu.cod_alu = mat.cod_alu) and (datediff(''d'', alu.dat_nas, now()) < 6574) ORDER BY Alu.Nom_alu';

implementation

end.
