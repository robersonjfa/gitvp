CREATE TABLE Aluno (
  id              SERIAL NOT NULL, 
  nome            varchar(60) NOT NULL, 
  data_nascimento date NOT NULL, 
  email           varchar(150), 
  cpf             varchar(11) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
COMMENT ON TABLE Aluno IS 'Cadastro dos alunos.';
COMMENT ON COLUMN Aluno.id IS 'Identificador do aluno.';
COMMENT ON COLUMN Aluno.nome IS 'Nome do aluno';
COMMENT ON COLUMN Aluno.data_nascimento IS 'Data de Nascimento.';
CREATE TABLE Curso (
  id            SERIAL NOT NULL, 
  nome          varchar(150) NOT NULL, 
  carga_horaria int4 NOT NULL, 
  conteudo      json, 
  PRIMARY KEY (id));
COMMENT ON TABLE Curso IS 'Cadastro dos Cursos';
COMMENT ON COLUMN Curso.id IS 'Identificador do Curso';
COMMENT ON COLUMN Curso.nome IS 'Nome do Curso';
COMMENT ON COLUMN Curso.carga_horaria IS 'Carga Horária em minutos.';
CREATE TABLE Matricula (
  id             SERIAL NOT NULL, 
  aluno_id       int4 NOT NULL, 
  curso_id       int4 NOT NULL, 
  data_matricula timestamp DEFAULT current_timestamp NOT NULL, 
  PRIMARY KEY (id));
COMMENT ON TABLE Matricula IS 'Cadastro da Matrícula do Aluno';
COMMENT ON COLUMN Matricula.id IS 'Identificador da Matrícula';
COMMENT ON COLUMN Matricula.aluno_id IS 'Identificador do aluno';
COMMENT ON COLUMN Matricula.curso_id IS 'Identificador do curso';
COMMENT ON COLUMN Matricula.data_matricula IS 'Data/hora da matrícula';
ALTER TABLE Matricula ADD CONSTRAINT FKMatricula834089 FOREIGN KEY (aluno_id) REFERENCES Aluno (id);
ALTER TABLE Matricula ADD CONSTRAINT FKMatricula72905 FOREIGN KEY (curso_id) REFERENCES Curso (id);
