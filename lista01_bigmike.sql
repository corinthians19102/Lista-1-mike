

CREATE VIEW vw_alunos_cursos AS
SELECT a.nome AS aluno, d.nome AS disciplina, c.nome AS curso
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
JOIN disciplinas d ON m.disciplina_id = d.id
JOIN cursos c ON d.curso_id = c.id;


	

CREATE VIEW vw_total_alunos_disciplina AS
SELECT d.nome AS disciplina, COUNT(m.aluno_id) AS total_alunos
FROM disciplinas d
LEFT JOIN matriculas m ON d.id = m.disciplina_id
GROUP BY d.nome;


CREATE VIEW vw_alunos_status_matricula AS
SELECT a.nome AS aluno, d.nome AS disciplina, m.status
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
JOIN disciplinas d ON m.disciplina_id = d.id;


CREATE VIEW vw_professores_turmas AS
SELECT p.nome AS professor, d.nome AS disciplina, t.horario
FROM professores p
JOIN turmas t ON p.id = t.professor_id
JOIN disciplinas d ON t.disciplina_id = d.id;




CREATE VIEW vw_alunos_maiores_20 AS
SELECT nome, data_nascimento
FROM alunos
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 20;




CREATE VIEW vw_carga_horaria_curso AS
SELECT c.nome AS curso, COUNT(d.id) AS total_disciplinas, SUM(d.carga_horaria) AS carga_horaria_total
FROM cursos c
JOIN disciplinas d ON c.id = d.curso_id
GROUP BY c.nome;




CREATE VIEW vw_professores_especialidades AS
SELECT p.nome, p.especialidade
FROM professores p;



CREATE VIEW vw_alunos_varias_disciplinas AS
SELECT a.nome, COUNT(m.disciplina_id) AS total_disciplinas
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
GROUP BY a.nome
HAVING COUNT(m.disciplina_id) > 1;




CREATE VIEW vw_alunos_disciplinas_concluidas AS
SELECT a.nome, COUNT(m.disciplina_id) AS disciplinas_concluidas
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
WHERE m.status = 'Concluído'
GROUP BY a.nome;




CREATE VIEW vw_turmas_semestre AS
SELECT t.*
FROM turmas t
WHERE t.semestre = '2024.1';




CREATE VIEW vw_alunos_matricula_trancada AS
SELECT a.nome
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
WHERE m.status = 'Trancado';


	

CREATE VIEW vw_disciplinas_sem_alunos AS
SELECT d.nome
FROM disciplinas d
LEFT JOIN matriculas m ON d.id = m.disciplina_id
WHERE m.aluno_id IS NULL;


	

CREATE VIEW vw_total_alunos_por_status AS
SELECT m.status, COUNT(m.aluno_id) AS total_alunos
FROM matriculas m
GROUP BY m.status;




CREATE VIEW vw_total_professores_especialidade AS
SELECT p.especialidade, COUNT(p.id) AS total_professores
FROM professores p
GROUP BY p.especialidade;




CREATE VIEW vw_alunos_idade AS
SELECT nome, TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM alunos;




CREATE VIEW vw_ultimas_matriculas AS
SELECT a.nome, MAX(m.data_matricula) AS ultima_matricula
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
GROUP BY a.nome;




CREATE VIEW vw_disciplinas_curso AS
SELECT d.nome AS disciplina
FROM disciplinas d
JOIN cursos c ON d.curso_id = c.id
WHERE c.nome = 'Engenharia de Software';




CREATE VIEW vw_professores_sem_turmas AS
SELECT p.nome
FROM professores p
LEFT JOIN turmas t ON p.id = t.professor_id
WHERE t.professor_id IS NULL;




CREATE VIEW vw_alunos_cpf_email AS
SELECT nome, cpf, email
FROM alunos;




CREATE VIEW vw_total_disciplinas_professor AS
SELECT p.nome AS professor, COUNT(t.disciplina_id) AS total_disciplinas
FROM professores p
LEFT JOIN turmas t ON p.id = t.professor_id
GROUP BY p.nome;