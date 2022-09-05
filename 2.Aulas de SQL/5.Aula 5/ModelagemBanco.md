classDiagram
      
class Alunos {
    CodAluno
          IdAluno
          IdPessoaFisica
          IdSituacao
          RendaFamiliar
          
}
        
class AlunosSituacoes {
    Descricao
          IdSituacao
          
}
        
class AreasConhecimento {
    Descricao
          IdAreaConhecimento
          Nome
          
}
        
class Cursos {
    CargaHorariaHora
          IdAreaConhecimento
          IdCurso
          Nome
          
}
        
class CursosOfertados {
    IdCurso
          IdCursoOfertado
          IdPeriodo
          
}
        
class Disciplinas {
    CargaHorariaHoras
          Ementa
          IdCurso
          IdDisciplina
          Nome
          
}
        
class DisciplinasOfertadas {
    IdDisciplinaOfertada
          IdProfessorDisciplina
          
}
        
class DisciplinasOfertadasFaltas {
    IdDisciplinaOfertada
          IdDisciplinasOfertadasFalta
          IdMatricula
          
}
        
class DisciplinasOfertadasNotas {
    IdDisciplinaOfertada
          IdDisciplinasOfertadasNota
          IdMatricula
          IdTipoNota
          Nota
          
}
        
class InstituicaoEnsinoCampus {
    IdInstituicaoEnsinoCampus
          Nome
          
}
        
class Matriculas {
    DataMatricula
          IdAluno
          IdCursoOfertado
          IdMatricula
          IdMatriculaSituacao
          IdPeriodo
          
}
        
class MatriculasSituacoes {
    Descricao
          IdMatriculaSituacao
          
}
        
class Periodos {
    Ano
          DataInicio
          DataTermino
          IdPeriodo
          Semestre
          
}
        
class Pessoas {
    IdPessoa
          Nome
          
}
        
class PessoasEmails {
    Email
          IdPessoa
          IdPessoaEmail
          IsAtual
          IsInstitucional
          IsPessoal
          
}
        
class PessoasEnderecos {
    Bairro
          CEP
          Complemento
          Endereco
          IdPessoa
          IdPessoaEndereco
          Rua
          
}
        
class PessoasFisicas {
    CPF
          DataNascimento
          IdPessoa
          IdPessoaFisica
          RG
          Sexo
          
}
        
class PessoasTelefones {
    IdPessoa
          IdPessoaTelefone
          IsAtualizado
          IsPessoal
          Telefone
          
}
        
class Professores {
    Curriculum
          IdPessoaFisica
          IdProfessor
          IdProfessoresSituacao
          IsCoordenador
          
}
        
class ProfessoresDisciplinas {
    IdDisciplina
          IdProfessor
          IdProfessorDisciplina
          
}
        
class ProfessoresSituacoes {
    Descricao
          IdProfessoresSituacao
          
}
        
class Salas {
    CapacidadeMaximaAlunos
          IdInstituicaoEnsinoCampus
          IdSala
          PossueArCondicionado
          PossueProjetor
          PossueQuadroBranco
          
}
        
class TipoNotas {
    Descricao
          IdTipoNota
          
}
        
class Turmas {
    CodTurma
          IdDisciplinaOfertada
          IdMatricula
          IdSala
          IdTurma
          IsVitrual
          
}
        
      Alunos --|> PessoasFisicas: IdPessoaFisica
            Alunos --|> AlunosSituacoes: IdSituacao
            Cursos --|> AreasConhecimento: IdAreaConhecimento
            CursosOfertados --|> Cursos: IdCurso
            CursosOfertados --|> Periodos: IdPeriodo
            Disciplinas --|> Cursos: IdCurso
            DisciplinasOfertadas --|> ProfessoresDisciplinas: IdProfessorDisciplina
            DisciplinasOfertadasFaltas --|> DisciplinasOfertadas: IdDisciplinaOfertada
            DisciplinasOfertadasFaltas --|> Matriculas: IdMatricula
            DisciplinasOfertadasNotas --|> DisciplinasOfertadas: IdDisciplinaOfertada
            DisciplinasOfertadasNotas --|> Matriculas: IdMatricula
            DisciplinasOfertadasNotas --|> TipoNotas: IdTipoNota
            Matriculas --|> Alunos: IdAluno
            Matriculas --|> CursosOfertados: IdCursoOfertado
            Matriculas --|> MatriculasSituacoes: IdMatriculaSituacao
            Matriculas --|> Periodos: IdPeriodo
            PessoasEmails --|> Pessoas: IdPessoa
            PessoasEnderecos --|> Pessoas: IdPessoa
            PessoasFisicas --|> Pessoas: IdPessoa
            PessoasTelefones --|> Pessoas: IdPessoa
            Professores --|> PessoasFisicas: IdPessoaFisica
            Professores --|> ProfessoresSituacoes: IdProfessoresSituacao
            ProfessoresDisciplinas --|> Disciplinas: IdDisciplina
            ProfessoresDisciplinas --|> Professores: IdProfessor
            Salas --|> InstituicaoEnsinoCampus: IdInstituicaoEnsinoCampus
            Turmas --|> DisciplinasOfertadas: IdDisciplinaOfertada
            Turmas --|> Matriculas: IdMatricula
            Turmas --|> Salas: IdSala
            
      