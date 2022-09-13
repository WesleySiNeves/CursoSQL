-- Gerado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   em:        2022-09-12 18:27:39 BRT
--   site:      SQL Server 2012
--   tipo:      SQL Server 2012

if(not exists(SELECT * FROM  sys.databases db
    where db.Name ='EscolaDB' ))
    BEGIN

            CREATE DATABASE  EscolaDB;

            Use EscolaDB
    END

GO

CREATE SCHEMA Faculdade

GO
CREATE SCHEMA Cadastro


CREATE TABLE Cadastro.InstituicaoEnsinoCampus 
    (
     IdInstituicaoEnsinoCampus UNIQUEIDENTIFIER NOT NULL , 
     Nome VARCHAR (100) NOT NULL 
    )
GO

ALTER TABLE Cadastro.InstituicaoEnsinoCampus ADD CONSTRAINT InstituicaoEnsinoCampus_PK PRIMARY KEY CLUSTERED (IdInstituicaoEnsinoCampus)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO


CREATE TABLE Faculdade.AlunosSituacoes 
    (
     IdSituacao UNIQUEIDENTIFIER NOT NULL , 
     Descricao VARCHAR (30) NOT NULL 
    )
GO

ALTER TABLE Faculdade.AlunosSituacoes ADD CONSTRAINT AlunosSituacoes_PK PRIMARY KEY CLUSTERED (IdSituacao)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO


CREATE TABLE Faculdade.AreasConhecimento 
    (
     IdAreaConhecimento UNIQUEIDENTIFIER NOT NULL , 
     Nome VARCHAR (100) NOT NULL , 
     Descricao VARCHAR (200) 
    )
GO

ALTER TABLE Faculdade.AreasConhecimento ADD CONSTRAINT AreasConhecimento_PK PRIMARY KEY CLUSTERED (IdAreaConhecimento)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.CursosOfertados 
    (
     IdCursoOfertado UNIQUEIDENTIFIER NOT NULL , 
     IdCurso INTEGER NOT NULL , 
     IdPeriodo UNIQUEIDENTIFIER NOT NULL 
    )
GO 

    


ALTER TABLE Faculdade.CursosOfertados ADD CONSTRAINT CursosOfertados_PK PRIMARY KEY CLUSTERED (IdCursoOfertado)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO


CREATE TABLE Cadastro.Pessoas 
    (
     IdPessoa UNIQUEIDENTIFIER NOT NULL , 
     Nome VARCHAR (100) NOT NULL 
    )
GO

ALTER TABLE Cadastro.Pessoas ADD CONSTRAINT Pessoas_PK PRIMARY KEY CLUSTERED (IdPessoa)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Cadastro.PessoasFisicas 
    (
     IdPessoaFisica UNIQUEIDENTIFIER NOT NULL , 
     IdPessoa UNIQUEIDENTIFIER NOT NULL , 
     CPF CHAR (11) NOT NULL , 
     RG VARCHAR (10) NOT NULL , 
     Sexo CHAR (1) NOT NULL , 
     DataNascimento DATE 
    )
GO 



CREATE TABLE Faculdade.Alunos 
    (
     IdAluno UNIQUEIDENTIFIER NOT NULL , 
     IdPessoaFisica UNIQUEIDENTIFIER NOT NULL , 
     IdSituacao UNIQUEIDENTIFIER NOT NULL , 
     CodAluno VARCHAR (8) NOT NULL , 
     RendaFamiliar DECIMAL (6,2) NOT NULL 
    )
GO 



ALTER TABLE Faculdade.Alunos ADD CONSTRAINT Alunos_PK PRIMARY KEY CLUSTERED (IdAluno)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO




CREATE TABLE Faculdade.Cursos 
    (
     IdCurso INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     Nome VARCHAR (100) NOT NULL , 
     CargaHorariaHora SMALLINT NOT NULL , 
     IdAreaConhecimento UNIQUEIDENTIFIER NOT NULL ,
     CONSTRAINT CHECK_FaculdadeCursos CHECK(CargaHorariaHora > 0)
    )
GO

ALTER TABLE Faculdade.Cursos ADD CONSTRAINT Cursos_PK PRIMARY KEY CLUSTERED (IdCurso)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO



CREATE TABLE Faculdade.Disciplinas 
    (
     IdDisciplina UNIQUEIDENTIFIER NOT NULL , 
     Nome VARCHAR (100) NOT NULL , 
     CargaHorariaHoras SMALLINT NOT NULL , 
     Ementa VARCHAR (MAX) NOT NULL , 
     IdCurso INTEGER NOT NULL 
    )
GO

ALTER TABLE Faculdade.Disciplinas ADD CONSTRAINT Disciplinas_PK PRIMARY KEY CLUSTERED (IdDisciplina)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.DisciplinasOfertadas 
    (
     IdDisciplinaOfertada UNIQUEIDENTIFIER NOT NULL , 
     IdProfessorDisciplina UNIQUEIDENTIFIER NOT NULL 
    )
GO 

    

ALTER TABLE Faculdade.DisciplinasOfertadas ADD CONSTRAINT DisciplinasOfertadas_PK PRIMARY KEY CLUSTERED (IdDisciplinaOfertada)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.DisciplinasOfertadasFaltas 
    (
     IdDisciplinasOfertadasFalta UNIQUEIDENTIFIER NOT NULL , 
     IdDisciplinaOfertada UNIQUEIDENTIFIER NOT NULL , 
     IdMatricula UNIQUEIDENTIFIER NOT NULL 
    )
GO

ALTER TABLE Faculdade.DisciplinasOfertadasFaltas ADD CONSTRAINT DisciplinasOfertadasFaltas_PK PRIMARY KEY CLUSTERED (IdDisciplinasOfertadasFalta)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.DisciplinasOfertadasNotas 
    (
     IdDisciplinasOfertadasNota UNIQUEIDENTIFIER NOT NULL , 
     IdMatricula UNIQUEIDENTIFIER NOT NULL , 
     Nota DECIMAL (5,2) NOT NULL , 
     IdTipoNota TINYINT NOT NULL , 
     IdDisciplinaOfertada UNIQUEIDENTIFIER NOT NULL 
    )
GO 

    


ALTER TABLE Faculdade.DisciplinasOfertadasNotas ADD CONSTRAINT DisciplinasOfertadasNotas_PK PRIMARY KEY CLUSTERED (IdDisciplinasOfertadasNota)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO



CREATE TABLE Faculdade.Matriculas 
    (
     IdMatricula UNIQUEIDENTIFIER NOT NULL , 
     DataMatricula DATE NOT NULL , 
     IdPeriodo UNIQUEIDENTIFIER NOT NULL , 
     IdMatriculaSituacao UNIQUEIDENTIFIER NOT NULL , 
     IdAluno UNIQUEIDENTIFIER NOT NULL , 
     IdCursoOfertado UNIQUEIDENTIFIER NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Matriculas__IDX ON Faculdade.Matriculas 
    ( 
     IdAluno ,IdCursoOfertado
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    Matriculas__IDXv1 ON Faculdade.Matriculas 
    ( 
     IdPeriodo 
    ) 
GO

ALTER TABLE Faculdade.Matriculas ADD CONSTRAINT Matriculas_PK PRIMARY KEY CLUSTERED (IdMatricula)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.MatriculasSituacoes 
    (
     IdMatriculaSituacao UNIQUEIDENTIFIER NOT NULL , 
     Descricao VARCHAR (30) NOT NULL 
    )
GO

ALTER TABLE Faculdade.MatriculasSituacoes ADD CONSTRAINT MatriculasSituacoes_PK PRIMARY KEY CLUSTERED (IdMatriculaSituacao)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.Periodos 
    (
     IdPeriodo UNIQUEIDENTIFIER NOT NULL , 
     Ano SMALLINT NOT NULL , 
     DataInicio DATE NOT NULL , 
     DataTermino DATE NOT NULL , 
     Semestre TINYINT NOT NULL 
    )
GO

ALTER TABLE Faculdade.Periodos ADD CONSTRAINT Periodos_PK PRIMARY KEY CLUSTERED (IdPeriodo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO



CREATE TABLE Cadastro.PessoasEmails 
    (
     IdPessoaEmail UNIQUEIDENTIFIER NOT NULL , 
     Email VARCHAR (100) NOT NULL , 
     IsPessoal BIT NOT NULL , 
     IsAtual BIT NOT NULL , 
     IsInstitucional BIT NOT NULL , 
     IdPessoa UNIQUEIDENTIFIER NOT NULL 
    )
GO

ALTER TABLE Cadastro.PessoasEmails ADD CONSTRAINT PessoasEmails_PK PRIMARY KEY CLUSTERED (IdPessoaEmail)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Cadastro.PessoasEnderecos 
    (
     IdPessoaEndereco UNIQUEIDENTIFIER NOT NULL , 
     Endereco VARCHAR (100) NOT NULL , 
     Rua VARCHAR (100) NOT NULL , 
     Complemento VARCHAR (100) NOT NULL , 
     Bairro VARCHAR (100) NOT NULL , 
     CEP CHAR (10) NOT NULL , 
     IdPessoa UNIQUEIDENTIFIER NOT NULL 
    )
GO

ALTER TABLE Cadastro.PessoasEnderecos ADD CONSTRAINT PessoasEnderecos_PK PRIMARY KEY CLUSTERED (IdPessoaEndereco, IdPessoa)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO



    


CREATE UNIQUE NONCLUSTERED INDEX 
    Unique_CadastroPessoasFisicas_IdPessoa ON Cadastro.PessoasFisicas 
    ( 
     IdPessoa 
    ) 
GO

ALTER TABLE Cadastro.PessoasFisicas ADD CONSTRAINT PessoasFisicas_PK PRIMARY KEY CLUSTERED (IdPessoaFisica)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Cadastro.PessoasTelefones 
    (
     IdPessoaTelefone UNIQUEIDENTIFIER NOT NULL , 
     Telefone VARCHAR (10) NOT NULL , 
     IsPessoal BIT NOT NULL , 
     IsAtualizado BIT NOT NULL , 
     IdPessoa UNIQUEIDENTIFIER NOT NULL 
    )
GO

ALTER TABLE Cadastro.PessoasTelefones ADD CONSTRAINT PessoasTelefones_PK PRIMARY KEY CLUSTERED (IdPessoaTelefone)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.Professores 
    (
     IdProfessor UNIQUEIDENTIFIER NOT NULL , 
     IdPessoaFisica UNIQUEIDENTIFIER NOT NULL , 
     Curriculum IMAGE , 
     IsCoordenador BIT NOT NULL , 
     IdProfessoresSituacao UNIQUEIDENTIFIER NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Professores__IDX ON Faculdade.Professores 
    ( 
     IdPessoaFisica 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    Professores__IDXv1 ON Faculdade.Professores 
    ( 
     IdProfessoresSituacao 
    ) 
GO

ALTER TABLE Faculdade.Professores ADD CONSTRAINT Professores_PK PRIMARY KEY CLUSTERED (IdProfessor)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.ProfessoresDisciplinas 
    (
     IdProfessorDisciplina UNIQUEIDENTIFIER NOT NULL , 
     IdProfessor UNIQUEIDENTIFIER NOT NULL , 
     IdDisciplina UNIQUEIDENTIFIER NOT NULL 
    )
GO

ALTER TABLE Faculdade.ProfessoresDisciplinas ADD CONSTRAINT ProfessoresDisciplinas_PK PRIMARY KEY CLUSTERED (IdProfessorDisciplina)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.ProfessoresSituacoes 
    (
     IdProfessoresSituacao UNIQUEIDENTIFIER NOT NULL , 
     Descricao VARCHAR (20) NOT NULL 
    )
GO

ALTER TABLE Faculdade.ProfessoresSituacoes ADD CONSTRAINT ProfessoresSituacoes_PK PRIMARY KEY CLUSTERED (IdProfessoresSituacao)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.Salas 
    (
     IdSala UNIQUEIDENTIFIER NOT NULL , 
     PossueQuadroBranco BIT NOT NULL , 
     PossueArCondicionado BIT NOT NULL , 
     PossueProjetor BIT NOT NULL , 
     CapacidadeMaximaAlunos SMALLINT NOT NULL , 
     IdInstituicaoEnsinoCampus UNIQUEIDENTIFIER NOT NULL 
    )
GO

ALTER TABLE Faculdade.Salas ADD CONSTRAINT Salas_PK PRIMARY KEY CLUSTERED (IdSala)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.TipoNotas 
    (
     IdTipoNota TINYINT NOT NULL IDENTITY NOT FOR REPLICATION , 
     Descricao VARCHAR (30) NOT NULL 
    )
GO

ALTER TABLE Faculdade.TipoNotas ADD CONSTRAINT TipoNotas_PK PRIMARY KEY CLUSTERED (IdTipoNota)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Faculdade.Turmas 
    (
     IdTurma UNIQUEIDENTIFIER NOT NULL , 
     CodTurma VARCHAR (10) NOT NULL , 
     IdDisciplinaOfertada UNIQUEIDENTIFIER NOT NULL , 
     IdMatricula UNIQUEIDENTIFIER NOT NULL , 
     IdSala UNIQUEIDENTIFIER NOT NULL , 
     IsVitrual BIT NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Turmas__IDX ON Faculdade.Turmas 
    ( 
     IdDisciplinaOfertada 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    Turmas__IDXv1 ON Faculdade.Turmas 
    ( 
     IdSala 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    Turmas__IDXv2 ON Faculdade.Turmas 
    ( 
     IdMatricula 
    ) 
GO

ALTER TABLE Faculdade.Turmas ADD CONSTRAINT Turmas_PK PRIMARY KEY CLUSTERED (IdTurma)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Faculdade.Alunos 
    ADD CONSTRAINT Alunos_AlunosSituacoes_FK FOREIGN KEY 
    ( 
     IdSituacao
    ) 
    REFERENCES Faculdade.AlunosSituacoes 
    ( 
     IdSituacao 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Alunos 
    ADD CONSTRAINT Alunos_PessoasFisicas_FK FOREIGN KEY 
    ( 
     IdPessoaFisica
    ) 
    REFERENCES Cadastro.PessoasFisicas 
    ( 
     IdPessoaFisica 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Cursos 
    ADD CONSTRAINT Cursos_AreasConhecimento_FK FOREIGN KEY 
    ( 
     IdAreaConhecimento
    ) 
    REFERENCES Faculdade.AreasConhecimento 
    ( 
     IdAreaConhecimento 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.CursosOfertados 
    ADD CONSTRAINT CursosOfertados_Cursos_FK FOREIGN KEY 
    ( 
     IdCurso
    ) 
    REFERENCES Faculdade.Cursos 
    ( 
     IdCurso 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.CursosOfertados 
    ADD CONSTRAINT CursosOfertados_Periodos_FK FOREIGN KEY 
    ( 
     IdPeriodo
    ) 
    REFERENCES Faculdade.Periodos 
    ( 
     IdPeriodo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Disciplinas 
    ADD CONSTRAINT Disciplinas_Cursos_FK FOREIGN KEY 
    ( 
     IdCurso
    ) 
    REFERENCES Faculdade.Cursos 
    ( 
     IdCurso 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.DisciplinasOfertadas 
    ADD CONSTRAINT DisciplinasOfertadas_ProfessoresDisciplinas_FK FOREIGN KEY 
    ( 
     IdProfessorDisciplina
    ) 
    REFERENCES Faculdade.ProfessoresDisciplinas 
    ( 
     IdProfessorDisciplina 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.DisciplinasOfertadasFaltas 
    ADD CONSTRAINT DisciplinasOfertadasFaltas_DisciplinasOfertadas_FK FOREIGN KEY 
    ( 
     IdDisciplinaOfertada
    ) 
    REFERENCES Faculdade.DisciplinasOfertadas 
    ( 
     IdDisciplinaOfertada 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.DisciplinasOfertadasFaltas 
    ADD CONSTRAINT DisciplinasOfertadasFaltas_Matriculas_FK FOREIGN KEY 
    ( 
     IdMatricula
    ) 
    REFERENCES Faculdade.Matriculas 
    ( 
     IdMatricula 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.DisciplinasOfertadasNotas 
    ADD CONSTRAINT DisciplinasOfertadasNotas_DisciplinasOfertadas_FK FOREIGN KEY 
    ( 
     IdDisciplinaOfertada
    ) 
    REFERENCES Faculdade.DisciplinasOfertadas 
    ( 
     IdDisciplinaOfertada 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.DisciplinasOfertadasNotas 
    ADD CONSTRAINT DisciplinasOfertadasNotas_Matriculas_FK FOREIGN KEY 
    ( 
     IdMatricula
    ) 
    REFERENCES Faculdade.Matriculas 
    ( 
     IdMatricula 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.DisciplinasOfertadasNotas 
    ADD CONSTRAINT DisciplinasOfertadasNotas_TipoNotas_FK FOREIGN KEY 
    ( 
     IdTipoNota
    ) 
    REFERENCES Faculdade.TipoNotas 
    ( 
     IdTipoNota 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Matriculas 
    ADD CONSTRAINT Matriculas_Alunos_FK FOREIGN KEY 
    ( 
     IdAluno
    ) 
    REFERENCES Faculdade.Alunos 
    ( 
     IdAluno 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Matriculas 
    ADD CONSTRAINT Matriculas_CursosOfertados_FK FOREIGN KEY 
    ( 
     IdCursoOfertado
    ) 
    REFERENCES Faculdade.CursosOfertados 
    ( 
     IdCursoOfertado 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Matriculas 
    ADD CONSTRAINT Matriculas_MatriculasSituacoes_FK FOREIGN KEY 
    ( 
     IdMatriculaSituacao
    ) 
    REFERENCES Faculdade.MatriculasSituacoes 
    ( 
     IdMatriculaSituacao 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Matriculas 
    ADD CONSTRAINT Matriculas_Periodos_FK FOREIGN KEY 
    ( 
     IdPeriodo
    ) 
    REFERENCES Faculdade.Periodos 
    ( 
     IdPeriodo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Cadastro.PessoasEmails 
    ADD CONSTRAINT PessoasEmails_Pessoas_FK FOREIGN KEY 
    ( 
     IdPessoa
    ) 
    REFERENCES Cadastro.Pessoas 
    ( 
     IdPessoa 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Cadastro.PessoasEnderecos 
    ADD CONSTRAINT PessoasEnderecos_Pessoas_FK FOREIGN KEY 
    ( 
     IdPessoa
    ) 
    REFERENCES Cadastro.Pessoas 
    ( 
     IdPessoa 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Cadastro.PessoasFisicas 
    ADD CONSTRAINT PessoasFisicas_Pessoas_FK FOREIGN KEY 
    ( 
     IdPessoa
    ) 
    REFERENCES Cadastro.Pessoas 
    ( 
     IdPessoa 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Cadastro.PessoasTelefones 
    ADD CONSTRAINT PessoasTelefones_Pessoas_FK FOREIGN KEY 
    ( 
     IdPessoa
    ) 
    REFERENCES Cadastro.Pessoas 
    ( 
     IdPessoa 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Professores 
    ADD CONSTRAINT Professores_PessoasFisicas_FK FOREIGN KEY 
    ( 
     IdPessoaFisica
    ) 
    REFERENCES Cadastro.PessoasFisicas 
    ( 
     IdPessoaFisica 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Professores 
    ADD CONSTRAINT Professores_ProfessoresSituacoes_FK FOREIGN KEY 
    ( 
     IdProfessoresSituacao
    ) 
    REFERENCES Faculdade.ProfessoresSituacoes 
    ( 
     IdProfessoresSituacao 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.ProfessoresDisciplinas 
    ADD CONSTRAINT ProfessoresDisciplinas_Disciplinas_FK FOREIGN KEY 
    ( 
     IdDisciplina
    ) 
    REFERENCES Faculdade.Disciplinas 
    ( 
     IdDisciplina 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.ProfessoresDisciplinas 
    ADD CONSTRAINT ProfessoresDisciplinas_Professores_FK FOREIGN KEY 
    ( 
     IdProfessor
    ) 
    REFERENCES Faculdade.Professores 
    ( 
     IdProfessor 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Salas 
    ADD CONSTRAINT Salas_InstituicaoEnsinoCampus_FK FOREIGN KEY 
    ( 
     IdInstituicaoEnsinoCampus
    ) 
    REFERENCES Cadastro.InstituicaoEnsinoCampus 
    ( 
     IdInstituicaoEnsinoCampus 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Turmas 
    ADD CONSTRAINT Turmas_DisciplinasOfertadas_FK FOREIGN KEY 
    ( 
     IdDisciplinaOfertada
    ) 
    REFERENCES Faculdade.DisciplinasOfertadas 
    ( 
     IdDisciplinaOfertada 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Turmas 
    ADD CONSTRAINT Turmas_Matriculas_FK FOREIGN KEY 
    ( 
     IdMatricula
    ) 
    REFERENCES Faculdade.Matriculas 
    ( 
     IdMatricula 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Faculdade.Turmas 
    ADD CONSTRAINT Turmas_Salas_FK FOREIGN KEY 
    ( 
     IdSala
    ) 
    REFERENCES Faculdade.Salas 
    ( 
     IdSala 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            24
-- CREATE INDEX                            13
-- ALTER TABLE                             52
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
