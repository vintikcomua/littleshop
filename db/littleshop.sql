--
-- Файл сгенерирован с помощью SQLiteStudio v3.3.3 в Пн Жов 3 11:03:26 2022
--
-- Использованная кодировка текста: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: dicBrand
DROP TABLE IF EXISTS dicBrand;

CREATE TABLE dicBrand (
    id    INTEGER      PRIMARY KEY AUTOINCREMENT
                       NOT NULL,
    short VARCHAR (50) UNIQUE
                       NOT NULL
);

INSERT INTO dicBrand (
                         id,
                         short
                     )
                     VALUES (
                         1,
                         'Кольчуга'
                     );

INSERT INTO dicBrand (
                         id,
                         short
                     )
                     VALUES (
                         2,
                         'FERODO'
                     );


-- Таблица: dicClassUnit
DROP TABLE IF EXISTS dicClassUnit;

CREATE TABLE dicClassUnit (
    id       INTEGER       PRIMARY KEY
                           NOT NULL,
    short    VARCHAR (50)  UNIQUE
                           NOT NULL,
    fullname VARCHAR (255) 
);

INSERT INTO dicClassUnit (
                             id,
                             short,
                             fullname
                         )
                         VALUES (
                             101,
                             'м',
                             'Метр'
                         );

INSERT INTO dicClassUnit (
                             id,
                             short,
                             fullname
                         )
                         VALUES (
                             171,
                             'міс',
                             'Місяць'
                         );

INSERT INTO dicClassUnit (
                             id,
                             short,
                             fullname
                         )
                         VALUES (
                             175,
                             'год',
                             'Година'
                         );

INSERT INTO dicClassUnit (
                             id,
                             short,
                             fullname
                         )
                         VALUES (
                             301,
                             'кг',
                             'Кілограм'
                         );

INSERT INTO dicClassUnit (
                             id,
                             short,
                             fullname
                         )
                         VALUES (
                             2009,
                             'шт',
                             'Штука'
                         );


-- Таблица: dicProduct
DROP TABLE IF EXISTS dicProduct;

CREATE TABLE dicProduct (
    id               INTEGER       NOT NULL
                                   PRIMARY KEY AUTOINCREMENT,
    group_id         INTEGER       NOT NULL
                                   REFERENCES dicProductGroup (id) ON DELETE RESTRICT
                                                                   ON UPDATE CASCADE
                                   DEFAULT (0),
    article          VARCHAR (50)  NOT NULL
                                   DEFAULT (''),
    short            VARCHAR (150) NOT NULL,
    unit_id          INTEGER       REFERENCES dicClassUnit (id) ON DELETE RESTRICT
                                                                ON UPDATE CASCADE
                                   NOT NULL
                                   DEFAULT (2009),
    brand_id         INTEGER       REFERENCES dicBrand (id) ON DELETE RESTRICT
                                                            ON UPDATE CASCADE,
    typeofproduct_id INTEGER       DEFAULT 1
                                   NOT NULL
                                   REFERENCES eTypesOfProduct (id) ON DELETE NO ACTION
                                                                   ON UPDATE CASCADE
);

INSERT INTO dicProduct (
                           id,
                           group_id,
                           article,
                           short,
                           unit_id,
                           brand_id,
                           typeofproduct_id
                       )
                       VALUES (
                           1,
                           1,
                           '1.0231.00',
                           'Захист картера Volkswagen Caddy 3 2004-2011 Всі двигун, КПП, радіатор',
                           2009,
                           1,
                           1
                       );

INSERT INTO dicProduct (
                           id,
                           group_id,
                           article,
                           short,
                           unit_id,
                           brand_id,
                           typeofproduct_id
                       )
                       VALUES (
                           2,
                           1,
                           'FDB1766',
                           'Гальмівні колодки дискові FERODO задні RENAULT LAGUNA III (BT0/1) 1.5 dCi (BT00, BT0A, BT0T, BT1J)',
                           2009,
                           2,
                           1
                       );


-- Таблица: dicProductGroup
DROP TABLE IF EXISTS dicProductGroup;

CREATE TABLE dicProductGroup (
    id        INTEGER      PRIMARY KEY AUTOINCREMENT
                           NOT NULL,
    short     VARCHAR (50) NOT NULL,
    parent_id INTEGER      NOT NULL
                           REFERENCES dicProductGroup (id) ON DELETE RESTRICT
                                                           ON UPDATE CASCADE
                           DEFAULT (0) 
);

INSERT INTO dicProductGroup (
                                id,
                                short,
                                parent_id
                            )
                            VALUES (
                                0,
                                'Номенклатура',
                                0
                            );

INSERT INTO dicProductGroup (
                                id,
                                short,
                                parent_id
                            )
                            VALUES (
                                1,
                                'Товари',
                                0
                            );

INSERT INTO dicProductGroup (
                                id,
                                short,
                                parent_id
                            )
                            VALUES (
                                2,
                                'Послуги',
                                0
                            );

INSERT INTO dicProductGroup (
                                id,
                                short,
                                parent_id
                            )
                            VALUES (
                                3,
                                'Продукція',
                                0
                            );


-- Таблица: eTypesOfProduct
DROP TABLE IF EXISTS eTypesOfProduct;

CREATE TABLE eTypesOfProduct (
    id    INTEGER      NOT NULL
                       PRIMARY KEY AUTOINCREMENT,
    short VARCHAR (50) NOT NULL,
    CONSTRAINT eTypesOfProducts_UN UNIQUE (
        short
    )
);

INSERT INTO eTypesOfProduct (
                                id,
                                short
                            )
                            VALUES (
                                1,
                                'Товар'
                            );

INSERT INTO eTypesOfProduct (
                                id,
                                short
                            )
                            VALUES (
                                2,
                                'Услуга'
                            );

INSERT INTO eTypesOfProduct (
                                id,
                                short
                            )
                            VALUES (
                                3,
                                'Комплект'
                            );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
