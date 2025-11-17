-- Таблица ЖАНР
CREATE TABLE ЖАНР (
    id_жанра SERIAL PRIMARY KEY,
    название VARCHAR(255) NOT NULL UNIQUE
);

-- Таблица ИСПОЛНИТЕЛЬ
CREATE TABLE ИСПОЛНИТЕЛЬ (
    id_исполнителя SERIAL PRIMARY KEY,
    имя_псевдоним VARCHAR(255) NOT NULL
);

-- Таблица АЛЬБОМ
CREATE TABLE АЛЬБОМ (
    id_альбома SERIAL PRIMARY KEY,
    название VARCHAR(255) NOT NULL,
    год_выпуска INTEGER CHECK (год_выпуска > 0)
);

-- Таблица ТРЕК
CREATE TABLE ТРЕК (
    id_трека SERIAL PRIMARY KEY,
    название VARCHAR(255) NOT NULL,
    длительность INTERVAL NOT NULL,
    id_альбома INTEGER NOT NULL,
    FOREIGN KEY (id_альбома) REFERENCES АЛЬБОМ(id_альбома) ON DELETE CASCADE
);

-- Таблица СБОРНИК
CREATE TABLE СБОРНИК (
    id_сборника SERIAL PRIMARY KEY,
    название VARCHAR(255) NOT NULL,
    год_выпуска INTEGER CHECK (год_выпуска > 0)
);

-- Таблица ИСПОЛНИТЕЛЬ_ЖАНР (связь многие-ко-многим)
CREATE TABLE ИСПОЛНИТЕЛЬ_ЖАНР (
    id_исполнителя INTEGER NOT NULL,
    id_жанра INTEGER NOT NULL,
    PRIMARY KEY (id_исполнителя, id_жанра),
    FOREIGN KEY (id_исполнителя) REFERENCES ИСПОЛНИТЕЛЬ(id_исполнителя) ON DELETE CASCADE,
    FOREIGN KEY (id_жанра) REFERENCES ЖАНР(id_жанра) ON DELETE CASCADE
);

-- Таблица ИСПОЛНИТЕЛЬ_АЛЬБОМ (связь многие-ко-многим)
CREATE TABLE ИСПОЛНИТЕЛЬ_АЛЬБОМ (
    id_исполнителя INTEGER NOT NULL,
    id_альбома INTEGER NOT NULL,
    PRIMARY KEY (id_исполнителя, id_альбома),
    FOREIGN KEY (id_исполнителя) REFERENCES ИСПОЛНИТЕЛЬ(id_исполнителя) ON DELETE CASCADE,
    FOREIGN KEY (id_альбома) REFERENCES АЛЬБОМ(id_альбома) ON DELETE CASCADE
);

-- Таблица СБОРНИК_ТРЕК (связь многие-ко-многим)
CREATE TABLE СБОРНИК_ТРЕК (
    id_сборника INTEGER NOT NULL,
    id_трека INTEGER NOT NULL,
    PRIMARY KEY (id_сборника, id_трека),
    FOREIGN KEY (id_сборника) REFERENCES СБОРНИК(id_сборника) ON DELETE CASCADE,
    FOREIGN KEY (id_трека) REFERENCES ТРЕК(id_трека) ON DELETE CASCADE
);