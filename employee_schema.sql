-- Таблица СОТРУДНИК
CREATE TABLE СОТРУДНИК (
    id SERIAL PRIMARY KEY,
    имя VARCHAR(255) NOT NULL,
    отдел VARCHAR(255),
    начальник_id INTEGER,
    FOREIGN KEY (начальник_id) REFERENCES СОТРУДНИК(id) ON DELETE SET NULL
);