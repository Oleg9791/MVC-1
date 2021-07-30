-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 30 2021 г., 19:52
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
-- База данных: `w1020`
--
CREATE DATABASE IF NOT EXISTS `w1020` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `w1020`;

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
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `caption` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Заголовок',
  `text` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Новости',
  `picture` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Имя файла'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `caption`, `text`, `picture`) VALUES
(21, 'Погода', 'жара', '17QN.gif'),
(22, 'Авто', '765654', 'image1.png');

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
  `login` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Логин',
  `pass` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Пароль',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Имя',
  `user_groups_id` int NOT NULL COMMENT 'Группа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `pass`, `name`, `user_groups_id`) VALUES
(5, 'admin', '627226e5d3a54d6c4468b4e07ff9da68', 'Анатолий Николаевич', 1),
(6, 'user2', '627226e5d3a54d6c4468b4e07ff9da68', 'Nina', 3),
(7, 'den', '627226e5d3a54d6c4468b4e07ff9da68', 'Denis', 1),
(8, 'fgh', '627226e5d3a54d6c4468b4e07ff9da68', 'Inna', 1),
(9, 'user111', '627226e5d3a54d6c4468b4e07ff9da68', 'Lena', 1),
(10, 'user333', '627226e5d3a54d6c4468b4e07ff9da68', 'Tina', 1),
(11, 'pav', '627226e5d3a54d6c4468b4e07ff9da68', 'pavel', 1),
(12, 'vova', '2588c10b332e6d8e78b247ce568aa7fd', 'vova', 1),
(13, 'masa1', 'c3f8a32191bb98320685dd1fe9f13cab', 'Masa', 1),
(14, 'val', '3104f81bf40625a490840c4ce7e5c186', 'Valera', 2),
(15, 'nata1', '21d03e086752e371dc8b867d035a69fa', 'Nata', 3),
(16, 'nina123', '627226e5d3a54d6c4468b4e07ff9da68', 'Nina', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Название',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Группа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `user_groups`
--

INSERT INTO `user_groups` (`id`, `name`, `code`) VALUES
(1, 'Администраторы', 'admin'),
(2, 'Пользователи', 'user'),
(3, 'Гости', 'guest');

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
(61, 'Zenona', 78),
(62, 'Gerero', 300),
(65, 'Sten', 769),
(66, 'Aron', 970),
(72, '222', 250),
(555, 'Leo', 460),
(556, 'del', 250),
(559, 'Сидоров', 232);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `gb`
--
ALTER TABLE `gb`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
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
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `fk_users_user_groups_idx` (`user_groups_id`);

--
-- Индексы таблицы `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `opros`
--
ALTER TABLE `opros`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `ved`
--
ALTER TABLE `ved`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=560;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_user_groups` FOREIGN KEY (`user_groups_id`) REFERENCES `user_groups` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
