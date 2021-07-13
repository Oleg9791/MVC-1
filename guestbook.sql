-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 13 2021 г., 22:36
-- Версия сервера: 8.0.19
-- Версия PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `guestbook`
--
CREATE DATABASE IF NOT EXISTS `guestbook` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `guestbook`;

-- --------------------------------------------------------

--
-- Структура таблицы `gb`
--

CREATE TABLE `gb` (
  `id` int UNSIGNED NOT NULL COMMENT 'id',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Сообщение',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Имя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `gb`
--

INSERT INTO `gb` (`id`, `message`, `name`) VALUES
(50, 'Привет!', 'Leo'),
(51, 'Привет!!!', 'Ольга'),
(52, 'Как дела?', 'Макс'),
(53, 'Всё хорошо.', 'Костя');

-- --------------------------------------------------------

--
-- Структура таблицы `opros`
--

CREATE TABLE `opros` (
  `id` int NOT NULL COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Имя',
  `meropriatie` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Мероприятие',
  `comment` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Комментарии',
  `phone` int NOT NULL COMMENT 'Телефон'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `opros`
--

INSERT INTO `opros` (`id`, `name`, `meropriatie`, `comment`, `phone`) VALUES
(1, '111', '111111111', '1111111111111111', 11111111),
(3, '2', '2', '2', 2),
(4, '2', 'День рождения', 'Круто', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL COMMENT '№',
  `login` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'login',
  `pass` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'password',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'name',
  `user_group` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'user_group'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `pass`, `name`, `user_group`) VALUES
(1, 'admin', '123', 'Максим Петрович', 'admin'),
(3, 'user', '321', 'Ольга Юрьевна', 'user'),
(4, 'user2', '111', 'Сергей Игоревич', 'user'),
(5, 'Oleg', '555', 'Олег Олегович', 'admin'),
(6, 'user23', '999', 'Leo', 'guest'),
(8, 'user555', '111', 'Jon', 'guest'),
(9, 'user4444', '555', 'Leo', 'guest'),
(10, 'user777', '888', 'Ольга', 'guest'),
(11, 'user29898989', '111', 'Leo', 'guest');

-- --------------------------------------------------------

--
-- Структура таблицы `ved`
--

CREATE TABLE `ved` (
  `id` int NOT NULL COMMENT '№',
  `fio` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'ФИО',
  `zp` float DEFAULT NULL COMMENT 'Зарплата'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `ved`
--

INSERT INTO `ved` (`id`, `fio`, `zp`) VALUES
(1, 'Viktor', 1500),
(57, 'Maxim', 12000000),
(59, 'Sergo', 324),
(60, 'Sonia', 8999),
(61, 'Zenon', 7800),
(62, 'Gerero', 300),
(65, 'Sten', 769),
(66, 'Aron', 970),
(72, '222', 250),
(555, 'Leo', 460),
(556, 'del', 250);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `gb`
--
ALTER TABLE `gb`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `opros`
--
ALTER TABLE `opros`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `ved`
--
ALTER TABLE `ved`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `gb`
--
ALTER TABLE `gb`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `opros`
--
ALTER TABLE `opros`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `ved`
--
ALTER TABLE `ved`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=559;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
