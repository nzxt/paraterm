-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 12 2019 г., 21:54
-- Версия сервера: 5.7.23
-- Версия PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `paraterm`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_address`
--

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate`
--

CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_activity`
--

CREATE TABLE `oc_affiliate_activity` (
  `affiliate_activity_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_login`
--

CREATE TABLE `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_transaction`
--

CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api`
--

CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'jkMnUtnkLKmdJBHRKLUfwuLxtd3M7q1D0lxIYYX7m1jDjjCP8zAdAN9QgpCPz2HqICa1eoShB1rzifSZaaIZwnDknjtOPXt6C4QRqXhgXBnDIyJpToy2G5HwpMSCJMuCQlSuI9wQ4ULJUaQKrrtOdKsXfvfKiPTDG9spW419Jqhpa6BbeIbeQcxMkZZs7a8a9mI5pgGxcwvjSmfvGthPi58EEfD91YEPCTi6MmgSisAgkCb2Sx9lt9Hid5TlEM2l', 1, '2019-01-09 00:10:37', '2019-01-09 00:10:37');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_ip`
--

CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_session`
--

CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article`
--

CREATE TABLE `oc_article` (
  `article_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_available` date NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `article_review` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `gstatus` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_article`
--

INSERT INTO `oc_article` (`article_id`, `image`, `date_available`, `sort_order`, `article_review`, `status`, `noindex`, `date_added`, `date_modified`, `viewed`, `gstatus`) VALUES
(120, 'catalog/cart.png', '0000-00-00', 1, 1, 1, 1, '2014-04-08 04:26:00', '2015-06-29 09:35:55', 10, 0),
(123, 'catalog/demo/canon_eos_5d_2.jpg', '0000-00-00', 1, 1, 1, 1, '2014-03-31 06:55:15', '2015-06-29 09:03:48', 136, 1),
(124, 'catalog/demo/canon_eos_5d_3.jpg', '0000-00-00', 1, 0, 1, 1, '2015-06-29 09:05:38', '2015-06-29 10:11:50', 2, 0),
(125, 'catalog/demo/canon_eos_5d_2.jpg', '0000-00-00', 1, 0, 1, 1, '2015-06-29 09:09:03', '0000-00-00 00:00:00', 2, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_description`
--

CREATE TABLE `oc_article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `tag` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_article_description`
--

INSERT INTO `oc_article_description` (`article_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `meta_title`, `meta_h1`, `tag`) VALUES
(120, 1, 'CMS для интернет магазинов OPENCART.PRO v2.x', '&lt;p&gt;Рады представить Вашему вниманию OPENCART.PRO v2.x основанную на OPENCART v2.x&lt;/p&gt;\r\n', 'CMS для интернет магазинов OPENCART.PRO v2.x это бесплатный функциональный движок для создания качественных продающих магазинов.', 'cms, opencart, ocshop', 'CMS для интернет магазинов OPENCART.PRO v2.x - Скачать', 'CMS для интернет магазинов OPENCART.PRO v2.x', ''),
(123, 1, 'Обзор Первый', '&lt;p&gt;Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-) Это первый фото обзор тут можно написать много какого то текста который описывает фото обзор и говорит что и как и почему для чего :-)&lt;/p&gt;\r\n', 'Фото Обзор Первый', 'Фото Обзор Первый', 'Фото Обзор Первый', 'Фото Обзор Первый', ''),
(124, 1, 'Важная статья', '&lt;p&gt;Это очень важная статья которую нужно прочитать всем важным людям про важные события важных людей :-)&lt;/p&gt;', '', '', '', '', ''),
(125, 1, 'Первая новость', '&lt;p&gt;Это первая новость всем новостям новость :-)&lt;/p&gt;', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_image`
--

CREATE TABLE `oc_article_image` (
  `article_image_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_related`
--

CREATE TABLE `oc_article_related` (
  `article_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_article_related`
--

INSERT INTO `oc_article_related` (`article_id`, `related_id`) VALUES
(120, 123),
(120, 124),
(123, 120),
(123, 124),
(124, 120),
(124, 123);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_related_mn`
--

CREATE TABLE `oc_article_related_mn` (
  `article_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_related_product`
--

CREATE TABLE `oc_article_related_product` (
  `article_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_article_related_product`
--

INSERT INTO `oc_article_related_product` (`article_id`, `product_id`) VALUES
(30, 123),
(31, 123),
(43, 123),
(45, 123),
(120, 28),
(120, 30),
(120, 41),
(123, 30),
(123, 31),
(123, 43),
(123, 45),
(124, 28),
(124, 30),
(124, 41),
(124, 47);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_related_wb`
--

CREATE TABLE `oc_article_related_wb` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_to_blog_category`
--

CREATE TABLE `oc_article_to_blog_category` (
  `article_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `main_blog_category` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_article_to_blog_category`
--

INSERT INTO `oc_article_to_blog_category` (`article_id`, `blog_category_id`, `main_blog_category`) VALUES
(124, 0, 0),
(123, 70, 1),
(120, 0, 0),
(125, 69, 1),
(120, 69, 0),
(120, 71, 1),
(124, 71, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_to_download`
--

CREATE TABLE `oc_article_to_download` (
  `article_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_to_layout`
--

CREATE TABLE `oc_article_to_layout` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_article_to_layout`
--

INSERT INTO `oc_article_to_layout` (`article_id`, `store_id`, `layout_id`) VALUES
(120, 0, 0),
(123, 0, 0),
(124, 0, 0),
(125, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_to_store`
--

CREATE TABLE `oc_article_to_store` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_article_to_store`
--

INSERT INTO `oc_article_to_store` (`article_id`, `store_id`) VALUES
(120, 0),
(123, 0),
(124, 0),
(125, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute`
--

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(12, 7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_description`
--

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(12, 1, 'Примечание');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group`
--

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group_description`
--

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(7, 1, 'Основные');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner`
--

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner_image`
--

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(79, 7, 1, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(87, 6, 1, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, 1, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, 1, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, 1, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, 1, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, 1, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, 1, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, 1, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, 1, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, 1, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(80, 7, 1, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(97, 8, 1, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, 1, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_benefit`
--

CREATE TABLE `oc_benefit` (
  `benefit_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_benefit`
--

INSERT INTO `oc_benefit` (`benefit_id`, `link`, `status`, `type`, `image`, `name`) VALUES
(39, '/index.php?route=product/product&amp;product_id=40', 1, 0, 'catalog/demo/present/present6.png', 'Подарок наушники'),
(25, '', 1, 1, 'catalog/demo/benefit/wifi.jpg', 'WIFI'),
(38, 'http://ru.wikipedia.org/wiki/Bluetooth', 1, 1, 'catalog/demo/benefit/bluetooth.jpg', 'Bluetooth'),
(42, 'index.php?route=product/product&amp;product_id=40', 1, 0, 'catalog/demo/present/present1.png', 'Телефоны'),
(41, '', 1, 1, 'catalog/demo/benefit/android.png', 'Android');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_benefit_description`
--

CREATE TABLE `oc_benefit_description` (
  `benefit_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_benefit_description`
--

INSERT INTO `oc_benefit_description` (`benefit_id`, `language_id`, `description`) VALUES
(25, 1, '&lt;p&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;Под аббревиатурой Wi-Fi (от английского словосочетания Wireless Fidelity&lt;/span&gt;&lt;sup class=&quot;reference&quot; id=&quot;cite_ref-1&quot; style=&quot;line-height: 1em; unicode-bidi: -webkit-isolate; color: rgb(37, 37, 37); font-family: sans-serif;&quot;&gt;&lt;a href=&quot;https://ru.wikipedia.org/wiki/Wi-Fi#cite_note-1&quot; style=&quot;text-decoration: none; color: rgb(11, 0, 128); background: none;&quot;&gt;[1]&lt;/a&gt;&lt;/sup&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;, которое можно дословно перевести как «беспроводное качество» или «беспроводная точность») в настоящее время развивается целое семейство стандартов передачи цифровых потоков данных по радиоканалам.&lt;/span&gt;&lt;/p&gt;\r\n'),
(25, 2, '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;WIFI&lt;/span&gt;&lt;/p&gt;\r\n'),
(38, 1, '&lt;p&gt;&lt;b style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;Bluetooth&lt;/b&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&amp;nbsp;(от слов&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B3%D0%BB%D0%B8%D0%B9%D1%81%D0%BA%D0%B8%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA&quot; style=&quot;text-decoration: none; color: rgb(11, 0, 128); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot; title=&quot;Английский язык&quot;&gt;англ.&lt;/a&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;i style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&lt;span lang=&quot;en&quot; xml:lang=&quot;en&quot;&gt;blue&lt;/span&gt;&lt;/i&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&amp;nbsp;- синий и&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B3%D0%BB%D0%B8%D0%B9%D1%81%D0%BA%D0%B8%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA&quot; style=&quot;text-decoration: none; color: rgb(11, 0, 128); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot; title=&quot;Английский язык&quot;&gt;англ.&lt;/a&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;i style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&lt;span lang=&quot;en&quot; xml:lang=&quot;en&quot;&gt;tooth&lt;/span&gt;&lt;/i&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&amp;nbsp;- зуб; произносится&amp;nbsp;&lt;/span&gt;&lt;span class=&quot;IPA&quot; style=&quot;font-family: \'Arial Unicode MS\', \'Lucida Sans Unicode\'; color: rgb(37, 37, 37); font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&lt;a href=&quot;https://ru.wikipedia.org/wiki/%D0%9C%D0%B5%D0%B6%D0%B4%D1%83%D0%BD%D0%B0%D1%80%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9_%D1%84%D0%BE%D0%BD%D0%B5%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_%D0%B0%D0%BB%D1%84%D0%B0%D0%B2%D0%B8%D1%82&quot; style=&quot;text-decoration: none; color: rgb(11, 0, 128); background: none;&quot; title=&quot;Международный фонетический алфавит&quot;&gt;/bluːtuːθ/&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;)&lt;/span&gt;&lt;/p&gt;\r\n'),
(38, 2, '&lt;p&gt;&lt;b style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;Bluetooth&lt;/b&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&amp;nbsp;(от слов&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B3%D0%BB%D0%B8%D0%B9%D1%81%D0%BA%D0%B8%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA&quot; style=&quot;text-decoration: none; color: rgb(11, 0, 128); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot; title=&quot;Английский язык&quot;&gt;англ.&lt;/a&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;i style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&lt;span lang=&quot;en&quot; xml:lang=&quot;en&quot;&gt;blue&lt;/span&gt;&lt;/i&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&amp;nbsp;- синий и&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B3%D0%BB%D0%B8%D0%B9%D1%81%D0%BA%D0%B8%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA&quot; style=&quot;text-decoration: none; color: rgb(11, 0, 128); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot; title=&quot;Английский язык&quot;&gt;англ.&lt;/a&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;i style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&lt;span lang=&quot;en&quot; xml:lang=&quot;en&quot;&gt;tooth&lt;/span&gt;&lt;/i&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&amp;nbsp;- зуб; произносится&amp;nbsp;&lt;/span&gt;&lt;span class=&quot;IPA&quot; style=&quot;font-family: \'Arial Unicode MS\', \'Lucida Sans Unicode\'; color: rgb(37, 37, 37); font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&lt;a href=&quot;https://ru.wikipedia.org/wiki/%D0%9C%D0%B5%D0%B6%D0%B4%D1%83%D0%BD%D0%B0%D1%80%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9_%D1%84%D0%BE%D0%BD%D0%B5%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_%D0%B0%D0%BB%D1%84%D0%B0%D0%B2%D0%B8%D1%82&quot; style=&quot;text-decoration: none; color: rgb(11, 0, 128); background: none;&quot; title=&quot;Международный фонетический алфавит&quot;&gt;/bluːtuːθ/&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;)&lt;/span&gt;&lt;/p&gt;\r\n'),
(39, 1, '&lt;p&gt;Подарок наушники&lt;/p&gt;\r\n'),
(39, 2, '&lt;p&gt;Подарок наушники&lt;/p&gt;\r\n'),
(41, 1, ''),
(41, 2, ''),
(42, 1, '&lt;p&gt;Телефоны&lt;/p&gt;\r\n'),
(42, 2, '&lt;p&gt;Телефоны&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category`
--

CREATE TABLE `oc_blog_category` (
  `blog_category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_blog_category`
--

INSERT INTO `oc_blog_category` (`blog_category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `noindex`, `date_added`, `date_modified`) VALUES
(69, 'catalog/demo/canon_eos_5d_2.jpg', 0, 1, 0, 0, 1, 1, '2014-04-08 03:56:26', '2015-06-18 09:15:42'),
(70, 'catalog/demo/iphone_2.jpg', 0, 1, 0, 0, 1, 1, '2014-04-08 03:58:55', '2015-06-18 09:16:41'),
(71, 'catalog/demo/canon_eos_5d_1.jpg', 69, 1, 1, 0, 1, 1, '2015-06-18 09:13:57', '2015-06-18 09:15:58');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_description`
--

CREATE TABLE `oc_blog_category_description` (
  `blog_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_blog_category_description`
--

INSERT INTO `oc_blog_category_description` (`blog_category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `meta_title`, `meta_h1`) VALUES
(70, 1, 'Обзоры', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(69, 1, 'Новости', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(71, 1, 'Анонсы', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_path`
--

CREATE TABLE `oc_blog_category_path` (
  `blog_category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_blog_category_path`
--

INSERT INTO `oc_blog_category_path` (`blog_category_id`, `path_id`, `level`) VALUES
(69, 69, 0),
(71, 71, 1),
(71, 69, 0),
(70, 70, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_to_layout`
--

CREATE TABLE `oc_blog_category_to_layout` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_blog_category_to_layout`
--

INSERT INTO `oc_blog_category_to_layout` (`blog_category_id`, `store_id`, `layout_id`) VALUES
(69, 0, 0),
(71, 0, 0),
(70, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_to_store`
--

CREATE TABLE `oc_blog_category_to_store` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_blog_category_to_store`
--

INSERT INTO `oc_blog_category_to_store` (`blog_category_id`, `store_id`) VALUES
(69, 0),
(70, 0),
(71, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_cart`
--

CREATE TABLE `oc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category`
--

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `noindex`, `date_added`, `date_modified`) VALUES
(1, 'catalog/category/termopara.net-01.jpg', 0, 0, 1, 10, 1, 1, '2013-09-17 11:57:01', '2015-09-16 12:33:42'),
(2, 'catalog/category/termopara.net-02.jpg', 0, 0, 1, 20, 1, 1, '2013-09-17 10:51:42', '2015-09-16 13:27:25'),
(3, 'catalog/category/termopara.net-03.jpg', 0, 0, 1, 30, 1, 1, '2013-09-19 14:42:38', '2015-09-17 09:39:45'),
(4, 'catalog/category/termopara.net-04.jpg', 0, 0, 1, 40, 1, 1, '2009-01-05 21:49:15', '2015-09-16 12:34:05'),
(5, 'catalog/category/termopara.net-06.jpg', 0, 0, 1, 60, 1, 1, '2009-01-05 21:49:43', '2015-09-16 12:34:30'),
(6, 'catalog/category/termopara.net-05.jpg', 0, 0, 1, 50, 1, 1, '2015-06-23 00:58:27', '2015-09-16 12:34:19'),
(7, '', 0, 0, 1, 100, 0, 1, '2015-09-16 13:32:33', '2015-09-16 13:36:19'),
(8, '', 0, 0, 1, 100, 0, 1, '2015-09-16 13:43:36', '2015-09-16 13:43:36'),
(9, '', 0, 0, 1, 100, 0, 1, '2015-09-16 13:44:06', '2015-09-16 13:44:06');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_description`
--

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `description_bottom` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `description_bottom`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(1, 1, 'Термопары для котлов', '&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; При ремонте газового котла часто возникает необходимость в замене термопары. Термопара представляет собой устройство контроля пламени, которое управляет электромагнитным клапаном подачи газа на горелку. Без нее нормальная работа газового котла невозможна.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; В нашем интернет-магазине представлен большой ассортимент термопар для любых видов автоматик, применяемых в различных моделях газовых котлов, например таких как АТОН, Вулкан, Колви, Маяк, РОСС, Житомир, Гелиос, Термо-бар, Проскуров, Атем, Данко, Термо, Дани, Termoteka Hotherm, Велгас, Старобельск, Ростов и др.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Цены у нас всегда доступны. Купить термопару для газового котла очень просто &amp;ndash; оформляйте заказ на сайте или звоните нам по телефону. Вашу покупку доставим в любой город Украины.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n', '', 'Термопары для котлов', 'Купить термопары для газовых котлов и конвекторов по цене производителя. Доставка по Украине. Гарантия качества. Специальное предложение оптовикам.', 'термопара, газовый котел, газовый конвектор, газовая автоматика, газовый клапан, пилотная горелка', ''),
(2, 1, 'Термопары для колонок', '&lt;span style=&quot;font-size:14px&quot;&gt;Сейчас имеются в наличии термопары для газовых колонок таких торговых марок как:&lt;br /&gt;\n&lt;strong&gt;Beretta&lt;/strong&gt; (Беретта), &lt;strong&gt;Demrad&lt;/strong&gt; (Демрад), &lt;strong&gt;Junkers&lt;/strong&gt; (Юнкерс), &lt;strong&gt;Bosh&lt;/strong&gt; (Бош), &lt;strong&gt;Termet&lt;/strong&gt; (Термет), &lt;strong&gt;Vaillant&lt;/strong&gt; (Вайлант)&lt;br /&gt;\n&lt;br /&gt;\nНе нашли термопару для вашей модели? Позвоните нам, и мы поможем подобрать или изготовим в короткий срок.&lt;/span&gt;&lt;br /&gt;\n&amp;nbsp;', '', 'Термопары для колонок', 'Купить термопары для газовых колонок по цене производителя. Доставка по Украине. Гарантия качества. Специальное предложение оптовикам.', 'термопара, газовая колонка, бойлер, водогрейка', ''),
(3, 1, 'Термопары для газовых плит', '&lt;span style=&quot;font-size:14px&quot;&gt;В нашем магазине вы можете подобрать термопару для газовых плит и духовок таких производителей как:&lt;br /&gt;\n&lt;strong&gt;Ariston &lt;/strong&gt;(Аристон), &lt;strong&gt;Indesit &lt;/strong&gt;(Индезит), &lt;strong&gt;Bosh &lt;/strong&gt;(Бош), &lt;strong&gt;Eleсtrolux &lt;/strong&gt;(Электролюкс), &lt;strong&gt;Gorenje &lt;/strong&gt;(Горенье), &lt;strong&gt;Ardo &lt;/strong&gt;(Ардо), &lt;strong&gt;Zanussi &lt;/strong&gt;(Занусси), &lt;strong&gt;Gefest &lt;/strong&gt;(Гефест), &lt;strong&gt;Beko &lt;/strong&gt;(Беко), &lt;strong&gt;Orion &lt;/strong&gt;(Орион)&lt;br /&gt;\n&lt;br /&gt;\nНе нашли термопару для вашей духовки? Позвоните нам - мы поможем подобрать или изготовим в короткий срок.&lt;/span&gt;', '', 'Термопары для газовых плит', 'Купить термопары для газовых плит, духовок, варочных поверхностей по цене производителя. Доставка по Украине. Гарантия качества. Специальное предложение оптовикам.', 'термопара, газовая плита, духовка, варочная поверхность, варочная панель, конфорка, газконтроль', ''),
(4, 1, 'Газоподводные трубки', '&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; При ремонте газового котла часто возникает необходимость в замене термопары. Термопара представляет собой устройство контроля пламени, которое управляет электромагнитным клапаном подачи газа на горелку. Без нее нормальная работа газового котла невозможна.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; В нашем интернет-магазине представлен большой ассортимент термопар для любых видов автоматик, применяемых в различных моделях газовых котлов, например таких как Атон, Колви, Маяк, Росс, Термобар, Проскурив, Атем, Данко и др.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Цены у нас всегда доступны. Купить термопару для газового котла очень просто &amp;ndash; оформляйте заказ на сайте или звоните нам по телефону. Вашу покупку доставим в любой город Украины.&lt;/p&gt;\n', '', 'Газопроводные трубки', 'Купить трубки для подачи газа по цене производителя. Доставка по Украине. Гарантия качества. Специальное предложение оптовикам.', 'медная трубка, трубка запальника, импульсная трубка, трубка подачи газа, запальная горелка, пилотная горелка', ''),
(5, 1, 'Другие запчасти', '&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Качественные запчасти для газового отопления обеспечивают длительную бесперебойную работу котлов, конвекторов, колонок и газовых плит в вашем доме, квартире или на производстве.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; В нашем Интернет-магазине вы сможете подобрать необходимые вам запчасти по самой выгодной стоимости.&lt;/p&gt;\n\n&lt;p&gt;Цены у нас всегда доступны. Купить нужную запчасть очень просто &amp;ndash; оформляйте заказ на сайте или звоните нам по телефону. Вашу покупку доставим в любой город Украины.&lt;/p&gt;\n', '', 'Другие запчасти', 'Купить запчасти для газовых котлов, конвекторов, колонок и плит по цене производителя. Доставка по Украине. Гарантия качества. Специальное предложение оптовикам.', 'клапан, мембрана, стакан, терморегулятор, биметаллическая пластина, датчик', ''),
(6, 1, 'Крепежные комплектующие', '', '', 'Крепёжные запчасти', 'Купить крепежные комплектующие для газового оборудования по цене производителя. Доставка по Украине. Гарантия качества. Специальное предложение оптовикам.', 'гайки, втулки, ниппели, инжекторы, форсунки, сопла, двоякое крепление, заглушки', ''),
(7, 1, 'Для котлов', '', '', 'Запчасти для котлов', '', '', ''),
(8, 1, 'Для колонок', '', '', 'Запчасти для колонок', '', '', ''),
(9, 1, 'Для газплит', '', '', 'Запчасти для газовых плит', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_filter`
--

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_path`
--

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 4, 0),
(5, 5, 0),
(6, 6, 0),
(7, 7, 0),
(8, 8, 0),
(9, 9, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_layout`
--

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_store`
--

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_country`
--

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Армения', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Азербайджан', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Белоруссия (Беларусь)', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Грузия', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Казахстан', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Киргизия (Кыргызстан)', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Молдова', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Российская Федерация', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Таджикистан', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Туркменистан', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Украина', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Узбекистан', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon`
--

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_category`
--

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_history`
--

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_product`
--

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_currency`
--

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4, 'Гривна', 'UAH', '', 'грн.', '2', 1.00000000, 1, '2019-01-09 01:36:38');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer`
--

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_activity`
--

CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group`
--

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group_description`
--

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_history`
--

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_ip`
--

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_login`
--

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'jas0n', '127.0.0.1', 1, '2019-01-12 07:13:32', '2019-01-12 07:13:32');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_online`
--

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_online`
--

INSERT INTO `oc_customer_online` (`ip`, `customer_id`, `url`, `referer`, `date_added`) VALUES
('127.0.0.1', 0, 'http://termopara.net/signup/', 'http://termopara.net/signin/', '2019-01-12 21:49:55');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_reward`
--

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_search`
--

CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_transaction`
--

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_wishlist`
--

CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custommenu`
--

CREATE TABLE `oc_custommenu` (
  `custommenu_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `columns` int(3) NOT NULL,
  `custommenu_type` varchar(20) NOT NULL,
  `status` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_custommenu`
--

INSERT INTO `oc_custommenu` (`custommenu_id`, `sort_order`, `columns`, `custommenu_type`, `status`) VALUES
(71, 5, 1, 'category', 1),
(70, 4, 1, 'category', 1),
(69, 7, 1, 'custom', 1),
(9, 1, 1, 'product', 1),
(66, 3, 1, 'category', 1),
(17, 1, 1, 'manufacturer', 1),
(65, 2, 1, 'category', 1),
(64, 1, 1, 'category', 1),
(35, 1, 1, 'manufacturer', 1),
(36, 1, 1, 'manufacturer', 1),
(37, 1, 1, 'manufacturer', 1),
(38, 1, 1, 'manufacturer', 1),
(39, 1, 1, 'manufacturer', 1),
(41, 1, 1, 'custom', 1),
(44, 1, 1, 'custom', 1),
(49, 1, 1, 'custom', 1),
(51, 1, 1, 'custom', 1),
(68, 6, 1, 'custom', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custommenu_child`
--

CREATE TABLE `oc_custommenu_child` (
  `custommenu_child_id` int(11) NOT NULL,
  `custommenu_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `custommenu_type` varchar(20) NOT NULL,
  `status` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_custommenu_child`
--

INSERT INTO `oc_custommenu_child` (`custommenu_child_id`, `custommenu_id`, `sort_order`, `custommenu_type`, `status`) VALUES
(99, 14, 2, 'information', 1),
(98, 14, 1, '', 1),
(97, 14, 1, '', 1),
(96, 14, 1, '', 1),
(95, 31, 1, '', 1),
(94, 31, 1, '', 1),
(93, 30, 1, '', 1),
(92, 53, 1, '', 1),
(91, 53, 1, '', 1),
(90, 53, 1, '', 1),
(89, 53, 1, '', 1),
(88, 53, 1, '', 1),
(87, 53, 1, 'custom', 1),
(86, 14, 1, '', 1),
(85, 14, 1, '', 1),
(84, 14, 1, '', 1),
(83, 14, 1, '', 1),
(80, 14, 1, '', 1),
(81, 14, 1, '', 1),
(82, 14, 1, '', 1),
(102, 14, 1, '', 1),
(101, 31, 1, '', 1),
(79, 14, 1, '', 1),
(105, 14, 1, '', 1),
(104, 31, 3, '', 1),
(100, 14, 1, '', 1),
(47, 14, 2, 'product', 1),
(78, 14, 1, 'custom', 1),
(57, 53, 2, 'manufacturer', 1),
(58, 53, 3, 'manufacturer', 1),
(60, 53, 4, 'manufacturer', 1),
(63, 53, 5, 'manufacturer', 1),
(67, 53, 6, 'manufacturer', 1),
(103, 14, 2, 'custom', 1),
(106, 14, 2, '', 1),
(107, 31, 3, '', 1),
(108, 14, 1, '', 1),
(109, 14, 2, '', 1),
(110, 14, 3, '', 1),
(111, 14, 1, '', 1),
(112, 14, 2, '', 1),
(113, 14, 3, '', 1),
(114, 14, 1, '', 1),
(115, 14, 2, '', 1),
(116, 14, 3, '', 1),
(117, 14, 1, '', 1),
(118, 14, 2, '', 1),
(119, 14, 3, '', 1),
(120, 14, 1, '', 1),
(121, 14, 2, '', 1),
(122, 14, 3, '', 1),
(123, 14, 1, '', 1),
(124, 14, 2, '', 1),
(125, 14, 3, '', 1),
(126, 14, 1, '', 1),
(127, 14, 2, '', 1),
(128, 14, 3, '', 1),
(129, 14, 1, '', 1),
(130, 14, 2, '', 1),
(131, 14, 3, '', 1),
(132, 14, 1, '', 1),
(133, 14, 2, '', 1),
(134, 14, 3, '', 1),
(135, 14, 1, '', 1),
(136, 14, 2, '', 1),
(137, 14, 3, '', 1),
(138, 14, 1, '', 1),
(139, 14, 2, '', 1),
(140, 14, 3, '', 1),
(141, 14, 1, '', 1),
(142, 14, 2, '', 1),
(143, 14, 3, '', 1),
(144, 14, 1, '', 1),
(145, 14, 2, '', 1),
(146, 14, 3, '', 1),
(147, 14, 1, '', 1),
(148, 14, 2, '', 1),
(149, 14, 3, '', 1),
(150, 14, 1, '', 1),
(151, 14, 2, '', 1),
(152, 14, 3, '', 1),
(153, 14, 1, '', 1),
(154, 14, 2, '', 1),
(155, 14, 1, '', 1),
(156, 31, 1, '', 1),
(157, 53, 1, '', 1),
(158, 31, 1, '', 1),
(159, 53, 1, '', 1),
(160, 31, 1, '', 1),
(161, 31, 1, '', 1),
(162, 53, 1, '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custommenu_child_description`
--

CREATE TABLE `oc_custommenu_child_description` (
  `custommenu_child_id` int(11) NOT NULL,
  `custommenu_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL DEFAULT '',
  `language_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_custommenu_child_description`
--

INSERT INTO `oc_custommenu_child_description` (`custommenu_child_id`, `custommenu_id`, `name`, `link`, `language_id`) VALUES
(157, 53, 'Акции', 'product/specials', 1),
(113, 14, 'О нас', '4', 1),
(112, 14, 'Контакты', 'contacts', 1),
(111, 14, 'Производители', 'brands', 1),
(103, 14, 'Контакты', 'information/contact', 1),
(99, 14, 'О нас', '4', 1),
(98, 14, 'Производители', 'product/brands', 1),
(87, 53, 'Акции', 'product/special', 1),
(47, 14, 'Canon EOS 5D', '30', 1),
(53, 0, 'Телефоны и PDA', '24', 1),
(78, 14, 'Производители', 'product/manufacturer', 1),
(57, 53, 'Canon', '9', 1),
(58, 53, 'Hewlett-Packard', '7', 1),
(60, 53, 'HTC', '5', 1),
(63, 53, 'Palm', '6', 1),
(67, 53, 'Sony', '10', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custommenu_child_to_store`
--

CREATE TABLE `oc_custommenu_child_to_store` (
  `custommenu_child_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_custommenu_child_to_store`
--

INSERT INTO `oc_custommenu_child_to_store` (`custommenu_child_id`, `store_id`) VALUES
(2, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(29, 0),
(32, 0),
(33, 0),
(37, 0),
(42, 0),
(45, 0),
(47, 0),
(57, 0),
(58, 0),
(60, 0),
(63, 0),
(67, 0),
(77, 0),
(78, 0),
(87, 0),
(99, 0),
(103, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custommenu_description`
--

CREATE TABLE `oc_custommenu_description` (
  `custommenu_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL DEFAULT '',
  `language_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_custommenu_description`
--

INSERT INTO `oc_custommenu_description` (`custommenu_id`, `name`, `link`, `language_id`) VALUES
(70, 'Газоподводные трубки', '4', 1),
(69, 'Контакты', '/contacts', 1),
(68, 'О нас', '/paraterm', 1),
(14, 'Акции', 'product/specials', 1),
(26, 'PC', '', 1),
(64, 'Термопары для котлов', '1', 1),
(37, 'Apple', '8', 0),
(38, 'Apple', '8', 0),
(65, 'Термопары для колонок', '2', 1),
(66, 'Термопары для газовых плит', '3', 1),
(71, 'Другие запчасти', '5', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custommenu_to_store`
--

CREATE TABLE `oc_custommenu_to_store` (
  `custommenu_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_custommenu_to_store`
--

INSERT INTO `oc_custommenu_to_store` (`custommenu_id`, `store_id`) VALUES
(9, 0),
(17, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(41, 0),
(44, 0),
(49, 0),
(51, 0),
(64, 0),
(65, 0),
(66, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field`
--

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_customer_group`
--

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_description`
--

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value`
--

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value_description`
--

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download`
--

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download_description`
--

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_event`
--

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES
(1, 'voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension`
--

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'theme_default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'module', 'product_tab'),
(30, 'module', 'blog_category'),
(31, 'module', 'blog_latest'),
(32, 'module', 'blog_featured'),
(33, 'module', 'blog_popular'),
(34, 'module', 'imgcategory'),
(35, 'module', 'manufacturer'),
(36, 'module', 'popular'),
(37, 'module', 'cachemanager');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter`
--

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_description`
--

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group`
--

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group_description`
--

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_geo_zone`
--

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information`
--

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `noindex` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`, `noindex`) VALUES
(3, 1, 3, 1, 1),
(4, 1, 1, 1, 1),
(5, 1, 4, 1, 1),
(6, 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_description`
--

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', '', ''),
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_layout`
--

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_store`
--

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_language`
--

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'Russian', 'ru-ru', 'ru_RU.UTF-8,ru_RU,russian', '', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout`
--

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Главная'),
(2, 'Товар'),
(3, 'Категория'),
(4, 'По-умолчанию'),
(5, 'Список Производителей'),
(6, 'Аккаунт'),
(7, 'Оформление заказа'),
(8, 'Контакты'),
(9, 'Карта сайта'),
(10, 'Партнерская программа'),
(11, 'Информация'),
(12, 'Сравнение'),
(13, 'Поиск'),
(14, 'Блог'),
(15, 'Категории Блога'),
(16, 'Статьи Блога'),
(17, 'Страница Производителя');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_module`
--

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(103, 17, 'manufacturer', 'column_left', 0),
(69, 10, 'affiliate', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(186, 15, 'blog_popular.35', 'content_bottom', 0),
(119, 1, 'product_tab.32', 'content_top', 2),
(78, 14, 'blog_category', 'column_left', 0),
(84, 16, 'blog_popular.35', 'content_bottom', 0),
(185, 15, 'account', 'column_left', 2),
(89, 14, 'blog_popular.35', 'content_bottom', 0),
(184, 15, 'blog_latest.33', 'column_left', 1),
(94, 14, 'blog_featured.34', 'column_left', 1),
(104, 17, 'category', 'column_left', 1),
(105, 17, 'banner.30', 'column_left', 2),
(188, 3, 'popular.37', 'content_bottom', 0),
(118, 1, 'imgcategory.38', 'content_top', 1),
(117, 1, 'slideshow.27', 'content_top', 0),
(120, 1, 'carousel.29', 'content_top', 3),
(187, 3, 'category', 'column_left', 0),
(183, 15, 'category', 'column_left', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_route`
--

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(83, 3, 0, 'product/category'),
(64, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(57, 14, 0, 'blog/latest'),
(82, 15, 0, 'blog/category'),
(56, 16, 0, 'blog/article'),
(63, 17, 0, 'product/manufacturer/info');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class`
--

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class_description`
--

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Сантиметр', 'см'),
(2, 1, 'Миллиметр', 'мм'),
(3, 1, 'Дюйм', 'in');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_location`
--

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer`
--

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `noindex`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 1, 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 1, 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 1, 0),
(8, 'ParaTerm', 'catalog/paraterm-logo-v.png', 1, 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 1, 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_description`
--

CREATE TABLE `oc_manufacturer_description` (
  `manufacturer_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `description_bottom` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer_description`
--

INSERT INTO `oc_manufacturer_description` (`manufacturer_id`, `language_id`, `description`, `description_bottom`, `meta_description`, `meta_keyword`, `meta_title`, `meta_h1`) VALUES
(8, 1, '&lt;p&gt;Украинский производитель термопар и других комплектующихдля котлов и газовых плит.&lt;br&gt;&lt;/p&gt;', '', 'Производитель термопар для котлов и газовых плит.', 'термопара, termopara, паратерм, paraterm', 'paraterm', 'paraterm'),
(9, 1, '', '', '', '', '', ''),
(9, 2, '', '', '', '', '', ''),
(7, 1, '', '', '', '', '', ''),
(7, 2, '', '', '', '', '', ''),
(5, 1, '', '', '', '', '', ''),
(5, 2, '', '', '', '', '', ''),
(6, 1, '', '', '', '', '', ''),
(6, 2, '', '', '', '', '', ''),
(10, 1, '', '', '', '', '', ''),
(10, 2, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_to_layout`
--

CREATE TABLE `oc_manufacturer_to_layout` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer_to_layout`
--

INSERT INTO `oc_manufacturer_to_layout` (`manufacturer_id`, `store_id`, `layout_id`) VALUES
(8, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_to_store`
--

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_marketing`
--

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_menu`
--

CREATE TABLE `oc_menu` (
  `menu_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `type` varchar(6) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_menu_description`
--

CREATE TABLE `oc_menu_description` (
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_menu_module`
--

CREATE TABLE `oc_menu_module` (
  `menu_module_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_modification`
--

CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`, `date_modified`) VALUES
(1, '|Quickfix by iSenseLabs', 'isenselabs_quickfix', 'iSenseLabs', '1.4', 'http://isenselabs.com', '<modification>\r\n    <name>|Quickfix by iSenseLabs</name>\r\n	<version>1.4</version>\r\n	<link>http://isenselabs.com</link>\r\n	<author>iSenseLabs</author>\r\n	<code>isenselabs_quickfix</code>\r\n\r\n	<file path=\"admin/controller/extension/installer.php\">\r\n		<operation error=\"skip\">\r\n			<search ><![CDATA[\'extension/installer/ftp\']]></search>\r\n			<add position=\"replace\"><![CDATA[\'extension/installer/localcopy\']]></add>\r\n		</operation>\r\n\r\n		<operation error=\"skip\">\r\n			<search ><![CDATA[\'url\'  => str_replace(\'&amp;\', \'&\', $this->url->link(\'extension/installer/\'. $this->rewrite_step(\'ftp\', \'localremove\'), \'token=\' . $this->session->data[\'token\'],]]></search>\r\n			<add position=\"replace\"><![CDATA[\'url\'  => str_replace(\'&amp;\', \'&\', $this->url->link(\'extension/installer/localcopy\', \'token=\' . $this->session->data[\'token\'],]]></add>\r\n		</operation>\r\n\r\n		<operation error=\"skip\">\r\n			<search ><![CDATA[\'url\'  => str_replace(\'&amp;\', \'&\', $this->url->link(\'extension/installer/\'. $this->rewrite_step(\'localcopy\', \'localremove\'), \'token=\' . $this->session->data[\'token\'],]]></search>\r\n			<add position=\"replace\"><![CDATA[\'url\'  => str_replace(\'&amp;\', \'&\', $this->url->link(\'extension/installer/localcopy\', \'token=\' . $this->session->data[\'token\'],]]></add>\r\n		</operation>\r\n\r\n		<operation>\r\n			<search><![CDATA[public function unzip() {]]></search>\r\n			<add position=\"before\"><![CDATA[			\r\n	public function localcopy() {\r\n		$this->load->language(\'extension/installer\');\r\n\r\n		$json = array();\r\n\r\n		if (!$this->user->hasPermission(\'modify\', \'extension/installer\')) {\r\n			$json[\'error\'] = $this->language->get(\'error_permission\');\r\n		}\r\n\r\n		if (VERSION == \'2.0.0.0\') {\r\n		    $directory = DIR_DOWNLOAD  . str_replace(array(\'../\', \'..\\\\\', \'..\'), \'\', $this->request->post[\'path\']) . \'/upload/\';\r\n		} else {\r\n		    $directory = DIR_UPLOAD  . str_replace(array(\'../\', \'..\\\\\', \'..\'), \'\', $this->request->post[\'path\']) . \'/upload/\';\r\n		}\r\n\r\n		if (!is_dir($directory)) {\r\n			$json[\'error\'] = $this->language->get(\'error_directory\');\r\n		}\r\n\r\n		if (!$json) {\r\n			// Get a list of files ready to upload\r\n			$files = array();\r\n\r\n			$path = array($directory . \'*\');\r\n\r\n			while (count($path) != 0) {\r\n				$next = array_shift($path);\r\n\r\n				foreach (glob($next) as $file) {\r\n					if (is_dir($file)) {\r\n						$path[] = $file . \'/*\';\r\n					}\r\n\r\n					$files[] = $file;\r\n				}\r\n			}\r\n\r\n			$root = dirname(DIR_APPLICATION).\'/\';\r\n\r\n			foreach ($files as $file) {\r\n				// Upload everything in the upload directory\r\n				$destination = substr($file, strlen($directory));\r\n\r\n				// Update from newer OpenCart versions:\r\n				if (substr($destination, 0, 5) == \'admin\') {\r\n					$destination = DIR_APPLICATION . substr($destination, 5);\r\n				} else if (substr($destination, 0, 7) == \'catalog\') {\r\n					$destination = DIR_CATALOG . substr($destination, 7);\r\n				} else if (substr($destination, 0, 5) == \'image\') {\r\n					$destination = DIR_IMAGE . substr($destination, 5);\r\n				} else if (substr($destination, 0, 6) == \'system\') {\r\n					$destination = DIR_SYSTEM . substr($destination, 6);\r\n				} else {\r\n					$destination = $root.$destination;\r\n				}\r\n\r\n				if (is_dir($file)) {\r\n					if (!file_exists($destination)) {\r\n						if (!mkdir($destination)) {\r\n							$json[\'error\'] = sprintf($this->language->get(\'error_ftp_directory\'), $destination);\r\n						}\r\n					}\r\n				}\r\n\r\n				if (is_file($file)) {\r\n					if (!copy($file, $destination)) {\r\n						$json[\'error\'] = sprintf($this->language->get(\'error_ftp_file\'), $file);\r\n					}\r\n				}\r\n			}\r\n		}\r\n\r\n		$this->response->addHeader(\'Content-Type: application/json\');\r\n		$this->response->setOutput(json_encode($json));\r\n	}]]></add>\r\n		</operation>\r\n	</file>	\r\n</modification>\r\n', 1, '2019-01-09 18:48:18', '2019-01-09 18:48:18'),
(3, 'Modification Manager', 'modification_manager', 'OpenCart-Templates', '2.8.1', 'http://www.opencart-templates.co.uk/modification-manager', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n  <name>Modification Manager</name>\n  <code>modification_manager</code>\n  <version>2.8.1</version>\n  <author>OpenCart-Templates</author>\n  <link>http://www.opencart-templates.co.uk/modification-manager</link>\n\n  <file path=\"admin/language/en-gb/extension/modification.php\">\n	<operation>\n      <search><![CDATA[<?php]]></search> \n      <add position=\"after\"><![CDATA[\n$_[\'tab_error\'] = \'Error\';\n$_[\'tab_files\'] = \'Files\';\n\n$_[\'text_add\'] = \'Add Modification\';\n$_[\'text_edit\'] = \'Edit Modification: %s\';\n\n$_[\'text_enabled\'] = \'Enabled\';\n$_[\'text_disabled\'] = \'Disabled\';\n\n$_[\'entry_author\'] = \'Author\';\n$_[\'entry_name\'] = \'Name\';\n$_[\'entry_xml\'] = \'XML\';\n\n$_[\'button_filter\'] = \'Filter\';\n$_[\'button_reset\'] = \'Reset\';\n\n$_[\'column_date_modified\'] = \'Last Modified\';\n\n$_[\'error_warning\'] = \'There has been an error. Please check your data and try again\';\n$_[\'error_required\'] = \'This field is required\';\n$_[\'error_name\'] = \'Missing name tag\';\n$_[\'error_code\'] = \'Missing code tag\';\n$_[\'error_exists\'] = \'Modification \\\'%s\\\' is already using the same code: %s!\';]]></add>\n    </operation>\n  </file>\n\n  <file path=\"admin/controller/extension/installer.php\">\n	<operation>\n      <search index=\"0\"><![CDATA[$json[\'error\'] = sprintf($this->language->get(\'error_exists\'), $modification_info[\'name\']);]]></search>\n      <add position=\"replace\"><![CDATA[$this->model_extension_modification->deleteModification($modification_info[\'modification_id\']);]]></add>\n    </operation>\n  </file>\n</modification>', 1, '2019-01-09 19:19:11', '2019-01-09 19:19:11'),
(4, 'Export/Import Tool (V3.20) for OpenCart 2.x', 'Export/Import Tool (V3.20) for OpenCart 2.x', 'mhccorp.com', '2.x-3.20', 'https://www.mhccorp.com', '<modification>\n	<name>Export/Import Tool (V3.20) for OpenCart 2.x</name>\n	<code>Export/Import Tool (V3.20) for OpenCart 2.x</code>\n	<version>2.x-3.20</version>\n	<author>mhccorp.com</author>\n	<link>https://www.mhccorp.com</link>\n	<file path=\"admin/controller/common/menu.php\">\n		<operation error=\"skip\">\n			<search><![CDATA[$data[\'text_backup\'] = $this->language->get(\'text_backup\');]]></search>\n			<add position=\"after\"><![CDATA[\n		$data[\'text_export_import\'] = $this->language->get(\'text_export_import\');\n			]]></add>\n		</operation>\n		<operation error=\"skip\">\n			<search><![CDATA[$data[\'backup\'] = $this->url->link(\'tool/backup\', \'token=\' . $this->session->data[\'token\'],]]></search>\n			<add position=\"after\"><![CDATA[\n		$data[\'export_import\'] = $this->url->link(\'tool/export_import\', \'token=\' . $this->session->data[\'token\'], (version_compare(PHP_VERSION, \'2.2.0.0\') >= 0) ? true : \'SSL\');\n			]]></add>\n		</operation>\n	</file>\n	<file path=\"admin/language/*/common/menu.php\">\n		<operation error=\"skip\">\n			<search><![CDATA[$_[\'text_backup\']]]></search>\n			<add position=\"after\"><![CDATA[\n$_[\'text_export_import\']               = \'Export / Import\';\n			]]></add>\n		</operation>\n	</file>\n	<file path=\"admin/view/template/common/menu.tpl\">\n		<operation error=\"skip\">\n			<search><![CDATA[<li><a href=\"<?php echo $backup; ?>\"><?php echo $text_backup; ?></a></li>]]></search>\n			<add position=\"replace\"><![CDATA[<li><a href=\"<?php echo $backup; ?>\"><?php echo $text_backup; ?></a></li><li><a href=\"<?php echo $export_import; ?>\"><?php echo $text_export_import; ?></a></li>]]></add>\n		</operation>\n	</file>\n	<file path=\"admin/controller/common/column_left.php\">\n		<operation error=\"skip\">\n			<search><![CDATA[if ($this->user->hasPermission(\'access\', \'tool/log\')) {]]></search>\n			<add position=\"before\"><![CDATA[\n			if ($this->user->hasPermission(\'access\', \'tool/export_import\')) {\n				$tool[] = array(\n					\'name\'	   => $this->language->get(\'text_export_import\'),\n					\'href\'     => $this->url->link(\'tool/export_import\', \'token=\' . $this->session->data[\'token\'], true),\n					\'children\' => array()		\n				);\n			}\n			]]></add>\n		</operation>\n	</file>\n	<file path=\"admin/language/*/common/column_left.php\">\n		<operation error=\"skip\">\n			<search><![CDATA[$_[\'text_backup\']]]></search>\n			<add position=\"after\"><![CDATA[\n$_[\'text_export_import\']             = \'Export / Import\';\n			]]></add>\n		</operation>\n	</file>\n</modification>\n', 1, '2019-01-10 20:04:14', '2019-01-11 23:15:33'),
(5, 'Apply Button', 'apply_button', 'The Krotek', '3.0.1', 'https://thekrotek.com', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n	<name><![CDATA[Apply Button]]></name>\r\n	<code>apply_button</code>\r\n	<version><![CDATA[3.0.1]]></version>\r\n	<author><![CDATA[The Krotek]]></author>\r\n	<link>https://thekrotek.com</link>\r\n	\r\n	<!-- Admin: Setting -->\r\n\r\n	<file path=\"admin/model/setting/setting.php\">\r\n		<operation>\r\n			<search><![CDATA[extends Model {]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n\r\n			public function getLastInsertID($code)\r\n			{\r\n				$query = $this->db->query(\"SHOW TABLES LIKE \'\".DB_PREFIX.$code.\"\'\");\r\n			\r\n				if ($query->num_rows) {\r\n					$query = $this->db->query(\"SELECT \".$code.\"_id AS id FROM `\".DB_PREFIX.$code.\"` ORDER BY \".$code.\"_id DESC LIMIT 1\");\r\n					$id = $query->row[\'id\'];\r\n				} else {\r\n					$id = 0;\r\n				}\r\n				\r\n				return $id;\r\n			}\r\n			\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n			\r\n	<!-- Admin: Controllers -->\r\n	<!-- \r\n		<file path=\"admin/controller/catalog/*.php|admin/controller/customer/*.php|admin/controller/design/*.php|admin/controller/localisation/*.php|admin/controller/marketing/*.php|admin/controller/sale/*.php|admin/controller/user/*.php|admin/controller/setting/*.php\">\r\n	-->\r\n	<file path=\"admin/controller/catalog/*.php|admin/controller/customer/*.php|admin/controller/design/*.php|admin/controller/localisation/*.php|admin/controller/sale/*.php|admin/controller/user/*.php|admin/controller/setting/*.php\">\r\n		<operation error=\"skip\">\r\n			<search><![CDATA[$this->response->redirect($this->url->link(]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n\r\n			if (!isset($this->request->post[\'selected\']) && isset($this->request->get[\'route\']) && isset($this->request->post[\'apply\'])) {\r\n				$get = explode(\"/\", $this->request->get[\'route\']);\r\n				$folder = $get[0];\r\n				$file = $get[1];\r\n				\r\n				if ($file == \'user_permission\') $table = \'user_group\';\r\n				else $table = $file;\r\n\r\n				$this->load->model(\'setting/setting\');\r\n				$last_id = $this->model_setting_setting->getLastInsertID($table);\r\n\r\n				if ($file == \'setting\') {\r\n					$route = \'setting/store\';\r\n					$editroute = \'setting/setting\';\r\n				} else {\r\n					$route = $folder.\'/\'.$file;\r\n					$editroute = $folder.\'/\'.$file.\'/edit\';\r\n				}\r\n				\r\n				if (!isset($url)) $url = \"\";\r\n\r\n				if (($file != \'setting\') && (isset($this->request->get[$table.\'_id\']) || $last_id)) {\r\n					$url .= \'&\'.$table.\'_id=\'.(isset($this->request->get[$table.\'_id\']) ? $this->request->get[$table.\'_id\'] : $last_id);\r\n				}\r\n\r\n				if ($this->request->post[\'apply\']) {\r\n					if (version_compare(VERSION, \'3\', \'>=\')) {\r\n						$url = \'user_token=\'.$this->session->data[\'user_token\'].$url;\r\n					} else {\r\n						$url = \'token=\'.$this->session->data[\'token\'].$url;\r\n					}\r\n					\r\n					$this->response->redirect($this->url->link($editroute, $url, true));\r\n				}\r\n			}\r\n			\r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"skip\">\r\n			<search><![CDATA[$this->document->setTitle]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n\r\n			$data[\'button_apply\'] = $this->language->get(\'button_apply\');\r\n			\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	\r\n	<!-- Admin: Templates -->\r\n\r\n	<file path=\"admin/view/template/*/*_form.tpl|admin/view/template/setting/setting.tpl\">\r\n		<operation error=\"skip\">\r\n			<search><![CDATA[<i class=\"fa fa-save\"></i></button>]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			\r\n			<button onclick=\"$(\'#content form #apply\').attr(\'value\', \'1\'); $(\'#\' + $(\'#content form\').attr(\'id\')).submit();\" data-toggle=\"tooltip\" title=\"<?php echo (!empty($button_apply) ? $button_apply : \'Apply\'); ?>\" class=\"btn btn-success\"><i class=\"fa fa-check\"></i></button>\r\n			\r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"skip\">\r\n			<search index=\"0\"><![CDATA[</form>]]></search>\r\n			<add position=\"replace\"><![CDATA[\r\n					\r\n			<input type=\"hidden\" name=\"apply\" id=\"apply\" value=\"0\"></form>\r\n			\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n\r\n	<file path=\"admin/view/template/*/*_form.twig|admin/view/template/setting/setting.twig\">\r\n		<operation error=\"skip\">\r\n			<search><![CDATA[<i class=\"fa fa-save\"></i></button>]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			\r\n			<button onclick=\"$(\'#content form #apply\').attr(\'value\', \'1\'); $(\'#\' + $(\'#content form\').attr(\'id\')).submit();\" data-toggle=\"tooltip\" title=\"{{ button_apply }}\" class=\"btn btn-success\"><i class=\"fa fa-check\"></i></button>\r\n			\r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"skip\">\r\n			<search index=\"0\"><![CDATA[</form>]]></search>\r\n			<add position=\"replace\"><![CDATA[\r\n					\r\n			<input type=\"hidden\" name=\"apply\" id=\"apply\" value=\"0\"></form>\r\n			\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	\r\n	<!-- Admin: Language -->\r\n	\r\n	<file path=\"admin/language/*/*.php\">\r\n		<operation>\r\n			<search><![CDATA[<?php]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			\r\n			$_[\'button_apply\'] = \"Apply\";\r\n			\r\n			]]></add>\r\n		</operation>		\r\n	</file>\r\n			\r\n</modification>', 1, '2019-01-11 19:55:51', '2019-01-11 23:20:30'),
(6, 'Localization Changes', 'localization_changes', 'NZXTUA', '1.0.0', 'https://zhv.in.ua/admin/model/setting/setting.php', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n  <name><![CDATA[Localization Changes]]></name>\r\n  <code>localization_changes</code>\r\n  <version><![CDATA[1.0.0]]></version>\r\n  <author><![CDATA[NZXTUA]]></author>\r\n  <link>https://zhv.in.ua/admin/model/setting/setting.php</link>\r\n  <!-- Header  -->\r\n  <file path=\"catalog/language/ru-ru/common/header.php\">\r\n	<operation>\r\n      <search index=\"0\">$_[\'text_account\']       = \'Личный кабинет\';</search>\r\n      <add position=\"replace\">$_[\'text_account\']       = \'Мой аккаунт\';</add>\r\n    </operation>\r\n	<operation>\r\n      <search index=\"0\">$_[\'text_wishlist\']      = \'Закладки (%s)\';</search>\r\n      <add position=\"replace\">$_[\'text_wishlist\']      = \'Избранное (%s)\';</add>\r\n    </operation>\r\n	<operation>\r\n      <search index=\"0\">$_[\'text_search\']        = \'Поиск\';</search>\r\n      <add position=\"replace\">$_[\'text_search\']        = \'Что ищем?\';</add>\r\n    </operation>\r\n  </file>\r\n</modification>', 1, '2019-01-11 22:29:50', '2019-01-12 05:17:46');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_module`
--

CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(29, 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
(28, 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(27, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1600\",\"height\":\"380\",\"status\":\"0\"}'),
(31, 'Banner 1', 'banner', '{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(32, 'Главная', 'product_tab', '{\"name\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f\",\"limit\":\"8\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\",\"active_module\":\"28\"}'),
(33, 'Последние статьи', 'blog_latest', '{\"name\":\"\\u041f\\u043e\\u0441\\u043b\\u0435\\u0434\\u043d\\u0438\\u0435 \\u0441\\u0442\\u0430\\u0442\\u044c\\u0438\",\"limit\":\"2\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(34, 'Рекомендуемые статьи', 'blog_featured', '{\"name\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0443\\u0435\\u043c\\u044b\\u0435 \\u0441\\u0442\\u0430\\u0442\\u044c\\u0438\",\"article\":[\"120\",\"124\"],\"limit\":\"5\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(35, 'Популярные статьи', 'blog_popular', '{\"name\":\"\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0435 \\u0441\\u0442\\u0430\\u0442\\u044c\\u0438\",\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(37, 'Популярные товары', 'popular', '{\"name\":\"\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b\",\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(38, 'Категории (IMG)', 'imgcategory', '{\"name\":\"\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438 (IMG)\",\"category_id\":\"0\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option`
--

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_description`
--

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value`
--

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value_description`
--

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order`
--

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_custom_field`
--

CREATE TABLE `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_history`
--

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_option`
--

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_product`
--

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring`
--

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring_transaction`
--

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_status`
--

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'В обработке'),
(3, 1, 'Доставлено'),
(7, 1, 'Отменено'),
(5, 1, 'Сделка завершена'),
(8, 1, 'Возврат'),
(9, 1, 'Отмена и аннулирование'),
(10, 1, 'Неудавшийся'),
(11, 1, 'Возмещенный'),
(12, 1, 'Полностью измененный'),
(13, 1, 'Полный возврат'),
(1, 1, 'Ожидание'),
(15, 1, 'Обработано'),
(14, 1, 'Истекло'),
(16, 1, 'Анулированный');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_total`
--

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_voucher`
--

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product`
--

CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `noindex`, `date_added`, `date_modified`) VALUES
(51, '1152', '', '', '', '120', '', '', '', 99999, 6, 'catalog/product/termopara.net-01152-01.jpg', 8, 1, '84.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 10, 1, 3, 1, '2013-09-28 08:33:01', '2016-02-12 10:57:00'),
(52, '1162', '', '', '', '120', '', '', '', 99999, 6, 'catalog/product/termopara.net-01162-01.jpg', 8, 1, '84.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 20, 1, 1, 1, '2013-09-28 08:41:31', '2016-02-12 10:59:27'),
(53, '1222', '', '', '', '120', '', '', '', 99999, 6, 'catalog/product/termopara.net-01222-01.jpg', 8, 1, '56.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 60, 1, 0, 1, '2013-09-28 08:52:27', '2016-02-12 11:06:01'),
(54, '1242', '', '', '', '150', '', '', '', 99999, 6, 'catalog/product/termopara.net-01242-01.jpg', 8, 1, '61.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 70, 1, 0, 1, '2013-09-28 08:53:07', '2016-02-12 11:07:17'),
(56, '1252', '', '', '', '156', '', '', '', 99999, 6, 'catalog/product/termopara.net-01252-01.jpg', 8, 1, '65.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 80, 1, 0, 1, '2013-09-28 09:49:55', '2016-02-12 11:08:23'),
(57, '1262', '', '', '', '159', '', '', '', 99999, 6, 'catalog/product/termopara.net-01262-01.jpg', 8, 1, '71.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 90, 1, 0, 1, '2013-09-28 09:58:55', '2016-02-12 11:11:38'),
(58, '1292', '', '', '', '169', '', '', '', 99999, 6, 'catalog/product/termopara.net-01292-01.jpg', 8, 1, '76.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 100, 1, 0, 1, '2013-09-28 10:17:28', '2016-02-12 11:12:43'),
(59, '1438', '', '', '', '48', '', '', '', 99999, 6, 'catalog/product/termopara.net-01438-01.jpg', 8, 1, '47.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 180, 1, 0, 1, '2013-09-28 10:25:08', '2016-02-12 12:05:49'),
(60, '1468', '', '', '', '60', '', '', '', 99999, 6, 'catalog/product/termopara.net-01468-01.jpg', 8, 1, '57.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 200, 1, 0, 1, '2013-09-28 10:31:49', '2016-02-12 12:08:14'),
(61, '1498', '', '', '', '75', '', '', '', 99999, 6, 'catalog/product/termopara.net-01498-01.jpg', 8, 1, '72.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 220, 1, 0, 1, '2013-09-28 10:43:28', '2016-02-12 12:11:22'),
(62, '1749', '', '', '', '51', '', '', '', 99999, 6, 'catalog/product/termopara.net-01749-01.jpg', 8, 1, '51.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 380, 1, 0, 1, '2013-09-28 10:52:18', '2016-02-12 12:53:02'),
(63, '1740', '', '', '', '51', '', '', '', 99999, 6, 'catalog/product/termopara.net-01740-01.jpg', 8, 1, '51.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 390, 1, 0, 1, '2013-09-28 11:04:47', '2016-02-12 12:54:08'),
(64, '1760', '', '', '', '60', '', '', '', 99999, 6, 'catalog/product/termopara.net-01760-01.jpg', 8, 1, '59.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 410, 1, 0, 1, '2013-09-28 11:38:42', '2016-02-12 12:56:13'),
(65, '1539', '', '', '', '48', '', '', '', 99999, 6, 'catalog/product/termopara.net-01539-01.jpg', 8, 1, '47.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 240, 1, 0, 1, '2013-09-28 11:43:53', '2016-02-12 12:28:51'),
(66, '1549', '', '', '', '51', '', '', '', 99999, 6, 'catalog/product/termopara.net-01549-01.jpg', 8, 1, '50.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 250, 1, 0, 1, '2013-09-28 11:53:24', '2016-02-12 12:30:09'),
(67, '1569', '', '', '', '60', '', '', '', 99999, 6, 'catalog/product/termopara.net-01569-01.jpg', 8, 1, '57.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 280, 1, 0, 1, '2013-09-28 11:55:53', '2016-02-12 12:35:40'),
(68, '1560', '', '', '', '60', '', '', '', 99999, 6, 'catalog/product/termopara.net-01560-01.jpg', 8, 1, '57.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 290, 1, 0, 1, '2013-09-28 11:59:40', '2016-02-12 12:36:47'),
(69, '1390', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-01390-01.jpg', 8, 1, '88.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 160, 1, 0, 1, '2013-09-28 12:09:15', '2016-02-12 11:34:43'),
(70, '2119', '', '', '', '180', '', '', '', 0, 6, 'catalog/product/termopara.net-02119-01.jpg', 8, 1, '179.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 490, 1, 0, 1, '2013-09-28 12:45:57', '2016-02-12 13:24:04'),
(71, '2210', '', '', '', '180', '', '', '', 99999, 6, 'catalog/product/termopara.net-02210-01.jpg', 8, 1, '179.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 520, 1, 0, 1, '2013-09-28 13:05:48', '2016-02-12 13:27:29'),
(72, '2310', '', '', '', '180', '', '', '', 99999, 6, 'catalog/product/termopara.net-02310-01.jpg', 8, 1, '179.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 530, 1, 0, 1, '2013-09-28 13:14:36', '2016-02-12 13:28:32'),
(73, '2418', '', '', '', '180', '', '', '', 99999, 6, 'catalog/product/termopara.net-02418-01.jpg', 8, 1, '179.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 550, 1, 0, 1, '2013-09-28 13:53:52', '2016-02-12 13:31:01'),
(74, '2428', '', '', '', '180', '', '', '', 99999, 6, 'catalog/product/termopara.net-02428-01.jpg', 8, 1, '179.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 540, 1, 0, 1, '2013-09-28 14:21:30', '2016-02-12 13:29:54'),
(75, '2538', '', '', '', '180', '', '', '', 99999, 6, 'catalog/product/termopara.net-02538-01.jpg', 8, 1, '179.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 560, 1, 0, 1, '2013-09-28 14:45:42', '2016-02-12 13:32:04'),
(76, '2558', '', '', '', '180', '', '', '', 99999, 6, 'catalog/product/termopara.net-02558-01.jpg', 8, 1, '179.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 570, 1, 0, 1, '2013-09-28 14:49:41', '2016-02-12 13:33:08'),
(77, '2568', '', '', '', '180', '', '', '', 99999, 6, 'catalog/product/termopara.net-02568-01.jpg', 8, 1, '179.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 580, 1, 0, 1, '2013-09-28 14:52:54', '2016-02-12 13:34:19'),
(78, '2578', '', '', '', '180', '', '', '', 99999, 6, 'catalog/product/termopara.net-02578-01.jpg', 8, 1, '179.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 590, 1, 0, 1, '2013-09-28 15:00:04', '2016-02-12 13:35:23'),
(79, '3128', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-03128-01.jpg', 8, 1, '94.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 600, 1, 0, 1, '2013-09-28 17:14:46', '2016-02-12 13:36:43'),
(80, '3228', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-03228-01.jpg', 8, 1, '94.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 620, 1, 0, 1, '2013-09-28 17:24:10', '2016-02-12 13:39:28'),
(81, '3354', '', '', '', '69', '', '', '', 99999, 6, 'catalog/product/termopara.net-03354-01.jpg', 8, 1, '77.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 690, 1, 0, 1, '2013-09-28 17:29:12', '2016-02-12 14:10:29'),
(82, '3454', '', '', '', '69', '', '', '', 99999, 6, 'catalog/product/termopara.net-03454-01.jpg', 8, 1, '77.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 700, 1, 0, 1, '2013-09-28 17:42:55', '2016-02-12 14:13:13'),
(83, '3555', '', '', '', '120', '', '', '', 0, 6, 'catalog/product/termopara.net-03555-01.jpg', 8, 1, '80.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 710, 1, 0, 1, '2013-09-28 17:45:27', '2016-02-12 14:15:27'),
(84, '4130', '', '', '', '31', '', '', '', 99999, 6, 'catalog/product/termopara.net-04130-01.jpg', 8, 1, '29.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 720, 1, 0, 1, '2013-09-28 18:31:51', '2015-11-13 17:03:58'),
(85, '4230', '', '', '', '33', '', '', '', 99999, 6, 'catalog/product/termopara.net-04230-01.jpg', 8, 1, '32.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 730, 1, 0, 1, '2013-09-28 18:56:48', '2015-11-13 17:05:46'),
(86, '4240', '', '', '', '37', '', '', '', 99999, 6, 'catalog/product/termopara.net-04240-01.jpg', 8, 1, '36.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 750, 1, 0, 1, '2013-09-28 19:57:01', '2015-11-13 17:08:46'),
(87, '4140', '', '', '', '36', '', '', '', 99999, 6, 'catalog/product/termopara.net-04140-01.jpg', 8, 1, '32.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 740, 1, 0, 1, '2013-09-28 19:57:34', '2015-11-13 17:07:28'),
(88, '4160', '', '', '', '39', '', '', '', 99999, 6, 'catalog/product/termopara.net-04160-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 760, 1, 0, 1, '2013-09-28 20:02:36', '2015-11-13 17:10:28'),
(89, '4260', '', '', '', '42', '', '', '', 99999, 6, 'catalog/product/termopara.net-04260-01.jpg', 8, 1, '42.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 770, 1, 0, 1, '2013-09-28 20:03:31', '2015-11-13 17:11:40'),
(90, '4350', '', '', '', '49', '', '', '', 99999, 6, 'catalog/product/termopara.net-04350-01.jpg', 8, 1, '40.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 790, 1, 0, 1, '2013-09-28 20:29:19', '2015-11-13 17:14:29'),
(91, '4300', '', '', '', '54', '', '', '', 99999, 6, 'catalog/product/termopara.net-04300-01.jpg', 8, 1, '55.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 800, 1, 0, 1, '2013-09-28 20:54:02', '2015-11-13 17:15:52'),
(92, '4440', '', '', '', '48', '', '', '', 99999, 6, 'catalog/product/termopara.net-04440-01.jpg', 8, 1, '53.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 840, 1, 0, 1, '2013-09-28 21:26:28', '2015-11-13 18:10:37'),
(93, '4540', '', '', '', '48', '', '', '', 99999, 6, 'catalog/product/termopara.net-04540-01.jpg', 8, 1, '53.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 850, 1, 0, 1, '2013-09-28 22:02:18', '2015-11-13 17:34:51'),
(94, '4620', '', '', '', '48', '', '', '', 99999, 6, 'catalog/product/termopara.net-04620-01.jpg', 8, 1, '52.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 860, 1, 0, 1, '2013-09-28 22:26:09', '2015-11-13 17:36:31'),
(95, '4920', '', '', '', '55', '', '', '', 99999, 6, 'catalog/product/termopara.net-04920-01.jpg', 8, 1, '52.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 830, 1, 0, 1, '2013-09-29 11:01:12', '2015-11-13 17:31:18'),
(96, '1838', '', '', '', '60', '', '', '', 99999, 6, 'catalog/product/termopara.net-01838-01.jpg', 8, 1, '53.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 450, 1, 0, 1, '2013-09-29 12:47:55', '2016-02-12 13:00:58'),
(97, '1839', '', '', '', '60', '', '', '', 99999, 6, 'catalog/product/termopara.net-01839-01.jpg', 8, 1, '53.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 460, 1, 0, 1, '2013-09-29 13:17:05', '2016-02-12 13:02:08'),
(98, '1368', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-01368-01.jpg', 8, 1, '86.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 110, 1, 0, 1, '2013-09-29 13:40:57', '2016-02-12 11:27:02'),
(99, '5110', '', '', '', '24', '', '', '', 99999, 6, 'catalog/product/termopara.net-05110-01.jpg', 8, 1, '32.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 890, 1, 8, 1, '2013-09-29 14:40:27', '2015-11-13 17:46:04'),
(100, '5512', '', '', '', '160', '', '', '', 99999, 6, 'catalog/product/termopara.net-05512-01.jpg', 8, 1, '200.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1020, 1, 0, 1, '2013-09-29 16:12:02', '2015-09-17 13:52:19'),
(101, '5212', '', '', '', '10', '', '', '', 99999, 6, 'catalog/product/termopara.net-05212-01.jpg', 8, 1, '11.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 930, 1, 0, 1, '2013-09-29 16:55:36', '2015-11-13 17:49:30'),
(102, '5221', '', '', '', '5', '', '', '', 99999, 6, 'catalog/product/termopara.net-05221-01.jpg', 8, 1, '10.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 940, 0, 0, 1, '2013-09-29 17:07:06', '2015-08-01 00:00:00'),
(103, '5930', '', '', '', '20', '', '', '', 99999, 6, 'catalog/product/termopara.net-05430-01.jpg', 8, 1, '30.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1210, 0, 0, 1, '2013-09-29 17:15:30', '2015-08-01 00:00:00'),
(104, '5612', '', '', '', '165', '', '', '', 99999, 6, 'catalog/product/termopara.net-05612-01.jpg', 8, 1, '200.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 990, 1, 0, 1, '2013-10-01 12:06:06', '2015-09-17 13:52:44'),
(105, '5622', '', '', '', '100', '', '', '', 99999, 6, 'catalog/product/termopara.net-05622-01.jpg', 8, 1, '200.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1000, 0, 0, 1, '2013-10-01 12:29:16', '2015-08-01 00:00:00'),
(106, '5613', '', '', '', '100', '', '', '', 99999, 6, 'catalog/product/termopara.net-05613-01.jpg', 8, 1, '200.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1010, 0, 0, 1, '2013-10-01 12:40:45', '2015-08-01 00:00:00'),
(107, '5940', '', '', '', '22', '', '', '', 99999, 6, 'catalog/product/termopara.net-05440-01.jpg', 8, 1, '33.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1220, 0, 0, 1, '2013-10-04 21:18:28', '2015-08-01 00:00:00'),
(108, '1529', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-01529-01.jpg', 8, 1, '94.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 330, 1, 0, 1, '2013-10-21 08:33:57', '2016-02-12 12:46:00'),
(109, '4910', '', '', '', '48', '', '', '', 99999, 6, 'catalog/product/termopara.net-04910-01.jpg', 8, 1, '42.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 810, 1, 0, 1, '2013-10-21 09:06:47', '2015-11-13 17:17:26'),
(110, '5950', '', '', '', '24', '', '', '', 99999, 6, 'catalog/product/termopara.net-05450-01.jpg', 8, 1, '36.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1230, 0, 0, 1, '2014-01-16 16:46:32', '2015-08-01 00:00:00'),
(111, '5960', '', '', '', '26', '', '', '', 99999, 6, 'catalog/product/termopara.net-05460-01.jpg', 8, 1, '39.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1240, 0, 0, 1, '2014-01-16 16:49:10', '2015-08-01 00:00:00'),
(112, '5980', '', '', '', '30', '', '', '', 99999, 6, 'catalog/product/termopara.net-05480-01.jpg', 8, 1, '45.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1250, 0, 0, 1, '2014-01-16 16:52:58', '2015-08-01 00:00:00'),
(113, '5999', '', '', '', '33', '', '', '', 99999, 6, 'catalog/product/termopara.net-05499-01.jpg', 8, 1, '50.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1260, 0, 0, 1, '2014-01-16 16:55:25', '2015-08-01 00:00:00'),
(114, '1439', '', '', '', '48', '', '', '', 99999, 6, 'catalog/product/termopara.net-01439-01.jpg', 8, 1, '47.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 190, 1, 0, 1, '2014-01-17 12:44:16', '2016-02-12 12:06:57'),
(115, '1469', '', '', '', '60', '', '', '', 99999, 6, 'catalog/product/termopara.net-01469-01.jpg', 8, 1, '57.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 210, 1, 0, 1, '2014-01-17 13:32:52', '2016-02-12 12:09:20'),
(116, '1499', '', '', '', '75', '', '', '', 99999, 6, 'catalog/product/termopara.net-01499-01.jpg', 8, 1, '72.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 230, 1, 0, 1, '2014-01-17 13:37:07', '2016-02-12 12:12:38'),
(117, '1589', '', '', '', '72', '', '', '', 99999, 6, 'catalog/product/termopara.net-01589-01.jpg', 8, 1, '72.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 300, 1, 0, 1, '2014-01-17 14:56:50', '2016-02-12 12:43:35'),
(118, '1649', '', '', '', '51', '', '', '', 99999, 6, 'catalog/product/termopara.net-01649-01.jpg', 8, 1, '50.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 360, 1, 0, 1, '2014-01-17 15:46:55', '2016-02-12 12:50:21'),
(119, '1669', '', '', '', '60', '', '', '', 99999, 6, 'catalog/product/termopara.net-01669-01.jpg', 8, 1, '57.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 370, 1, 0, 1, '2014-01-17 16:27:50', '2016-02-12 12:51:30'),
(120, '1990', '', '', '', '109', '', '', '', 99999, 6, 'catalog/product/termopara.net-01990-01.jpg', 8, 1, '99.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 480, 1, 0, 1, '2014-01-17 19:02:01', '2016-02-12 13:08:41'),
(121, '1769', '', '', '', '60', '', '', '', 99999, 6, 'catalog/product/termopara.net-01769-01.jpg', 8, 1, '59.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 400, 1, 0, 1, '2014-01-17 20:45:33', '2016-02-12 12:55:13'),
(122, '1799', '', '', '', '75', '', '', '', 99999, 6, 'catalog/product/termopara.net-01799-01.jpg', 8, 1, '73.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 420, 1, 0, 1, '2014-01-17 20:50:32', '2016-02-12 12:57:18'),
(123, '1639', '', '', '', '48', '', '', '', 99999, 6, 'catalog/product/termopara.net-01639-01.jpg', 8, 1, '47.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 350, 1, 0, 1, '2014-01-17 22:00:43', '2016-02-12 12:49:05'),
(124, '1568', '', '', '', '60', '', '', '', 99999, 6, 'catalog/product/termopara.net-01568-01.jpg', 8, 1, '57.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 270, 1, 0, 1, '2014-01-17 22:39:33', '2016-02-12 12:34:31'),
(125, '1848', '', '', '', '69', '', '', '', 99999, 6, 'catalog/product/termopara.net-01848-01.jpg', 8, 1, '52.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 430, 1, 0, 1, '2014-03-13 12:27:05', '2016-02-12 12:58:55'),
(127, '1849', '', '', '', '69', '', '', '', 99999, 6, 'catalog/product/termopara.net-01849-01.jpg', 8, 1, '52.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 440, 1, 0, 1, '2014-03-13 12:31:31', '2016-02-12 12:59:56'),
(128, '3604', '', '', '', '99', '', '', '', 99999, 6, 'catalog/product/termopara.net-03604-01.jpg', 8, 1, '88.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 680, 1, 0, 1, '2014-03-13 12:48:55', '2016-02-12 13:45:14'),
(129, '2139', '', '', '', '99', '', '', '', 99999, 6, 'catalog/product/termopara.net-02139-01.jpg', 8, 1, '94.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 510, 1, 0, 1, '2014-03-13 13:04:42', '2016-02-12 13:26:12'),
(130, '1182', '', '', '', '120', '', '', '', 0, 8, 'catalog/product/termopara.net-01182-01.jpg', 8, 1, '96.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 30, 1, 0, 1, '2014-04-07 06:45:40', '2016-02-12 11:01:31'),
(131, '1192', '', '', '', '120', '', '', '', 0, 8, 'catalog/product/termopara.net-01192-01.jpg', 8, 1, '97.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 40, 1, 0, 1, '2014-04-07 07:03:17', '2016-02-12 11:04:49'),
(132, '3724', '', '', '', '99', '', '', '', 99999, 6, 'catalog/product/termopara.net-03724-01.jpg', 8, 1, '91.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 670, 1, 0, 1, '2014-06-27 12:58:22', '2016-02-12 13:44:08'),
(133, '1428', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-01428-01.jpg', 8, 1, '94.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 235, 1, 0, 1, '2014-07-07 06:43:26', '2016-02-12 12:14:33'),
(134, '2129', '', '', '', '180', '', '', '', 0, 6, 'catalog/product/termopara.net-02129-01.jpg', 8, 1, '179.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 500, 1, 0, 1, '2014-07-07 13:15:00', '2016-02-12 13:25:08'),
(135, '3828', '', '', '', '120', '', '', '', 99999, 6, 'catalog/product/termopara.net-03828-01.jpg', 8, 1, '98.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 640, 1, 0, 1, '2014-07-07 19:52:15', '2016-02-12 13:41:45'),
(136, '3938', '', '', '', '120', '', '', '', 99999, 6, 'catalog/product/termopara.net-03938-01.jpg', 8, 1, '94.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 650, 1, 0, 1, '2014-07-07 19:57:43', '2016-02-12 13:42:45'),
(137, '5310', '', '', '', '43', '', '', '', 99999, 6, 'catalog/product/termopara.net-05310-01.jpg', 8, 1, '40.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 910, 1, 0, 1, '2014-07-10 08:42:32', '2015-09-17 13:38:20'),
(138, '5320', '', '', '', '48', '', '', '', 99999, 6, 'catalog/product/termopara.net-05320-01.jpg', 8, 1, '45.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 920, 1, 0, 1, '2014-07-10 16:52:22', '2015-11-13 17:47:44'),
(139, '5402', '', '', '', '39', '', '', '', 99999, 6, 'catalog/product/termopara.net-05402-01.jpg', 8, 1, '53.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 960, 1, 0, 1, '2014-07-14 09:15:36', '2015-11-13 17:52:51'),
(140, '5412', '', '', '', '39', '', '', '', 99999, 6, 'catalog/product/termopara.net-05412-01.jpg', 8, 1, '53.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 970, 1, 0, 1, '2014-07-14 09:29:37', '2015-11-13 17:54:11'),
(141, '6148', '', '', '', '10', '', '', '', 99999, 6, 'catalog/product/termopara.net-05748-01.jpg', 8, 1, '11.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1180, 1, 0, 1, '2014-07-14 10:34:27', '2015-11-13 17:40:29'),
(142, '6149', '', '', '', '10', '', '', '', 99999, 6, 'catalog/product/termopara.net-05749-01.jpg', 8, 1, '11.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1190, 1, 1, 1, '2014-07-14 10:41:00', '2015-11-13 17:41:56'),
(143, '6140', '', '', '', '10', '', '', '', 99999, 6, 'catalog/product/termopara.net-05740-01.jpg', 8, 1, '11.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1200, 1, 0, 1, '2014-07-14 10:41:07', '2015-11-13 17:44:23'),
(144, '5422', '', '', '', '43', '', '', '', 99999, 6, 'catalog/product/termopara.net-05422-01.jpg', 8, 1, '58.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 980, 1, 0, 1, '2014-10-29 18:03:44', '2015-11-13 17:55:47'),
(145, '1540', '', '', '', '51', '', '', '', 99999, 6, 'catalog/product/termopara.net-01549-01.jpg', 8, 1, '50.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 260, 1, 0, 1, '2014-10-29 18:36:41', '2016-02-12 12:33:16'),
(146, '4912', '', '', '', '51', '', '', '', 99999, 6, 'catalog/product/termopara.net-04912-01.jpg', 8, 1, '46.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 820, 1, 0, 1, '2014-10-29 22:57:58', '2015-11-13 17:29:38'),
(147, '1391', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-01391-01.jpg', 8, 1, '88.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 150, 1, 0, 1, '2015-01-20 13:22:17', '2016-02-12 11:33:32'),
(148, '1528', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-01529-01.jpg', 8, 1, '128.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 320, 0, 0, 1, '2015-02-27 18:50:11', '2015-08-01 00:00:00'),
(149, '1580', '', '', '', '72', '', '', '', 99999, 6, 'catalog/product/termopara.net-01589-01.jpg', 8, 1, '72.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 310, 1, 0, 1, '2015-02-27 18:58:38', '2016-02-12 12:44:42'),
(150, '4330', '', '', '', '49', '', '', '', 99999, 6, 'catalog/product/termopara.net-04330-01.jpg', 8, 1, '38.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 780, 1, 0, 1, '2015-02-27 19:32:04', '2015-11-13 17:13:07'),
(151, '5240', '', '', '', '50', '', '', '', 99999, 6, 'catalog/product/termopara.net-05240-01.jpg', 8, 1, '70.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 950, 1, 1, 1, '2015-02-27 20:09:13', '2015-11-13 17:51:25'),
(152, '5800', '', '', '', '24', '', '', '', 99999, 6, 'catalog/product/termopara.net-05800-01.jpg', 8, 1, '30.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 900, 1, 0, 1, '2015-02-27 20:16:41', '2015-11-13 17:46:43'),
(153, '4730', '', '', '', '31', '', '', '', 99999, 6, 'catalog/product/termopara.net-04730-01.jpg', 8, 1, '53.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 870, 1, 0, 1, '2015-02-27 21:07:36', '2015-11-13 17:37:46'),
(154, '4740', '', '', '', '31', '', '', '', 99999, 6, 'catalog/product/termopara.net-04740-01.jpg', 8, 1, '54.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 880, 1, 0, 1, '2015-02-27 21:16:27', '2015-11-13 17:39:07'),
(155, '5701', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1030, 0, 0, 1, '2015-02-27 21:16:27', '2015-09-16 14:09:50'),
(156, '5702', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1040, 0, 0, 1, '2015-02-27 21:16:27', '2015-09-16 14:13:36'),
(157, '5703', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1050, 0, 0, 1, '2015-02-27 21:16:27', '2015-08-01 00:00:00'),
(158, '5704', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1060, 1, 0, 1, '2015-02-27 21:16:27', '2015-09-17 13:53:47'),
(159, '5705', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1070, 0, 0, 1, '2015-02-27 21:16:27', '2015-08-01 00:00:00'),
(160, '5706', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1080, 0, 0, 1, '2015-02-27 21:16:27', '2015-08-01 00:00:00'),
(161, '5707', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1090, 0, 0, 1, '2015-02-27 21:16:27', '2015-08-01 00:00:00'),
(162, '5708', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1100, 1, 1, 1, '2015-02-27 21:16:27', '2015-09-17 13:54:24'),
(163, '5709', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1110, 0, 0, 1, '2015-02-27 21:16:27', '2015-09-16 14:07:17'),
(164, '5710', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1120, 0, 0, 1, '2015-02-27 21:16:27', '2015-09-16 14:07:42'),
(165, '5711', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1130, 1, 0, 1, '2015-02-27 21:16:27', '2015-09-17 13:54:57'),
(166, '5712', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1140, 0, 0, 1, '2015-02-27 21:16:27', '2015-09-16 14:08:17'),
(167, '5713', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1150, 0, 0, 1, '2015-02-27 21:16:27', '2015-09-16 14:08:35'),
(168, '5714', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1160, 0, 0, 1, '2015-02-27 21:16:27', '2015-09-16 14:09:05'),
(169, '5715', '', '', '', '35', '', '', '', 99999, 6, 'catalog/product/termopara.net-05701-01.jpg', 8, 1, '35.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 1170, 0, 0, 1, '2015-02-27 21:16:27', '2015-09-16 14:09:26'),
(170, '1360', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-01360-01.jpg', 8, 1, '86.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 120, 1, 0, 1, '2013-09-29 13:40:57', '2016-02-12 11:28:49'),
(171, '1370', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-01370-01.jpg', 8, 1, '87.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 140, 1, 0, 1, '2013-09-29 13:40:57', '2016-02-12 11:31:32'),
(172, '1378', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-01378-01.jpg', 8, 1, '87.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 130, 1, 0, 1, '2013-09-29 13:40:57', '2016-02-12 11:29:58'),
(173, '1599', '', '', '', '72', '', '', '', 0, 8, 'catalog/product/termopara.net-01599-01.jpg', 8, 1, '100.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 660, 1, 0, 1, '2014-01-17 14:56:50', '2015-09-17 12:33:34'),
(174, '7569', '', '', '', '60', '', '', '', 99999, 6, 'catalog/product/termopara.net-07569-01.jpg', 8, 1, '57.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 340, 1, 0, 1, '2013-09-28 11:55:53', '2016-02-12 12:47:25'),
(175, '1869', '', '', '', '69', '', '', '', 99999, 6, 'catalog/product/termopara.net-01869-01.jpg', 8, 1, '60.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 470, 1, 0, 1, '2014-03-13 12:31:31', '2016-02-12 13:07:15'),
(176, '7390', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-07390-01.jpg', 8, 1, '88.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 170, 1, 0, 1, '2013-09-29 13:40:57', '2016-02-12 11:39:48'),
(177, '7128', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-07128-01.jpg', 8, 1, '94.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 610, 1, 0, 1, '2013-09-28 17:14:46', '2016-02-12 13:38:11'),
(178, '7228', '', '', '', '90', '', '', '', 99999, 6, 'catalog/product/termopara.net-07228-01.jpg', 8, 1, '94.0000', 0, 0, '2013-09-27', '0.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 630, 1, 0, 1, '2013-09-28 17:24:10', '2016-02-12 13:40:25');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_attribute`
--

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(51, 12, 1, 'L=540мм, М12х1.25'),
(52, 12, 1, 'L=570мм, М12х1.25'),
(53, 12, 1, 'L=280мм, М12х1.25'),
(54, 12, 1, 'L=410мм, М12х1.25'),
(56, 12, 1, 'L=560мм, М12х1.25'),
(57, 12, 1, 'L=620мм, М12х1.25'),
(58, 12, 1, 'L=950мм, М12х1.25'),
(59, 12, 1, 'L=345мм, М8х1'),
(60, 12, 1, 'L=600мм, М8х1'),
(61, 12, 1, 'L=900мм, М8х1'),
(62, 12, 1, 'L=400мм, М9х1, А3'),
(63, 12, 1, 'L=400мм, М10х1, А3'),
(64, 12, 1, 'L=600мм, М10х1, А3'),
(65, 12, 1, 'L=320мм, М9х1,  А1'),
(66, 12, 1, 'L=400мм, М9х1,  А1'),
(67, 12, 1, 'L=600мм, М9х1, А1'),
(68, 12, 1, 'L=600мм, М10х1, А1'),
(69, 12, 1, 'L=900мм, М10х1'),
(70, 12, 1, 'L=580/140/400мм, М9х1, клеммы'),
(71, 12, 1, ' L=380/700/750мм, М10х1, клеммы'),
(72, 12, 1, 'L=220/700/800мм, М10х1, клеммы'),
(73, 12, 1, 'L=145/170/640/750мм, М8х1, клеммы'),
(74, 12, 1, 'L=420 мм, М8х1'),
(75, 12, 1, ' L=200/665/750мм, М8х1, клеммы'),
(76, 12, 1, 'L=220/480/840мм, М8х1, клеммы'),
(77, 12, 1, 'L=260/460/840мм, М8х1, клеммы'),
(78, 12, 1, 'L=260/480/840мм, М9х1, клеммы'),
(79, 12, 1, 'L=1200 мм, М8*1'),
(80, 12, 1, 'L=1200 мм, М8*1'),
(81, 12, 1, 'L=500мм, 2 клеммы'),
(82, 12, 1, 'L=500мм, 2 клеммы'),
(83, 12, 1, 'L=500мм, разъем'),
(84, 12, 1, 'L=300мм, Ø4мм, М10*1'),
(85, 12, 1, 'L=300мм, Ø6мм, М10*1'),
(86, 12, 1, 'L=400мм, Ø6мм, М10*1'),
(87, 12, 1, 'L=400мм, Ø4мм, М10*1'),
(88, 12, 1, 'L=600мм, Ø4мм, М10*1'),
(89, 12, 1, 'L=600мм, Ø6мм, М10*1'),
(90, 12, 1, 'L=500мм, Ø4мм, М10*1.25'),
(91, 12, 1, 'L=1000мм, Ø4мм, М10*1.25'),
(92, 12, 1, 'L=400мм, Ø4мм, М10*1'),
(93, 12, 1, 'L=400мм, Ø4мм, М10*1'),
(94, 12, 1, 'L=220мм, Ø4мм, М10*1'),
(95, 12, 1, 'L=800/400мм, Ø4мм, М10*1.25'),
(96, 12, 1, 'L=350мм, М8х1'),
(97, 12, 1, 'L=350мм, М9х1'),
(98, 12, 1, 'L=900мм, М8х1'),
(99, 12, 1, 'в датчик пламени'),
(100, 12, 1, 'силумин, 1/2&quot;'),
(101, 12, 1, 'белая вакуумная резина, 2мм'),
(102, 12, 1, 'черная резина ТМКЩ, 1.5мм'),
(103, 12, 1, 'L=30см, М10 - 1/2&quot;'),
(104, 12, 1, '2 крышки, силумин, 1/2&quot;'),
(105, 12, 1, '2 крышки, ЦАМ, 1/2&quot;'),
(106, 12, 1, '2 крышки, ЦАМ, 3/4&quot;'),
(107, 12, 1, 'L=40см, М10 - 1/2&quot;'),
(108, 12, 1, 'L=1200мм, М9х1, А1'),
(109, 12, 1, 'L=950мм, Ø4мм, М10*1.25'),
(110, 12, 1, 'L=50см, М10 - 1/2&quot;'),
(111, 12, 1, 'L=60см, М10 - 1/2&quot;'),
(112, 12, 1, 'L=80см, М10 - 1/2&quot;'),
(113, 12, 1, 'L=100см, М10 - 1/2&quot;'),
(114, 12, 1, 'L=345мм, М9х1'),
(115, 12, 1, 'L=600мм, М9х1'),
(116, 12, 1, 'L=900мм, М9х1'),
(117, 12, 1, 'L=850мм, М9х1,  А1'),
(118, 12, 1, 'L=400мм, М9х1, А2'),
(119, 12, 1, 'L=600мм, М9х1, А2'),
(120, 12, 1, 'L=900мм, М8х1, комплект для крепления'),
(121, 12, 1, 'L=600мм, М9х1, А3'),
(122, 12, 1, 'L=900мм, М9х1, А3'),
(123, 12, 1, 'L=320мм, М9х1, А2'),
(124, 12, 1, 'L=600мм, М8х1, А1'),
(125, 12, 1, 'L=350мм, М8х1'),
(127, 12, 1, 'L=350мм, М9х1'),
(128, 12, 1, 'L=1000мм, клемма'),
(129, 12, 1, 'L=350мм, М9х1'),
(130, 12, 1, 'L=860мм, М12х1.25'),
(131, 12, 1, 'L=920мм, М12х1.25'),
(132, 12, 1, 'L=1200мм, клеммы'),
(133, 12, 1, 'L=1200мм, М8х1'),
(134, 12, 1, 'L=580/140/400мм, М9х1, клеммы'),
(135, 12, 1, 'L=1100мм, М8х1'),
(136, 12, 1, 'L=350мм, М8х1'),
(137, 12, 1, ''),
(138, 12, 1, ''),
(139, 12, 1, 'L=105мм, Ø10мм, внутренняя резьба 1/2&quot;'),
(140, 12, 1, 'L=105мм, Ø10мм, внешняя резьба 1/2&quot;'),
(141, 12, 1, 'М8х1, латунь'),
(142, 12, 1, 'М9х1, латунь'),
(143, 12, 1, 'М10х1, латунь'),
(144, 12, 1, 'L=105мм, Ø16мм, наружная резьба 1/2&quot;'),
(145, 12, 1, 'L=400мм, М10х1,  А1'),
(146, 12, 1, 'L=1200мм, Ø4мм, М10*1.25'),
(147, 12, 1, 'L=900мм, 11/32&quot;'),
(148, 12, 1, 'L=1200мм, М9х1, А1'),
(149, 12, 1, 'L=850мм, М10х1,  А1'),
(150, 12, 1, 'L=350мм, Ø4мм, М10*1.25'),
(151, 12, 1, 'диаметр 40мм, толщина 0.12мм'),
(152, 12, 1, 'в датчик пламени'),
(153, 12, 1, 'L=300мм, Ø4мм, М10*1'),
(154, 12, 1, 'L=300мм, Ø4мм, М10*1');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_description`
--

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `description_mini` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `description_mini`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(51, 1, 'Термопара АОГВ-80', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара АОГВ-80&lt;/strong&gt; применяется для газовых котлов АОГВ-80 старого образца производства ЗАО &amp;laquo;Ростовгазоаппарат&amp;raquo;.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;540 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;открытый&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;М12х1,25&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 15 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;6 + (0.012 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медная труба&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;120 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары АОГВ-80 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, АОГВ, котел', 'Термопара газового котла АОГВ-80', 'Термопара газового котла АОГВ-80 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900\n', 'АОГВ, термопара, котел', ''),
(52, 1, 'Термопара АОГВ-110', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара АОГВ-110&lt;/strong&gt; применяется для газовых котлов АОГВ-110 -120, АКГВ-11 серии &amp;laquo;Эконом&amp;raquo; старого образца производства ЗАО &amp;laquo;Ростовгазоаппарат&amp;raquo; с 2004 г.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;570 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;открытый&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;М12х1,25&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 15 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;6 + (0.012 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медная труба&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;130 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары АОГВ-110 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, АОГВ, котел', 'Термопара газового котла АОГВ-110', 'Термопара газового котла АОГВ-110 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900\n', 'АОГВ-110, АОГВ-120, АКГВ-11, термопара, котел', ''),
(53, 1, 'Термопара АОГВ-7,5 DANI', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара АОГВ-7.5 DANI&lt;/strong&gt; применяется для парапетных газовых котлов АОГВ (АКГВ) 7.5 DANI.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;280 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;закрытый&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;М12х1,25&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 15 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;8 + (0.014 х L) &amp;plusmn; 3 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медная трубка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;70 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары АОГВ 7.5 DANI упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, АОГВ, DANI, котел', 'Термопара АОГВ-7,5 DANI', 'Термопара АОГВ-7,5 DANI по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900\n', 'АОГВ, DANI, термопара, котел', ''),
(54, 1, 'Термопара АОГВ-11 DANI', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара АОГВ-11 DANI&lt;/strong&gt; применяется для газовых котлов АОГВ (АКГВ) 11.5 DANI.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;410 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;закрытый&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;М12х1,25&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 15 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;8 + (0.014 х L) &amp;plusmn; 3 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медная трубка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;75 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары АОГВ-11 DANI упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, АОГВ, DANI, котел', 'Термопара АОГВ-11 DANI', 'Термопара АОГВ-11 DANI по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900\n', 'АОГВ, DANI, термопара, котел', ''),
(56, 1, 'Термопара АОГВ-17 DANI', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара АОГВ-17 DANI&lt;/strong&gt; применяется для газовых котлов АОГВ-17, АОГВ-19, АОГВ-23.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;560 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;закрытый&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;М12х1,25&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 15 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;8 + (0.014 х L) &amp;plusmn; 3 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медная трубка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;80 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары АОГВ-17 DANI упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, АОГВ, DANI, котел', 'Термопара АОГВ-17 DANI', 'Термопара АОГВ-17 DANI по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АОГВ, DANI, термопара, котел', ''),
(57, 1, 'Термопара АОГВ-23 DANI', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара АОГВ-23 DANI&lt;/strong&gt; применяется для парапетных газовых котлов АОГВ-23, АОГВ-29.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;620 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;закрытый&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;М12х1,25&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 15 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;8 + (0.014 х L) &amp;plusmn; 3 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медная трубка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;90 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары АОГВ-23 DANI упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, АОГВ, DANI, котел', 'Термопара АОГВ-23 DANI', 'Термопара АОГВ-23 DANI по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АОГВ, DANI, термопара, котел', ''),
(58, 1, 'Термопара АОГВ-32', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара АОГВ-32&lt;/strong&gt; применяется для газовых котлов АОГВ (АКГВ) мощностью до 32 кВт, газовой автоматики АГУК.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;950 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;закрытый&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;М12х1,25&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 15 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;8 + (0.014 х L) &amp;plusmn; 3 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медная трубка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;100 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары АОГВ-32 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, АОГВ, котел', 'Термопара АОГВ-32', 'Термопара АОГВ-32 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АОГВ, термопара, котел', ''),
(59, 1, 'Термопара Арбат 345мм М8', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Арбат 345мм М8&lt;/strong&gt; применяется для газовых котлов с автоматикой Арбат, например таких как РОСС, Житомир, Вулкан, Данко, Атон, Термо, Дани, Маяк, Колви, а также колонок ВПГ и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;345 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А17 резьба М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Арбат 345мм М8 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, Арбат, котел, РОСС, Житомир, Вулкан, Данко, Атон, Термо-бар, Дани, Маяк, Колви, ВПГ', 'Термопара Арбат 345мм М8', 'Термопара Арбат 345мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Арбат, термопара, котел', ''),
(60, 1, 'Термопара Арбат 600мм М8', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Арбат 600мм М8&lt;/strong&gt; применяется для газовых котлов с автоматикой Арбат, например таких как РОСС, Житомир, Вулкан, Данко, Атон, Термо, Дани, Маяк, Колви и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А17 резьба М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;50 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Арбат 600мм М8 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, Арбат, котел, РОСС, Житомир, Вулкан, Данко, Атон, Термо-бар, Дани, Маяк, Колви', 'Термопара Арбат 600мм М8', 'Термопара Арбат 600мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Арбат, термопара, котел', ''),
(61, 1, 'Термопара Арбат 900мм М8', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Арбат 900мм М8&lt;/strong&gt; применяется для газовых котлов с автоматикой Арбат, например таких как РОСС, Житомир, Вулкан, Данко, Атон, Термо, Дани, Маяк, Колви и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;900 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А17 резьба М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;70 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Арбат 900мм М8 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, Арбат, котел, РОСС, Житомир, Вулкан, Данко, Атон, Термо-бар, Дани, Маяк, Колви', 'Термопара Арбат 900мм М8', 'Термопара Арбат 900мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Арбат, термопара, котел', ''),
(62, 1, 'Термопара SIT А3 400мм М9 (02.200.053)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A3 400мм М9 (0.200.053)&lt;/strong&gt; применяется в газовых котлах, оснащенных блоком автоматики EuroSIT, Арбат (с 2008г), ОРИОН, HONEYWELL, Евроказ, Факел-2М, FEG и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;400 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А3&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;35 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A3 400мм М9 (0.200.053) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А3 400мм М9 (02.200.053) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(63, 1, 'Термопара SIT A3 400мм М10 Каре', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A3 400мм М10 Каре&lt;/strong&gt; применяется в газовых котлах Данко, Ривнетерм и других котлах мощностью до 25кВт, с автоматикой регулирования и безопасности КАРЕ&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;400 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А3&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М10 под ключ 10&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;35 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A3 400мм М10 Каре упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А3 400мм М10 для автоматики Каре по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'котел, конвектор, термопара, КАРЕ', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `description_mini`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(64, 1, 'Термопара SIT A3 600мм М10 Каре', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A3 600мм М10 Каре&lt;/strong&gt; применяется в газовых котлах Данко, Ривнетерм и других котлах мощностью до 25кВт, с автоматикой регулирования и безопасности КАРЕ&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А3&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М10 под ключ 10&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;50 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A3 600мм М10 Каре упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А3 600мм М10 для автоматики Каре по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'котел, конвектор, термопара, КАРЕ', ''),
(65, 1, 'Термопара SIT A1 320мм М9 (0.200.003)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A1 320мм М9 (0.200.003)&lt;/strong&gt; применяется для газовых котлов с автоматикой EuroSIT, например таких как Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;320 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А1&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A1 320мм М9 (0.200.003) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT A1 320мм М9 (0.200.003) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(66, 1, 'Термопара SIT А1 400мм М9 (0.200.005)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A1 400мм М9 (0.200.005)&lt;/strong&gt; применяется для газовых котлов с автоматикой EuroSIT, например таких как Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;400 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А1&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;35 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A1 400мм М9 (0.200.005) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А1 400мм М9 (0.200.005) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(67, 1, 'Термопара SIT А1 600мм М9 (0.200.009)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A1 600мм М9 (0.200.009)&lt;/strong&gt; применяется для газовых котлов с автоматикой EuroSIT, например таких как Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А1&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;50 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A1 600мм М9 (0.200.009) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А1 600мм М9 (0.200.009) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(68, 1, 'Термопара SIT А1 600мм М10 (0.200.025)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A1 600мм М10 (0.200.025)&lt;/strong&gt; применяется для газовых конвекторах, например таких как Атон, Данко, Сутиски, Модуль, АКОГ, Росс, Ваxi, Gorenje, Feg, Demrad, Lampart и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А1&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М10 под ключ 10&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;50 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A1 600мм М10 (0.200.025) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А1 600мм М10 (0.200.025) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(69, 1, 'Термопара Honeywell 900мм М10', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Honeywell 900мм М10&lt;/strong&gt; применяется для газовых котлов и конвекторов с автоматикой HONEYWELL V5475G (Q335C 1031B/1023B), например таких как Данко, Проскуров, Маяк, Житомир, FEG и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;900 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А4 + штуцер 7/16&amp;quot; под ключ 12&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М10 под ключ 10&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;70 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Honeywell 900мм М10 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара Honeywell, котел, Маяк, Проскуров', '', 'Термопара Honeywell 900мм М10 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Honeywell, термопара', ''),
(70, 1, 'Термопара колонки Beretta Idrabagno', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара&amp;nbsp; для&amp;nbsp; газовых&amp;nbsp; проточных&amp;nbsp; нагревателей&amp;nbsp; Beretta&amp;nbsp; Idrabagno-11&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=580/140/400мм;&lt;/span&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану штуцером М9х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к датчику - ножевые клеммы(мама).&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Может быть установлена в моделях &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;-11i,&amp;nbsp; -14,&amp;nbsp; -14i,&amp;nbsp; -17,&amp;nbsp; -17i&lt;/span&gt;&lt;/span&gt; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Beretta, Беретта, колонка, термопара', '', 'Термопара газовой колонки Beretta Idrabagno по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Beretta, Беретта, колонка, термопара', ''),
(71, 1, 'Термопара колонки Demrad', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара для бытовых газовых проточных водонагревателей Demrad&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=380/700/750мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;штуцером &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;М10х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к датчику - ножевые клеммы(мама).&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Может устанавливаться в моделях &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;серии Compact C-125, C-150S, С-275S/SE/SEI, С-275В, С-350S/SE, &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Compact Turbo &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;и др;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Demrad, Демрад, колонка, термопара', '', 'Термопара газовой колонки Demrad по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Demrad, Демрад, колонка, термопара', ''),
(72, 1, 'Термопара колонки Junkers-Bosch', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара для газовых проточных водонагревателей Junkers-Bosch &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=220/700/800мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;штуцером &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;М10х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к датчику - ножевые клеммы(мама).&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Может устанавливаться в моделях:&amp;nbsp; &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;-WR, -WRD, -WT, -WTD&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Junkers-Bosch, Юнкерс-Бош, колонка, термопара', '', 'Термопара газовой колонки Junkers-Bosch по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Junkers-Bosch, Юнкерс-Бош, колонка, термопара', ''),
(73, 1, 'Термопара колонки Vaillant atmoMAG', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара для газовых проточных водонагревателей Vaillant atmoMAG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=145/170/640/750мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;штуцером &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;М8х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к датчику - ножевые клеммы(мама).&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Применяется в моделях: MAG OE 11-0/0 XZ C+ H, MAG 14-0 GRX, MAG 14-0 RXZ, turboMAG 11-2 H, turboMAG 14-2 H, MAG mini 11-0 RXI, turboMAG 11-2 H, turboMAG 14-2 H и других.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Vaillant, Вайлант, колонка, термопара', '', 'Термопара газовой колонки Vaillant atmoMAG по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Vaillant, Вайлант, колонка, термопара', ''),
(74, 1, 'Термопара колонки Vaillant atmoMAG Pro', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара&amp;nbsp; для&amp;nbsp; газовых&amp;nbsp; проточных&amp;nbsp; нагревателей&amp;nbsp; Vaillant&amp;nbsp; atmoMAG Pro&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=420 мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;штуцером &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;М8х1.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Может устанавливаться в моделях: MAG Pro OE 10 0/0 XZ, MAG Pro OE 10 0/0 XZ, Mag Pro 11-0 XZ C+,MAG PRO OE 11-0 XZC+, MAG pro OE 11-0/0 XZ C+ H и других.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Vaillant, Вайлант, колонка, термопара', '', 'Термопара газовой колонки Vaillant atmoMAG Pro по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Vaillant, Вайлант, колонка, термопара', ''),
(75, 1, 'Термопара колонки Termet G-17-30', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара&amp;nbsp; для&amp;nbsp; газовых проточных водонагревателей Termet G-17-30&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=200/665/750мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;штуцером &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;М8х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к датчику - ножевые клеммы(мама)&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Termet, Термет, колонка, термопара', '', 'Термопара газовой колонки Termet G-17-30 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Termet, Термет, колонка, термопара', ''),
(76, 1, 'Термопара колонки Termet G-19-01', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара для газовых проточных водонагревателей Termet G-19-01&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=220/480/840мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;штуцером &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;М8х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к датчику - ножевые клеммы(мама).&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Termet, Термет, колонка, термопара', '', 'Термопара газовой колонки Termet G-19-01 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Termet, Термет, колонка, термопара', ''),
(77, 1, 'Термопара колонки Termet TermaQ G-19-01', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара для газовых проточных нагревателей Termet TermaQ G-19-01&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=260/460/840мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;штуцером &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;М8х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к датчику - ножевые клеммы(мама).&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Termet, Термет, колонка, термопара', '', 'Термопара газовой колонки Termet TermaQ G-19-01 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Termet, Термет, колонка, термопара', ''),
(78, 1, 'Термопара колонки Termet Aqua', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара&amp;nbsp; для&amp;nbsp; газовых&amp;nbsp; проточных&amp;nbsp; водонагревателей&amp;nbsp; Termet&amp;nbsp; Aqua&lt;/span&gt;&amp;nbsp; &lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;nbsp; Длина L=260/480/840мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;штуцером &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;М8х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к датчику - ножевые клеммы(мама).&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Может устанавливаться в моделях:&amp;nbsp; Aqua Heat&amp;nbsp; G-19-00,&amp;nbsp; Aqua Comfort G-19-03.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Termet, Термет, колонка, термопара', '', 'Термопара газовой колонки Termet Aqua по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Termet, Термет, колонка, термопара', ''),
(79, 1, 'Термопара духовки INDESIT 1200мм М8', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара (газ-контроль) духовки/гриля газовых плит ARISTON INDESIT&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L = 1200 мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану штуцером М8х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Рабочий оголовок без резьбы, с проточкой под защелку&lt;/span&gt;&lt;/span&gt;.&lt;/p&gt;\n', '', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, духовка, гриль', '', 'Термопара газовой духовки INDESIT 1200мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, духовка, гриль', ''),
(80, 1, 'Термопара духовки ARISTON INDESIT 1200мм М8', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара (газ-контроль) духовки для газовых плит ARISTON INDESIT&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L = 1200 мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану штуцером М8х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Резьба рабочего оголовка 8х1.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, духовка', '', 'Термопара газовой духовки ARISTON INDESIT 1200мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, духовка', ''),
(81, 1, 'Термопара конфорки ARISTON INDESIT 500мм М6', '&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара (газ-контроль) конфорки варочных панелей ARISTON INDESIT&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=500 мм;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение - ножевая клемма (мама) + О-клемма&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Резьба рабочего оголовка 6х0,75.&lt;/span&gt;&lt;/span&gt;', '', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, варочная панель', '', 'Термопара газовой конфорки ARISTON INDESIT 500мм М6 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, варочная панель', ''),
(82, 1, 'Термопара конфорки ARISTON INDESIT 500мм М8', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара (газ-контроль) конфорки варочных панелей ARISTON INDESIT&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=500 мм;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану - 2 ножевые клеммы (мама)&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Резьба рабочего оголовка 8х1.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, варочная панель', '', 'Термопара газовой конфорки ARISTON INDESIT 500мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, варочная панель', ''),
(83, 1, 'Термопара конфорки Electrolux 500мм', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара (газ-контроль) конфорки для варочных панелей Electrolux&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L = 500 мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану - коаксиальный разъем&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Резьба рабочего оголовка 6х0,75.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Применяется для газовых плит ELECTROLUX, GORENJE, HANSA, ZANUSSI, AEG разных моделей с аналогичными установочными размерами&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Electrolux, Электролюкс, Аристон, Индезит, термопара, газплита, газконтроль, варочная панель', '', 'Термопара газовой конфорки Electrolux 500мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Electrolux, Электролюкс, термопара, газплита, газконтроль, варочная панель', ''),
(84, 1, 'Трубка запальника автоматики EuroSIT 300мм, ø4мм ', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для газовых котлов с автоматикой EuroSIT-630&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется&lt;/span&gt;&lt;/span&gt; для подключения пилотной горелки к газовому клапану;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=300 мм; Диаметр &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;Oslash;4&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;мм&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайками&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;и ниппелем;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется для пилотной горелки серий SIT 140, SIT 150;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'EuroSIT, СИТ, трубка запальника', '', 'Трубка запальника автоматики EuroSIT 300мм, ø4мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, трубка запальника', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `description_mini`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(85, 1, 'Трубка запальника автоматики EuroSIT 300мм, ø6мм ', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для газовых котлов с автоматикой EuroSIT-630&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется&lt;/span&gt;&lt;/span&gt; для подключения пилотной горелки к газовому клапану;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=300 мм;&lt;/span&gt;&lt;/span&gt; &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Диаметр &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;Oslash;6&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;мм&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайками&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;и ниппелем;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется для пилотной горелки серий SIT 140, SIT 150;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'EuroSIT, СИТ, трубка запальника', '', 'Трубка запальника автоматики EuroSIT 300мм, ø6мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, трубка запальника', ''),
(86, 1, 'Трубка запальника автоматики EuroSIT 400мм, ø6мм ', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для газовых котлов с автоматикой EuroSIT-630&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется&lt;/span&gt;&lt;/span&gt; для подключения пилотной горелки к газовому клапану;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=400 мм; Диаметр &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;Oslash;6&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;мм&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайками&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;и ниппелем;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется для пилотной горелки серий SIT 140, SIT 150;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'EuroSIT, СИТ, трубка запальника', '', 'Трубка запальника автоматики EuroSIT 400мм, ø6мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, трубка запальника', ''),
(87, 1, 'Трубка запальника автоматики EuroSIT 400мм, ø4мм ', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для газовых котлов с автоматикой EuroSIT-630&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется&lt;/span&gt;&lt;/span&gt; для подключения пилотной горелки к газовому клапану;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=400 мм;&lt;/span&gt;&lt;/span&gt; &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Диаметр &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;Oslash;4&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;мм&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайками&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;и ниппелем;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется для пилотной горелки серий SIT 140, SIT 150;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'EuroSIT, СИТ, трубка запальника', '', 'Трубка запальника автоматики EuroSIT 400мм, ø4мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, трубка запальника', ''),
(88, 1, 'Трубка запальника автоматики EuroSIT 600мм, ø4мм ', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для газовых котлов с автоматикой EuroSIT-630&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется&lt;/span&gt;&lt;/span&gt; для подключения пилотной горелки к газовому клапану;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=600 мм;&lt;/span&gt;&lt;/span&gt; &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Диаметр &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;Oslash;4&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;мм&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайками&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;и ниппелем;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется для пилотной горелки серий SIT 140, SIT 150;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'EuroSIT, СИТ, трубка запальника', '', 'Трубка запальника автоматики EuroSIT 600мм, ø4мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, трубка запальника', ''),
(89, 1, 'Трубка запальника автоматики EuroSIT 600мм, ø6мм ', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для газовых котлов с автоматикой EuroSIT-630&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется&lt;/span&gt;&lt;/span&gt; для подключения пилотной горелки к газовому клапану;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=600 мм; Диаметр &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;Oslash;6&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;мм&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайками&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;и ниппелем;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется для пилотной горелки серий SIT 140, SIT 150;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'EuroSIT, СИТ, трубка запальника', '', 'Трубка запальника автоматики EuroSIT 600мм, ø6мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, трубка запальника', ''),
(90, 1, 'Импульсная трубка автоматики КАРЕ 500мм, ø4мм', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Импульсная трубка запальника для газовой автоматики КАРЕ&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется для соединения терморегулятор - мембранный клапан;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=500 мм;&lt;/span&gt;&lt;/span&gt; &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Диаметр &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;Oslash;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;4мм&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайками.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;В зависимости от габаритных размеров котла может применяться как соединение:&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;ul&gt;\n_x0009_&lt;li&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;терморегулятор - клапан мембранный&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n_x0009_&lt;li&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;датчик тяги - датчик от закипания&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n_x0009_&lt;li&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;терморегулятор - эвакуационная горелка&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n_x0009_&lt;li&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;датчик от закипания - электромагнитный клапан&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n&lt;/ul&gt;\n', '', 'Каре, импульсная трубка, котел', '', 'Импульсная трубка автоматики КАРЕ 500мм, ø4мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Каре, импульсная трубка, котел', ''),
(91, 1, 'Импульсная трубка автоматики КАРЕ 1000мм, ø4мм', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Импульсная трубка запальника для газовой автоматики КАРЕ&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется для соединения терморегулятор - &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;эвакуационная горелка&lt;/span&gt;&lt;/span&gt;;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=1000 мм; Диаметр &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;Oslash;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;4мм&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайками.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;В зависимости от габаритных размеров котла может применяться как соединение:&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;ul&gt;\n_x0009_&lt;li&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;терморегулятор - эвакуационная горелка&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n_x0009_&lt;li&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;датчик тяги - пилотная горелка&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n_x0009_&lt;li&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;датчик от закипания - электромагнитный клапан&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n&lt;/ul&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n', '', 'Каре, импульсная трубка, котел', '', 'Импульсная трубка автоматики КАРЕ 1000мм, ø4мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Каре, импульсная трубка, котел', ''),
(92, 1, 'Трубка запальника Арбат, Комфорт, Пламя 400мм, ø4мм', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для котлов с автоматикой Арбат-11, Комфорт, Пламя&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Служит для соединения запальника с блоком клапанов автоматики&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=400 мм; Диаметр &amp;Oslash;4мм&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайкой и ниппелем&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Арбат, Комфорт, Пламя, трубка запальника', '', 'Трубка запальника Арбат, Комфорт, Пламя 400мм, ø4мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Арбат, Комфорт, Пламя, трубка запальника', ''),
(93, 1, 'Трубка запальника Евроказ, Факел 400мм, ø4мм', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для котлов с автоматикой Евроказ, Факел-2М&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Служит для соединения запальника с блоком клапанов автоматики;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайкой и ниппелем;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=400 мм; Диаметр &amp;Oslash;4мм.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Евроказ, Факел, трубка запальника', '', 'Трубка запальника Евроказ, Факел 400мм, ø4мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Евроказ, Факел, трубка запальника', ''),
(94, 1, 'Трубка запальника Beretta Idrabagno 220мм, ø4мм', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для водяного нагревателя&amp;nbsp;Beretta Idrabagno&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Служит для соединения запальника с газовым клапаном колонки;&amp;nbsp; Укомплектована необходимыми для монтажа крепежными элементами;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=220 мм; Диаметр &amp;Oslash;4мм.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Может применяться в моделях:&amp;nbsp; Idrabagno Aqua -11, -11i, -14, -14i, -17, -17i&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Beretta, Беретта, колонка, трубка запальника', '', 'Трубка запальника Beretta Idrabagno 220мм, ø4мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Beretta, Беретта, колонка, трубка запальника', ''),
(95, 1, 'Импульсная трубка автоматики АПОК-1 800мм/400мм', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Т-образная и&lt;/span&gt;мпульсная трубка для газовой автоматики АПОК-1&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Служит для соединения клапана-отсекателя с датчиком пламени и датчиком тяги;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа тремя гайками М10&lt;/span&gt;&lt;/span&gt;;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=800/400 мм;&lt;/span&gt;&lt;/span&gt; &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Диаметр &amp;Oslash;4мм.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'АПОК-1, импульсная трубка', '', 'Импульсная трубка автоматики АПОК-1 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АПОК-1, импульсная трубка', ''),
(96, 1, 'Термопара Термо 350мм М8 универсальная', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Термо 350мм М8 универсальная&lt;/strong&gt; применяется в парапетных газовых котлах Термо&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;350 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;универсальный с длинной резьбой&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;2 медных провода&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;35 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Термо 350мм М8 универсальная упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'Термо, котел, термопара', '', 'Термопара Термо 350мм М8 универсальная по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Термо, котел, термопара', ''),
(97, 1, 'Термопара Термо 350мм М9 универсальная', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Термо 350мм М9 универсальная&lt;/strong&gt; применяется в парапетных газовых котлах Термо&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;350 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;универсальный с длинной резьбой&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС&amp;nbsp;при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;2 медных провода&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;35 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Термо 350мм М9 универсальная упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'Термо, котел, термопара', '', 'Термопара Термо 350мм М9 универсальная по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Термо, котел, термопара', ''),
(98, 1, 'Термопара Honeywell 600мм 11/32&quot;', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Honeywell 600мм 11/32&amp;quot;&lt;/strong&gt; применяется для газовых котлов и конвекторов с автоматикой HONEYWELL V5475G (Q335C 1031B/1023B), например таких как Данко, Проскуров, Маяк, Житомир, FEG и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А4 + штуцер 7/16&amp;quot; под ключ 12&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер 11/32&amp;quot; под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;50 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Honeywell 600мм 11/32 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара Honeywell, котел, Маяк, Проскуров', '', 'Термопара Honeywell 600мм 11/32&quot; по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Honeywell, термопара', ''),
(99, 1, 'Биметаллическая пластина автоматики АПОК-1', '&lt;p&gt;Биметаллическая пластина для газовой автоматики АПОК-1.&lt;/p&gt;\n\n&lt;p&gt;Служит составной частью датчика пламени, контролирующего пламя в котле.&lt;/p&gt;\n', '', 'АПОК-1, биметаллическая пластина, датчик пламени', '', 'Биметаллическая пластина автоматики АПОК-1 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АПОК-1, биметаллическая пластина, датчик пламени', ''),
(100, 1, 'Клапан-отсекатель автоматики АПОК-1', '&lt;p&gt;Клапан-отсекатель для газовой автоматики АПОК-1;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;Входной и выходной патрубки 1/2&amp;quot;.&lt;/p&gt;\n\n&lt;p&gt;Материал: силумин (кремний-алюминий);&lt;/p&gt;\n\n&lt;p&gt;Является основным узлом автоматики безопасности.&lt;/p&gt;\n\n&lt;p&gt;Имеет три выхода:&lt;/p&gt;\n\n&lt;ul&gt;\n_x0009_&lt;li&gt;основной - на запорно-регулирующий кран;&lt;/li&gt;\n_x0009_&lt;li&gt;к штуцеру верхней крышки для подачи газа на запальную горелку;&lt;/li&gt;\n_x0009_&lt;li&gt;к штуцеру нижней крышки для подачи газа к датчику тяги и датчику погасания пламени;&lt;/li&gt;\n&lt;/ul&gt;\n', '', 'АПОК-1, клапан-отсекатель', '', 'Клапан-отсекатель автоматики АПОК-1 купить в магазине Termopara.Net. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АПОК-1, клапан-отсекатель', ''),
(101, 1, 'Мембрана водяного регулятора ВПГ белая', '&lt;p&gt;Мембрана для водяного регулятора газовых колонок ВПГ 18/20/23/23М, НЕВА3208&lt;/p&gt;\n\n&lt;p&gt;Материал: белая вакуумная резина&lt;/p&gt;\n\n&lt;p&gt;Толщина 2мм.&lt;/p&gt;\n', '', 'ВПГ, мембрана, колонка', '', 'Мембрана водяного регулятора ВПГ белая по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'ВПГ, мембрана, колонка', ''),
(102, 1, 'Мембрана водяного регулятора ВПГ черная 1,5мм', '&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Мембрана для водяного регулятора газовых колонок ВПГ 18/20/23/23М, НЕВА3208;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Материал: резина ТМКЩ (черная);&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Толщина 1,5мм.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'ВПГ, мембрана, колонка', '', 'Мембрана водяного регулятора ВПГ черная 1,5мм купить по цене производителя. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'ВПГ, мембрана, колонка', ''),
(103, 1, 'Медная трубка для смесителя 300мм, М10-½&quot; ', '&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Медная подводная трубка для подключения смесителя&amp;nbsp; М10 x ½&quot;;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Длина L=300мм&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Гайка 1/2&quot;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Игла М10*1;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Укомплектована резиновой прокладкой.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Данный вид трубок отличается своим качеством и возможностью г&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;нуть к требуемой траектории.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Можно использoвать в системах с рабочим давлением до 10 атмосфер.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'трубка подводная, трубка смесителя', '', 'Медная трубка для смесителя 300мм, М10-½&quot; купить по цене производителя. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', '', ''),
(104, 1, 'Терморегулятор автоматики АПОК-1', '&lt;p&gt;Терморегулятор автоматики АПОК-1 для газовых котлов&lt;/p&gt;\n\n&lt;p&gt;Двухкрышечная конструкция корпуса&lt;/p&gt;\n\n&lt;p&gt;Материал: силумин (кремний-алюминий)&lt;/p&gt;\n\n&lt;p&gt;Резьбовое подсоединение к котлу 1/2&amp;quot;&lt;/p&gt;\n\n&lt;p&gt;Подходит ко всем котлам, где установлена данная автоматика (КЧМ, КСТ и другие)&lt;/p&gt;\n', '', 'АПОК-1, терморегулятор', '', 'Терморегулятор автоматики АПОК-1 купить в магазине Termopara.Net. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АПОК-1, терморегулятор', ''),
(105, 1, 'Терморегулятор автоматики АПОК-1 ', '&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Терморегулятор автоматики АПОК-1 для газовых котлов;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Двухкрышечная конструкция корпуса;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Материал: ЦАМ (цинк-алюминий-медь);&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Резьбовое подсоединение к котлу 1/2&quot;.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n', '', 'АПОК-1, терморегулятор', '', 'Терморегулятор автоматики АПОК-1 купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'АПОК-1, терморегулятор', ''),
(106, 1, 'Терморегулятор автоматики АПОК-1 ', '&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Терморегулятор автоматики АПОК-1 для газовых котлов;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Двухкрышечная конструкция корпуса;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Материал: ЦАМ &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;(цинк-алюминий-медь)&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Резьбовое подсоединение к котлу 3/4&quot;.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n', '', 'АПОК-1, терморегулятор', '', 'Терморегулятор автоматики АПОК-1 купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'АПОК-1, терморегулятор', ''),
(107, 1, 'Медная трубка для смесителя 400мм, М10-½&quot;', '&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Медная подводная трубка для подключения смесителя&amp;nbsp; М10 x ½&quot;;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Длина L=400мм&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Гайка 1/2&quot;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Игла М10*1;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Укомплектована резиновой прокладкой.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Данный вид трубок отличается своим качеством и возможностью г&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;нуть к требуемой траектории.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Можно использoвать в системах с рабочим давлением до 10 атмосфер.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'трубка подводная, трубка смесителя', '', 'Медная трубка для смесителя 400мм, М10-½&quot; купить по цене производителя. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', '', ''),
(108, 1, 'Термопара SIT А1 1200мм М9 (0.200.019)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A1 1200мм М9 (0.200.019)&lt;/strong&gt; применяется для газовых котлов с автоматикой EuroSIT, например таких как Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;1200 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А1&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;90 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A1 1200мм М9 (0.200.019) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А1 1200мм М9 (0.200.019) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(109, 1, 'Трубка запальника автоматики АПОК 950мм', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для газовой пневматической автоматики АПОК&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Служит для соединения клапана-отсекателя с запальником;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайкой М10 и ниппелем&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=950 мм;&amp;nbsp; Диаметр &amp;Oslash;4мм.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'АПОК-1, трубка запальника', '', 'Трубка запальника автоматики АПОК 950мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АПОК-1, трубка запальника', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `description_mini`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(110, 1, 'Медная трубка для смесителя 500мм, М10-½&quot;', '&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Медная подводная трубка для подключения смесителя&amp;nbsp; М10 x ½&quot;;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Длина L=500мм&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Гайка 1/2&quot;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Игла М10*1;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Укомплектована резиновой прокладкой.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Данный вид трубок отличается своим качеством и возможностью г&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;нуть к требуемой траектории.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Можно использoвать в системах с рабочим давлением до 10 атмосфер.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'трубка подводная, трубка смесителя', '', 'Медная трубка для смесителя 500мм, М10-½&quot; купить по цене производителя. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', '', ''),
(111, 1, 'Медная трубка для смесителя 600мм, М10-½&quot;', '&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Медная подводная трубка для подключения смесителя&amp;nbsp; М10 x ½&quot;;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Длина L=600мм&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Гайка 1/2&quot;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Игла М10*1;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Укомплектована резиновой прокладкой.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Данный вид трубок отличается своим качеством и возможностью г&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;нуть к требуемой траектории.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Можно использoвать в системах с рабочим давлением до 10 атмосфер.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'трубка подводная, трубка смесителя', '', 'Медная трубка для смесителя 600мм, М10-½&quot; купить по цене производителя. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', '', ''),
(112, 1, 'Медная трубка для смесителя 800мм, М10-½&quot;', '&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Медная подводная трубка для подключения смесителя&amp;nbsp; М10 x ½&quot;;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Длина L=800мм&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Гайка 1/2&quot;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Игла М10*1;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Укомплектована резиновой прокладкой.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Данный вид трубок отличается своим качеством и возможностью г&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;нуть к требуемой траектории.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Можно использoвать в системах с рабочим давлением до 10 атмосфер.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'трубка подводная, трубка смесителя', '', 'Медная трубка для смесителя 800мм, М10-½&quot; купить по цене производителя. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', '', ''),
(113, 1, 'Медная трубка для смесителя 1000мм, М10-½&quot;', '&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Медная подводная трубка для подключения смесителя&amp;nbsp; М10 x ½&quot;;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Длина L=1000мм&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Гайка 1/2&quot;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Игла М10*1;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Укомплектована резиновой прокладкой.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Данный вид трубок отличается своим качеством и возможностью г&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;нуть к требуемой траектории.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Можно использoвать в системах с рабочим давлением до 10 атмосфер.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'трубка подводная, трубка смесителя', '', 'Медная трубка для смесителя 1000мм, М10-½&quot; купить по цене производителя. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', '', ''),
(114, 1, 'Термопара Арбат 345мм М9', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Арбат 345мм М9&lt;/strong&gt; применяется для газовых котлов с автоматикой Арбат, например таких как РОСС, Житомир, Вулкан, Данко, Атон, Термо, Дани, Маяк, Колви и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;345 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А17 резьба М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Арбат 345мм М9 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, Арбат, котел, РОСС, Житомир, Вулкан, Данко, Атон, Термо-бар, Дани, Маяк, Колви', '', 'Термопара Арбат 345мм М9 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Арбат, термопара, котел', ''),
(115, 1, 'Термопара Арбат 600мм М9', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Арбат 600мм М9&lt;/strong&gt; применяется для газовых котлов с автоматикой Арбат, например таких как РОСС, Житомир, Вулкан, Данко, Атон, Термо, Дани, Маяк, Колви и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А17 резьба М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;50 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Арбат 600мм М9 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, Арбат, котел, РОСС, Житомир, Вулкан, Данко, Атон, Термо-бар, Дани, Маяк, Колви', '', 'Термопара Арбат 600мм М9 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Арбат, термопара, котел', ''),
(116, 1, 'Термопара Арбат 900мм М9', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Арбат 900мм М9&lt;/strong&gt; применяется для газовых котлов с автоматикой Арбат, например таких как РОСС, Житомир, Вулкан, Данко, Атон, Термо, Дани, Маяк, Колви и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;900 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А17 резьба М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;70 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Арбат 900мм М9 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, Арбат, котел, РОСС, Житомир, Вулкан, Данко, Атон, Термо-бар, Дани, Маяк, Колви', '', 'Термопара Арбат 900мм М9 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Арбат, термопара, котел', ''),
(117, 1, 'Термопара SIT А1 850мм М9 (0.200.013)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A1 850мм М9 (0.200.013)&lt;/strong&gt; применяется для газовых котлов с автоматикой EuroSIT, например таких как Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;850 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А1&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;65 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A1 850мм М9 (0.200.013) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А1 850мм М9 (0.200.013) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(118, 1, 'Термопара SIT А2 400мм М9 (0.200.231)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A2 400мм М9 (0.200.231)&lt;/strong&gt; применяется в газовых конвекторах Атон, Данко, Сутиски, Модуль, АКОГ, Росс, Ваxi, Gorenje, Feg, Demrad, Lampart и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;400 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А2&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;35 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A2 400мм М9 (0.200.231) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А2 400мм М9 (0.200.231) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, конвектор, термопара', ''),
(119, 1, 'Термопара SIT А2 600мм М9 (0.200.233)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A2 600мм М9 (0.200.233)&lt;/strong&gt; применяется в газовых конвекторах Атон, Данко, Сутиски, Модуль, АКОГ, Росс, Ваxi, Gorenje, Feg, Demrad, Lampart и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А2&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;50 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A2 600мм М9 (0.200.233) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А2 600мм М9 (0.200.233) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, конвектор, термопара', ''),
(120, 1, 'Термопара универсальная 900мм с комплектом крепления', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара универсальная 900мм с комплектом крепления&lt;/strong&gt; может применяться в газовых духовках, котлах, конвекторах и водонагревателях разного типа. В комплект входит набор крепежных элементов для подсоединения термопары к любым сочетаниям горелки и клапана.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;900 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Крепление оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;цанговая гайка, 2 конусные гайки&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;М8х1, М9х1, М9х0.75, М10х1&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;90 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары упакованы в ПЭ пакеты с этикеткой и вкладышем. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара универсальная 900мм с комплектом крепления по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'котел, конвектор, термопара', ''),
(121, 1, 'Термопара SIT А3 600мм М9 (0.200.055)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A3 600мм М9 (0.200.055)&lt;/strong&gt; применяется в газовых котлах, оснащенных блоком автоматики EuroSIT, Арбат (с 2008г), ОРИОН, HONEYWELL, Евроказ, Факел-2М, FEG и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А3&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;50 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A3 600мм М9 (0.200.055) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А3 600мм М9 (0.200.055) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(122, 1, 'Термопара SIT А3 900мм М9 (0.200.058)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A3 900мм М9 (0.200.058)&lt;/strong&gt; применяется в газовых котлах, оснащенных блоком автоматики EuroSIT, Арбат (с 2008г), ОРИОН, HONEYWELL, Евроказ, Факел-2М, FEG и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;900 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А3&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;70 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A3 900мм М9 (0.200.058) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А3 900мм М9 (0.200.058) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(123, 1, 'Термопара SIT А2 320мм М9 (0.200.230)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A2 320мм М9 (0.200.230)&lt;/strong&gt; применяется в газовых конвекторах Атон, Данко, Сутиски, Модуль, АКОГ, Росс, Ваxi, Gorenje, Feg, Demrad, Lampart и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;320 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А2&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A2 320мм М9 (0.200.230) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А2 320мм М9 (0.200.230) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, конвектор, термопара', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `description_mini`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(124, 1, 'Термопара SIT А1 600мм М8 (0.200.124)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A1 600мм М8 (0.200.124)&lt;/strong&gt; применяется для газовых котлов с автоматикой EuroSIT, например таких как Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А1&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;50 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A1 600мм М8 (0.200.124) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А1 600мм М8 (0.200.124) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(125, 1, 'Термопара Термо 350мм М8', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Термо 350мм М8&lt;/strong&gt; применяется в парапетных газовых котлах Термо&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;350 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;оригинальный с резьбой М8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;2 медных провода&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Термо 350мм М8 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'Термо, котел, термопара', '', 'Термопара Термо 350мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Термо, котел, термопара', ''),
(127, 1, 'Термопара Термо 350мм М9', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Термо 350мм М9&lt;/strong&gt; применяется в парапетных газовых котлах Термо&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;350 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;оригинальный с резьбой М8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;2 медных провода&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Термо 350мм М9 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'Термо, котел, термопара', '', 'Термопара Термо 350мм М9 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Термо, котел, термопара', ''),
(128, 1, 'Термопара духовки Orion ORSK', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара (газ-контроль) газовой плиты Orion ORSK&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L = 1000 мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану - ножевая клемма&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Гайка крепления оголовка М8х1.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Orion, Орион, термопара, духовка, газплита, газконтроль', '', 'Термопара духовки газовой плиты Orion ORSK по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Orion, Орион, термопара, духовка, газплита, газконтроль', ''),
(129, 1, 'Термопара колонки Beretta Idrabagno (до 2006г)', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара для газовых проточных нагревателей Beretta модель Idrabagno&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=350мм;&lt;/span&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&lt;br /&gt;\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану штуцером М9х1&lt;/span&gt;&lt;/span&gt;.&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Может быть установлена в моделях&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;:&lt;/p&gt;\n\n&lt;ul&gt;\n_x0009_&lt;li&gt;\n_x0009_&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Beretta Idrabagno-10&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n_x0009_&lt;/li&gt;\n_x0009_&lt;li&gt;\n_x0009_&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Beretta Idrabagno-11&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n_x0009_&lt;/li&gt;\n_x0009_&lt;li&gt;\n_x0009_&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Beretta Idrabagno-11i&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n_x0009_&lt;/li&gt;\n_x0009_&lt;li&gt;\n_x0009_&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Beretta Idrabagno-13&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n_x0009_&lt;/li&gt;\n_x0009_&lt;li&gt;\n_x0009_&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Beretta Idrabagno-14&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n_x0009_&lt;/li&gt;\n_x0009_&lt;li&gt;\n_x0009_&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Beretta Idrabagno-17&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n_x0009_&lt;/li&gt;\n_x0009_&lt;li&gt;\n_x0009_&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Beretta Idrabagno-17i&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n_x0009_&lt;/li&gt;\n&lt;/ul&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;до 2006 года выпуска&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Beretta, Беретта, колонка, термопара', '', 'Термопара газовой колонки Beretta Idrabagno (до 2006г) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Beretta, Беретта, колонка, термопара', ''),
(130, 1, 'Термопара АОГВ-29', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара АОГВ-29&lt;/strong&gt; применяется для газовых котлов &lt;span style=&quot;font-size:16px&quot;&gt;АОГВ-23, АОГВ-29&lt;/span&gt; старого образца производства ЗАО &amp;laquo;Ростовгазоаппарат&amp;raquo;.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;860 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;открытый&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;М12х1,25&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 15 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;6 + (0.012 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медная труба&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;110 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары АОГВ-29 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, АОГВ, котел', '', 'Термопара газового котла АОГВ-29 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АОГВ-29, термопара, котел', ''),
(131, 1, 'Термопара АОГВ-35', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара АОГВ-35&lt;/strong&gt; применяется для газовых котлов АОГВ-35 старого образца производства ЗАО &amp;laquo;Ростовгазоаппарат&amp;raquo;.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;920 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;открытый&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;М12х1,25&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 15 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;6 + (0.012 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медная труба&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;120 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары АОГВ-35 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, АОГВ, котел', '', 'Термопара АОГВ-35 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900\n', 'АОГВ, термопара, котел', ''),
(132, 1, 'Термопара духовки Hansa 1200мм', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара духовки газовой плиты Hansa&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L = 1200 мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану - клеммы&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Гайка крепления оголовка М8х1.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Hansa, Ханса, термопара, духовка, газплита, газконтроль', '', 'Термопара газовой духовки Hansa 1200мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Hansa, Ханса, термопара, духовка, газплита, газконтроль', ''),
(133, 1, 'Термопара Арбат 1200мм М8', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Арбат 1200мм М8&lt;/strong&gt; применяется для газовых котлов с автоматикой Арбат, например таких как РОСС, Житомир, Вулкан, Данко, Атон, Термо, Дани, Маяк, Колви и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;1200 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А17 резьба М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М8 под ключ 8&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;90 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Арбат 1200мм М8 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, Арбат, котел, РОСС, Житомир, Вулкан, Данко, Атон, Термо-бар, Дани, Маяк, Колви', '', 'Термопара Арбат 1200мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Арбат, термопара, котел', ''),
(134, 1, 'Термопара колонки Beretta Aqua', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара&amp;nbsp; для&amp;nbsp; газовых&amp;nbsp; проточных&amp;nbsp; нагревателей&amp;nbsp; Beretta&amp;nbsp; Aqua&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=360/380/680мм;&lt;/span&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану штуцером М8х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к датчику - ножевые клеммы(мама).&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Может быть установлена в моделях &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Beretta, Беретта, колонка, термопара', '', 'Термопара газовой колонки Beretta Aqua по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Beretta, Беретта, колонка, термопара', ''),
(135, 1, 'Термопара духовки BEKO 1100мм М8', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара духовки газовой плиты BEKO&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L = 1100 мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану - штуцер М8х1.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'ВЕКО, термопара, духовка, газплита', '', 'Термопара духовки газплиты BEKO 1100мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'ВЕКО, термопара, духовка, газплита', ''),
(136, 1, 'Термопара гриля BEKO 350мм М8', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара гриля газовой плиты BEKO&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L = 350 мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану - штуцером М8х1.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'ВЕКО, термопара, гриль, газплита', '', 'Термопара гриля газплиты BEKO 350мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'ВЕКО, термопара, гриль, газплита', ''),
(137, 1, 'Запальник автоматики АПОК-1', '&lt;p&gt;Запальная горелка для газовой автоматики АПОК-1&lt;/p&gt;\n', '', 'АПОК-1, запальник', '', 'Запальник автоматики АПОК-1 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АПОК-1, запальник', ''),
(138, 1, 'Запальник автоматики Пламя', '&lt;p&gt;Запальная горелка для газовой автоматики Пламя, Арбат, Вулкан&lt;/p&gt;\n', '', 'Пламя, запальник', '', 'Запальник автоматики Пламя по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Пламя, запальник', ''),
(139, 1, 'Стакан термобаллона 100мм, ø10мм, внутренняя резьба ½&quot;', '&lt;p&gt;Стакан медный под термобаллон&lt;br /&gt;\nL=100мм&lt;br /&gt;\nНаружный диаметр трубки 10мм&lt;br /&gt;\nвнутренний диаметр 9мм&lt;br /&gt;\nвнутреннее резьбовое соединение 1/2&amp;quot;&lt;/p&gt;\n', '', 'стакан термобаллона', '', 'Стакан термобаллона 100мм, ø10мм, внутренняя резьба ½&quot; по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'стакан термобаллона', ''),
(140, 1, 'Стакан термобаллона 100мм, ø10мм, наружная резьба ½&quot;', '&lt;p&gt;Стакан медный под термобаллон&lt;br /&gt;\nL=100мм&lt;br /&gt;\nНаружный диаметр трубки 10мм&lt;br /&gt;\nвнутренний диаметр 9мм&lt;br /&gt;\nнаружное резьбовое соединение 1/2&amp;quot;&lt;/p&gt;\n', '', 'стакан термобаллона', '', 'Стакан термобаллона 100мм, ø10мм, наружная резьба ½&quot; по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'стакан термобаллона', ''),
(141, 1, 'Гайка разрезная М8х1 (G6.032.011)', '&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Латунная разрезная гайка М8х1. Используется для крепления термопары в электромагнитном клапане&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'гайка, гайка разрезная, гайка термопары', '', 'Гайка разрезная М8х1 (G6.032.011) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'гайка, гайка разрезная, гайка термопары', ''),
(142, 1, 'Гайка разрезная М9х1 (G6.032.010)', '&lt;p&gt;Латунная разрезная гайка М9х1. Используется для крепления термопары в электромагнитном клапане&lt;/p&gt;\n', '', 'гайка, гайка разрезная, гайка термопары', '', 'Гайка разрезная М9х1 (G6.032.010) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'гайка, гайка разрезная, гайка термопары', ''),
(143, 1, 'Гайка разрезная М10х1 (G6.032.009)', '&lt;p&gt;Латунная разрезная гайка М10х1. Используется для крепления термопары в электромагнитном клапане&lt;/p&gt;\n', '', 'гайка, гайка разрезная, гайка термопары', '', 'Гайка разрезная М10х1 (G6.032.009) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'гайка, гайка разрезная, гайка термопары', ''),
(144, 1, 'Стакан термобаллона 105мм, ø16мм, наружная резьба ½&quot;', '&lt;p&gt;Стакан медный под термобаллон&lt;br /&gt;\nL=105мм&lt;br /&gt;\nНаружный диаметр трубки 16мм&lt;br /&gt;\nвнутренний диаметр 15мм&lt;br /&gt;\nнаружное резьбовое соединение 1/2&amp;quot;&lt;/p&gt;\n', '', 'стакан термобаллона', '', 'Стакан термобаллона 105мм, ø16мм, наружная резьба ½&quot; по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'стакан термобаллона', ''),
(145, 1, 'Термопара SIT А1 400мм М10 (0.200.025)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A1 400мм М10 (0.200.025)&lt;/strong&gt; применяется для газовых конвекторах, например таких как Атон, Данко, Сутиски, Модуль, АКОГ, Росс, Ваxi, Gorenje, Feg, Demrad, Lampart и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;400 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А1&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М10 под ключ 10&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;35 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A1 400мм М10 (0.200.025) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А1 400мм М10 (0.200.025) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(146, 1, 'Трубка запальника автоматики АПОК 1200мм', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для газовой пневматической автоматики АПОК&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Служит для соединения клапана-отсекателя с запальником;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайкой М10 и ниппелем&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=1200 мм;&amp;nbsp; Диаметр &amp;Oslash;4мм.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'АПОК-1, трубка запальника', '', 'Трубка запальника автоматики АПОК 1200мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АПОК-1, трубка запальника', ''),
(147, 1, 'Термопара Honeywell 900мм 11/32&quot;', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Honeywell 900мм 11/32&amp;quot;&lt;/strong&gt; применяется для газовых котлов и конвекторов с автоматикой HONEYWELL V5475G (Q335C 1031B/1023B), например таких как Данко, Проскуров, Маяк, Житомир, FEG и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;900 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А4 + штуцер 7/16&amp;quot; под ключ 12&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер 11/32&amp;quot; под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;70 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Honeywell 900мм 11/32 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара Honeywell, котел, Маяк, Проскуров', '', 'Термопара Honeywell 900мм 11/32&quot; по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Honeywell, термопара, котел', ''),
(148, 1, 'Термопара SIT A1 1200мм М8 (0.200.000)', '&lt;h1&gt;&lt;span style=&quot;color:#024b8a;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Термопара для газовых котлов и конвекторов с автоматикой EuroSIT&amp;nbsp; &lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/h1&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Длина&amp;nbsp; L=&lt;strong&gt;1200мм&amp;nbsp; &lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Подсоединение к клапану штуцером&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;М8х1&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Код SIT 0.200.000&lt;/span&gt;&lt;/span&gt; &lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;(Тип оголовка А1&lt;/span&gt;&lt;/span&gt;)&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;font-family: arial,helvetica,sans-serif;&quot;&gt;Применяется в газовых котлах и конвекторах: Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов и др.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT A1 1200мм М8 (0.200.000) купить по цене производителя. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'EuroSIT, СИТ, котел, конвектор, термопара', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `description_mini`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(149, 1, 'Термопара SIT А1 850мм М10 (0.200.029)', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A1 850мм М10 (0.200.029)&lt;/strong&gt; применяется для газовых конвекторах, например таких как Атон, Данко, Сутиски, Модуль, АКОГ, Росс, Ваxi, Gorenje, Feg, Demrad, Lampart и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;850 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А1&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М10 под ключ 10&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;65 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A1 850мм М10 (0.200.029) упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А1 850мм М10 (0.200.029) по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара', ''),
(150, 1, 'Импульсная трубка автоматики КАРЕ 350мм, ø4мм', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Импульсная трубка запальника для газовой автоматики КАРЕ&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется для соединения терморегулятор - мембранный клапан;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=350 мм;&lt;/span&gt;&lt;/span&gt; &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Диаметр &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;Oslash;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;4мм&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Укомплектована необходимыми для монтажа гайками.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;В зависимости от габаритных размеров котла может применяться как соединение:&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;ul&gt;\n_x0009_&lt;li&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;терморегулятор - клапан мембранный&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n_x0009_&lt;li&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;датчик тяги - датчик от закипания&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n_x0009_&lt;li&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;терморегулятор - эвакуационная горелка&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n_x0009_&lt;li&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;датчик от закипания - электромагнитный клапан&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n&lt;/ul&gt;\n', '', 'Каре, импульсная трубка, котел', '', 'Импульсная трубка автоматики КАРЕ 350мм, ø4мм по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Каре, импульсная трубка, котел', ''),
(151, 1, 'Мембрана терморегулятора КАРЕ', '&lt;p&gt;Медная мембрана для терморегулятора газовой автоматики КАРЕ&lt;/p&gt;\n\n&lt;p&gt;Диаметр 40мм, толщина 0,12мм.&lt;/p&gt;\n', '', 'Каре, мембрана, терморегулятор, котел', '', 'Мембрана терморегулятора КАРЕ по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Каре, мембрана, терморегулятор, котел', ''),
(152, 1, 'Шариковый клапан автоматики АПОК-1', '&lt;p&gt;Шариковый клапан для газовой автоматики АПОК-1.&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;Служит составной частью датчика пламени, контролирующего пламя в котле.&lt;/p&gt;\n', '', 'АПОК-1, клапан, датчик пламени', '', 'Шариковый клапан автоматики АПОК-1 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'АПОК-1, клапан, датчик пламени', ''),
(153, 1, 'Трубка запальника Honeywell 300мм, ø4мм М10-М10', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для автоматики Honeywell&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется&lt;/span&gt;&lt;/span&gt; для подключения пилотной горелки к газовому клапану;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=300 мм; Диаметр &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;Oslash;4&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;мм&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется для пилотной горелки Polidoro&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Honeywell, трубка запальника', '', 'Трубка запальника Honeywell 300мм, ø4мм М10-М10 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Honeywell, трубка запальника', ''),
(154, 1, 'Трубка запальника Honeywell 400мм ø4мм М10-7/16&quot;', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Трубка запальника для автоматики Honeywell&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется&lt;/span&gt;&lt;/span&gt; для подключения пилотной горелки к газовому клапану;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L=400 мм; Диаметр &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&amp;Oslash;4&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;мм&lt;/span&gt;&lt;/span&gt;;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Используется с пилотной горелкой Polidoro&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Резьба крепежных штуцеров М10х1 и 7/16&amp;quot;. &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Honeywell, трубка запальника', '', 'Трубка запальника Honeywell 400мм ø4мм М10-7/16&quot; по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Honeywell, трубка запальника', ''),
(155, 1, 'Датчик тяги 60°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 60 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(156, 1, 'Датчик тяги 65°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 65 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(157, 1, 'Датчик тяги 70°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 70 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(158, 1, 'Датчик тяги 75°С (G6070001)', 'Датчик тяги 75 градусов ( G6070001)', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 75 градусов ( G6070001) купить в магазине Termopara.Net. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'датчик тяги, котел, колонка', ''),
(159, 1, 'Датчик тяги 80°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 80 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(160, 1, 'Датчик тяги 85°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 85 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(161, 1, 'Датчик тяги 90°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 90 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(162, 1, 'Датчик тяги 95°С (G6070002)', 'Датчик тяги 95&amp;deg;С (G6070002)', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 95 градусов (G6070002) купить в магазине Termopara.Net. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'датчик тяги, котел, колонка', ''),
(163, 1, 'Датчик тяги 100°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 100 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(164, 1, 'Датчик тяги 105°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 105 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(165, 1, 'Датчик тяги 110°С (G6070004)', 'Датчик тяги 110&amp;deg;С (G6070004)', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 110 градусов (G6070004) купить в магазине Termopara.Net. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'датчик тяги, котел, колонка', ''),
(166, 1, 'Датчик тяги 115°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 115 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(167, 1, 'Датчик тяги 120°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 120 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(168, 1, 'Датчик тяги 125°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 125 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(169, 1, 'Датчик тяги 130°С', '', '', 'датчик тяги, котел, колонка', '', 'Датчик тяги 130 градусов купить в интернет-магазине Termopara.net. Доставка по всей Украине, гарантия, оптовые скидки. тел. (098) 545-49-00, (099) 545-39-00', 'датчик тяги, котел, колонка', ''),
(170, 1, 'Термопара Honeywell 600мм М10', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Honeywell 600мм М10&lt;/strong&gt; применяется для газовых котлов и конвекторов с автоматикой HONEYWELL V5475G (Q335C 1031B/1023B), например таких как Данко, Проскуров, Маяк, Житомир, FEG и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А4 + штуцер 7/16&amp;quot; под ключ 12&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М10 под ключ 10&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;50 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Honeywell 600мм М10 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара Honeywell, котел, Маяк, Проскуров', '', 'Термопара Honeywell 600мм М10 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Honeywell, термопара', ''),
(171, 1, 'Термопара Honeywell 750мм М10', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Honeywell 750мм М10&lt;/strong&gt; применяется для газовых котлов и конвекторов с автоматикой HONEYWELL V5475G (Q335C 1031B/1023B), например таких как Данко, Проскуров, Маяк, Житомир, FEG и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;750 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А4 + штуцер 7/16&amp;quot; под ключ 12&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М10 под ключ 10&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;60 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Honeywell 750мм М10 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара Honeywell, котел, Маяк, Проскуров', '', 'Термопара Honeywell 750мм М10 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Honeywell, термопара', ''),
(172, 1, 'Термопара Honeywell 750мм 11/32&quot;', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Honeywell 750мм 11/32&amp;quot;&lt;/strong&gt; применяется для газовых котлов и конвекторов с автоматикой HONEYWELL V5475G (Q335C 1031B/1023B), например таких как Данко, Проскуров, Маяк, Житомир, FEG и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;750 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А4 + штуцер 7/16&amp;quot; под ключ 12&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер 11/32&amp;quot; под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;60 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Honeywell 750мм 11/32 упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара Honeywell, котел, Маяк, Проскуров', '', 'Термопара Honeywell 750мм 11/32&quot; по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900 - Магазин Termopara.Net', 'Honeywell, термопара', ''),
(173, 1, 'Термопара для газового гриля SIT А1 900мм М9', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара для газовых котлов и конвекторов с автоматикой EuroSIT&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина&amp;nbsp; L=850мм&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану штуцером&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;М9х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Код SIT 0.200.013&lt;/span&gt;&lt;/span&gt; &lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;(Тип оголовка А1&lt;/span&gt;&lt;/span&gt;)&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Применяется в газовых котлах и конвекторах: Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов и др.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, гриль, газовая пушка', '', 'Термопара для газового гриля SIT А1 900мм М9 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, газовый гриль, газовая пушка, термопара', ''),
(174, 1, 'Термопара SIT А1 600мм М9 с гибким проводником', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара SIT A1 600мм М9 с гибким проводником&lt;/strong&gt; применяется для газовых котлов с автоматикой EuroSIT, например таких как Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А1&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;2 медных провода&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;40 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары SIT A1 600мм М9 с гибким проводником упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара, EuroSIT, СИТ, котел, конвектор, Атон, Гелиос, Бар, Данко, Термо, Маяк, Росс, Житомир, Колви, Старобельск, Ростов', '', 'Термопара SIT А1 600мм М9 с гибким проводником по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'EuroSIT, СИТ, котел, конвектор, термопара, гибкий проводник', ''),
(175, 1, 'Термопара Термо 600мм М9 универсальная', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Термо 600мм М9 универсальная&lt;/strong&gt; применяется в парапетных газовых котлах Термо&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;универсальный с длинной резьбой&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М9 под ключ 9&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;ТермоЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;медный капилляр&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;55 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Термо 600мм М9 универсальная упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'Термо, котел, термопара', '', 'Термопара Термо 600мм М9 универсальная по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Термо, котел, термопара', ''),
(176, 1, 'Термопара Honeywell 900мм М10 с гибким проводником', '&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ПРИМЕНЕНИЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;&lt;strong&gt;Термопара Honeywell 900мм М10 (гибкая)&lt;/strong&gt; применяется для газовых котлов и конвекторов с автоматикой HONEYWELL V5475G (Q335C 1031B/1023B), например таких как Данко, Проскуров, Маяк, Житомир, FEG и др.&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;ТЕХНИЧЕСКИЕ ДАННЫЕ:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-left:40px; width:92%&quot;&gt;\n_x0009_&lt;tbody&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Длина (L)&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;900 мм&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td rowspan=&quot;10&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.termopara.net/image/data/drawings/termopara.net-01162-06.jpg&quot; style=&quot;float:left; height:200px; width:250px&quot; /&gt;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Тип оголовка&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;А4 + штуцер 7/16&amp;quot; под ключ 12&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Подсоединение к клапану&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;штуцер М10 под ключ 10&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время срабатывания при розжиге&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;le; 6 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Время отключения при погасании пламени&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;30-60 с&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Термо ЭДС при 100&amp;ordm;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;ge; 30 мВ&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Сопротивление&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;9 + (0.015 х L) &amp;plusmn; 4 m&amp;Omega;&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Максимальная рабочая температура&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;600 &amp;deg;С&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Кондуктор&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;2 медных провода&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009__x0009_&lt;tr&gt;\n_x0009__x0009__x0009_&lt;td&gt;Вес&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;60 г&lt;/td&gt;\n_x0009__x0009__x0009_&lt;td&gt;&amp;nbsp;&lt;/td&gt;\n_x0009__x0009_&lt;/tr&gt;\n_x0009_&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h2&gt;&lt;span style=&quot;font-size:18px&quot;&gt;УПАКОВКА И ДОСТАВКА:&lt;/span&gt;&lt;/h2&gt;\n\n&lt;p style=&quot;margin-left:40px&quot;&gt;Термопары Honeywell 900мм М10 с гибким проводником упакованы в ПЭ пакеты с этикеткой. Для отправки используется картонная тара. Сроки доставки 1-3 дня с момента заказа. Перевозка осуществляется такими компаниями как Новая Почта, Интайм, Деливери или по согласованию с заказчиком.&lt;/p&gt;\n', '', 'термопара Honeywell, котел, Маяк, Проскуров', '', 'Термопара Honeywell 900мм М10 с гибким проводником по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Honeywell, термопара, проводник', ''),
(177, 1, 'Термопара гибкая духовки INDESIT 1200мм М8', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара (газ-контроль) духовки/гриля газовых плит ARISTON INDESIT&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L = 1200 мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану штуцером М8х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Рабочий оголовок без резьбы, с проточкой под защелку&lt;/span&gt;&lt;/span&gt;.&lt;/p&gt;\n', '', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, духовка, гриль', '', 'Термопара гибкая для духовки INDESIT 1200мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, духовка, гриль', ''),
(178, 1, 'Термопара гибкая духовки ARISTON 1200мм М8', '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Термопара (газ-контроль) духовки для газовых плит ARISTON INDESIT&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Длина L = 1200 мм;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Подсоединение к клапану штуцером М8х1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Резьба рабочего оголовка 8х1.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', '', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, духовка', '', 'Термопара гибкая для духовки ARISTON 1200мм М8 по цене производителя. Доставка по Украине, гарантия качества. Специальное предложение оптовикам. +38(099)5453900', 'Ariston, Indesit, Аристон, Индезит, термопара, газконтроль, газплита, духовка', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_discount`
--

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(1, 51, 1, 2, 1, '82.0000', '0000-00-00', '0000-00-00'),
(2, 51, 1, 3, 2, '81.0000', '0000-00-00', '0000-00-00'),
(3, 51, 1, 5, 3, '80.0000', '0000-00-00', '0000-00-00'),
(4, 51, 1, 10, 4, '78.1000', '0000-00-00', '0000-00-00'),
(5, 51, 1, 15, 5, '77.0000', '0000-00-00', '0000-00-00'),
(6, 51, 1, 20, 6, '76.3000', '0000-00-00', '0000-00-00'),
(7, 51, 1, 30, 7, '75.2000', '0000-00-00', '0000-00-00'),
(8, 51, 1, 40, 8, '74.4000', '0000-00-00', '0000-00-00'),
(9, 51, 1, 50, 9, '73.8000', '0000-00-00', '0000-00-00'),
(10, 51, 1, 75, 10, '72.7000', '0000-00-00', '0000-00-00'),
(11, 51, 1, 100, 11, '72.0000', '0000-00-00', '0000-00-00'),
(12, 52, 1, 2, 1, '82.0000', '0000-00-00', '0000-00-00'),
(13, 52, 1, 3, 2, '81.0000', '0000-00-00', '0000-00-00'),
(14, 52, 1, 5, 3, '80.0000', '0000-00-00', '0000-00-00'),
(15, 52, 1, 10, 4, '78.1000', '0000-00-00', '0000-00-00'),
(16, 52, 1, 15, 5, '77.0000', '0000-00-00', '0000-00-00'),
(17, 52, 1, 20, 6, '76.3000', '0000-00-00', '0000-00-00'),
(18, 52, 1, 30, 7, '75.2000', '0000-00-00', '0000-00-00'),
(19, 52, 1, 40, 8, '74.4000', '0000-00-00', '0000-00-00'),
(20, 52, 1, 50, 9, '73.8000', '0000-00-00', '0000-00-00'),
(21, 52, 1, 75, 10, '72.7000', '0000-00-00', '0000-00-00'),
(22, 52, 1, 100, 11, '72.0000', '0000-00-00', '0000-00-00'),
(23, 53, 1, 2, 1, '53.0000', '0000-00-00', '0000-00-00'),
(24, 53, 1, 3, 2, '52.0000', '0000-00-00', '0000-00-00'),
(25, 53, 1, 5, 3, '50.0000', '0000-00-00', '0000-00-00'),
(26, 53, 1, 10, 4, '47.3000', '0000-00-00', '0000-00-00'),
(27, 53, 1, 15, 5, '45.7000', '0000-00-00', '0000-00-00'),
(28, 53, 1, 20, 6, '44.7000', '0000-00-00', '0000-00-00'),
(29, 53, 1, 30, 7, '43.1000', '0000-00-00', '0000-00-00'),
(30, 53, 1, 40, 8, '42.0000', '0000-00-00', '0000-00-00'),
(31, 53, 1, 50, 9, '41.1000', '0000-00-00', '0000-00-00'),
(32, 53, 1, 75, 10, '39.6000', '0000-00-00', '0000-00-00'),
(33, 53, 1, 100, 11, '38.5000', '0000-00-00', '0000-00-00'),
(34, 54, 1, 2, 1, '58.0000', '0000-00-00', '0000-00-00'),
(35, 54, 1, 3, 2, '57.0000', '0000-00-00', '0000-00-00'),
(36, 54, 1, 5, 3, '55.0000', '0000-00-00', '0000-00-00'),
(37, 54, 1, 10, 4, '52.6000', '0000-00-00', '0000-00-00'),
(38, 54, 1, 15, 5, '51.1000', '0000-00-00', '0000-00-00'),
(39, 54, 1, 20, 6, '50.1000', '0000-00-00', '0000-00-00'),
(40, 54, 1, 30, 7, '48.7000', '0000-00-00', '0000-00-00'),
(41, 54, 1, 40, 8, '47.7000', '0000-00-00', '0000-00-00'),
(42, 54, 1, 50, 9, '46.9000', '0000-00-00', '0000-00-00'),
(43, 54, 1, 75, 10, '45.5000', '0000-00-00', '0000-00-00'),
(44, 54, 1, 100, 11, '44.5000', '0000-00-00', '0000-00-00'),
(45, 56, 1, 2, 1, '63.0000', '0000-00-00', '0000-00-00'),
(46, 56, 1, 3, 2, '62.0000', '0000-00-00', '0000-00-00'),
(47, 56, 1, 5, 3, '60.0000', '0000-00-00', '0000-00-00'),
(48, 56, 1, 10, 4, '57.6000', '0000-00-00', '0000-00-00'),
(49, 56, 1, 15, 5, '56.3000', '0000-00-00', '0000-00-00'),
(50, 56, 1, 20, 6, '55.3000', '0000-00-00', '0000-00-00'),
(51, 56, 1, 30, 7, '53.9000', '0000-00-00', '0000-00-00'),
(52, 56, 1, 40, 8, '52.9000', '0000-00-00', '0000-00-00'),
(53, 56, 1, 50, 9, '52.2000', '0000-00-00', '0000-00-00'),
(54, 56, 1, 75, 10, '50.8000', '0000-00-00', '0000-00-00'),
(55, 56, 1, 100, 11, '49.9000', '0000-00-00', '0000-00-00'),
(56, 57, 1, 2, 1, '68.0000', '0000-00-00', '0000-00-00'),
(57, 57, 1, 3, 2, '67.0000', '0000-00-00', '0000-00-00'),
(58, 57, 1, 5, 3, '65.0000', '0000-00-00', '0000-00-00'),
(59, 57, 1, 10, 4, '62.5000', '0000-00-00', '0000-00-00'),
(60, 57, 1, 15, 5, '61.0000', '0000-00-00', '0000-00-00'),
(61, 57, 1, 20, 6, '59.9000', '0000-00-00', '0000-00-00'),
(62, 57, 1, 30, 7, '58.4000', '0000-00-00', '0000-00-00'),
(63, 57, 1, 40, 8, '57.4000', '0000-00-00', '0000-00-00'),
(64, 57, 1, 50, 9, '56.6000', '0000-00-00', '0000-00-00'),
(65, 57, 1, 75, 10, '55.1000', '0000-00-00', '0000-00-00'),
(66, 57, 1, 100, 11, '54.0000', '0000-00-00', '0000-00-00'),
(67, 58, 1, 2, 1, '73.0000', '0000-00-00', '0000-00-00'),
(68, 58, 1, 3, 2, '72.0000', '0000-00-00', '0000-00-00'),
(69, 58, 1, 5, 3, '70.0000', '0000-00-00', '0000-00-00'),
(70, 58, 1, 10, 4, '67.6000', '0000-00-00', '0000-00-00'),
(71, 58, 1, 15, 5, '66.2000', '0000-00-00', '0000-00-00'),
(72, 58, 1, 20, 6, '65.2000', '0000-00-00', '0000-00-00'),
(73, 58, 1, 30, 7, '63.8000', '0000-00-00', '0000-00-00'),
(74, 58, 1, 40, 8, '62.8000', '0000-00-00', '0000-00-00'),
(75, 58, 1, 50, 9, '62.1000', '0000-00-00', '0000-00-00'),
(76, 58, 1, 75, 10, '60.7000', '0000-00-00', '0000-00-00'),
(77, 58, 1, 100, 11, '59.7000', '0000-00-00', '0000-00-00'),
(78, 59, 1, 2, 1, '46.0000', '0000-00-00', '0000-00-00'),
(79, 59, 1, 3, 2, '45.0000', '0000-00-00', '0000-00-00'),
(80, 59, 1, 5, 3, '43.0000', '0000-00-00', '0000-00-00'),
(81, 59, 1, 10, 4, '41.5000', '0000-00-00', '0000-00-00'),
(82, 59, 1, 15, 5, '40.4000', '0000-00-00', '0000-00-00'),
(83, 59, 1, 20, 6, '39.9000', '0000-00-00', '0000-00-00'),
(84, 59, 1, 30, 7, '39.1000', '0000-00-00', '0000-00-00'),
(85, 59, 1, 40, 8, '38.4000', '0000-00-00', '0000-00-00'),
(86, 59, 1, 50, 9, '37.9000', '0000-00-00', '0000-00-00'),
(87, 59, 1, 75, 10, '37.1000', '0000-00-00', '0000-00-00'),
(88, 59, 1, 100, 11, '36.6000', '0000-00-00', '0000-00-00'),
(89, 60, 1, 2, 1, '56.0000', '0000-00-00', '0000-00-00'),
(90, 60, 1, 3, 2, '55.0000', '0000-00-00', '0000-00-00'),
(91, 60, 1, 5, 3, '52.5000', '0000-00-00', '0000-00-00'),
(92, 60, 1, 10, 4, '50.5000', '0000-00-00', '0000-00-00'),
(93, 60, 1, 15, 5, '49.2000', '0000-00-00', '0000-00-00'),
(94, 60, 1, 20, 6, '48.4000', '0000-00-00', '0000-00-00'),
(95, 60, 1, 30, 7, '47.1000', '0000-00-00', '0000-00-00'),
(96, 60, 1, 40, 8, '46.1000', '0000-00-00', '0000-00-00'),
(97, 60, 1, 50, 9, '45.6000', '0000-00-00', '0000-00-00'),
(98, 60, 1, 75, 10, '44.3000', '0000-00-00', '0000-00-00'),
(99, 60, 1, 100, 11, '43.5000', '0000-00-00', '0000-00-00'),
(100, 61, 1, 2, 1, '70.0000', '0000-00-00', '0000-00-00'),
(101, 61, 1, 3, 2, '68.0000', '0000-00-00', '0000-00-00'),
(102, 61, 1, 5, 3, '64.9000', '0000-00-00', '0000-00-00'),
(103, 61, 1, 10, 4, '61.8000', '0000-00-00', '0000-00-00'),
(104, 61, 1, 15, 5, '60.3000', '0000-00-00', '0000-00-00'),
(105, 61, 1, 20, 6, '59.0000', '0000-00-00', '0000-00-00'),
(106, 61, 1, 30, 7, '57.2000', '0000-00-00', '0000-00-00'),
(107, 61, 1, 40, 8, '55.9000', '0000-00-00', '0000-00-00'),
(108, 61, 1, 50, 9, '55.1000', '0000-00-00', '0000-00-00'),
(109, 61, 1, 75, 10, '53.3000', '0000-00-00', '0000-00-00'),
(110, 61, 1, 100, 11, '52.0000', '0000-00-00', '0000-00-00'),
(111, 62, 1, 2, 1, '49.0000', '0000-00-00', '0000-00-00'),
(112, 62, 1, 3, 2, '48.0000', '0000-00-00', '0000-00-00'),
(113, 62, 1, 5, 3, '46.6000', '0000-00-00', '0000-00-00'),
(114, 62, 1, 10, 4, '44.8000', '0000-00-00', '0000-00-00'),
(115, 62, 1, 15, 5, '43.8000', '0000-00-00', '0000-00-00'),
(116, 62, 1, 20, 6, '43.0000', '0000-00-00', '0000-00-00'),
(117, 62, 1, 30, 7, '42.0000', '0000-00-00', '0000-00-00'),
(118, 62, 1, 40, 8, '41.2000', '0000-00-00', '0000-00-00'),
(119, 62, 1, 50, 9, '40.7000', '0000-00-00', '0000-00-00'),
(120, 62, 1, 75, 10, '39.7000', '0000-00-00', '0000-00-00'),
(121, 62, 1, 100, 11, '38.9000', '0000-00-00', '0000-00-00'),
(122, 63, 1, 2, 1, '49.0000', '0000-00-00', '0000-00-00'),
(123, 63, 1, 3, 2, '48.0000', '0000-00-00', '0000-00-00'),
(124, 63, 1, 5, 3, '46.6000', '0000-00-00', '0000-00-00'),
(125, 63, 1, 10, 4, '44.8000', '0000-00-00', '0000-00-00'),
(126, 63, 1, 15, 5, '43.8000', '0000-00-00', '0000-00-00'),
(127, 63, 1, 20, 6, '43.0000', '0000-00-00', '0000-00-00'),
(128, 63, 1, 30, 7, '42.0000', '0000-00-00', '0000-00-00'),
(129, 63, 1, 40, 8, '41.2000', '0000-00-00', '0000-00-00'),
(130, 63, 1, 50, 9, '40.7000', '0000-00-00', '0000-00-00'),
(131, 63, 1, 75, 10, '39.7000', '0000-00-00', '0000-00-00'),
(132, 63, 1, 100, 11, '38.9000', '0000-00-00', '0000-00-00'),
(133, 64, 1, 2, 1, '57.0000', '0000-00-00', '0000-00-00'),
(134, 64, 1, 3, 2, '56.0000', '0000-00-00', '0000-00-00'),
(135, 64, 1, 5, 3, '53.6000', '0000-00-00', '0000-00-00'),
(136, 64, 1, 10, 4, '51.5000', '0000-00-00', '0000-00-00'),
(137, 64, 1, 15, 5, '50.2000', '0000-00-00', '0000-00-00'),
(138, 64, 1, 20, 6, '49.4000', '0000-00-00', '0000-00-00'),
(139, 64, 1, 30, 7, '48.2000', '0000-00-00', '0000-00-00'),
(140, 64, 1, 40, 8, '47.1000', '0000-00-00', '0000-00-00'),
(141, 64, 1, 50, 9, '46.6000', '0000-00-00', '0000-00-00'),
(142, 64, 1, 75, 10, '45.3000', '0000-00-00', '0000-00-00'),
(143, 64, 1, 100, 11, '44.3000', '0000-00-00', '0000-00-00'),
(144, 65, 1, 2, 1, '46.0000', '0000-00-00', '0000-00-00'),
(145, 65, 1, 3, 2, '45.0000', '0000-00-00', '0000-00-00'),
(146, 65, 1, 5, 3, '42.7000', '0000-00-00', '0000-00-00'),
(147, 65, 1, 10, 4, '41.2000', '0000-00-00', '0000-00-00'),
(148, 65, 1, 15, 5, '40.2000', '0000-00-00', '0000-00-00'),
(149, 65, 1, 20, 6, '39.7000', '0000-00-00', '0000-00-00'),
(150, 65, 1, 30, 7, '38.6000', '0000-00-00', '0000-00-00'),
(151, 65, 1, 40, 8, '38.1000', '0000-00-00', '0000-00-00'),
(152, 65, 1, 50, 9, '37.6000', '0000-00-00', '0000-00-00'),
(153, 65, 1, 75, 10, '36.6000', '0000-00-00', '0000-00-00'),
(154, 65, 1, 100, 11, '36.1000', '0000-00-00', '0000-00-00'),
(155, 66, 1, 2, 1, '48.0000', '0000-00-00', '0000-00-00'),
(156, 66, 1, 3, 2, '47.0000', '0000-00-00', '0000-00-00'),
(157, 66, 1, 5, 3, '45.6000', '0000-00-00', '0000-00-00'),
(158, 66, 1, 10, 4, '43.8000', '0000-00-00', '0000-00-00'),
(159, 66, 1, 15, 5, '42.7000', '0000-00-00', '0000-00-00'),
(160, 66, 1, 20, 6, '42.0000', '0000-00-00', '0000-00-00'),
(161, 66, 1, 30, 7, '40.9000', '0000-00-00', '0000-00-00'),
(162, 66, 1, 40, 8, '40.2000', '0000-00-00', '0000-00-00'),
(163, 66, 1, 50, 9, '39.7000', '0000-00-00', '0000-00-00'),
(164, 66, 1, 75, 10, '38.6000', '0000-00-00', '0000-00-00'),
(165, 66, 1, 100, 11, '37.9000', '0000-00-00', '0000-00-00'),
(166, 67, 1, 2, 1, '56.0000', '0000-00-00', '0000-00-00'),
(167, 67, 1, 3, 2, '55.0000', '0000-00-00', '0000-00-00'),
(168, 67, 1, 5, 3, '52.5000', '0000-00-00', '0000-00-00'),
(169, 67, 1, 10, 4, '50.5000', '0000-00-00', '0000-00-00'),
(170, 67, 1, 15, 5, '49.2000', '0000-00-00', '0000-00-00'),
(171, 67, 1, 20, 6, '48.4000', '0000-00-00', '0000-00-00'),
(172, 67, 1, 30, 7, '47.1000', '0000-00-00', '0000-00-00'),
(173, 67, 1, 40, 8, '46.1000', '0000-00-00', '0000-00-00'),
(174, 67, 1, 50, 9, '45.6000', '0000-00-00', '0000-00-00'),
(175, 67, 1, 75, 10, '44.3000', '0000-00-00', '0000-00-00'),
(176, 67, 1, 100, 11, '43.3000', '0000-00-00', '0000-00-00'),
(177, 68, 1, 2, 1, '56.0000', '0000-00-00', '0000-00-00'),
(178, 68, 1, 3, 2, '55.0000', '0000-00-00', '0000-00-00'),
(179, 68, 1, 5, 3, '52.5000', '0000-00-00', '0000-00-00'),
(180, 68, 1, 10, 4, '50.5000', '0000-00-00', '0000-00-00'),
(181, 68, 1, 15, 5, '49.2000', '0000-00-00', '0000-00-00'),
(182, 68, 1, 20, 6, '48.4000', '0000-00-00', '0000-00-00'),
(183, 68, 1, 30, 7, '47.1000', '0000-00-00', '0000-00-00'),
(184, 68, 1, 40, 8, '46.1000', '0000-00-00', '0000-00-00'),
(185, 68, 1, 50, 9, '45.6000', '0000-00-00', '0000-00-00'),
(186, 68, 1, 75, 10, '44.3000', '0000-00-00', '0000-00-00'),
(187, 68, 1, 100, 11, '43.3000', '0000-00-00', '0000-00-00'),
(188, 69, 1, 2, 1, '85.0000', '0000-00-00', '0000-00-00'),
(189, 69, 1, 3, 2, '82.0000', '0000-00-00', '0000-00-00'),
(190, 69, 1, 5, 3, '80.6000', '0000-00-00', '0000-00-00'),
(191, 69, 1, 10, 4, '77.3000', '0000-00-00', '0000-00-00'),
(192, 69, 1, 15, 5, '75.2000', '0000-00-00', '0000-00-00'),
(193, 69, 1, 20, 6, '73.6000', '0000-00-00', '0000-00-00'),
(194, 69, 1, 30, 7, '71.8000', '0000-00-00', '0000-00-00'),
(195, 69, 1, 40, 8, '70.3000', '0000-00-00', '0000-00-00'),
(196, 69, 1, 50, 9, '69.3000', '0000-00-00', '0000-00-00'),
(197, 69, 1, 75, 10, '67.2000', '0000-00-00', '0000-00-00'),
(198, 69, 1, 100, 11, '65.9000', '0000-00-00', '0000-00-00'),
(199, 70, 1, 2, 1, '174.0000', '0000-00-00', '0000-00-00'),
(200, 70, 1, 3, 2, '170.0000', '0000-00-00', '0000-00-00'),
(201, 70, 1, 5, 3, '160.7000', '0000-00-00', '0000-00-00'),
(202, 70, 1, 10, 4, '148.8000', '0000-00-00', '0000-00-00'),
(203, 70, 1, 15, 5, '142.1000', '0000-00-00', '0000-00-00'),
(204, 70, 1, 20, 6, '137.2000', '0000-00-00', '0000-00-00'),
(205, 70, 1, 30, 7, '130.3000', '0000-00-00', '0000-00-00'),
(206, 70, 1, 40, 8, '125.4000', '0000-00-00', '0000-00-00'),
(207, 70, 1, 50, 9, '121.5000', '0000-00-00', '0000-00-00'),
(208, 70, 1, 75, 10, '114.8000', '0000-00-00', '0000-00-00'),
(209, 70, 1, 100, 11, '110.0000', '0000-00-00', '0000-00-00'),
(210, 71, 1, 2, 1, '174.0000', '0000-00-00', '0000-00-00'),
(211, 71, 1, 3, 2, '170.0000', '0000-00-00', '0000-00-00'),
(212, 71, 1, 5, 3, '160.9000', '0000-00-00', '0000-00-00'),
(213, 71, 1, 10, 4, '149.1000', '0000-00-00', '0000-00-00'),
(214, 71, 1, 15, 5, '142.4000', '0000-00-00', '0000-00-00'),
(215, 71, 1, 20, 6, '137.5000', '0000-00-00', '0000-00-00'),
(216, 71, 1, 30, 7, '130.8000', '0000-00-00', '0000-00-00'),
(217, 71, 1, 40, 8, '125.9000', '0000-00-00', '0000-00-00'),
(218, 71, 1, 50, 9, '122.1000', '0000-00-00', '0000-00-00'),
(219, 71, 1, 75, 10, '115.4000', '0000-00-00', '0000-00-00'),
(220, 71, 1, 100, 11, '110.5000', '0000-00-00', '0000-00-00'),
(221, 72, 1, 2, 1, '174.0000', '0000-00-00', '0000-00-00'),
(222, 72, 1, 3, 2, '170.0000', '0000-00-00', '0000-00-00'),
(223, 72, 1, 5, 3, '160.7000', '0000-00-00', '0000-00-00'),
(224, 72, 1, 10, 4, '148.8000', '0000-00-00', '0000-00-00'),
(225, 72, 1, 15, 5, '142.1000', '0000-00-00', '0000-00-00'),
(226, 72, 1, 20, 6, '137.2000', '0000-00-00', '0000-00-00'),
(227, 72, 1, 30, 7, '130.3000', '0000-00-00', '0000-00-00'),
(228, 72, 1, 40, 8, '125.4000', '0000-00-00', '0000-00-00'),
(229, 72, 1, 50, 9, '121.5000', '0000-00-00', '0000-00-00'),
(230, 72, 1, 75, 10, '114.8000', '0000-00-00', '0000-00-00'),
(231, 72, 1, 100, 11, '110.0000', '0000-00-00', '0000-00-00'),
(232, 73, 1, 2, 1, '174.0000', '0000-00-00', '0000-00-00'),
(233, 73, 1, 3, 2, '170.0000', '0000-00-00', '0000-00-00'),
(234, 73, 1, 5, 3, '161.7000', '0000-00-00', '0000-00-00'),
(235, 73, 1, 10, 4, '150.4000', '0000-00-00', '0000-00-00'),
(236, 73, 1, 15, 5, '143.9000', '0000-00-00', '0000-00-00'),
(237, 73, 1, 20, 6, '139.3000', '0000-00-00', '0000-00-00'),
(238, 73, 1, 30, 7, '132.6000', '0000-00-00', '0000-00-00'),
(239, 73, 1, 40, 8, '128.0000', '0000-00-00', '0000-00-00'),
(240, 73, 1, 50, 9, '124.4000', '0000-00-00', '0000-00-00'),
(241, 73, 1, 75, 10, '117.7000', '0000-00-00', '0000-00-00'),
(242, 73, 1, 100, 11, '113.0000', '0000-00-00', '0000-00-00'),
(243, 74, 1, 2, 1, '174.0000', '0000-00-00', '0000-00-00'),
(244, 74, 1, 3, 2, '171.0000', '0000-00-00', '0000-00-00'),
(245, 74, 1, 5, 3, '162.0000', '0000-00-00', '0000-00-00'),
(246, 74, 1, 10, 4, '150.9000', '0000-00-00', '0000-00-00'),
(247, 74, 1, 15, 5, '144.2000', '0000-00-00', '0000-00-00'),
(248, 74, 1, 20, 6, '139.6000', '0000-00-00', '0000-00-00'),
(249, 74, 1, 30, 7, '133.1000', '0000-00-00', '0000-00-00'),
(250, 74, 1, 40, 8, '128.5000', '0000-00-00', '0000-00-00'),
(251, 74, 1, 50, 9, '124.9000', '0000-00-00', '0000-00-00'),
(252, 74, 1, 75, 10, '118.2000', '0000-00-00', '0000-00-00'),
(253, 74, 1, 100, 11, '113.8000', '0000-00-00', '0000-00-00'),
(254, 75, 1, 2, 1, '174.0000', '0000-00-00', '0000-00-00'),
(255, 75, 1, 3, 2, '170.0000', '0000-00-00', '0000-00-00'),
(256, 75, 1, 5, 3, '160.9000', '0000-00-00', '0000-00-00'),
(257, 75, 1, 10, 4, '149.1000', '0000-00-00', '0000-00-00'),
(258, 75, 1, 15, 5, '142.1000', '0000-00-00', '0000-00-00'),
(259, 75, 1, 20, 6, '137.5000', '0000-00-00', '0000-00-00'),
(260, 75, 1, 30, 7, '130.6000', '0000-00-00', '0000-00-00'),
(261, 75, 1, 40, 8, '125.7000', '0000-00-00', '0000-00-00'),
(262, 75, 1, 50, 9, '121.8000', '0000-00-00', '0000-00-00'),
(263, 75, 1, 75, 10, '115.1000', '0000-00-00', '0000-00-00'),
(264, 75, 1, 100, 11, '110.2000', '0000-00-00', '0000-00-00'),
(265, 76, 1, 2, 1, '174.0000', '0000-00-00', '0000-00-00'),
(266, 76, 1, 3, 2, '170.0000', '0000-00-00', '0000-00-00'),
(267, 76, 1, 5, 3, '160.4000', '0000-00-00', '0000-00-00'),
(268, 76, 1, 10, 4, '148.3000', '0000-00-00', '0000-00-00'),
(269, 76, 1, 15, 5, '141.4000', '0000-00-00', '0000-00-00'),
(270, 76, 1, 20, 6, '136.5000', '0000-00-00', '0000-00-00'),
(271, 76, 1, 30, 7, '129.5000', '0000-00-00', '0000-00-00'),
(272, 76, 1, 40, 8, '124.6000', '0000-00-00', '0000-00-00'),
(273, 76, 1, 50, 9, '120.8000', '0000-00-00', '0000-00-00'),
(274, 76, 1, 75, 10, '113.8000', '0000-00-00', '0000-00-00'),
(275, 76, 1, 100, 11, '108.9000', '0000-00-00', '0000-00-00'),
(276, 77, 1, 2, 1, '174.0000', '0000-00-00', '0000-00-00'),
(277, 77, 1, 3, 2, '170.0000', '0000-00-00', '0000-00-00'),
(278, 77, 1, 5, 3, '160.9000', '0000-00-00', '0000-00-00'),
(279, 77, 1, 10, 4, '149.4000', '0000-00-00', '0000-00-00'),
(280, 77, 1, 15, 5, '142.4000', '0000-00-00', '0000-00-00'),
(281, 77, 1, 20, 6, '137.8000', '0000-00-00', '0000-00-00'),
(282, 77, 1, 30, 7, '130.8000', '0000-00-00', '0000-00-00'),
(283, 77, 1, 40, 8, '125.9000', '0000-00-00', '0000-00-00'),
(284, 77, 1, 50, 9, '122.3000', '0000-00-00', '0000-00-00'),
(285, 77, 1, 75, 10, '115.4000', '0000-00-00', '0000-00-00'),
(286, 77, 1, 100, 11, '110.7000', '0000-00-00', '0000-00-00'),
(287, 78, 1, 2, 1, '174.0000', '0000-00-00', '0000-00-00'),
(288, 78, 1, 3, 2, '170.0000', '0000-00-00', '0000-00-00'),
(289, 78, 1, 5, 3, '160.9000', '0000-00-00', '0000-00-00'),
(290, 78, 1, 10, 4, '149.1000', '0000-00-00', '0000-00-00'),
(291, 78, 1, 15, 5, '142.1000', '0000-00-00', '0000-00-00'),
(292, 78, 1, 20, 6, '137.5000', '0000-00-00', '0000-00-00'),
(293, 78, 1, 30, 7, '130.6000', '0000-00-00', '0000-00-00'),
(294, 78, 1, 40, 8, '125.7000', '0000-00-00', '0000-00-00'),
(295, 78, 1, 50, 9, '122.1000', '0000-00-00', '0000-00-00'),
(296, 78, 1, 75, 10, '115.1000', '0000-00-00', '0000-00-00'),
(297, 78, 1, 100, 11, '110.2000', '0000-00-00', '0000-00-00'),
(298, 79, 1, 2, 1, '90.0000', '0000-00-00', '0000-00-00'),
(299, 79, 1, 3, 2, '87.0000', '0000-00-00', '0000-00-00'),
(300, 79, 1, 5, 3, '82.9000', '0000-00-00', '0000-00-00'),
(301, 79, 1, 10, 4, '78.0000', '0000-00-00', '0000-00-00'),
(302, 79, 1, 15, 5, '75.1000', '0000-00-00', '0000-00-00'),
(303, 79, 1, 20, 6, '73.3000', '0000-00-00', '0000-00-00'),
(304, 79, 1, 30, 7, '70.5000', '0000-00-00', '0000-00-00'),
(305, 79, 1, 40, 8, '68.5000', '0000-00-00', '0000-00-00'),
(306, 79, 1, 50, 9, '67.2000', '0000-00-00', '0000-00-00'),
(307, 79, 1, 75, 10, '64.3000', '0000-00-00', '0000-00-00'),
(308, 79, 1, 100, 11, '62.3000', '0000-00-00', '0000-00-00'),
(309, 80, 1, 2, 1, '90.0000', '0000-00-00', '0000-00-00'),
(310, 80, 1, 3, 2, '87.0000', '0000-00-00', '0000-00-00'),
(311, 80, 1, 5, 3, '83.2000', '0000-00-00', '0000-00-00'),
(312, 80, 1, 10, 4, '78.3000', '0000-00-00', '0000-00-00'),
(313, 80, 1, 15, 5, '75.4000', '0000-00-00', '0000-00-00'),
(314, 80, 1, 20, 6, '73.6000', '0000-00-00', '0000-00-00'),
(315, 80, 1, 30, 7, '70.8000', '0000-00-00', '0000-00-00'),
(316, 80, 1, 40, 8, '68.8000', '0000-00-00', '0000-00-00'),
(317, 80, 1, 50, 9, '67.5000', '0000-00-00', '0000-00-00'),
(318, 80, 1, 75, 10, '64.6000', '0000-00-00', '0000-00-00'),
(319, 80, 1, 100, 11, '62.6000', '0000-00-00', '0000-00-00'),
(320, 81, 1, 2, 1, '72.0000', '0000-00-00', '0000-00-00'),
(321, 81, 1, 3, 2, '69.0000', '0000-00-00', '0000-00-00'),
(322, 81, 1, 5, 3, '64.4000', '0000-00-00', '0000-00-00'),
(323, 81, 1, 10, 4, '58.5000', '0000-00-00', '0000-00-00'),
(324, 81, 1, 15, 5, '55.1000', '0000-00-00', '0000-00-00'),
(325, 81, 1, 20, 6, '52.8000', '0000-00-00', '0000-00-00'),
(326, 81, 1, 30, 7, '49.4000', '0000-00-00', '0000-00-00'),
(327, 81, 1, 40, 8, '47.1000', '0000-00-00', '0000-00-00'),
(328, 81, 1, 50, 9, '45.3000', '0000-00-00', '0000-00-00'),
(329, 81, 1, 75, 10, '42.0000', '0000-00-00', '0000-00-00'),
(330, 81, 1, 100, 11, '39.7000', '0000-00-00', '0000-00-00'),
(331, 82, 1, 2, 1, '72.0000', '0000-00-00', '0000-00-00'),
(332, 82, 1, 3, 2, '69.0000', '0000-00-00', '0000-00-00'),
(333, 82, 1, 5, 3, '64.4000', '0000-00-00', '0000-00-00'),
(334, 82, 1, 10, 4, '58.5000', '0000-00-00', '0000-00-00'),
(335, 82, 1, 15, 5, '55.1000', '0000-00-00', '0000-00-00'),
(336, 82, 1, 20, 6, '52.8000', '0000-00-00', '0000-00-00'),
(337, 82, 1, 30, 7, '49.4000', '0000-00-00', '0000-00-00'),
(338, 82, 1, 40, 8, '47.1000', '0000-00-00', '0000-00-00'),
(339, 82, 1, 50, 9, '45.3000', '0000-00-00', '0000-00-00'),
(340, 82, 1, 75, 10, '42.0000', '0000-00-00', '0000-00-00'),
(341, 82, 1, 100, 11, '39.7000', '0000-00-00', '0000-00-00'),
(342, 83, 1, 2, 0, '75.0000', '0000-00-00', '0000-00-00'),
(343, 83, 1, 3, 0, '72.0000', '0000-00-00', '0000-00-00'),
(344, 83, 1, 5, 0, '68.0000', '0000-00-00', '0000-00-00'),
(345, 83, 1, 10, 0, '63.0000', '0000-00-00', '0000-00-00'),
(346, 84, 1, 2, 1, '28.0000', '0000-00-00', '0000-00-00'),
(347, 84, 1, 3, 2, '27.0000', '0000-00-00', '0000-00-00'),
(348, 84, 1, 5, 3, '26.5000', '0000-00-00', '0000-00-00'),
(349, 84, 1, 10, 4, '25.0000', '0000-00-00', '0000-00-00'),
(350, 84, 1, 15, 5, '24.3000', '0000-00-00', '0000-00-00'),
(351, 84, 1, 20, 6, '23.8000', '0000-00-00', '0000-00-00'),
(352, 84, 1, 30, 7, '23.0000', '0000-00-00', '0000-00-00'),
(353, 84, 1, 40, 8, '22.3000', '0000-00-00', '0000-00-00'),
(354, 84, 1, 50, 9, '22.1000', '0000-00-00', '0000-00-00'),
(355, 84, 1, 75, 10, '21.0000', '0000-00-00', '0000-00-00'),
(356, 84, 1, 100, 11, '20.6000', '0000-00-00', '0000-00-00'),
(357, 85, 1, 2, 1, '30.0000', '0000-00-00', '0000-00-00'),
(358, 85, 1, 3, 2, '29.0000', '0000-00-00', '0000-00-00'),
(359, 85, 1, 5, 3, '28.9000', '0000-00-00', '0000-00-00'),
(360, 85, 1, 10, 4, '27.7000', '0000-00-00', '0000-00-00'),
(361, 85, 1, 15, 5, '26.9000', '0000-00-00', '0000-00-00'),
(362, 85, 1, 20, 6, '26.5000', '0000-00-00', '0000-00-00'),
(363, 85, 1, 30, 7, '25.8000', '0000-00-00', '0000-00-00'),
(364, 85, 1, 40, 8, '25.2000', '0000-00-00', '0000-00-00'),
(365, 85, 1, 50, 9, '25.0000', '0000-00-00', '0000-00-00'),
(366, 85, 1, 75, 10, '24.3000', '0000-00-00', '0000-00-00'),
(367, 85, 1, 100, 11, '23.8000', '0000-00-00', '0000-00-00'),
(368, 86, 1, 2, 1, '35.0000', '0000-00-00', '0000-00-00'),
(369, 86, 1, 3, 2, '34.0000', '0000-00-00', '0000-00-00'),
(370, 86, 1, 5, 3, '33.1000', '0000-00-00', '0000-00-00'),
(371, 86, 1, 10, 4, '31.9000', '0000-00-00', '0000-00-00'),
(372, 86, 1, 15, 5, '31.3000', '0000-00-00', '0000-00-00'),
(373, 86, 1, 20, 6, '30.9000', '0000-00-00', '0000-00-00'),
(374, 86, 1, 30, 7, '30.2000', '0000-00-00', '0000-00-00'),
(375, 86, 1, 40, 8, '29.7000', '0000-00-00', '0000-00-00'),
(376, 86, 1, 50, 9, '29.4000', '0000-00-00', '0000-00-00'),
(377, 86, 1, 75, 10, '28.7000', '0000-00-00', '0000-00-00'),
(378, 86, 1, 100, 11, '28.2000', '0000-00-00', '0000-00-00'),
(379, 87, 1, 2, 1, '30.0000', '0000-00-00', '0000-00-00'),
(380, 87, 1, 3, 2, '29.0000', '0000-00-00', '0000-00-00'),
(381, 87, 1, 5, 3, '28.9000', '0000-00-00', '0000-00-00'),
(382, 87, 1, 10, 4, '27.7000', '0000-00-00', '0000-00-00'),
(383, 87, 1, 15, 5, '26.9000', '0000-00-00', '0000-00-00'),
(384, 87, 1, 20, 6, '26.5000', '0000-00-00', '0000-00-00'),
(385, 87, 1, 30, 7, '25.8000', '0000-00-00', '0000-00-00'),
(386, 87, 1, 40, 8, '25.2000', '0000-00-00', '0000-00-00'),
(387, 87, 1, 50, 9, '25.0000', '0000-00-00', '0000-00-00'),
(388, 87, 1, 75, 10, '24.3000', '0000-00-00', '0000-00-00'),
(389, 87, 1, 100, 11, '23.8000', '0000-00-00', '0000-00-00'),
(390, 88, 1, 2, 1, '34.0000', '0000-00-00', '0000-00-00'),
(391, 88, 1, 3, 2, '33.0000', '0000-00-00', '0000-00-00'),
(392, 88, 1, 5, 3, '32.1000', '0000-00-00', '0000-00-00'),
(393, 88, 1, 10, 4, '31.1000', '0000-00-00', '0000-00-00'),
(394, 88, 1, 15, 5, '30.6000', '0000-00-00', '0000-00-00'),
(395, 88, 1, 20, 6, '30.2000', '0000-00-00', '0000-00-00'),
(396, 88, 1, 30, 7, '29.4000', '0000-00-00', '0000-00-00'),
(397, 88, 1, 40, 8, '28.9000', '0000-00-00', '0000-00-00'),
(398, 88, 1, 50, 9, '28.7000', '0000-00-00', '0000-00-00'),
(399, 88, 1, 75, 10, '28.0000', '0000-00-00', '0000-00-00'),
(400, 88, 1, 100, 11, '27.7000', '0000-00-00', '0000-00-00'),
(401, 89, 1, 2, 1, '41.0000', '0000-00-00', '0000-00-00'),
(402, 89, 1, 3, 2, '40.0000', '0000-00-00', '0000-00-00'),
(403, 89, 1, 5, 3, '39.4000', '0000-00-00', '0000-00-00'),
(404, 89, 1, 10, 4, '38.5000', '0000-00-00', '0000-00-00'),
(405, 89, 1, 15, 5, '37.7000', '0000-00-00', '0000-00-00'),
(406, 89, 1, 20, 6, '37.4000', '0000-00-00', '0000-00-00'),
(407, 89, 1, 30, 7, '36.8000', '0000-00-00', '0000-00-00'),
(408, 89, 1, 40, 8, '36.3000', '0000-00-00', '0000-00-00'),
(409, 89, 1, 50, 9, '36.1000', '0000-00-00', '0000-00-00'),
(410, 89, 1, 75, 10, '35.3000', '0000-00-00', '0000-00-00'),
(411, 89, 1, 100, 11, '34.8000', '0000-00-00', '0000-00-00'),
(412, 90, 1, 2, 1, '38.0000', '0000-00-00', '0000-00-00'),
(413, 90, 1, 3, 2, '37.0000', '0000-00-00', '0000-00-00'),
(414, 90, 1, 5, 3, '36.3000', '0000-00-00', '0000-00-00'),
(415, 90, 1, 10, 4, '34.8000', '0000-00-00', '0000-00-00'),
(416, 90, 1, 15, 5, '33.9000', '0000-00-00', '0000-00-00'),
(417, 90, 1, 20, 6, '33.1000', '0000-00-00', '0000-00-00'),
(418, 90, 1, 30, 7, '32.1000', '0000-00-00', '0000-00-00'),
(419, 90, 1, 40, 8, '31.7000', '0000-00-00', '0000-00-00'),
(420, 90, 1, 50, 9, '31.1000', '0000-00-00', '0000-00-00'),
(421, 90, 1, 75, 10, '30.2000', '0000-00-00', '0000-00-00'),
(422, 90, 1, 100, 11, '29.4000', '0000-00-00', '0000-00-00'),
(423, 91, 1, 2, 1, '53.0000', '0000-00-00', '0000-00-00'),
(424, 91, 1, 3, 2, '51.0000', '0000-00-00', '0000-00-00'),
(425, 91, 1, 5, 3, '49.5000', '0000-00-00', '0000-00-00'),
(426, 91, 1, 10, 4, '47.0000', '0000-00-00', '0000-00-00'),
(427, 91, 1, 15, 5, '45.8000', '0000-00-00', '0000-00-00'),
(428, 91, 1, 20, 6, '44.8000', '0000-00-00', '0000-00-00'),
(429, 91, 1, 30, 7, '43.3000', '0000-00-00', '0000-00-00'),
(430, 91, 1, 40, 8, '42.4000', '0000-00-00', '0000-00-00'),
(431, 91, 1, 50, 9, '41.6000', '0000-00-00', '0000-00-00'),
(432, 91, 1, 75, 10, '40.4000', '0000-00-00', '0000-00-00'),
(433, 91, 1, 100, 11, '39.4000', '0000-00-00', '0000-00-00'),
(434, 92, 1, 2, 1, '50.0000', '0000-00-00', '0000-00-00'),
(435, 92, 1, 3, 2, '48.0000', '0000-00-00', '0000-00-00'),
(436, 92, 1, 5, 3, '46.8000', '0000-00-00', '0000-00-00'),
(437, 92, 1, 10, 4, '44.4000', '0000-00-00', '0000-00-00'),
(438, 92, 1, 15, 5, '42.9000', '0000-00-00', '0000-00-00'),
(439, 92, 1, 20, 6, '41.6000', '0000-00-00', '0000-00-00'),
(440, 92, 1, 30, 7, '40.2000', '0000-00-00', '0000-00-00'),
(441, 92, 1, 40, 8, '39.2000', '0000-00-00', '0000-00-00'),
(442, 92, 1, 50, 9, '38.5000', '0000-00-00', '0000-00-00'),
(443, 92, 1, 75, 10, '37.0000', '0000-00-00', '0000-00-00'),
(444, 92, 1, 100, 11, '35.8000', '0000-00-00', '0000-00-00'),
(445, 93, 1, 2, 1, '50.0000', '0000-00-00', '0000-00-00'),
(446, 93, 1, 3, 2, '48.0000', '0000-00-00', '0000-00-00'),
(447, 93, 1, 5, 3, '46.8000', '0000-00-00', '0000-00-00'),
(448, 93, 1, 10, 4, '44.4000', '0000-00-00', '0000-00-00'),
(449, 93, 1, 15, 5, '42.6000', '0000-00-00', '0000-00-00'),
(450, 93, 1, 20, 6, '41.6000', '0000-00-00', '0000-00-00'),
(451, 93, 1, 30, 7, '40.2000', '0000-00-00', '0000-00-00'),
(452, 93, 1, 40, 8, '39.2000', '0000-00-00', '0000-00-00'),
(453, 93, 1, 50, 9, '38.5000', '0000-00-00', '0000-00-00'),
(454, 93, 1, 75, 10, '37.0000', '0000-00-00', '0000-00-00'),
(455, 93, 1, 100, 11, '35.8000', '0000-00-00', '0000-00-00'),
(456, 94, 1, 2, 1, '49.0000', '0000-00-00', '0000-00-00'),
(457, 94, 1, 3, 2, '48.0000', '0000-00-00', '0000-00-00'),
(458, 94, 1, 5, 3, '45.8000', '0000-00-00', '0000-00-00'),
(459, 94, 1, 10, 4, '43.1000', '0000-00-00', '0000-00-00'),
(460, 94, 1, 15, 5, '41.6000', '0000-00-00', '0000-00-00'),
(461, 94, 1, 20, 6, '40.7000', '0000-00-00', '0000-00-00'),
(462, 94, 1, 30, 7, '39.2000', '0000-00-00', '0000-00-00'),
(463, 94, 1, 40, 8, '38.2000', '0000-00-00', '0000-00-00'),
(464, 94, 1, 50, 9, '37.2000', '0000-00-00', '0000-00-00'),
(465, 94, 1, 75, 10, '35.8000', '0000-00-00', '0000-00-00'),
(466, 94, 1, 100, 11, '34.8000', '0000-00-00', '0000-00-00'),
(467, 95, 1, 2, 1, '51.0000', '0000-00-00', '0000-00-00'),
(468, 95, 1, 3, 2, '50.0000', '0000-00-00', '0000-00-00'),
(469, 95, 1, 5, 3, '48.5000', '0000-00-00', '0000-00-00'),
(470, 95, 1, 10, 4, '47.3000', '0000-00-00', '0000-00-00'),
(471, 95, 1, 15, 5, '46.6000', '0000-00-00', '0000-00-00'),
(472, 95, 1, 20, 6, '46.1000', '0000-00-00', '0000-00-00'),
(473, 95, 1, 30, 7, '45.3000', '0000-00-00', '0000-00-00'),
(474, 95, 1, 40, 8, '44.8000', '0000-00-00', '0000-00-00'),
(475, 95, 1, 50, 9, '44.4000', '0000-00-00', '0000-00-00'),
(476, 95, 1, 75, 10, '43.6000', '0000-00-00', '0000-00-00'),
(477, 95, 1, 100, 11, '43.1000', '0000-00-00', '0000-00-00'),
(478, 96, 1, 2, 1, '51.0000', '0000-00-00', '0000-00-00'),
(479, 96, 1, 3, 2, '50.0000', '0000-00-00', '0000-00-00'),
(480, 96, 1, 5, 3, '47.4000', '0000-00-00', '0000-00-00'),
(481, 96, 1, 10, 4, '45.1000', '0000-00-00', '0000-00-00'),
(482, 96, 1, 15, 5, '43.5000', '0000-00-00', '0000-00-00'),
(483, 96, 1, 20, 6, '42.7000', '0000-00-00', '0000-00-00'),
(484, 96, 1, 30, 7, '41.2000', '0000-00-00', '0000-00-00'),
(485, 96, 1, 40, 8, '40.2000', '0000-00-00', '0000-00-00'),
(486, 96, 1, 50, 9, '39.4000', '0000-00-00', '0000-00-00'),
(487, 96, 1, 75, 10, '38.1000', '0000-00-00', '0000-00-00'),
(488, 96, 1, 100, 11, '37.1000', '0000-00-00', '0000-00-00'),
(489, 97, 1, 2, 1, '51.0000', '0000-00-00', '0000-00-00'),
(490, 97, 1, 3, 2, '50.0000', '0000-00-00', '0000-00-00'),
(491, 97, 1, 5, 3, '47.4000', '0000-00-00', '0000-00-00'),
(492, 97, 1, 10, 4, '45.1000', '0000-00-00', '0000-00-00'),
(493, 97, 1, 15, 5, '43.5000', '0000-00-00', '0000-00-00'),
(494, 97, 1, 20, 6, '42.7000', '0000-00-00', '0000-00-00'),
(495, 97, 1, 30, 7, '41.2000', '0000-00-00', '0000-00-00'),
(496, 97, 1, 40, 8, '40.2000', '0000-00-00', '0000-00-00'),
(497, 97, 1, 50, 9, '39.4000', '0000-00-00', '0000-00-00'),
(498, 97, 1, 75, 10, '38.1000', '0000-00-00', '0000-00-00'),
(499, 97, 1, 100, 11, '37.1000', '0000-00-00', '0000-00-00'),
(500, 98, 1, 2, 1, '83.0000', '0000-00-00', '0000-00-00'),
(501, 98, 1, 3, 2, '80.0000', '0000-00-00', '0000-00-00'),
(502, 98, 1, 5, 3, '76.7000', '0000-00-00', '0000-00-00'),
(503, 98, 1, 10, 4, '72.6000', '0000-00-00', '0000-00-00'),
(504, 98, 1, 15, 5, '70.3000', '0000-00-00', '0000-00-00'),
(505, 98, 1, 20, 6, '68.5000', '0000-00-00', '0000-00-00'),
(506, 98, 1, 30, 7, '66.2000', '0000-00-00', '0000-00-00'),
(507, 98, 1, 40, 8, '64.4000', '0000-00-00', '0000-00-00'),
(508, 98, 1, 50, 9, '63.1000', '0000-00-00', '0000-00-00'),
(509, 98, 1, 75, 10, '60.8000', '0000-00-00', '0000-00-00'),
(510, 98, 1, 100, 11, '59.0000', '0000-00-00', '0000-00-00'),
(511, 99, 1, 2, 1, '26.0000', '0000-00-00', '0000-00-00'),
(512, 99, 1, 3, 2, '19.0000', '0000-00-00', '0000-00-00'),
(513, 99, 1, 5, 3, '18.1000', '0000-00-00', '0000-00-00'),
(514, 99, 1, 10, 4, '16.9000', '0000-00-00', '0000-00-00'),
(515, 99, 1, 15, 5, '16.2000', '0000-00-00', '0000-00-00'),
(516, 99, 1, 20, 6, '15.7000', '0000-00-00', '0000-00-00'),
(517, 99, 1, 30, 7, '14.9000', '0000-00-00', '0000-00-00'),
(518, 99, 1, 40, 8, '14.2000', '0000-00-00', '0000-00-00'),
(519, 99, 1, 50, 9, '14.0000', '0000-00-00', '0000-00-00'),
(520, 99, 1, 75, 10, '13.2000', '0000-00-00', '0000-00-00'),
(521, 99, 1, 100, 11, '12.7000', '0000-00-00', '0000-00-00'),
(522, 101, 1, 2, 1, '8.0000', '0000-00-00', '0000-00-00'),
(523, 101, 1, 3, 2, '7.0000', '0000-00-00', '0000-00-00'),
(524, 101, 1, 5, 3, '6.6000', '0000-00-00', '0000-00-00'),
(525, 101, 1, 10, 4, '6.3000', '0000-00-00', '0000-00-00'),
(526, 101, 1, 15, 5, '6.1000', '0000-00-00', '0000-00-00'),
(527, 101, 1, 20, 6, '6.0000', '0000-00-00', '0000-00-00'),
(528, 101, 1, 30, 7, '5.8000', '0000-00-00', '0000-00-00'),
(529, 101, 1, 40, 8, '5.7000', '0000-00-00', '0000-00-00'),
(530, 101, 1, 50, 9, '5.6000', '0000-00-00', '0000-00-00'),
(531, 101, 1, 75, 10, '5.4000', '0000-00-00', '0000-00-00'),
(532, 101, 1, 100, 11, '5.3000', '0000-00-00', '0000-00-00'),
(533, 108, 1, 2, 1, '90.0000', '0000-00-00', '0000-00-00'),
(534, 108, 1, 3, 2, '87.0000', '0000-00-00', '0000-00-00'),
(535, 108, 1, 5, 3, '82.9000', '0000-00-00', '0000-00-00'),
(536, 108, 1, 10, 4, '78.3000', '0000-00-00', '0000-00-00'),
(537, 108, 1, 15, 5, '75.4000', '0000-00-00', '0000-00-00'),
(538, 108, 1, 20, 6, '73.6000', '0000-00-00', '0000-00-00'),
(539, 108, 1, 30, 7, '70.8000', '0000-00-00', '0000-00-00'),
(540, 108, 1, 40, 8, '68.8000', '0000-00-00', '0000-00-00'),
(541, 108, 1, 50, 9, '67.2000', '0000-00-00', '0000-00-00'),
(542, 108, 1, 75, 10, '64.6000', '0000-00-00', '0000-00-00'),
(543, 108, 1, 100, 11, '62.6000', '0000-00-00', '0000-00-00'),
(544, 109, 1, 2, 1, '41.0000', '0000-00-00', '0000-00-00'),
(545, 109, 1, 3, 2, '40.0000', '0000-00-00', '0000-00-00'),
(546, 109, 1, 5, 3, '39.4000', '0000-00-00', '0000-00-00'),
(547, 109, 1, 10, 4, '38.2000', '0000-00-00', '0000-00-00'),
(548, 109, 1, 15, 5, '37.4000', '0000-00-00', '0000-00-00'),
(549, 109, 1, 20, 6, '37.0000', '0000-00-00', '0000-00-00'),
(550, 109, 1, 30, 7, '36.5000', '0000-00-00', '0000-00-00'),
(551, 109, 1, 40, 8, '36.1000', '0000-00-00', '0000-00-00'),
(552, 109, 1, 50, 9, '35.5000', '0000-00-00', '0000-00-00'),
(553, 109, 1, 75, 10, '34.8000', '0000-00-00', '0000-00-00'),
(554, 109, 1, 100, 11, '34.6000', '0000-00-00', '0000-00-00'),
(555, 114, 1, 2, 1, '46.0000', '0000-00-00', '0000-00-00'),
(556, 114, 1, 3, 2, '45.0000', '0000-00-00', '0000-00-00'),
(557, 114, 1, 5, 3, '43.0000', '0000-00-00', '0000-00-00'),
(558, 114, 1, 10, 4, '41.5000', '0000-00-00', '0000-00-00'),
(559, 114, 1, 15, 5, '40.4000', '0000-00-00', '0000-00-00'),
(560, 114, 1, 20, 6, '39.9000', '0000-00-00', '0000-00-00'),
(561, 114, 1, 30, 7, '39.1000', '0000-00-00', '0000-00-00'),
(562, 114, 1, 40, 8, '38.4000', '0000-00-00', '0000-00-00'),
(563, 114, 1, 50, 9, '37.9000', '0000-00-00', '0000-00-00'),
(564, 114, 1, 75, 10, '37.1000', '0000-00-00', '0000-00-00'),
(565, 114, 1, 100, 11, '36.6000', '0000-00-00', '0000-00-00'),
(566, 115, 1, 2, 1, '56.0000', '0000-00-00', '0000-00-00'),
(567, 115, 1, 3, 2, '55.0000', '0000-00-00', '0000-00-00'),
(568, 115, 1, 5, 3, '52.5000', '0000-00-00', '0000-00-00'),
(569, 115, 1, 10, 4, '50.5000', '0000-00-00', '0000-00-00'),
(570, 115, 1, 15, 5, '49.2000', '0000-00-00', '0000-00-00'),
(571, 115, 1, 20, 6, '48.4000', '0000-00-00', '0000-00-00'),
(572, 115, 1, 30, 7, '47.1000', '0000-00-00', '0000-00-00'),
(573, 115, 1, 40, 8, '46.1000', '0000-00-00', '0000-00-00'),
(574, 115, 1, 50, 9, '45.6000', '0000-00-00', '0000-00-00'),
(575, 115, 1, 75, 10, '44.3000', '0000-00-00', '0000-00-00'),
(576, 115, 1, 100, 11, '43.5000', '0000-00-00', '0000-00-00'),
(577, 116, 1, 2, 1, '70.0000', '0000-00-00', '0000-00-00'),
(578, 116, 1, 3, 2, '68.0000', '0000-00-00', '0000-00-00'),
(579, 116, 1, 5, 3, '64.9000', '0000-00-00', '0000-00-00'),
(580, 116, 1, 10, 4, '61.8000', '0000-00-00', '0000-00-00'),
(581, 116, 1, 15, 5, '60.3000', '0000-00-00', '0000-00-00'),
(582, 116, 1, 20, 6, '59.0000', '0000-00-00', '0000-00-00'),
(583, 116, 1, 30, 7, '57.2000', '0000-00-00', '0000-00-00'),
(584, 116, 1, 40, 8, '55.9000', '0000-00-00', '0000-00-00'),
(585, 116, 1, 50, 9, '54.8000', '0000-00-00', '0000-00-00'),
(586, 116, 1, 75, 10, '53.3000', '0000-00-00', '0000-00-00'),
(587, 116, 1, 100, 11, '52.0000', '0000-00-00', '0000-00-00'),
(588, 117, 1, 2, 1, '69.0000', '0000-00-00', '0000-00-00'),
(589, 117, 1, 3, 2, '67.0000', '0000-00-00', '0000-00-00'),
(590, 117, 1, 5, 3, '64.1000', '0000-00-00', '0000-00-00'),
(591, 117, 1, 10, 4, '60.8000', '0000-00-00', '0000-00-00'),
(592, 117, 1, 15, 5, '58.7000', '0000-00-00', '0000-00-00'),
(593, 117, 1, 20, 6, '57.4000', '0000-00-00', '0000-00-00'),
(594, 117, 1, 30, 7, '55.4000', '0000-00-00', '0000-00-00'),
(595, 117, 1, 40, 8, '54.1000', '0000-00-00', '0000-00-00'),
(596, 117, 1, 50, 9, '53.0000', '0000-00-00', '0000-00-00'),
(597, 117, 1, 75, 10, '51.0000', '0000-00-00', '0000-00-00'),
(598, 117, 1, 100, 11, '49.7000', '0000-00-00', '0000-00-00'),
(599, 118, 1, 2, 1, '48.0000', '0000-00-00', '0000-00-00'),
(600, 118, 1, 3, 2, '47.0000', '0000-00-00', '0000-00-00'),
(601, 118, 1, 5, 3, '45.6000', '0000-00-00', '0000-00-00'),
(602, 118, 1, 10, 4, '43.8000', '0000-00-00', '0000-00-00'),
(603, 118, 1, 15, 5, '42.7000', '0000-00-00', '0000-00-00'),
(604, 118, 1, 20, 6, '42.0000', '0000-00-00', '0000-00-00'),
(605, 118, 1, 30, 7, '40.9000', '0000-00-00', '0000-00-00'),
(606, 118, 1, 40, 8, '40.2000', '0000-00-00', '0000-00-00'),
(607, 118, 1, 50, 9, '39.7000', '0000-00-00', '0000-00-00'),
(608, 118, 1, 75, 10, '38.6000', '0000-00-00', '0000-00-00'),
(609, 118, 1, 100, 11, '37.9000', '0000-00-00', '0000-00-00'),
(610, 119, 1, 2, 1, '56.0000', '0000-00-00', '0000-00-00'),
(611, 119, 1, 3, 2, '55.0000', '0000-00-00', '0000-00-00'),
(612, 119, 1, 5, 3, '52.5000', '0000-00-00', '0000-00-00'),
(613, 119, 1, 10, 4, '50.5000', '0000-00-00', '0000-00-00'),
(614, 119, 1, 15, 5, '49.2000', '0000-00-00', '0000-00-00'),
(615, 119, 1, 20, 6, '48.4000', '0000-00-00', '0000-00-00'),
(616, 119, 1, 30, 7, '47.1000', '0000-00-00', '0000-00-00'),
(617, 119, 1, 40, 8, '46.1000', '0000-00-00', '0000-00-00'),
(618, 119, 1, 50, 9, '45.6000', '0000-00-00', '0000-00-00'),
(619, 119, 1, 75, 10, '44.3000', '0000-00-00', '0000-00-00'),
(620, 119, 1, 100, 11, '43.3000', '0000-00-00', '0000-00-00'),
(621, 120, 1, 2, 1, '97.0000', '0000-00-00', '0000-00-00'),
(622, 120, 1, 3, 2, '95.0000', '0000-00-00', '0000-00-00'),
(623, 120, 1, 5, 3, '92.7000', '0000-00-00', '0000-00-00'),
(624, 120, 1, 10, 4, '89.6000', '0000-00-00', '0000-00-00'),
(625, 120, 1, 15, 5, '88.1000', '0000-00-00', '0000-00-00'),
(626, 120, 1, 20, 6, '86.8000', '0000-00-00', '0000-00-00'),
(627, 120, 1, 30, 7, '85.0000', '0000-00-00', '0000-00-00'),
(628, 120, 1, 40, 8, '83.7000', '0000-00-00', '0000-00-00'),
(629, 120, 1, 50, 9, '82.9000', '0000-00-00', '0000-00-00'),
(630, 120, 1, 75, 10, '81.1000', '0000-00-00', '0000-00-00'),
(631, 120, 1, 100, 11, '79.8000', '0000-00-00', '0000-00-00'),
(632, 121, 1, 2, 1, '57.0000', '0000-00-00', '0000-00-00'),
(633, 121, 1, 3, 2, '56.0000', '0000-00-00', '0000-00-00'),
(634, 121, 1, 5, 3, '53.6000', '0000-00-00', '0000-00-00'),
(635, 121, 1, 10, 4, '51.5000', '0000-00-00', '0000-00-00'),
(636, 121, 1, 15, 5, '50.2000', '0000-00-00', '0000-00-00'),
(637, 121, 1, 20, 6, '49.4000', '0000-00-00', '0000-00-00'),
(638, 121, 1, 30, 7, '48.2000', '0000-00-00', '0000-00-00'),
(639, 121, 1, 40, 8, '47.1000', '0000-00-00', '0000-00-00'),
(640, 121, 1, 50, 9, '46.6000', '0000-00-00', '0000-00-00'),
(641, 121, 1, 75, 10, '45.3000', '0000-00-00', '0000-00-00'),
(642, 121, 1, 100, 11, '44.3000', '0000-00-00', '0000-00-00'),
(643, 122, 1, 2, 1, '71.0000', '0000-00-00', '0000-00-00'),
(644, 122, 1, 3, 2, '69.0000', '0000-00-00', '0000-00-00'),
(645, 122, 1, 5, 3, '65.9000', '0000-00-00', '0000-00-00'),
(646, 122, 1, 10, 4, '63.1000', '0000-00-00', '0000-00-00'),
(647, 122, 1, 15, 5, '61.3000', '0000-00-00', '0000-00-00'),
(648, 122, 1, 20, 6, '60.0000', '0000-00-00', '0000-00-00'),
(649, 122, 1, 30, 7, '58.2000', '0000-00-00', '0000-00-00'),
(650, 122, 1, 40, 8, '57.2000', '0000-00-00', '0000-00-00'),
(651, 122, 1, 50, 9, '56.1000', '0000-00-00', '0000-00-00'),
(652, 122, 1, 75, 10, '54.3000', '0000-00-00', '0000-00-00'),
(653, 122, 1, 100, 11, '53.0000', '0000-00-00', '0000-00-00'),
(654, 123, 1, 2, 1, '46.0000', '0000-00-00', '0000-00-00'),
(655, 123, 1, 3, 2, '45.0000', '0000-00-00', '0000-00-00'),
(656, 123, 1, 5, 3, '42.7000', '0000-00-00', '0000-00-00'),
(657, 123, 1, 10, 4, '41.2000', '0000-00-00', '0000-00-00'),
(658, 123, 1, 15, 5, '40.2000', '0000-00-00', '0000-00-00'),
(659, 123, 1, 20, 6, '39.7000', '0000-00-00', '0000-00-00'),
(660, 123, 1, 30, 7, '38.6000', '0000-00-00', '0000-00-00'),
(661, 123, 1, 40, 8, '38.1000', '0000-00-00', '0000-00-00'),
(662, 123, 1, 50, 9, '37.6000', '0000-00-00', '0000-00-00'),
(663, 123, 1, 75, 10, '36.6000', '0000-00-00', '0000-00-00'),
(664, 123, 1, 100, 11, '36.1000', '0000-00-00', '0000-00-00'),
(665, 124, 1, 2, 1, '56.0000', '0000-00-00', '0000-00-00'),
(666, 124, 1, 3, 2, '55.0000', '0000-00-00', '0000-00-00'),
(667, 124, 1, 5, 3, '52.5000', '0000-00-00', '0000-00-00'),
(668, 124, 1, 10, 4, '50.5000', '0000-00-00', '0000-00-00'),
(669, 124, 1, 15, 5, '49.2000', '0000-00-00', '0000-00-00'),
(670, 124, 1, 20, 6, '48.4000', '0000-00-00', '0000-00-00'),
(671, 124, 1, 30, 7, '47.1000', '0000-00-00', '0000-00-00'),
(672, 124, 1, 40, 8, '46.1000', '0000-00-00', '0000-00-00'),
(673, 124, 1, 50, 9, '45.6000', '0000-00-00', '0000-00-00'),
(674, 124, 1, 75, 10, '44.3000', '0000-00-00', '0000-00-00'),
(675, 124, 1, 100, 11, '43.3000', '0000-00-00', '0000-00-00'),
(676, 125, 1, 2, 1, '50.0000', '0000-00-00', '0000-00-00'),
(677, 125, 1, 3, 2, '49.0000', '0000-00-00', '0000-00-00'),
(678, 125, 1, 5, 3, '46.4000', '0000-00-00', '0000-00-00'),
(679, 125, 1, 10, 4, '43.8000', '0000-00-00', '0000-00-00'),
(680, 125, 1, 15, 5, '42.5000', '0000-00-00', '0000-00-00'),
(681, 125, 1, 20, 6, '41.5000', '0000-00-00', '0000-00-00'),
(682, 125, 1, 30, 7, '40.2000', '0000-00-00', '0000-00-00'),
(683, 125, 1, 40, 8, '39.1000', '0000-00-00', '0000-00-00'),
(684, 125, 1, 50, 9, '38.4000', '0000-00-00', '0000-00-00'),
(685, 125, 1, 75, 10, '36.8000', '0000-00-00', '0000-00-00'),
(686, 125, 1, 100, 11, '35.8000', '0000-00-00', '0000-00-00'),
(687, 127, 1, 2, 1, '50.0000', '0000-00-00', '0000-00-00'),
(688, 127, 1, 3, 2, '49.0000', '0000-00-00', '0000-00-00'),
(689, 127, 1, 5, 3, '46.4000', '0000-00-00', '0000-00-00'),
(690, 127, 1, 10, 4, '43.8000', '0000-00-00', '0000-00-00'),
(691, 127, 1, 15, 5, '42.5000', '0000-00-00', '0000-00-00'),
(692, 127, 1, 20, 6, '41.5000', '0000-00-00', '0000-00-00'),
(693, 127, 1, 30, 7, '40.2000', '0000-00-00', '0000-00-00'),
(694, 127, 1, 40, 8, '39.1000', '0000-00-00', '0000-00-00'),
(695, 127, 1, 50, 9, '38.4000', '0000-00-00', '0000-00-00'),
(696, 127, 1, 75, 10, '36.8000', '0000-00-00', '0000-00-00'),
(697, 127, 1, 100, 11, '35.8000', '0000-00-00', '0000-00-00'),
(698, 128, 1, 2, 1, '83.0000', '0000-00-00', '0000-00-00'),
(699, 128, 1, 3, 2, '80.0000', '0000-00-00', '0000-00-00'),
(700, 128, 1, 5, 3, '75.2000', '0000-00-00', '0000-00-00'),
(701, 128, 1, 10, 4, '69.3000', '0000-00-00', '0000-00-00'),
(702, 128, 1, 15, 5, '65.9000', '0000-00-00', '0000-00-00'),
(703, 128, 1, 20, 6, '63.6000', '0000-00-00', '0000-00-00'),
(704, 128, 1, 30, 7, '60.3000', '0000-00-00', '0000-00-00'),
(705, 128, 1, 40, 8, '57.7000', '0000-00-00', '0000-00-00'),
(706, 128, 1, 50, 9, '55.9000', '0000-00-00', '0000-00-00'),
(707, 128, 1, 75, 10, '52.5000', '0000-00-00', '0000-00-00'),
(708, 128, 1, 100, 11, '50.2000', '0000-00-00', '0000-00-00'),
(709, 129, 1, 2, 1, '90.0000', '0000-00-00', '0000-00-00'),
(710, 129, 1, 3, 2, '86.0000', '0000-00-00', '0000-00-00'),
(711, 129, 1, 5, 3, '81.9000', '0000-00-00', '0000-00-00'),
(712, 129, 1, 10, 4, '76.7000', '0000-00-00', '0000-00-00'),
(713, 129, 1, 15, 5, '73.6000', '0000-00-00', '0000-00-00'),
(714, 129, 1, 20, 6, '71.6000', '0000-00-00', '0000-00-00'),
(715, 129, 1, 30, 7, '68.5000', '0000-00-00', '0000-00-00'),
(716, 129, 1, 40, 8, '66.4000', '0000-00-00', '0000-00-00'),
(717, 129, 1, 50, 9, '64.6000', '0000-00-00', '0000-00-00'),
(718, 129, 1, 75, 10, '61.5000', '0000-00-00', '0000-00-00'),
(719, 129, 1, 100, 11, '59.5000', '0000-00-00', '0000-00-00'),
(720, 130, 1, 2, 1, '93.0000', '0000-00-00', '0000-00-00'),
(721, 130, 1, 3, 2, '92.0000', '0000-00-00', '0000-00-00'),
(722, 130, 1, 5, 3, '90.0000', '0000-00-00', '0000-00-00'),
(723, 130, 1, 10, 4, '87.5000', '0000-00-00', '0000-00-00'),
(724, 130, 1, 15, 5, '86.1000', '0000-00-00', '0000-00-00'),
(725, 130, 1, 20, 6, '85.1000', '0000-00-00', '0000-00-00'),
(726, 130, 1, 30, 7, '83.6000', '0000-00-00', '0000-00-00'),
(727, 130, 1, 40, 8, '82.5000', '0000-00-00', '0000-00-00'),
(728, 130, 1, 50, 9, '81.8000', '0000-00-00', '0000-00-00'),
(729, 130, 1, 75, 10, '80.3000', '0000-00-00', '0000-00-00'),
(730, 130, 1, 100, 11, '79.3000', '0000-00-00', '0000-00-00'),
(731, 131, 1, 2, 1, '94.0000', '0000-00-00', '0000-00-00'),
(732, 131, 1, 3, 2, '93.0000', '0000-00-00', '0000-00-00'),
(733, 131, 1, 5, 3, '91.0000', '0000-00-00', '0000-00-00'),
(734, 131, 1, 10, 4, '88.0000', '0000-00-00', '0000-00-00'),
(735, 131, 1, 15, 5, '86.8000', '0000-00-00', '0000-00-00'),
(736, 131, 1, 20, 6, '86.0000', '0000-00-00', '0000-00-00'),
(737, 131, 1, 30, 7, '84.8000', '0000-00-00', '0000-00-00'),
(738, 131, 1, 40, 8, '84.0000', '0000-00-00', '0000-00-00'),
(739, 131, 1, 50, 9, '83.4000', '0000-00-00', '0000-00-00'),
(740, 131, 1, 75, 10, '82.2000', '0000-00-00', '0000-00-00'),
(741, 131, 1, 100, 11, '81.4000', '0000-00-00', '0000-00-00'),
(742, 132, 1, 2, 1, '86.0000', '0000-00-00', '0000-00-00'),
(743, 132, 1, 3, 2, '83.0000', '0000-00-00', '0000-00-00'),
(744, 132, 1, 5, 3, '78.3000', '0000-00-00', '0000-00-00'),
(745, 132, 1, 10, 4, '73.1000', '0000-00-00', '0000-00-00'),
(746, 132, 1, 15, 5, '70.0000', '0000-00-00', '0000-00-00'),
(747, 132, 1, 20, 6, '67.7000', '0000-00-00', '0000-00-00'),
(748, 132, 1, 30, 7, '64.6000', '0000-00-00', '0000-00-00'),
(749, 132, 1, 40, 8, '62.3000', '0000-00-00', '0000-00-00'),
(750, 132, 1, 50, 9, '60.8000', '0000-00-00', '0000-00-00'),
(751, 132, 1, 75, 10, '57.7000', '0000-00-00', '0000-00-00'),
(752, 132, 1, 100, 11, '55.4000', '0000-00-00', '0000-00-00'),
(753, 133, 1, 2, 1, '90.0000', '0000-00-00', '0000-00-00'),
(754, 133, 1, 3, 2, '87.0000', '0000-00-00', '0000-00-00'),
(755, 133, 1, 5, 3, '82.9000', '0000-00-00', '0000-00-00'),
(756, 133, 1, 10, 4, '78.3000', '0000-00-00', '0000-00-00'),
(757, 133, 1, 15, 5, '75.4000', '0000-00-00', '0000-00-00'),
(758, 133, 1, 20, 6, '73.4000', '0000-00-00', '0000-00-00'),
(759, 133, 1, 30, 7, '70.6000', '0000-00-00', '0000-00-00'),
(760, 133, 1, 40, 8, '68.8000', '0000-00-00', '0000-00-00'),
(761, 133, 1, 50, 9, '67.2000', '0000-00-00', '0000-00-00'),
(762, 133, 1, 75, 10, '64.4000', '0000-00-00', '0000-00-00'),
(763, 133, 1, 100, 11, '62.6000', '0000-00-00', '0000-00-00'),
(764, 134, 1, 2, 1, '174.0000', '0000-00-00', '0000-00-00'),
(765, 134, 1, 3, 2, '170.0000', '0000-00-00', '0000-00-00'),
(766, 134, 1, 5, 3, '162.0000', '0000-00-00', '0000-00-00'),
(767, 134, 1, 10, 4, '150.6000', '0000-00-00', '0000-00-00'),
(768, 134, 1, 15, 5, '143.9000', '0000-00-00', '0000-00-00'),
(769, 134, 1, 20, 6, '139.3000', '0000-00-00', '0000-00-00'),
(770, 134, 1, 30, 7, '132.9000', '0000-00-00', '0000-00-00'),
(771, 134, 1, 40, 8, '128.0000', '0000-00-00', '0000-00-00'),
(772, 134, 1, 50, 9, '124.4000', '0000-00-00', '0000-00-00'),
(773, 134, 1, 75, 10, '117.9000', '0000-00-00', '0000-00-00'),
(774, 134, 1, 100, 11, '113.3000', '0000-00-00', '0000-00-00'),
(775, 135, 1, 2, 1, '92.0000', '0000-00-00', '0000-00-00'),
(776, 135, 1, 3, 2, '88.0000', '0000-00-00', '0000-00-00'),
(777, 135, 1, 5, 3, '83.8000', '0000-00-00', '0000-00-00'),
(778, 135, 1, 10, 4, '77.6000', '0000-00-00', '0000-00-00'),
(779, 135, 1, 15, 5, '74.0000', '0000-00-00', '0000-00-00'),
(780, 135, 1, 20, 6, '71.4000', '0000-00-00', '0000-00-00'),
(781, 135, 1, 30, 7, '67.8000', '0000-00-00', '0000-00-00'),
(782, 135, 1, 40, 8, '65.2000', '0000-00-00', '0000-00-00'),
(783, 135, 1, 50, 9, '63.4000', '0000-00-00', '0000-00-00'),
(784, 135, 1, 75, 10, '59.8000', '0000-00-00', '0000-00-00'),
(785, 135, 1, 100, 11, '57.2000', '0000-00-00', '0000-00-00'),
(786, 136, 1, 2, 1, '88.0000', '0000-00-00', '0000-00-00'),
(787, 136, 1, 3, 2, '84.0000', '0000-00-00', '0000-00-00'),
(788, 136, 1, 5, 3, '79.8000', '0000-00-00', '0000-00-00'),
(789, 136, 1, 10, 4, '73.6000', '0000-00-00', '0000-00-00'),
(790, 136, 1, 15, 5, '70.0000', '0000-00-00', '0000-00-00'),
(791, 136, 1, 20, 6, '67.4000', '0000-00-00', '0000-00-00'),
(792, 136, 1, 30, 7, '63.8000', '0000-00-00', '0000-00-00'),
(793, 136, 1, 40, 8, '61.2000', '0000-00-00', '0000-00-00'),
(794, 136, 1, 50, 9, '59.4000', '0000-00-00', '0000-00-00'),
(795, 136, 1, 75, 10, '55.8000', '0000-00-00', '0000-00-00'),
(796, 136, 1, 100, 11, '53.2000', '0000-00-00', '0000-00-00'),
(797, 139, 1, 2, 1, '47.0000', '0000-00-00', '0000-00-00'),
(798, 139, 1, 3, 2, '43.0000', '0000-00-00', '0000-00-00'),
(799, 139, 1, 5, 3, '40.9000', '0000-00-00', '0000-00-00'),
(800, 139, 1, 10, 4, '38.2000', '0000-00-00', '0000-00-00'),
(801, 139, 1, 15, 5, '36.8000', '0000-00-00', '0000-00-00'),
(802, 139, 1, 20, 6, '35.5000', '0000-00-00', '0000-00-00'),
(803, 139, 1, 30, 7, '34.1000', '0000-00-00', '0000-00-00'),
(804, 139, 1, 40, 8, '32.8000', '0000-00-00', '0000-00-00'),
(805, 139, 1, 50, 9, '32.1000', '0000-00-00', '0000-00-00'),
(806, 139, 1, 75, 10, '30.4000', '0000-00-00', '0000-00-00'),
(807, 139, 1, 100, 11, '29.1000', '0000-00-00', '0000-00-00'),
(808, 140, 1, 2, 1, '47.0000', '0000-00-00', '0000-00-00'),
(809, 140, 1, 3, 2, '43.0000', '0000-00-00', '0000-00-00'),
(810, 140, 1, 5, 3, '40.9000', '0000-00-00', '0000-00-00'),
(811, 140, 1, 10, 4, '38.2000', '0000-00-00', '0000-00-00'),
(812, 140, 1, 15, 5, '36.8000', '0000-00-00', '0000-00-00'),
(813, 140, 1, 20, 6, '35.5000', '0000-00-00', '0000-00-00'),
(814, 140, 1, 30, 7, '34.1000', '0000-00-00', '0000-00-00'),
(815, 140, 1, 40, 8, '32.8000', '0000-00-00', '0000-00-00'),
(816, 140, 1, 50, 9, '32.1000', '0000-00-00', '0000-00-00'),
(817, 140, 1, 75, 10, '30.4000', '0000-00-00', '0000-00-00'),
(818, 140, 1, 100, 11, '29.1000', '0000-00-00', '0000-00-00'),
(819, 141, 1, 2, 1, '7.0000', '0000-00-00', '0000-00-00'),
(820, 141, 1, 3, 2, '6.0000', '0000-00-00', '0000-00-00'),
(821, 141, 1, 5, 3, '5.8000', '0000-00-00', '0000-00-00'),
(822, 141, 1, 10, 4, '5.4000', '0000-00-00', '0000-00-00'),
(823, 141, 1, 15, 5, '5.2000', '0000-00-00', '0000-00-00'),
(824, 141, 1, 20, 6, '4.9000', '0000-00-00', '0000-00-00'),
(825, 141, 1, 30, 7, '4.7000', '0000-00-00', '0000-00-00'),
(826, 141, 1, 40, 8, '4.6000', '0000-00-00', '0000-00-00'),
(827, 141, 1, 50, 9, '4.5000', '0000-00-00', '0000-00-00'),
(828, 141, 1, 75, 10, '4.4000', '0000-00-00', '0000-00-00'),
(829, 141, 1, 100, 11, '4.3000', '0000-00-00', '0000-00-00'),
(830, 142, 1, 2, 1, '7.0000', '0000-00-00', '0000-00-00'),
(831, 142, 1, 3, 2, '6.0000', '0000-00-00', '0000-00-00'),
(832, 142, 1, 5, 3, '5.8000', '0000-00-00', '0000-00-00'),
(833, 142, 1, 10, 4, '5.6000', '0000-00-00', '0000-00-00'),
(834, 142, 1, 15, 5, '5.4000', '0000-00-00', '0000-00-00'),
(835, 142, 1, 20, 6, '5.2000', '0000-00-00', '0000-00-00'),
(836, 142, 1, 30, 7, '4.9000', '0000-00-00', '0000-00-00'),
(837, 142, 1, 40, 8, '4.8000', '0000-00-00', '0000-00-00'),
(838, 142, 1, 50, 9, '4.7000', '0000-00-00', '0000-00-00'),
(839, 142, 1, 75, 10, '4.6000', '0000-00-00', '0000-00-00'),
(840, 142, 1, 100, 11, '4.5000', '0000-00-00', '0000-00-00'),
(841, 143, 1, 2, 1, '7.0000', '0000-00-00', '0000-00-00'),
(842, 143, 1, 3, 2, '6.0000', '0000-00-00', '0000-00-00'),
(843, 143, 1, 5, 3, '5.8000', '0000-00-00', '0000-00-00'),
(844, 143, 1, 10, 4, '5.7000', '0000-00-00', '0000-00-00'),
(845, 143, 1, 15, 5, '5.6000', '0000-00-00', '0000-00-00'),
(846, 143, 1, 20, 6, '5.4000', '0000-00-00', '0000-00-00'),
(847, 143, 1, 30, 7, '5.1000', '0000-00-00', '0000-00-00'),
(848, 143, 1, 40, 8, '5.0000', '0000-00-00', '0000-00-00'),
(849, 143, 1, 50, 9, '4.9000', '0000-00-00', '0000-00-00'),
(850, 143, 1, 75, 10, '4.8000', '0000-00-00', '0000-00-00'),
(851, 143, 1, 100, 11, '4.7000', '0000-00-00', '0000-00-00'),
(852, 144, 1, 2, 1, '49.0000', '0000-00-00', '0000-00-00'),
(853, 144, 1, 3, 2, '44.0000', '0000-00-00', '0000-00-00'),
(854, 144, 1, 5, 3, '42.2000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(855, 144, 1, 10, 4, '39.2000', '0000-00-00', '0000-00-00'),
(856, 144, 1, 15, 5, '37.7000', '0000-00-00', '0000-00-00'),
(857, 144, 1, 20, 6, '36.5000', '0000-00-00', '0000-00-00'),
(858, 144, 1, 30, 7, '35.0000', '0000-00-00', '0000-00-00'),
(859, 144, 1, 40, 8, '33.9000', '0000-00-00', '0000-00-00'),
(860, 144, 1, 50, 9, '32.8000', '0000-00-00', '0000-00-00'),
(861, 144, 1, 75, 10, '31.3000', '0000-00-00', '0000-00-00'),
(862, 144, 1, 100, 11, '30.2000', '0000-00-00', '0000-00-00'),
(863, 145, 1, 2, 1, '48.0000', '0000-00-00', '0000-00-00'),
(864, 145, 1, 3, 2, '47.0000', '0000-00-00', '0000-00-00'),
(865, 145, 1, 5, 3, '45.6000', '0000-00-00', '0000-00-00'),
(866, 145, 1, 10, 4, '43.8000', '0000-00-00', '0000-00-00'),
(867, 145, 1, 15, 5, '42.7000', '0000-00-00', '0000-00-00'),
(868, 145, 1, 20, 6, '42.0000', '0000-00-00', '0000-00-00'),
(869, 145, 1, 30, 7, '40.9000', '0000-00-00', '0000-00-00'),
(870, 145, 1, 40, 8, '40.2000', '0000-00-00', '0000-00-00'),
(871, 145, 1, 50, 9, '39.7000', '0000-00-00', '0000-00-00'),
(872, 145, 1, 75, 10, '38.6000', '0000-00-00', '0000-00-00'),
(873, 145, 1, 100, 11, '37.9000', '0000-00-00', '0000-00-00'),
(874, 146, 1, 2, 1, '45.0000', '0000-00-00', '0000-00-00'),
(875, 146, 1, 3, 2, '44.0000', '0000-00-00', '0000-00-00'),
(876, 146, 1, 5, 3, '43.3000', '0000-00-00', '0000-00-00'),
(877, 146, 1, 10, 4, '41.8000', '0000-00-00', '0000-00-00'),
(878, 146, 1, 15, 5, '41.1000', '0000-00-00', '0000-00-00'),
(879, 146, 1, 20, 6, '40.7000', '0000-00-00', '0000-00-00'),
(880, 146, 1, 30, 7, '40.0000', '0000-00-00', '0000-00-00'),
(881, 146, 1, 40, 8, '39.4000', '0000-00-00', '0000-00-00'),
(882, 146, 1, 50, 9, '38.9000', '0000-00-00', '0000-00-00'),
(883, 146, 1, 75, 10, '38.2000', '0000-00-00', '0000-00-00'),
(884, 146, 1, 100, 11, '37.7000', '0000-00-00', '0000-00-00'),
(885, 147, 1, 2, 1, '85.0000', '0000-00-00', '0000-00-00'),
(886, 147, 1, 3, 2, '82.0000', '0000-00-00', '0000-00-00'),
(887, 147, 1, 5, 3, '80.6000', '0000-00-00', '0000-00-00'),
(888, 147, 1, 10, 4, '77.3000', '0000-00-00', '0000-00-00'),
(889, 147, 1, 15, 5, '75.2000', '0000-00-00', '0000-00-00'),
(890, 147, 1, 20, 6, '73.6000', '0000-00-00', '0000-00-00'),
(891, 147, 1, 30, 7, '71.8000', '0000-00-00', '0000-00-00'),
(892, 147, 1, 40, 8, '70.3000', '0000-00-00', '0000-00-00'),
(893, 147, 1, 50, 9, '69.3000', '0000-00-00', '0000-00-00'),
(894, 147, 1, 75, 10, '67.2000', '0000-00-00', '0000-00-00'),
(895, 147, 1, 100, 11, '65.9000', '0000-00-00', '0000-00-00'),
(896, 148, 1, 2, 1, '100.9000', '0000-00-00', '0000-00-00'),
(897, 148, 1, 3, 2, '78.3000', '0000-00-00', '0000-00-00'),
(898, 148, 1, 5, 3, '75.0000', '0000-00-00', '0000-00-00'),
(899, 148, 1, 10, 4, '70.8000', '0000-00-00', '0000-00-00'),
(900, 148, 1, 15, 5, '68.3000', '0000-00-00', '0000-00-00'),
(901, 148, 1, 20, 6, '66.6000', '0000-00-00', '0000-00-00'),
(902, 148, 1, 30, 7, '64.1000', '0000-00-00', '0000-00-00'),
(903, 148, 1, 40, 8, '62.2000', '0000-00-00', '0000-00-00'),
(904, 148, 1, 50, 9, '60.8000', '0000-00-00', '0000-00-00'),
(905, 148, 1, 75, 10, '58.5000', '0000-00-00', '0000-00-00'),
(906, 148, 1, 100, 11, '56.6000', '0000-00-00', '0000-00-00'),
(907, 149, 1, 2, 1, '69.0000', '0000-00-00', '0000-00-00'),
(908, 149, 1, 3, 2, '67.0000', '0000-00-00', '0000-00-00'),
(909, 149, 1, 5, 3, '64.1000', '0000-00-00', '0000-00-00'),
(910, 149, 1, 10, 4, '60.8000', '0000-00-00', '0000-00-00'),
(911, 149, 1, 15, 5, '58.7000', '0000-00-00', '0000-00-00'),
(912, 149, 1, 20, 6, '57.4000', '0000-00-00', '0000-00-00'),
(913, 149, 1, 30, 7, '55.4000', '0000-00-00', '0000-00-00'),
(914, 149, 1, 40, 8, '54.1000', '0000-00-00', '0000-00-00'),
(915, 149, 1, 50, 9, '53.0000', '0000-00-00', '0000-00-00'),
(916, 149, 1, 75, 10, '51.0000', '0000-00-00', '0000-00-00'),
(917, 149, 1, 100, 11, '49.7000', '0000-00-00', '0000-00-00'),
(918, 150, 1, 2, 1, '36.0000', '0000-00-00', '0000-00-00'),
(919, 150, 1, 3, 2, '35.0000', '0000-00-00', '0000-00-00'),
(920, 150, 1, 5, 3, '33.5000', '0000-00-00', '0000-00-00'),
(921, 150, 1, 10, 4, '31.9000', '0000-00-00', '0000-00-00'),
(922, 150, 1, 15, 5, '30.9000', '0000-00-00', '0000-00-00'),
(923, 150, 1, 20, 6, '30.2000', '0000-00-00', '0000-00-00'),
(924, 150, 1, 30, 7, '28.9000', '0000-00-00', '0000-00-00'),
(925, 150, 1, 40, 8, '28.2000', '0000-00-00', '0000-00-00'),
(926, 150, 1, 50, 9, '27.7000', '0000-00-00', '0000-00-00'),
(927, 150, 1, 75, 10, '26.5000', '0000-00-00', '0000-00-00'),
(928, 150, 1, 100, 11, '25.8000', '0000-00-00', '0000-00-00'),
(929, 151, 1, 2, 1, '65.0000', '0000-00-00', '0000-00-00'),
(930, 151, 1, 3, 2, '60.0000', '0000-00-00', '0000-00-00'),
(931, 151, 1, 5, 3, '57.1000', '0000-00-00', '0000-00-00'),
(932, 151, 1, 10, 4, '52.9000', '0000-00-00', '0000-00-00'),
(933, 151, 1, 15, 5, '50.5000', '0000-00-00', '0000-00-00'),
(934, 151, 1, 20, 6, '49.0000', '0000-00-00', '0000-00-00'),
(935, 151, 1, 30, 7, '46.6000', '0000-00-00', '0000-00-00'),
(936, 151, 1, 40, 8, '44.8000', '0000-00-00', '0000-00-00'),
(937, 151, 1, 50, 9, '43.6000', '0000-00-00', '0000-00-00'),
(938, 151, 1, 75, 10, '41.1000', '0000-00-00', '0000-00-00'),
(939, 151, 1, 100, 11, '39.6000', '0000-00-00', '0000-00-00'),
(940, 153, 1, 2, 1, '50.0000', '0000-00-00', '0000-00-00'),
(941, 153, 1, 3, 2, '48.0000', '0000-00-00', '0000-00-00'),
(942, 153, 1, 5, 3, '46.8000', '0000-00-00', '0000-00-00'),
(943, 153, 1, 10, 4, '44.4000', '0000-00-00', '0000-00-00'),
(944, 153, 1, 15, 5, '42.9000', '0000-00-00', '0000-00-00'),
(945, 153, 1, 20, 6, '41.6000', '0000-00-00', '0000-00-00'),
(946, 153, 1, 30, 7, '40.2000', '0000-00-00', '0000-00-00'),
(947, 153, 1, 40, 8, '39.2000', '0000-00-00', '0000-00-00'),
(948, 153, 1, 50, 9, '38.5000', '0000-00-00', '0000-00-00'),
(949, 153, 1, 75, 10, '37.0000', '0000-00-00', '0000-00-00'),
(950, 153, 1, 100, 11, '36.1000', '0000-00-00', '0000-00-00'),
(951, 154, 1, 2, 1, '52.0000', '0000-00-00', '0000-00-00'),
(952, 154, 1, 3, 2, '50.0000', '0000-00-00', '0000-00-00'),
(953, 154, 1, 5, 3, '47.7000', '0000-00-00', '0000-00-00'),
(954, 154, 1, 10, 4, '45.3000', '0000-00-00', '0000-00-00'),
(955, 154, 1, 15, 5, '43.8000', '0000-00-00', '0000-00-00'),
(956, 154, 1, 20, 6, '42.9000', '0000-00-00', '0000-00-00'),
(957, 154, 1, 30, 7, '41.4000', '0000-00-00', '0000-00-00'),
(958, 154, 1, 40, 8, '40.4000', '0000-00-00', '0000-00-00'),
(959, 154, 1, 50, 9, '39.4000', '0000-00-00', '0000-00-00'),
(960, 154, 1, 75, 10, '38.0000', '0000-00-00', '0000-00-00'),
(961, 154, 1, 100, 11, '37.0000', '0000-00-00', '0000-00-00'),
(962, 170, 1, 2, 1, '83.0000', '0000-00-00', '0000-00-00'),
(963, 170, 1, 3, 2, '80.0000', '0000-00-00', '0000-00-00'),
(964, 170, 1, 5, 3, '76.7000', '0000-00-00', '0000-00-00'),
(965, 170, 1, 10, 4, '72.6000', '0000-00-00', '0000-00-00'),
(966, 170, 1, 15, 5, '70.3000', '0000-00-00', '0000-00-00'),
(967, 170, 1, 20, 6, '68.5000', '0000-00-00', '0000-00-00'),
(968, 170, 1, 30, 7, '66.2000', '0000-00-00', '0000-00-00'),
(969, 170, 1, 40, 8, '64.4000', '0000-00-00', '0000-00-00'),
(970, 170, 1, 50, 9, '63.1000', '0000-00-00', '0000-00-00'),
(971, 170, 1, 75, 10, '60.8000', '0000-00-00', '0000-00-00'),
(972, 170, 1, 100, 11, '59.0000', '0000-00-00', '0000-00-00'),
(973, 171, 1, 2, 1, '84.0000', '0000-00-00', '0000-00-00'),
(974, 171, 1, 3, 2, '81.0000', '0000-00-00', '0000-00-00'),
(975, 171, 1, 5, 3, '78.3000', '0000-00-00', '0000-00-00'),
(976, 171, 1, 10, 4, '74.4000', '0000-00-00', '0000-00-00'),
(977, 171, 1, 15, 5, '72.1000', '0000-00-00', '0000-00-00'),
(978, 171, 1, 20, 6, '70.6000', '0000-00-00', '0000-00-00'),
(979, 171, 1, 30, 7, '68.2000', '0000-00-00', '0000-00-00'),
(980, 171, 1, 40, 8, '66.4000', '0000-00-00', '0000-00-00'),
(981, 171, 1, 50, 9, '65.1000', '0000-00-00', '0000-00-00'),
(982, 171, 1, 75, 10, '63.1000', '0000-00-00', '0000-00-00'),
(983, 171, 1, 100, 11, '61.3000', '0000-00-00', '0000-00-00'),
(984, 172, 1, 2, 1, '84.0000', '0000-00-00', '0000-00-00'),
(985, 172, 1, 3, 2, '81.0000', '0000-00-00', '0000-00-00'),
(986, 172, 1, 5, 3, '78.3000', '0000-00-00', '0000-00-00'),
(987, 172, 1, 10, 4, '74.4000', '0000-00-00', '0000-00-00'),
(988, 172, 1, 15, 5, '72.1000', '0000-00-00', '0000-00-00'),
(989, 172, 1, 20, 6, '70.6000', '0000-00-00', '0000-00-00'),
(990, 172, 1, 30, 7, '68.2000', '0000-00-00', '0000-00-00'),
(991, 172, 1, 40, 8, '66.4000', '0000-00-00', '0000-00-00'),
(992, 172, 1, 50, 9, '65.1000', '0000-00-00', '0000-00-00'),
(993, 172, 1, 75, 10, '63.1000', '0000-00-00', '0000-00-00'),
(994, 172, 1, 100, 11, '61.3000', '0000-00-00', '0000-00-00'),
(995, 174, 1, 2, 0, '56.0000', '0000-00-00', '0000-00-00'),
(996, 174, 1, 3, 0, '55.0000', '0000-00-00', '0000-00-00'),
(997, 174, 1, 5, 0, '52.5000', '0000-00-00', '0000-00-00'),
(998, 174, 1, 10, 0, '49.2000', '0000-00-00', '0000-00-00'),
(999, 175, 1, 2, 0, '59.0000', '0000-00-00', '0000-00-00'),
(1000, 175, 1, 3, 0, '58.0000', '0000-00-00', '0000-00-00'),
(1001, 175, 1, 5, 0, '55.5000', '0000-00-00', '0000-00-00'),
(1002, 175, 1, 10, 0, '53.5000', '0000-00-00', '0000-00-00'),
(1003, 176, 1, 2, 0, '85.0000', '0000-00-00', '0000-00-00'),
(1004, 176, 1, 3, 0, '82.0000', '0000-00-00', '0000-00-00'),
(1005, 176, 1, 5, 0, '80.6000', '0000-00-00', '0000-00-00'),
(1006, 176, 1, 10, 0, '77.3000', '0000-00-00', '0000-00-00'),
(1007, 177, 1, 2, 0, '90.0000', '0000-00-00', '0000-00-00'),
(1008, 177, 1, 3, 0, '87.0000', '0000-00-00', '0000-00-00'),
(1009, 177, 1, 5, 0, '82.9000', '0000-00-00', '0000-00-00'),
(1010, 177, 1, 10, 0, '78.0000', '0000-00-00', '0000-00-00'),
(1011, 178, 1, 2, 0, '90.0000', '0000-00-00', '0000-00-00'),
(1012, 178, 1, 3, 0, '87.0000', '0000-00-00', '0000-00-00'),
(1013, 178, 1, 5, 0, '83.2000', '0000-00-00', '0000-00-00'),
(1014, 178, 1, 10, 0, '78.3000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_filter`
--

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_image`
--

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(1, 51, 'catalog/product/termopara.net-aogv-head.jpg', 2),
(2, 51, 'catalog/product/termopara.net-aogv-screw.jpg', 3),
(3, 51, 'catalog/product/termopara.net-01152-05.jpg', 4),
(4, 52, 'catalog/product/termopara.net-aogv-head.jpg', 2),
(5, 52, 'catalog/product/termopara.net-aogv-screw.jpg', 3),
(6, 52, 'catalog/product/termopara.net-01162-05.jpg', 4),
(7, 53, 'catalog/product/termopara.net-dani-head.jpg', 2),
(8, 53, 'catalog/product/termopara.net-dani-screw.jpg', 3),
(9, 53, 'catalog/product/termopara.net-01222-05.jpg', 4),
(10, 54, 'catalog/product/termopara.net-dani-head.jpg', 2),
(11, 54, 'catalog/product/termopara.net-dani-screw.jpg', 3),
(12, 54, 'catalog/product/termopara.net-01242-05.jpg', 4),
(13, 56, 'catalog/product/termopara.net-dani-head.jpg', 2),
(14, 56, 'catalog/product/termopara.net-dani-screw.jpg', 3),
(15, 56, 'catalog/product/termopara.net-01252-05.jpg', 4),
(16, 57, 'catalog/product/termopara.net-dani-head.jpg', 2),
(17, 57, 'catalog/product/termopara.net-dani-screw.jpg', 3),
(18, 57, 'catalog/product/termopara.net-01262-05.jpg', 4),
(19, 58, 'catalog/product/termopara.net-dani-head.jpg', 2),
(20, 58, 'catalog/product/termopara.net-dani-screw.jpg', 3),
(21, 58, 'catalog/product/termopara.net-01292-05.jpg', 4),
(22, 59, 'catalog/product/termopara.net-arbat-head.jpg', 2),
(23, 59, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(24, 59, 'catalog/product/termopara.net-01438-05.jpg', 4),
(25, 60, 'catalog/product/termopara.net-arbat-head.jpg', 2),
(26, 60, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(27, 60, 'catalog/product/termopara.net-01468-05.jpg', 4),
(28, 61, 'catalog/product/termopara.net-arbat-head.jpg', 2),
(29, 61, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(30, 61, 'catalog/product/termopara.net-01498-05.jpg', 4),
(31, 62, 'catalog/product/termopara.net-sitA3-head.jpg', 2),
(32, 62, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(33, 62, 'catalog/product/termopara.net-01749-05.jpg', 4),
(34, 63, 'catalog/product/termopara.net-sitA3-head.jpg', 2),
(35, 63, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(36, 63, 'catalog/product/termopara.net-01740-05.jpg', 4),
(37, 64, 'catalog/product/termopara.net-sitA3-head.jpg', 2),
(38, 64, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(39, 64, 'catalog/product/termopara.net-01760-05.jpg', 4),
(40, 65, 'catalog/product/termopara.net-sitA1-head.jpg', 2),
(41, 65, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(42, 65, 'catalog/product/termopara.net-01539-05.jpg', 4),
(43, 66, 'catalog/product/termopara.net-sitA1-head.jpg', 2),
(44, 66, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(45, 66, 'catalog/product/termopara.net-01549-05.jpg', 4),
(46, 67, 'catalog/product/termopara.net-sitA1-head.jpg', 2),
(47, 67, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(48, 67, 'catalog/product/termopara.net-01569-05.jpg', 4),
(49, 68, 'catalog/product/termopara.net-sitA1-head.jpg', 2),
(50, 68, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(51, 68, 'catalog/product/termopara.net-01560-05.jpg', 4),
(52, 69, 'catalog/product/termopara.net-honeywell-head.jpg', 2),
(53, 69, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(54, 69, 'catalog/product/termopara.net-01390-05.jpg', 4),
(55, 70, 'catalog/product/termopara.net-02119-03.jpg', 2),
(56, 70, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(57, 70, 'catalog/product/termopara.net-02119-05.jpg', 4),
(58, 71, 'catalog/product/termopara.net-02210-03.jpg', 2),
(59, 71, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(60, 71, 'catalog/product/termopara.net-02210-05.jpg', 4),
(61, 72, 'catalog/product/termopara.net-02310-03.jpg', 2),
(62, 72, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(63, 72, 'catalog/product/termopara.net-02310-05.jpg', 4),
(64, 73, 'catalog/product/termopara.net-02418-03.jpg', 2),
(65, 73, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(66, 73, 'catalog/product/termopara.net-02418-05.jpg', 4),
(67, 74, 'catalog/product/termopara.net-02428-03.jpg', 2),
(68, 74, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(69, 74, 'catalog/product/termopara.net-02428-05.jpg', 4),
(70, 75, 'catalog/product/termopara.net-02538-03.jpg', 2),
(71, 75, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(72, 75, 'catalog/product/termopara.net-02538-05.jpg', 4),
(73, 76, 'catalog/product/termopara.net-02310-03.jpg', 2),
(74, 76, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(75, 76, 'catalog/product/termopara.net-02558-05.jpg', 4),
(76, 77, 'catalog/product/termopara.net-02568-03.jpg', 2),
(77, 77, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(78, 77, 'catalog/product/termopara.net-02568-05.jpg', 4),
(79, 78, 'catalog/product/termopara.net-02578-03.jpg', 2),
(80, 78, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(81, 78, 'catalog/product/termopara.net-02578-05.jpg', 4),
(82, 79, 'catalog/product/termopara.net-03128-03.jpg', 2),
(83, 79, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(84, 79, 'catalog/product/termopara.net-03128-05.jpg', 4),
(85, 80, 'catalog/product/termopara.net-sitA3-head.jpg', 2),
(86, 80, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(87, 80, 'catalog/product/termopara.net-03228-05.jpg', 4),
(88, 81, 'catalog/product/termopara.net-03354-03.jpg', 2),
(89, 81, 'catalog/product/termopara.net-03354-04.jpg', 3),
(90, 81, 'catalog/product/termopara.net-03354-05.jpg', 4),
(91, 82, 'catalog/product/termopara.net-03454-03.jpg', 2),
(92, 82, 'catalog/product/termopara.net-03454-04.jpg', 3),
(93, 82, 'catalog/product/termopara.net-03454-05.JPG', 4),
(94, 83, 'catalog/product/termopara.net-03555-03.jpg', 2),
(95, 83, 'catalog/product/termopara.net-03555-04.jpg', 3),
(96, 83, 'catalog/product/termopara.net-03555-05.jpg', 4),
(97, 84, 'catalog/product/termopara.net-04130-03.jpg', 2),
(98, 84, 'catalog/product/termopara.net-04130-04.jpg', 3),
(99, 84, 'catalog/product/termopara.net-04130-05.jpg', 4),
(100, 85, 'catalog/product/termopara.net-04230-03.jpg', 2),
(101, 85, 'catalog/product/termopara.net-04230-04.jpg', 3),
(102, 85, 'catalog/product/termopara.net-04230-05.jpg', 4),
(103, 86, 'catalog/product/termopara.net-04230-03.jpg', 2),
(104, 86, 'catalog/product/termopara.net-04230-04.jpg', 3),
(105, 86, 'catalog/product/termopara.net-04240-05.jpg', 4),
(106, 87, 'catalog/product/termopara.net-04130-03.jpg', 2),
(107, 87, 'catalog/product/termopara.net-04130-04.jpg', 3),
(108, 87, 'catalog/product/termopara.net-04140-05.jpg', 4),
(109, 88, 'catalog/product/termopara.net-04130-03.jpg', 2),
(110, 88, 'catalog/product/termopara.net-04130-04.jpg', 3),
(111, 88, 'catalog/product/termopara.net-04160-05.jpg', 4),
(112, 89, 'catalog/product/termopara.net-04230-03.jpg', 2),
(113, 89, 'catalog/product/termopara.net-04230-04.jpg', 3),
(114, 89, 'catalog/product/termopara.net-04260-05.jpg', 4),
(115, 90, 'catalog/product/termopara.net-04300-03.jpg', 2),
(116, 90, 'catalog/product/termopara.net-04300-04.jpg', 3),
(117, 90, 'catalog/product/termopara.net-04350-05.jpg', 4),
(118, 91, 'catalog/product/termopara.net-04300-03.jpg', 2),
(119, 91, 'catalog/product/termopara.net-04300-04.jpg', 3),
(120, 91, 'catalog/product/termopara.net-04300-05.jpg', 4),
(121, 92, 'catalog/product/termopara.net-04440-03.jpg', 2),
(122, 92, 'catalog/product/termopara.net-04440-04.jpg', 3),
(123, 92, 'catalog/product/termopara.net-04440-05.jpg', 4),
(124, 93, 'catalog/product/termopara.net-04540-03.jpg', 2),
(125, 93, 'catalog/product/termopara.net-04540-04.jpg', 3),
(126, 93, 'catalog/product/termopara.net-04540-05.jpg', 4),
(127, 94, 'catalog/product/termopara.net-04620-03.jpg', 2),
(128, 94, 'catalog/product/termopara.net-04620-04.jpg', 3),
(129, 94, 'catalog/product/termopara.net-04620-05.jpg', 4),
(130, 95, 'catalog/product/termopara.net-04920-03.jpg', 2),
(131, 95, 'catalog/product/termopara.net-04920-04.jpg', 3),
(132, 95, 'catalog/product/termopara.net-04920-05.jpg', 4),
(133, 96, 'catalog/product/termopara.net-01838-03.jpg', 2),
(134, 96, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(135, 96, 'catalog/product/termopara.net-01838-05.jpg', 4),
(136, 97, 'catalog/product/termopara.net-01839-03.jpg', 2),
(137, 97, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(138, 97, 'catalog/product/termopara.net-01839-05.jpg', 4),
(139, 98, 'catalog/product/termopara.net-honeywell-head.jpg', 2),
(140, 98, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(141, 98, 'catalog/product/termopara.net-01368-05.jpg', 4),
(142, 99, 'catalog/product/termopara.net-05110-03.jpg', 2),
(143, 99, 'catalog/product/termopara.net-05110-04.jpg', 3),
(144, 99, 'catalog/product/termopara.net-05110-05.jpg', 4),
(145, 100, 'catalog/product/termopara.net-05512-03.jpg', 2),
(146, 100, 'catalog/product/termopara.net-05512-04.jpg', 3),
(147, 100, 'catalog/product/termopara.net-05512-05.jpg', 4),
(148, 101, 'catalog/product/termopara.net-05212-03.jpg', 2),
(149, 101, 'catalog/product/termopara.net-05212-04.jpg', 3),
(150, 101, 'catalog/product/termopara.net-05212-05.jpg', 4),
(151, 102, 'catalog/product/termopara.net-05221-03.jpg', 2),
(152, 102, 'catalog/product/termopara.net-05221-04.jpg', 3),
(153, 102, 'catalog/product/termopara.net-05221-05.jpg', 4),
(154, 103, 'catalog/product/termopara.net-05930-03.jpg', 2),
(155, 103, 'catalog/product/termopara.net-05930-04.jpg', 3),
(156, 103, 'catalog/product/termopara.net-05930-05.jpg', 4),
(157, 104, 'catalog/product/termopara.net-05612-03.jpg', 2),
(158, 104, 'catalog/product/termopara.net-05612-04.jpg', 3),
(159, 104, 'catalog/product/termopara.net-05612-05.jpg', 4),
(160, 105, 'catalog/product/termopara.net-05622-03.jpg', 2),
(161, 105, 'catalog/product/termopara.net-05622-04.jpg', 3),
(162, 105, 'catalog/product/termopara.net-05622-05.jpg', 4),
(163, 106, 'catalog/product/termopara.net-05613-03.jpg', 2),
(164, 106, 'catalog/product/termopara.net-05613-04.jpg', 3),
(165, 106, 'catalog/product/termopara.net-05613-05.jpg', 4),
(166, 107, 'catalog/product/termopara.net-05940-03.jpg', 2),
(167, 107, 'catalog/product/termopara.net-05940-04.jpg', 3),
(168, 107, 'catalog/product/termopara.net-05940-05.jpg', 4),
(169, 108, 'catalog/product/termopara.net-sitA1-head.jpg', 2),
(170, 108, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(171, 108, 'catalog/product/termopara.net-01529-05.jpg', 4),
(172, 109, 'catalog/product/termopara.net-04910-03.jpg', 2),
(173, 109, 'catalog/product/termopara.net-04910-04.jpg', 3),
(174, 109, 'catalog/product/termopara.net-04910-05.jpg', 4),
(175, 110, 'catalog/product/termopara.net-05950-03.jpg', 2),
(176, 110, 'catalog/product/termopara.net-05950-04.jpg', 3),
(177, 110, 'catalog/product/termopara.net-05950-05.jpg', 4),
(178, 111, 'catalog/product/termopara.net-05960-03.jpg', 2),
(179, 111, 'catalog/product/termopara.net-05960-04.jpg', 3),
(180, 111, 'catalog/product/termopara.net-05960-05.jpg', 4),
(181, 112, 'catalog/product/termopara.net-05980-03.jpg', 2),
(182, 112, 'catalog/product/termopara.net-05980-04.jpg', 3),
(183, 112, 'catalog/product/termopara.net-05980-05.jpg', 4),
(184, 113, 'catalog/product/termopara.net-05999-03.jpg', 2),
(185, 113, 'catalog/product/termopara.net-05999-04.jpg', 3),
(186, 113, 'catalog/product/termopara.net-05999-05.jpg', 4),
(187, 114, 'catalog/product/termopara.net-arbat-head.jpg', 2),
(188, 114, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(189, 114, 'catalog/product/termopara.net-01439-05.jpg', 4),
(190, 115, 'catalog/product/termopara.net-arbat-head.jpg', 2),
(191, 115, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(192, 115, 'catalog/product/termopara.net-01469-05.jpg', 4),
(193, 116, 'catalog/product/termopara.net-arbat-head.jpg', 2),
(194, 116, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(195, 116, 'catalog/product/termopara.net-01499-05.jpg', 4),
(196, 117, 'catalog/product/termopara.net-sitA1-head.jpg', 2),
(197, 117, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(198, 117, 'catalog/product/termopara.net-01589-05.jpg', 4),
(199, 118, 'catalog/product/termopara.net-sitA2-head.jpg', 2),
(200, 118, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(201, 118, 'catalog/product/termopara.net-01649-05.jpg', 4),
(202, 119, 'catalog/product/termopara.net-sitA2-head.jpg', 2),
(203, 119, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(204, 119, 'catalog/product/termopara.net-01669-05.jpg', 4),
(205, 120, 'catalog/product/termopara.net-01990-03.jpg', 2),
(206, 120, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(207, 120, 'catalog/product/termopara.net-01990-05.jpg', 4),
(208, 121, 'catalog/product/termopara.net-sitA3-head.jpg', 2),
(209, 121, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(210, 121, 'catalog/product/termopara.net-01769-05.jpg', 4),
(211, 122, 'catalog/product/termopara.net-sitA3-head.jpg', 2),
(212, 122, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(213, 122, 'catalog/product/termopara.net-01799-05.jpg', 4),
(214, 123, 'catalog/product/termopara.net-sitA2-head.jpg', 2),
(215, 123, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(216, 123, 'catalog/product/termopara.net-01639-05.jpg', 4),
(217, 124, 'catalog/product/termopara.net-sitA1-head.jpg', 2),
(218, 124, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(219, 124, 'catalog/product/termopara.net-01568-05.jpg', 4),
(220, 125, 'catalog/product/termopara.net-01848-03.jpg', 2),
(221, 125, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(222, 125, 'catalog/product/termopara.net-01848-05.jpg', 4),
(223, 127, 'catalog/product/termopara.net-01849-03.jpg', 2),
(224, 127, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(225, 127, 'catalog/product/termopara.net-01849-05.jpg', 4),
(226, 128, 'catalog/product/termopara.net-03604-03.jpg', 2),
(227, 128, 'catalog/product/termopara.net-03604-04.jpg', 3),
(228, 128, 'catalog/product/termopara.net-03604-05.jpg', 4),
(229, 129, 'catalog/product/termopara.net-02139-03.jpg', 2),
(230, 129, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(231, 129, 'catalog/product/termopara.net-02139-05.jpg', 4),
(232, 130, 'catalog/product/termopara.net-aogv-head.jpg', 2),
(233, 130, 'catalog/product/termopara.net-aogv-screw.jpg', 3),
(234, 130, 'catalog/product/termopara.net-01182-05.jpg', 4),
(235, 131, 'catalog/product/termopara.net-aogv-head.jpg', 2),
(236, 131, 'catalog/product/termopara.net-aogv-screw.jpg', 3),
(237, 131, 'catalog/product/termopara.net-01192-05.jpg', 4),
(238, 132, 'catalog/product/termopara.net-03724-03.jpg', 2),
(239, 132, 'catalog/product/termopara.net-03724-04.jpg', 3),
(240, 132, 'catalog/product/termopara.net-03724-05.jpg', 4),
(241, 133, 'catalog/product/termopara.net-arbat-head.jpg', 2),
(242, 133, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(243, 133, 'catalog/product/termopara.net-01428-05.jpg', 4),
(244, 134, 'catalog/product/termopara.net-02129-03.jpg', 2),
(245, 134, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(246, 134, 'catalog/product/termopara.net-02129-05.jpg', 4),
(247, 135, 'catalog/product/termopara.net-03828-03.jpg', 2),
(248, 135, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(249, 135, 'catalog/product/termopara.net-03828-05.jpg', 4),
(250, 136, 'catalog/product/termopara.net-03938-03.jpg', 2),
(251, 136, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(252, 136, 'catalog/product/termopara.net-03938-05.jpg', 4),
(253, 137, 'catalog/product/termopara.net-05310-03.jpg', 2),
(254, 137, 'catalog/product/termopara.net-05310-04.jpg', 3),
(255, 137, 'catalog/product/termopara.net-05310-05.jpg', 4),
(256, 138, 'catalog/product/termopara.net-05320-03.jpg', 2),
(257, 138, 'catalog/product/termopara.net-05320-04.jpg', 3),
(258, 138, 'catalog/product/termopara.net-05320-05.jpg', 4),
(259, 139, 'catalog/product/termopara.net-05402-03.jpg', 2),
(260, 139, 'catalog/product/termopara.net-05402-04.jpg', 3),
(261, 139, 'catalog/product/termopara.net-05402-05.jpg', 4),
(262, 140, 'catalog/product/termopara.net-05412-03.jpg', 2),
(263, 140, 'catalog/product/termopara.net-05412-04.jpg', 3),
(264, 140, 'catalog/product/termopara.net-05412-05.jpg', 4),
(265, 141, 'catalog/product/termopara.net-05748-03.jpg', 2),
(266, 141, 'catalog/product/termopara.net-05748-04.jpg', 3),
(267, 141, 'catalog/product/termopara.net-05748-05.jpg', 4),
(268, 142, 'catalog/product/termopara.net-05749-03.jpg', 2),
(269, 142, 'catalog/product/termopara.net-05749-04.jpg', 3),
(270, 142, 'catalog/product/termopara.net-05749-05.jpg', 4),
(271, 143, 'catalog/product/termopara.net-05740-03.jpg', 2),
(272, 143, 'catalog/product/termopara.net-05740-04.jpg', 3),
(273, 143, 'catalog/product/termopara.net-05740-05.jpg', 4),
(274, 144, 'catalog/product/termopara.net-05422-03.jpg', 2),
(275, 144, 'catalog/product/termopara.net-05422-04.jpg', 3),
(276, 144, 'catalog/product/termopara.net-05422-05.jpg', 4),
(277, 145, 'catalog/product/termopara.net-sitA1-head.jpg', 2),
(278, 145, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(279, 145, 'catalog/product/termopara.net-01540-05.jpg', 4),
(280, 146, 'catalog/product/termopara.net-04910-03.jpg', 2),
(281, 146, 'catalog/product/termopara.net-04910-04.jpg', 3),
(282, 146, 'catalog/product/termopara.net-04912-05.jpg', 4),
(283, 147, 'catalog/product/termopara.net-honeywell-head.jpg', 2),
(284, 147, 'catalog/product/termopara.net-screw-i1132.jpg', 3),
(285, 147, 'catalog/product/termopara.net-01391-05.jpg', 4),
(286, 148, 'catalog/product/termopara.net-01528-03.jpg', 2),
(287, 148, 'catalog/product/termopara.net-01528-04.jpg', 3),
(288, 148, 'catalog/product/termopara.net-01528-05.jpg', 4),
(289, 149, 'catalog/product/termopara.net-sitA1-head.jpg', 2),
(290, 149, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(291, 149, 'catalog/product/termopara.net-01580-05.jpg', 4),
(292, 150, 'catalog/product/termopara.net-04300-03.jpg', 2),
(293, 150, 'catalog/product/termopara.net-04300-04.jpg', 3),
(294, 150, 'catalog/product/termopara.net-04330-05.jpg', 4),
(295, 151, 'catalog/product/termopara.net-05240-03.jpg', 2),
(296, 151, 'catalog/product/termopara.net-05240-04.jpg', 3),
(297, 151, 'catalog/product/termopara.net-05240-05.jpg', 4),
(298, 152, 'catalog/product/termopara.net-05800-03.jpg', 2),
(299, 152, 'catalog/product/termopara.net-05800-04.jpg', 3),
(300, 152, 'catalog/product/termopara.net-05800-05.jpg', 4),
(301, 153, 'catalog/product/termopara.net-04730-03.jpg', 2),
(302, 153, 'catalog/product/termopara.net-04730-04.jpg', 3),
(303, 153, 'catalog/product/termopara.net-04730-05.jpg', 4),
(304, 154, 'catalog/product/termopara.net-04740-03.jpg', 2),
(305, 154, 'catalog/product/termopara.net-04740-04.jpg', 3),
(306, 154, 'catalog/product/termopara.net-04740-05.jpg', 4),
(307, 155, 'catalog/product/termopara.net-05701-03.jpg', 2),
(308, 155, 'catalog/product/termopara.net-05701-04.jpg', 3),
(309, 155, 'catalog/product/termopara.net-05701-05.jpg', 4),
(310, 156, 'catalog/product/termopara.net-05701-03.jpg', 2),
(311, 156, 'catalog/product/termopara.net-05701-04.jpg', 3),
(312, 156, 'catalog/product/termopara.net-05701-05.jpg', 4),
(313, 157, 'catalog/product/termopara.net-05701-03.jpg', 2),
(314, 157, 'catalog/product/termopara.net-05701-04.jpg', 3),
(315, 157, 'catalog/product/termopara.net-05701-05.jpg', 4),
(316, 158, 'catalog/product/termopara.net-05701-03.jpg', 2),
(317, 158, 'catalog/product/termopara.net-05701-04.jpg', 3),
(318, 158, 'catalog/product/termopara.net-05701-05.jpg', 4),
(319, 159, 'catalog/product/termopara.net-05701-03.jpg', 2),
(320, 159, 'catalog/product/termopara.net-05701-04.jpg', 3),
(321, 159, 'catalog/product/termopara.net-05701-05.jpg', 4),
(322, 160, 'catalog/product/termopara.net-05701-03.jpg', 2),
(323, 160, 'catalog/product/termopara.net-05701-04.jpg', 3),
(324, 160, 'catalog/product/termopara.net-05701-05.jpg', 4),
(325, 161, 'catalog/product/termopara.net-05701-03.jpg', 2),
(326, 161, 'catalog/product/termopara.net-05701-04.jpg', 3),
(327, 161, 'catalog/product/termopara.net-05701-05.jpg', 4),
(328, 162, 'catalog/product/termopara.net-05701-03.jpg', 2),
(329, 162, 'catalog/product/termopara.net-05701-04.jpg', 3),
(330, 162, 'catalog/product/termopara.net-05701-05.jpg', 4),
(331, 163, 'catalog/product/termopara.net-05701-03.jpg', 2),
(332, 163, 'catalog/product/termopara.net-05701-04.jpg', 3),
(333, 163, 'catalog/product/termopara.net-05701-05.jpg', 4),
(334, 164, 'catalog/product/termopara.net-05701-03.jpg', 2),
(335, 164, 'catalog/product/termopara.net-05701-04.jpg', 3),
(336, 164, 'catalog/product/termopara.net-05701-05.jpg', 4),
(337, 165, 'catalog/product/termopara.net-05701-03.jpg', 2),
(338, 165, 'catalog/product/termopara.net-05701-04.jpg', 3),
(339, 165, 'catalog/product/termopara.net-05701-05.jpg', 4),
(340, 166, 'catalog/product/termopara.net-05701-03.jpg', 2),
(341, 166, 'catalog/product/termopara.net-05701-04.jpg', 3),
(342, 166, 'catalog/product/termopara.net-05701-05.jpg', 4),
(343, 167, 'catalog/product/termopara.net-05701-03.jpg', 2),
(344, 167, 'catalog/product/termopara.net-05701-04.jpg', 3),
(345, 167, 'catalog/product/termopara.net-05701-05.jpg', 4),
(346, 168, 'catalog/product/termopara.net-05701-03.jpg', 2),
(347, 168, 'catalog/product/termopara.net-05701-04.jpg', 3),
(348, 168, 'catalog/product/termopara.net-05701-05.jpg', 4),
(349, 169, 'catalog/product/termopara.net-05701-03.jpg', 2),
(350, 169, 'catalog/product/termopara.net-05701-04.jpg', 3),
(351, 169, 'catalog/product/termopara.net-05701-05.jpg', 4),
(352, 170, 'catalog/product/termopara.net-honeywell-head.jpg', 2),
(353, 170, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(354, 170, 'catalog/product/termopara.net-01360-05.jpg', 4),
(355, 171, 'catalog/product/termopara.net-honeywell-head.jpg', 2),
(356, 171, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(357, 171, 'catalog/product/termopara.net-01370-05.jpg', 4),
(358, 172, 'catalog/product/termopara.net-honeywell-head.jpg', 2),
(359, 172, 'catalog/product/termopara.net-screw-i1132.jpg', 3),
(360, 172, 'catalog/product/termopara.net-01378-05.jpg', 4),
(361, 173, 'catalog/product/termopara.net-sitA1-head.jpg', 2),
(362, 173, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(363, 173, 'catalog/product/termopara.net-01599-05.jpg', 4),
(364, 174, 'catalog/product/termopara.net-07569-03.jpg', 2),
(365, 174, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(366, 174, 'catalog/product/termopara.net-07569-05.jpg', 4),
(367, 175, 'catalog/product/termopara.net-01869-03.jpg', 2),
(368, 175, 'catalog/product/termopara.net-screw-m9.jpg', 3),
(369, 175, 'catalog/product/termopara.net-01869-05.jpg', 4),
(370, 176, 'catalog/product/termopara.net-07390-03.jpg', 2),
(371, 176, 'catalog/product/termopara.net-screw-m10.jpg', 3),
(372, 176, 'catalog/product/termopara.net-07390-05.jpg', 4),
(373, 177, 'catalog/product/termopara.net-07128-03.jpg', 2),
(374, 177, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(375, 177, 'catalog/product/termopara.net-07128-05.jpg', 4),
(376, 178, 'catalog/product/termopara.net-sitA3-head.jpg', 2),
(377, 178, 'catalog/product/termopara.net-screw-m8.jpg', 3),
(378, 178, 'catalog/product/termopara.net-07228-05.jpg', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option`
--

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option_value`
--

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_recurring`
--

CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related`
--

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(51, 51),
(51, 52),
(51, 54),
(51, 58),
(51, 59),
(51, 60),
(51, 62),
(51, 63),
(51, 65),
(51, 68),
(51, 69),
(51, 70),
(51, 72),
(51, 76),
(51, 78),
(51, 80),
(51, 81),
(51, 84),
(51, 87),
(51, 90),
(51, 91),
(51, 94),
(51, 99),
(51, 100),
(51, 101),
(51, 104),
(51, 118),
(51, 119),
(51, 120),
(51, 121),
(51, 122),
(51, 123),
(51, 125),
(51, 127),
(51, 129),
(51, 130),
(51, 131),
(51, 133),
(51, 135),
(51, 137),
(51, 138),
(51, 139),
(51, 140),
(51, 141),
(51, 142),
(51, 143),
(51, 144),
(51, 145),
(51, 146),
(51, 150),
(51, 151),
(51, 152),
(51, 155),
(51, 156),
(51, 158),
(51, 162),
(51, 163),
(51, 164),
(51, 165),
(51, 166),
(51, 167),
(51, 168),
(51, 169),
(51, 173),
(51, 174),
(51, 175),
(51, 176),
(51, 177),
(51, 178),
(52, 51),
(52, 52),
(52, 54),
(52, 58),
(52, 59),
(52, 60),
(52, 62),
(52, 63),
(52, 65),
(52, 68),
(52, 69),
(52, 70),
(52, 72),
(52, 76),
(52, 78),
(52, 80),
(52, 81),
(52, 84),
(52, 87),
(52, 90),
(52, 91),
(52, 94),
(52, 99),
(52, 100),
(52, 101),
(52, 104),
(52, 118),
(52, 119),
(52, 120),
(52, 121),
(52, 122),
(52, 123),
(52, 125),
(52, 127),
(52, 129),
(52, 130),
(52, 131),
(52, 133),
(52, 135),
(52, 137),
(52, 138),
(52, 139),
(52, 140),
(52, 141),
(52, 142),
(52, 143),
(52, 144),
(52, 145),
(52, 146),
(52, 150),
(52, 151),
(52, 152),
(52, 155),
(52, 156),
(52, 158),
(52, 162),
(52, 163),
(52, 164),
(52, 165),
(52, 166),
(52, 167),
(52, 168),
(52, 169),
(52, 173),
(52, 174),
(52, 175),
(52, 176),
(52, 177),
(52, 178),
(53, 54),
(53, 59),
(53, 63),
(53, 65),
(53, 69),
(53, 76),
(53, 78),
(53, 80),
(53, 81),
(53, 84),
(53, 87),
(53, 100),
(53, 135),
(53, 146),
(54, 51),
(54, 52),
(54, 53),
(54, 54),
(54, 58),
(54, 59),
(54, 60),
(54, 62),
(54, 63),
(54, 65),
(54, 68),
(54, 69),
(54, 70),
(54, 72),
(54, 76),
(54, 78),
(54, 80),
(54, 81),
(54, 84),
(54, 87),
(54, 90),
(54, 91),
(54, 94),
(54, 99),
(54, 100),
(54, 101),
(54, 104),
(54, 118),
(54, 119),
(54, 120),
(54, 121),
(54, 122),
(54, 123),
(54, 125),
(54, 127),
(54, 129),
(54, 130),
(54, 131),
(54, 133),
(54, 135),
(54, 137),
(54, 138),
(54, 139),
(54, 140),
(54, 141),
(54, 142),
(54, 143),
(54, 144),
(54, 145),
(54, 146),
(54, 150),
(54, 151),
(54, 152),
(54, 155),
(54, 156),
(54, 158),
(54, 162),
(54, 163),
(54, 164),
(54, 165),
(54, 166),
(54, 167),
(54, 168),
(54, 169),
(54, 173),
(54, 174),
(54, 175),
(54, 176),
(54, 177),
(54, 178),
(56, 59),
(56, 63),
(56, 65),
(56, 69),
(56, 76),
(56, 78),
(56, 80),
(56, 81),
(56, 84),
(56, 87),
(56, 100),
(56, 135),
(56, 146),
(57, 59),
(57, 63),
(57, 65),
(57, 69),
(57, 76),
(57, 78),
(57, 80),
(57, 81),
(57, 84),
(57, 87),
(57, 100),
(57, 135),
(57, 146),
(58, 51),
(58, 52),
(58, 54),
(58, 58),
(58, 59),
(58, 63),
(58, 65),
(58, 69),
(58, 70),
(58, 72),
(58, 76),
(58, 78),
(58, 80),
(58, 81),
(58, 84),
(58, 87),
(58, 99),
(58, 100),
(58, 101),
(58, 120),
(58, 135),
(58, 137),
(58, 138),
(58, 139),
(58, 141),
(58, 142),
(58, 143),
(58, 144),
(58, 146),
(58, 151),
(58, 152),
(58, 158),
(58, 162),
(58, 165),
(59, 51),
(59, 52),
(59, 53),
(59, 54),
(59, 56),
(59, 57),
(59, 58),
(59, 59),
(59, 60),
(59, 62),
(59, 63),
(59, 65),
(59, 68),
(59, 69),
(59, 70),
(59, 72),
(59, 76),
(59, 78),
(59, 80),
(59, 81),
(59, 84),
(59, 87),
(59, 90),
(59, 91),
(59, 94),
(59, 98),
(59, 99),
(59, 100),
(59, 101),
(59, 104),
(59, 118),
(59, 119),
(59, 120),
(59, 121),
(59, 122),
(59, 123),
(59, 125),
(59, 127),
(59, 129),
(59, 130),
(59, 131),
(59, 133),
(59, 135),
(59, 137),
(59, 138),
(59, 139),
(59, 140),
(59, 141),
(59, 142),
(59, 143),
(59, 144),
(59, 145),
(59, 146),
(59, 147),
(59, 150),
(59, 151),
(59, 152),
(59, 155),
(59, 156),
(59, 158),
(59, 162),
(59, 163),
(59, 164),
(59, 165),
(59, 166),
(59, 167),
(59, 168),
(59, 169),
(59, 170),
(59, 171),
(59, 172),
(59, 173),
(59, 174),
(59, 175),
(59, 176),
(59, 177),
(59, 178),
(60, 51),
(60, 52),
(60, 54),
(60, 59),
(60, 63),
(60, 65),
(60, 69),
(60, 76),
(60, 78),
(60, 80),
(60, 81),
(60, 84),
(60, 87),
(60, 100),
(60, 135),
(60, 146),
(61, 63),
(61, 65),
(61, 76),
(61, 78),
(61, 80),
(61, 81),
(61, 84),
(61, 87),
(61, 100),
(61, 135),
(61, 146),
(62, 51),
(62, 52),
(62, 54),
(62, 59),
(62, 63),
(62, 65),
(62, 69),
(62, 76),
(62, 78),
(62, 80),
(62, 81),
(62, 84),
(62, 87),
(62, 100),
(62, 135),
(62, 146),
(63, 51),
(63, 52),
(63, 53),
(63, 54),
(63, 56),
(63, 57),
(63, 58),
(63, 59),
(63, 60),
(63, 61),
(63, 62),
(63, 63),
(63, 65),
(63, 66),
(63, 67),
(63, 68),
(63, 69),
(63, 70),
(63, 72),
(63, 76),
(63, 78),
(63, 80),
(63, 81),
(63, 84),
(63, 87),
(63, 90),
(63, 91),
(63, 94),
(63, 98),
(63, 99),
(63, 100),
(63, 101),
(63, 104),
(63, 108),
(63, 114),
(63, 115),
(63, 116),
(63, 117),
(63, 118),
(63, 119),
(63, 120),
(63, 121),
(63, 122),
(63, 123),
(63, 124),
(63, 125),
(63, 127),
(63, 129),
(63, 130),
(63, 131),
(63, 133),
(63, 135),
(63, 137),
(63, 138),
(63, 139),
(63, 140),
(63, 141),
(63, 142),
(63, 143),
(63, 144),
(63, 145),
(63, 146),
(63, 147),
(63, 149),
(63, 150),
(63, 151),
(63, 152),
(63, 155),
(63, 156),
(63, 158),
(63, 162),
(63, 163),
(63, 164),
(63, 165),
(63, 166),
(63, 167),
(63, 168),
(63, 169),
(63, 170),
(63, 171),
(63, 172),
(63, 173),
(63, 174),
(63, 175),
(63, 176),
(63, 177),
(63, 178),
(64, 76),
(64, 78),
(64, 80),
(64, 81),
(64, 84),
(64, 87),
(64, 100),
(64, 135),
(64, 146),
(65, 51),
(65, 52),
(65, 53),
(65, 54),
(65, 56),
(65, 57),
(65, 58),
(65, 59),
(65, 60),
(65, 61),
(65, 62),
(65, 63),
(65, 65),
(65, 68),
(65, 69),
(65, 70),
(65, 72),
(65, 76),
(65, 78),
(65, 80),
(65, 81),
(65, 84),
(65, 87),
(65, 90),
(65, 91),
(65, 94),
(65, 98),
(65, 99),
(65, 100),
(65, 101),
(65, 104),
(65, 114),
(65, 115),
(65, 116),
(65, 118),
(65, 119),
(65, 120),
(65, 121),
(65, 122),
(65, 123),
(65, 125),
(65, 127),
(65, 129),
(65, 130),
(65, 131),
(65, 133),
(65, 135),
(65, 137),
(65, 138),
(65, 139),
(65, 140),
(65, 141),
(65, 142),
(65, 143),
(65, 144),
(65, 145),
(65, 146),
(65, 147),
(65, 150),
(65, 151),
(65, 152),
(65, 155),
(65, 156),
(65, 158),
(65, 162),
(65, 163),
(65, 164),
(65, 165),
(65, 166),
(65, 167),
(65, 168),
(65, 169),
(65, 170),
(65, 171),
(65, 172),
(65, 173),
(65, 174),
(65, 175),
(65, 176),
(65, 177),
(65, 178),
(66, 63),
(66, 76),
(66, 78),
(66, 80),
(66, 81),
(66, 84),
(66, 87),
(66, 100),
(66, 135),
(66, 146),
(67, 63),
(67, 76),
(67, 78),
(67, 80),
(67, 81),
(67, 84),
(67, 87),
(67, 100),
(67, 135),
(67, 146),
(68, 51),
(68, 52),
(68, 54),
(68, 59),
(68, 63),
(68, 65),
(68, 69),
(68, 76),
(68, 78),
(68, 80),
(68, 81),
(68, 84),
(68, 87),
(68, 100),
(68, 135),
(68, 146),
(69, 51),
(69, 52),
(69, 53),
(69, 54),
(69, 56),
(69, 57),
(69, 58),
(69, 59),
(69, 60),
(69, 62),
(69, 63),
(69, 65),
(69, 68),
(69, 69),
(69, 70),
(69, 72),
(69, 76),
(69, 78),
(69, 80),
(69, 81),
(69, 84),
(69, 87),
(69, 90),
(69, 91),
(69, 94),
(69, 98),
(69, 99),
(69, 100),
(69, 101),
(69, 104),
(69, 118),
(69, 119),
(69, 120),
(69, 121),
(69, 122),
(69, 123),
(69, 125),
(69, 127),
(69, 129),
(69, 130),
(69, 131),
(69, 133),
(69, 135),
(69, 137),
(69, 138),
(69, 139),
(69, 140),
(69, 141),
(69, 142),
(69, 143),
(69, 144),
(69, 145),
(69, 146),
(69, 147),
(69, 150),
(69, 151),
(69, 152),
(69, 155),
(69, 156),
(69, 158),
(69, 162),
(69, 163),
(69, 164),
(69, 165),
(69, 166),
(69, 167),
(69, 168),
(69, 169),
(69, 170),
(69, 171),
(69, 172),
(69, 173),
(69, 174),
(69, 175),
(69, 176),
(69, 177),
(69, 178),
(70, 51),
(70, 52),
(70, 54),
(70, 58),
(70, 59),
(70, 63),
(70, 65),
(70, 69),
(70, 70),
(70, 72),
(70, 76),
(70, 78),
(70, 80),
(70, 81),
(70, 84),
(70, 87),
(70, 99),
(70, 100),
(70, 101),
(70, 120),
(70, 130),
(70, 131),
(70, 133),
(70, 135),
(70, 137),
(70, 138),
(70, 139),
(70, 141),
(70, 142),
(70, 143),
(70, 144),
(70, 146),
(70, 151),
(70, 152),
(70, 158),
(70, 162),
(70, 165),
(71, 76),
(71, 78),
(71, 80),
(71, 81),
(71, 84),
(71, 87),
(71, 100),
(71, 135),
(71, 146),
(72, 51),
(72, 52),
(72, 54),
(72, 58),
(72, 59),
(72, 63),
(72, 65),
(72, 69),
(72, 70),
(72, 76),
(72, 78),
(72, 80),
(72, 81),
(72, 84),
(72, 87),
(72, 99),
(72, 100),
(72, 101),
(72, 120),
(72, 130),
(72, 131),
(72, 133),
(72, 135),
(72, 137),
(72, 138),
(72, 139),
(72, 141),
(72, 142),
(72, 143),
(72, 144),
(72, 146),
(72, 151),
(72, 152),
(72, 158),
(72, 162),
(72, 165),
(73, 76),
(73, 78),
(73, 80),
(73, 81),
(73, 84),
(73, 87),
(73, 100),
(73, 135),
(73, 146),
(74, 76),
(74, 78),
(74, 80),
(74, 81),
(74, 84),
(74, 87),
(74, 100),
(74, 135),
(74, 146),
(75, 76),
(75, 78),
(75, 80),
(75, 81),
(75, 84),
(75, 87),
(75, 100),
(75, 135),
(75, 146),
(76, 51),
(76, 52),
(76, 53),
(76, 54),
(76, 56),
(76, 57),
(76, 58),
(76, 59),
(76, 60),
(76, 61),
(76, 62),
(76, 63),
(76, 64),
(76, 65),
(76, 66),
(76, 67),
(76, 68),
(76, 69),
(76, 70),
(76, 71),
(76, 72),
(76, 73),
(76, 74),
(76, 75),
(76, 76),
(76, 78),
(76, 80),
(76, 81),
(76, 84),
(76, 87),
(76, 90),
(76, 91),
(76, 94),
(76, 96),
(76, 97),
(76, 98),
(76, 99),
(76, 100),
(76, 101),
(76, 104),
(76, 108),
(76, 114),
(76, 115),
(76, 116),
(76, 117),
(76, 118),
(76, 119),
(76, 120),
(76, 121),
(76, 122),
(76, 123),
(76, 124),
(76, 125),
(76, 127),
(76, 129),
(76, 130),
(76, 131),
(76, 133),
(76, 134),
(76, 135),
(76, 137),
(76, 138),
(76, 139),
(76, 140),
(76, 141),
(76, 142),
(76, 143),
(76, 144),
(76, 145),
(76, 146),
(76, 147),
(76, 149),
(76, 150),
(76, 151),
(76, 152),
(76, 155),
(76, 156),
(76, 158),
(76, 162),
(76, 163),
(76, 164),
(76, 165),
(76, 166),
(76, 167),
(76, 168),
(76, 169),
(76, 170),
(76, 171),
(76, 172),
(76, 173),
(76, 174),
(76, 175),
(76, 176),
(76, 177),
(76, 178),
(77, 78),
(77, 80),
(77, 81),
(77, 84),
(77, 87),
(77, 100),
(77, 135),
(77, 146),
(78, 51),
(78, 52),
(78, 53),
(78, 54),
(78, 56),
(78, 57),
(78, 58),
(78, 59),
(78, 60),
(78, 61),
(78, 62),
(78, 63),
(78, 64),
(78, 65),
(78, 66),
(78, 67),
(78, 68),
(78, 69),
(78, 70),
(78, 71),
(78, 72),
(78, 73),
(78, 74),
(78, 75),
(78, 76),
(78, 77),
(78, 78),
(78, 80),
(78, 81),
(78, 84),
(78, 87),
(78, 90),
(78, 91),
(78, 94),
(78, 96),
(78, 97),
(78, 98),
(78, 99),
(78, 100),
(78, 101),
(78, 104),
(78, 108),
(78, 114),
(78, 115),
(78, 116),
(78, 117),
(78, 118),
(78, 119),
(78, 120),
(78, 121),
(78, 122),
(78, 123),
(78, 124),
(78, 125),
(78, 127),
(78, 129),
(78, 130),
(78, 131),
(78, 133),
(78, 134),
(78, 135),
(78, 137),
(78, 138),
(78, 139),
(78, 140),
(78, 141),
(78, 142),
(78, 143),
(78, 144),
(78, 145),
(78, 146),
(78, 147),
(78, 149),
(78, 150),
(78, 151),
(78, 152),
(78, 155),
(78, 156),
(78, 158),
(78, 162),
(78, 163),
(78, 164),
(78, 165),
(78, 166),
(78, 167),
(78, 168),
(78, 169),
(78, 170),
(78, 171),
(78, 172),
(78, 173),
(78, 174),
(78, 175),
(78, 176),
(78, 177),
(78, 178),
(79, 80),
(79, 81),
(79, 84),
(79, 87),
(79, 100),
(79, 135),
(79, 146),
(80, 51),
(80, 52),
(80, 53),
(80, 54),
(80, 56),
(80, 57),
(80, 58),
(80, 59),
(80, 60),
(80, 61),
(80, 62),
(80, 63),
(80, 64),
(80, 65),
(80, 66),
(80, 67),
(80, 68),
(80, 69),
(80, 70),
(80, 71),
(80, 72),
(80, 73),
(80, 74),
(80, 75),
(80, 76),
(80, 77),
(80, 78),
(80, 79),
(80, 80),
(80, 81),
(80, 84),
(80, 87),
(80, 90),
(80, 91),
(80, 94),
(80, 96),
(80, 97),
(80, 98),
(80, 99),
(80, 100),
(80, 101),
(80, 104),
(80, 108),
(80, 114),
(80, 115),
(80, 116),
(80, 117),
(80, 118),
(80, 119),
(80, 120),
(80, 121),
(80, 122),
(80, 123),
(80, 124),
(80, 125),
(80, 127),
(80, 129),
(80, 130),
(80, 131),
(80, 133),
(80, 134),
(80, 135),
(80, 137),
(80, 138),
(80, 139),
(80, 140),
(80, 141),
(80, 142),
(80, 143),
(80, 144),
(80, 145),
(80, 146),
(80, 147),
(80, 149),
(80, 150),
(80, 151),
(80, 152),
(80, 155),
(80, 156),
(80, 158),
(80, 162),
(80, 163),
(80, 164),
(80, 165),
(80, 166),
(80, 167),
(80, 168),
(80, 169),
(80, 170),
(80, 171),
(80, 172),
(80, 173),
(80, 174),
(80, 175),
(80, 176),
(80, 177),
(80, 178),
(81, 51),
(81, 52),
(81, 53),
(81, 54),
(81, 56),
(81, 57),
(81, 58),
(81, 59),
(81, 60),
(81, 61),
(81, 62),
(81, 63),
(81, 64),
(81, 65),
(81, 66),
(81, 67),
(81, 68),
(81, 69),
(81, 70),
(81, 71),
(81, 72),
(81, 73),
(81, 74),
(81, 75),
(81, 76),
(81, 77),
(81, 78),
(81, 79),
(81, 80),
(81, 81),
(81, 84),
(81, 87),
(81, 90),
(81, 91),
(81, 94),
(81, 96),
(81, 97),
(81, 98),
(81, 99),
(81, 100),
(81, 101),
(81, 104),
(81, 108),
(81, 114),
(81, 115),
(81, 116),
(81, 117),
(81, 118),
(81, 119),
(81, 120),
(81, 121),
(81, 122),
(81, 123),
(81, 124),
(81, 125),
(81, 127),
(81, 128),
(81, 129),
(81, 130),
(81, 131),
(81, 132),
(81, 133),
(81, 134),
(81, 135),
(81, 136),
(81, 137),
(81, 138),
(81, 139),
(81, 140),
(81, 141),
(81, 142),
(81, 143),
(81, 144),
(81, 145),
(81, 146),
(81, 147),
(81, 149),
(81, 150),
(81, 151),
(81, 152),
(81, 155),
(81, 156),
(81, 158),
(81, 162),
(81, 163),
(81, 164),
(81, 165),
(81, 166),
(81, 167),
(81, 168),
(81, 169),
(81, 170),
(81, 171),
(81, 172),
(81, 173),
(81, 174),
(81, 175),
(81, 176),
(81, 177),
(81, 178),
(82, 84),
(82, 87),
(82, 100),
(82, 146),
(83, 84),
(83, 87),
(83, 100),
(83, 146),
(84, 51),
(84, 52),
(84, 53),
(84, 54),
(84, 56),
(84, 57),
(84, 58),
(84, 59),
(84, 60),
(84, 61),
(84, 62),
(84, 63),
(84, 64),
(84, 65),
(84, 66),
(84, 67),
(84, 68),
(84, 69),
(84, 70),
(84, 71),
(84, 72),
(84, 73),
(84, 74),
(84, 75),
(84, 76),
(84, 77),
(84, 78),
(84, 79),
(84, 80),
(84, 81),
(84, 82),
(84, 83),
(84, 84),
(84, 87),
(84, 90),
(84, 91),
(84, 94),
(84, 96),
(84, 97),
(84, 98),
(84, 99),
(84, 100),
(84, 101),
(84, 104),
(84, 108),
(84, 114),
(84, 115),
(84, 116),
(84, 117),
(84, 118),
(84, 119),
(84, 120),
(84, 121),
(84, 122),
(84, 123),
(84, 124),
(84, 125),
(84, 127),
(84, 128),
(84, 129),
(84, 130),
(84, 131),
(84, 132),
(84, 133),
(84, 134),
(84, 135),
(84, 136),
(84, 137),
(84, 138),
(84, 139),
(84, 140),
(84, 141),
(84, 142),
(84, 143),
(84, 144),
(84, 145),
(84, 146),
(84, 147),
(84, 149),
(84, 150),
(84, 151),
(84, 152),
(84, 155),
(84, 156),
(84, 158),
(84, 162),
(84, 163),
(84, 164),
(84, 165),
(84, 166),
(84, 167),
(84, 168),
(84, 169),
(84, 170),
(84, 171),
(84, 172),
(84, 173),
(84, 174),
(84, 175),
(84, 176),
(84, 177),
(84, 178),
(85, 87),
(85, 100),
(85, 146),
(86, 100),
(86, 146),
(87, 51),
(87, 52),
(87, 53),
(87, 54),
(87, 56),
(87, 57),
(87, 58),
(87, 59),
(87, 60),
(87, 61),
(87, 62),
(87, 63),
(87, 64),
(87, 65),
(87, 66),
(87, 67),
(87, 68),
(87, 69),
(87, 70),
(87, 71),
(87, 72),
(87, 73),
(87, 74),
(87, 75),
(87, 76),
(87, 77),
(87, 78),
(87, 79),
(87, 80),
(87, 81),
(87, 82),
(87, 83),
(87, 84),
(87, 85),
(87, 87),
(87, 90),
(87, 91),
(87, 94),
(87, 96),
(87, 97),
(87, 98),
(87, 99),
(87, 100),
(87, 101),
(87, 104),
(87, 108),
(87, 114),
(87, 115),
(87, 116),
(87, 117),
(87, 118),
(87, 119),
(87, 120),
(87, 121),
(87, 122),
(87, 123),
(87, 124),
(87, 125),
(87, 127),
(87, 128),
(87, 129),
(87, 130),
(87, 131),
(87, 132),
(87, 133),
(87, 134),
(87, 135),
(87, 136),
(87, 137),
(87, 138),
(87, 139),
(87, 140),
(87, 141),
(87, 142),
(87, 143),
(87, 144),
(87, 145),
(87, 146),
(87, 147),
(87, 149),
(87, 150),
(87, 151),
(87, 152),
(87, 155),
(87, 156),
(87, 158),
(87, 162),
(87, 163),
(87, 164),
(87, 165),
(87, 166),
(87, 167),
(87, 168),
(87, 169),
(87, 170),
(87, 171),
(87, 172),
(87, 173),
(87, 174),
(87, 175),
(87, 176),
(87, 177),
(87, 178),
(88, 100),
(88, 146),
(89, 100),
(89, 146),
(90, 51),
(90, 52),
(90, 54),
(90, 59),
(90, 63),
(90, 65),
(90, 69),
(90, 76),
(90, 78),
(90, 80),
(90, 81),
(90, 84),
(90, 87),
(90, 100),
(90, 135),
(90, 146),
(91, 51),
(91, 52),
(91, 54),
(91, 59),
(91, 63),
(91, 65),
(91, 69),
(91, 76),
(91, 78),
(91, 80),
(91, 81),
(91, 84),
(91, 87),
(91, 100),
(91, 135),
(91, 146),
(92, 100),
(93, 100),
(94, 51),
(94, 52),
(94, 54),
(94, 59),
(94, 63),
(94, 65),
(94, 69),
(94, 76),
(94, 78),
(94, 80),
(94, 81),
(94, 84),
(94, 87),
(94, 100),
(94, 120),
(94, 135),
(94, 146),
(94, 158),
(94, 162),
(94, 165),
(95, 100),
(96, 76),
(96, 78),
(96, 80),
(96, 81),
(96, 84),
(96, 87),
(96, 100),
(96, 135),
(96, 146),
(97, 76),
(97, 78),
(97, 80),
(97, 81),
(97, 84),
(97, 87),
(97, 100),
(97, 135),
(97, 146),
(98, 59),
(98, 63),
(98, 65),
(98, 69),
(98, 76),
(98, 78),
(98, 80),
(98, 81),
(98, 84),
(98, 87),
(98, 100),
(98, 135),
(98, 146),
(99, 51),
(99, 52),
(99, 54),
(99, 58),
(99, 59),
(99, 63),
(99, 65),
(99, 69),
(99, 70),
(99, 72),
(99, 76),
(99, 78),
(99, 80),
(99, 81),
(99, 84),
(99, 87),
(99, 99),
(99, 100),
(99, 101),
(99, 120),
(99, 130),
(99, 131),
(99, 133),
(99, 135),
(99, 137),
(99, 138),
(99, 139),
(99, 141),
(99, 142),
(99, 143),
(99, 144),
(99, 146),
(99, 151),
(99, 152),
(99, 158),
(99, 162),
(99, 165),
(100, 51),
(100, 52),
(100, 53),
(100, 54),
(100, 56),
(100, 57),
(100, 58),
(100, 59),
(100, 60),
(100, 61),
(100, 62),
(100, 63),
(100, 64),
(100, 65),
(100, 66),
(100, 67),
(100, 68),
(100, 69),
(100, 70),
(100, 71),
(100, 72),
(100, 73),
(100, 74),
(100, 75),
(100, 76),
(100, 77),
(100, 78),
(100, 79),
(100, 80),
(100, 81),
(100, 82),
(100, 83),
(100, 84),
(100, 85),
(100, 86),
(100, 87),
(100, 88),
(100, 89),
(100, 90),
(100, 91),
(100, 92),
(100, 93),
(100, 94),
(100, 95),
(100, 96),
(100, 97),
(100, 98),
(100, 99),
(100, 100),
(100, 101),
(100, 104),
(100, 108),
(100, 109),
(100, 114),
(100, 115),
(100, 116),
(100, 117),
(100, 118),
(100, 119),
(100, 120),
(100, 121),
(100, 122),
(100, 123),
(100, 124),
(100, 125),
(100, 127),
(100, 128),
(100, 129),
(100, 130),
(100, 131),
(100, 132),
(100, 133),
(100, 134),
(100, 135),
(100, 136),
(100, 137),
(100, 138),
(100, 139),
(100, 140),
(100, 141),
(100, 142),
(100, 143),
(100, 144),
(100, 145),
(100, 146),
(100, 147),
(100, 149),
(100, 150),
(100, 151),
(100, 152),
(100, 153),
(100, 154),
(100, 155),
(100, 156),
(100, 158),
(100, 162),
(100, 163),
(100, 164),
(100, 165),
(100, 166),
(100, 167),
(100, 168),
(100, 169),
(100, 170),
(100, 171),
(100, 172),
(100, 173),
(100, 174),
(100, 175),
(100, 176),
(100, 177),
(100, 178),
(101, 51),
(101, 52),
(101, 54),
(101, 58),
(101, 59),
(101, 63),
(101, 65),
(101, 69),
(101, 70),
(101, 72),
(101, 76),
(101, 78),
(101, 80),
(101, 81),
(101, 84),
(101, 87),
(101, 99),
(101, 100),
(101, 101),
(101, 120),
(101, 129),
(101, 130),
(101, 131),
(101, 133),
(101, 135),
(101, 137),
(101, 138),
(101, 139),
(101, 141),
(101, 142),
(101, 143),
(101, 144),
(101, 146),
(101, 151),
(101, 152),
(101, 158),
(101, 162),
(101, 165),
(104, 51),
(104, 52),
(104, 54),
(104, 59),
(104, 63),
(104, 65),
(104, 69),
(104, 76),
(104, 78),
(104, 80),
(104, 81),
(104, 84),
(104, 87),
(104, 100),
(104, 120),
(104, 135),
(104, 146),
(104, 158),
(104, 162),
(104, 165),
(108, 63),
(108, 76),
(108, 78),
(108, 80),
(108, 81),
(108, 84),
(108, 87),
(108, 100),
(108, 135),
(108, 146),
(109, 100),
(109, 146),
(114, 63),
(114, 65),
(114, 76),
(114, 78),
(114, 80),
(114, 81),
(114, 84),
(114, 87),
(114, 100),
(114, 135),
(114, 146),
(115, 63),
(115, 65),
(115, 76),
(115, 78),
(115, 80),
(115, 81),
(115, 84),
(115, 87),
(115, 100),
(115, 135),
(115, 146),
(116, 63),
(116, 65),
(116, 76),
(116, 78),
(116, 80),
(116, 81),
(116, 84),
(116, 87),
(116, 100),
(116, 135),
(116, 146),
(117, 63),
(117, 76),
(117, 78),
(117, 80),
(117, 81),
(117, 84),
(117, 87),
(117, 100),
(117, 135),
(117, 146),
(118, 51),
(118, 52),
(118, 54),
(118, 59),
(118, 63),
(118, 65),
(118, 69),
(118, 76),
(118, 78),
(118, 80),
(118, 81),
(118, 84),
(118, 87),
(118, 100),
(118, 135),
(118, 146),
(119, 51),
(119, 52),
(119, 54),
(119, 59),
(119, 63),
(119, 65),
(119, 69),
(119, 76),
(119, 78),
(119, 80),
(119, 81),
(119, 84),
(119, 87),
(119, 100),
(119, 135),
(119, 146),
(120, 51),
(120, 52),
(120, 54),
(120, 58),
(120, 59),
(120, 63),
(120, 65),
(120, 69),
(120, 70),
(120, 72),
(120, 76),
(120, 78),
(120, 80),
(120, 81),
(120, 84),
(120, 87),
(120, 94),
(120, 99),
(120, 100),
(120, 101),
(120, 104),
(120, 120),
(120, 129),
(120, 130),
(120, 131),
(120, 133),
(120, 135),
(120, 137),
(120, 138),
(120, 139),
(120, 140),
(120, 141),
(120, 142),
(120, 143),
(120, 144),
(120, 146),
(120, 151),
(120, 152),
(120, 155),
(120, 156),
(120, 158),
(120, 162),
(120, 163),
(120, 164),
(120, 165),
(120, 166),
(120, 167),
(120, 168),
(120, 169),
(120, 173),
(120, 177),
(120, 178),
(121, 51),
(121, 52),
(121, 54),
(121, 59),
(121, 63),
(121, 65),
(121, 69),
(121, 76),
(121, 78),
(121, 80),
(121, 81),
(121, 84),
(121, 87),
(121, 100),
(121, 135),
(121, 146),
(122, 51),
(122, 52),
(122, 54),
(122, 59),
(122, 63),
(122, 65),
(122, 69),
(122, 76),
(122, 78),
(122, 80),
(122, 81),
(122, 84),
(122, 87),
(122, 100),
(122, 135),
(122, 146),
(123, 51),
(123, 52),
(123, 54),
(123, 59),
(123, 63),
(123, 65),
(123, 69),
(123, 76),
(123, 78),
(123, 80),
(123, 81),
(123, 84),
(123, 87),
(123, 100),
(123, 135),
(123, 146),
(124, 63),
(124, 76),
(124, 78),
(124, 80),
(124, 81),
(124, 84),
(124, 87),
(124, 100),
(124, 135),
(124, 146),
(125, 51),
(125, 52),
(125, 54),
(125, 59),
(125, 63),
(125, 65),
(125, 69),
(125, 76),
(125, 78),
(125, 80),
(125, 81),
(125, 84),
(125, 87),
(125, 100),
(125, 135),
(125, 146),
(127, 51),
(127, 52),
(127, 54),
(127, 59),
(127, 63),
(127, 65),
(127, 69),
(127, 76),
(127, 78),
(127, 80),
(127, 81),
(127, 84),
(127, 87),
(127, 100),
(127, 135),
(127, 146),
(128, 81),
(128, 84),
(128, 87),
(128, 100),
(128, 146),
(129, 51),
(129, 52),
(129, 54),
(129, 59),
(129, 63),
(129, 65),
(129, 69),
(129, 76),
(129, 78),
(129, 80),
(129, 81),
(129, 84),
(129, 87),
(129, 100),
(129, 101),
(129, 120),
(129, 135),
(129, 137),
(129, 138),
(129, 139),
(129, 141),
(129, 142),
(129, 143),
(129, 144),
(129, 146),
(129, 151),
(129, 152),
(129, 158),
(129, 162),
(129, 165),
(130, 51),
(130, 52),
(130, 54),
(130, 59),
(130, 63),
(130, 65),
(130, 69),
(130, 70),
(130, 72),
(130, 76),
(130, 78),
(130, 80),
(130, 81),
(130, 84),
(130, 87),
(130, 99),
(130, 100),
(130, 101),
(130, 120),
(130, 135),
(130, 137),
(130, 138),
(130, 139),
(130, 141),
(130, 142),
(130, 143),
(130, 144),
(130, 146),
(130, 151),
(130, 152),
(130, 158),
(130, 162),
(130, 165),
(131, 51),
(131, 52),
(131, 54),
(131, 59),
(131, 63),
(131, 65),
(131, 69),
(131, 70),
(131, 72),
(131, 76),
(131, 78),
(131, 80),
(131, 81),
(131, 84),
(131, 87),
(131, 99),
(131, 100),
(131, 101),
(131, 120),
(131, 135),
(131, 137),
(131, 138),
(131, 139),
(131, 141),
(131, 142),
(131, 143),
(131, 144),
(131, 146),
(131, 151),
(131, 152),
(131, 158),
(131, 162),
(131, 165),
(132, 81),
(132, 84),
(132, 87),
(132, 100),
(132, 146),
(133, 51),
(133, 52),
(133, 54),
(133, 59),
(133, 63),
(133, 65),
(133, 69),
(133, 70),
(133, 72),
(133, 76),
(133, 78),
(133, 80),
(133, 81),
(133, 84),
(133, 87),
(133, 99),
(133, 100),
(133, 101),
(133, 120),
(133, 135),
(133, 137),
(133, 138),
(133, 139),
(133, 141),
(133, 142),
(133, 143),
(133, 144),
(133, 146),
(133, 151),
(133, 152),
(133, 158),
(133, 162),
(133, 165),
(134, 76),
(134, 78),
(134, 80),
(134, 81),
(134, 84),
(134, 87),
(134, 100),
(134, 135),
(134, 146),
(135, 51),
(135, 52),
(135, 53),
(135, 54),
(135, 56),
(135, 57),
(135, 58),
(135, 59),
(135, 60),
(135, 61),
(135, 62),
(135, 63),
(135, 64),
(135, 65),
(135, 66),
(135, 67),
(135, 68),
(135, 69),
(135, 70),
(135, 71),
(135, 72),
(135, 73),
(135, 74),
(135, 75),
(135, 76),
(135, 77),
(135, 78),
(135, 79),
(135, 80),
(135, 81),
(135, 84),
(135, 87),
(135, 90),
(135, 91),
(135, 94),
(135, 96),
(135, 97),
(135, 98),
(135, 99),
(135, 100),
(135, 101),
(135, 104),
(135, 108),
(135, 114),
(135, 115),
(135, 116),
(135, 117),
(135, 118),
(135, 119),
(135, 120),
(135, 121),
(135, 122),
(135, 123),
(135, 124),
(135, 125),
(135, 127),
(135, 129),
(135, 130),
(135, 131),
(135, 133),
(135, 134),
(135, 135),
(135, 137),
(135, 138),
(135, 139),
(135, 140),
(135, 141),
(135, 142),
(135, 143),
(135, 144),
(135, 145),
(135, 146),
(135, 147),
(135, 149),
(135, 150),
(135, 151),
(135, 152),
(135, 155),
(135, 156),
(135, 158),
(135, 162),
(135, 163),
(135, 164),
(135, 165),
(135, 166),
(135, 167),
(135, 168),
(135, 169),
(135, 170),
(135, 171),
(135, 172),
(135, 173),
(135, 174),
(135, 175),
(135, 176),
(135, 177),
(135, 178),
(136, 81),
(136, 84),
(136, 87),
(136, 100),
(136, 146),
(137, 51),
(137, 52),
(137, 54),
(137, 58),
(137, 59),
(137, 63),
(137, 65),
(137, 69),
(137, 70),
(137, 72),
(137, 76),
(137, 78),
(137, 80),
(137, 81),
(137, 84),
(137, 87),
(137, 99),
(137, 100),
(137, 101),
(137, 120),
(137, 129),
(137, 130),
(137, 131),
(137, 133),
(137, 135),
(137, 137),
(137, 138),
(137, 139),
(137, 141),
(137, 142),
(137, 143),
(137, 144),
(137, 146),
(137, 151),
(137, 152),
(137, 158),
(137, 162),
(137, 165),
(138, 51),
(138, 52),
(138, 54),
(138, 58),
(138, 59),
(138, 63),
(138, 65),
(138, 69),
(138, 70),
(138, 72),
(138, 76),
(138, 78),
(138, 80),
(138, 81),
(138, 84),
(138, 87),
(138, 99),
(138, 100),
(138, 101),
(138, 120),
(138, 129),
(138, 130),
(138, 131),
(138, 133),
(138, 135),
(138, 137),
(138, 138),
(138, 139),
(138, 141),
(138, 142),
(138, 143),
(138, 144),
(138, 146),
(138, 151),
(138, 152),
(138, 158),
(138, 162),
(138, 165),
(139, 51),
(139, 52),
(139, 54),
(139, 58),
(139, 59),
(139, 63),
(139, 65),
(139, 69),
(139, 70),
(139, 72),
(139, 76),
(139, 78),
(139, 80),
(139, 81),
(139, 84),
(139, 87),
(139, 99),
(139, 100),
(139, 101),
(139, 120),
(139, 129),
(139, 130),
(139, 131),
(139, 133),
(139, 135),
(139, 137),
(139, 138),
(139, 139),
(139, 141),
(139, 142),
(139, 143),
(139, 144),
(139, 146),
(139, 151),
(139, 152),
(139, 158),
(139, 162),
(139, 165),
(140, 51),
(140, 52),
(140, 54),
(140, 59),
(140, 63),
(140, 65),
(140, 69),
(140, 76),
(140, 78),
(140, 80),
(140, 81),
(140, 84),
(140, 87),
(140, 100),
(140, 120),
(140, 135),
(140, 144),
(140, 146),
(140, 158),
(140, 162),
(140, 165),
(141, 51),
(141, 52),
(141, 54),
(141, 58),
(141, 59),
(141, 63),
(141, 65),
(141, 69),
(141, 70),
(141, 72),
(141, 76),
(141, 78),
(141, 80),
(141, 81),
(141, 84),
(141, 87),
(141, 99),
(141, 100),
(141, 101),
(141, 120),
(141, 129),
(141, 130),
(141, 131),
(141, 133),
(141, 135),
(141, 137),
(141, 138),
(141, 139),
(141, 141),
(141, 142),
(141, 143),
(141, 144),
(141, 146),
(141, 151),
(141, 152),
(141, 158),
(141, 162),
(141, 165),
(142, 51),
(142, 52),
(142, 54),
(142, 58),
(142, 59),
(142, 63),
(142, 65),
(142, 69),
(142, 70),
(142, 72),
(142, 76),
(142, 78),
(142, 80),
(142, 81),
(142, 84),
(142, 87),
(142, 99),
(142, 100),
(142, 101),
(142, 120),
(142, 129),
(142, 130),
(142, 131),
(142, 133),
(142, 135),
(142, 137),
(142, 138),
(142, 139),
(142, 141),
(142, 142),
(142, 143),
(142, 144),
(142, 146),
(142, 151),
(142, 152),
(142, 158),
(142, 162),
(142, 165),
(143, 51),
(143, 52),
(143, 54),
(143, 58),
(143, 59),
(143, 63),
(143, 65),
(143, 69),
(143, 70),
(143, 72),
(143, 76),
(143, 78),
(143, 80),
(143, 81),
(143, 84),
(143, 87),
(143, 99),
(143, 100),
(143, 101),
(143, 120),
(143, 129),
(143, 130),
(143, 131),
(143, 133),
(143, 135),
(143, 137),
(143, 138),
(143, 139),
(143, 141),
(143, 142),
(143, 143),
(143, 144),
(143, 146),
(143, 151),
(143, 152),
(143, 158),
(143, 162),
(143, 165),
(144, 51),
(144, 52),
(144, 54),
(144, 58),
(144, 59),
(144, 63),
(144, 65),
(144, 69),
(144, 70),
(144, 72),
(144, 76),
(144, 78),
(144, 80),
(144, 81),
(144, 84),
(144, 87),
(144, 99),
(144, 100),
(144, 101),
(144, 120),
(144, 129),
(144, 130),
(144, 131),
(144, 133),
(144, 135),
(144, 137),
(144, 138),
(144, 139),
(144, 140),
(144, 141),
(144, 142),
(144, 143),
(144, 144),
(144, 146),
(144, 151),
(144, 152),
(144, 158),
(144, 162),
(144, 165),
(145, 51),
(145, 52),
(145, 54),
(145, 59),
(145, 63),
(145, 65),
(145, 69),
(145, 76),
(145, 78),
(145, 80),
(145, 81),
(145, 84),
(145, 87),
(145, 100),
(145, 135),
(145, 146),
(146, 51),
(146, 52),
(146, 53),
(146, 54),
(146, 56),
(146, 57),
(146, 58),
(146, 59),
(146, 60),
(146, 61),
(146, 62),
(146, 63),
(146, 64),
(146, 65),
(146, 66),
(146, 67),
(146, 68),
(146, 69),
(146, 70),
(146, 71),
(146, 72),
(146, 73),
(146, 74),
(146, 75),
(146, 76),
(146, 77),
(146, 78),
(146, 79),
(146, 80),
(146, 81),
(146, 82),
(146, 83),
(146, 84),
(146, 85),
(146, 86),
(146, 87),
(146, 88),
(146, 89),
(146, 90),
(146, 91),
(146, 94),
(146, 96),
(146, 97),
(146, 98),
(146, 99),
(146, 100),
(146, 101),
(146, 104),
(146, 108),
(146, 109),
(146, 114),
(146, 115),
(146, 116),
(146, 117),
(146, 118),
(146, 119),
(146, 120),
(146, 121),
(146, 122),
(146, 123),
(146, 124),
(146, 125),
(146, 127),
(146, 128),
(146, 129),
(146, 130),
(146, 131),
(146, 132),
(146, 133),
(146, 134),
(146, 135),
(146, 136),
(146, 137),
(146, 138),
(146, 139),
(146, 140),
(146, 141),
(146, 142),
(146, 143),
(146, 144),
(146, 145),
(146, 146),
(146, 147),
(146, 149),
(146, 150),
(146, 151),
(146, 152),
(146, 155),
(146, 156),
(146, 158),
(146, 162),
(146, 163),
(146, 164),
(146, 165),
(146, 166),
(146, 167),
(146, 168),
(146, 169),
(146, 170),
(146, 171),
(146, 172),
(146, 173),
(146, 174),
(146, 175),
(146, 176),
(146, 177),
(146, 178),
(147, 59),
(147, 63),
(147, 65),
(147, 69),
(147, 76),
(147, 78),
(147, 80),
(147, 81),
(147, 84),
(147, 87),
(147, 100),
(147, 135),
(147, 146),
(149, 63),
(149, 76),
(149, 78),
(149, 80),
(149, 81),
(149, 84),
(149, 87),
(149, 100),
(149, 135),
(149, 146),
(150, 51),
(150, 52),
(150, 54),
(150, 59),
(150, 63),
(150, 65),
(150, 69),
(150, 76),
(150, 78),
(150, 80),
(150, 81),
(150, 84),
(150, 87),
(150, 100),
(150, 135),
(150, 146),
(151, 51),
(151, 52),
(151, 54),
(151, 58),
(151, 59),
(151, 63),
(151, 65),
(151, 69),
(151, 70),
(151, 72),
(151, 76),
(151, 78),
(151, 80),
(151, 81),
(151, 84),
(151, 87),
(151, 99),
(151, 100),
(151, 101),
(151, 120),
(151, 129),
(151, 130),
(151, 131),
(151, 133),
(151, 135),
(151, 137),
(151, 138),
(151, 139),
(151, 141),
(151, 142),
(151, 143),
(151, 144),
(151, 146),
(151, 151),
(151, 152),
(151, 158),
(151, 162),
(151, 165),
(152, 51),
(152, 52),
(152, 54),
(152, 58),
(152, 59),
(152, 63),
(152, 65),
(152, 69),
(152, 70),
(152, 72),
(152, 76),
(152, 78),
(152, 80),
(152, 81),
(152, 84),
(152, 87),
(152, 99),
(152, 100),
(152, 101),
(152, 120),
(152, 129),
(152, 130),
(152, 131),
(152, 133),
(152, 135),
(152, 137),
(152, 138),
(152, 139),
(152, 141),
(152, 142),
(152, 143),
(152, 144),
(152, 146),
(152, 151),
(152, 152),
(152, 158),
(152, 162),
(152, 165),
(153, 100),
(154, 100),
(155, 51),
(155, 52),
(155, 54),
(155, 59),
(155, 63),
(155, 65),
(155, 69),
(155, 76),
(155, 78),
(155, 80),
(155, 81),
(155, 84),
(155, 87),
(155, 100),
(155, 120),
(155, 135),
(155, 146),
(155, 158),
(155, 162),
(156, 51),
(156, 52),
(156, 54),
(156, 59),
(156, 63),
(156, 65),
(156, 69),
(156, 76),
(156, 78),
(156, 80),
(156, 81),
(156, 84),
(156, 87),
(156, 100),
(156, 120),
(156, 135),
(156, 146),
(158, 51),
(158, 52),
(158, 54),
(158, 58),
(158, 59),
(158, 63),
(158, 65),
(158, 69),
(158, 70),
(158, 72),
(158, 76),
(158, 78),
(158, 80),
(158, 81),
(158, 84),
(158, 87),
(158, 94),
(158, 99),
(158, 100),
(158, 101),
(158, 104),
(158, 120),
(158, 129),
(158, 130),
(158, 131),
(158, 133),
(158, 135),
(158, 137),
(158, 138),
(158, 139),
(158, 140),
(158, 141),
(158, 142),
(158, 143),
(158, 144),
(158, 146),
(158, 151),
(158, 152),
(158, 155),
(158, 158),
(158, 162),
(158, 163),
(158, 164),
(158, 165),
(158, 166),
(158, 167),
(158, 168),
(158, 169),
(162, 51),
(162, 52),
(162, 54),
(162, 58),
(162, 59),
(162, 63),
(162, 65),
(162, 69),
(162, 70),
(162, 72),
(162, 76),
(162, 78),
(162, 80),
(162, 81),
(162, 84),
(162, 87),
(162, 94),
(162, 99),
(162, 100),
(162, 101),
(162, 104),
(162, 120),
(162, 129),
(162, 130),
(162, 131),
(162, 133),
(162, 135),
(162, 137),
(162, 138),
(162, 139),
(162, 140),
(162, 141),
(162, 142),
(162, 143),
(162, 144),
(162, 146),
(162, 151),
(162, 152),
(162, 155),
(162, 158),
(162, 162),
(162, 163),
(162, 164),
(162, 165),
(162, 166),
(162, 167),
(162, 168),
(162, 169),
(163, 51),
(163, 52),
(163, 54),
(163, 59),
(163, 63),
(163, 65),
(163, 69),
(163, 76),
(163, 78),
(163, 80),
(163, 81),
(163, 84),
(163, 87),
(163, 100),
(163, 120),
(163, 135),
(163, 146),
(163, 158),
(163, 162),
(163, 165),
(164, 51),
(164, 52),
(164, 54),
(164, 59),
(164, 63),
(164, 65),
(164, 69),
(164, 76),
(164, 78),
(164, 80),
(164, 81),
(164, 84),
(164, 87),
(164, 100),
(164, 120),
(164, 135),
(164, 146),
(164, 158),
(164, 162),
(164, 165),
(165, 51),
(165, 52),
(165, 54),
(165, 58),
(165, 59),
(165, 63),
(165, 65),
(165, 69),
(165, 70),
(165, 72),
(165, 76),
(165, 78),
(165, 80),
(165, 81),
(165, 84),
(165, 87),
(165, 94),
(165, 99),
(165, 100),
(165, 101),
(165, 104),
(165, 120),
(165, 129),
(165, 130),
(165, 131),
(165, 133),
(165, 135),
(165, 137),
(165, 138),
(165, 139),
(165, 140),
(165, 141),
(165, 142),
(165, 143),
(165, 144),
(165, 146),
(165, 151),
(165, 152),
(165, 158),
(165, 162),
(165, 163),
(165, 164),
(165, 165),
(166, 51),
(166, 52),
(166, 54),
(166, 59),
(166, 63),
(166, 65),
(166, 69),
(166, 76),
(166, 78),
(166, 80),
(166, 81),
(166, 84),
(166, 87),
(166, 100),
(166, 120),
(166, 135),
(166, 146),
(166, 158),
(166, 162),
(167, 51),
(167, 52),
(167, 54),
(167, 59),
(167, 63),
(167, 65),
(167, 69),
(167, 76),
(167, 78),
(167, 80),
(167, 81),
(167, 84),
(167, 87),
(167, 100),
(167, 120),
(167, 135),
(167, 146),
(167, 158),
(167, 162),
(168, 51),
(168, 52),
(168, 54),
(168, 59),
(168, 63),
(168, 65),
(168, 69),
(168, 76),
(168, 78),
(168, 80),
(168, 81),
(168, 84),
(168, 87),
(168, 100),
(168, 120),
(168, 135),
(168, 146),
(168, 158),
(168, 162),
(169, 51),
(169, 52),
(169, 54),
(169, 59),
(169, 63),
(169, 65),
(169, 69),
(169, 76),
(169, 78),
(169, 80),
(169, 81),
(169, 84),
(169, 87),
(169, 100),
(169, 120),
(169, 135),
(169, 146),
(169, 158),
(169, 162),
(170, 59),
(170, 63),
(170, 65),
(170, 69),
(170, 76),
(170, 78),
(170, 80),
(170, 81),
(170, 84),
(170, 87),
(170, 100),
(170, 135),
(170, 146),
(171, 59),
(171, 63),
(171, 65),
(171, 69),
(171, 76),
(171, 78),
(171, 80),
(171, 81),
(171, 84),
(171, 87),
(171, 100),
(171, 135),
(171, 146),
(172, 59),
(172, 63),
(172, 65),
(172, 69),
(172, 76),
(172, 78),
(172, 80),
(172, 81),
(172, 84),
(172, 87),
(172, 100),
(172, 135),
(172, 146),
(173, 51),
(173, 52),
(173, 54),
(173, 59),
(173, 63),
(173, 65),
(173, 69),
(173, 76),
(173, 78),
(173, 80),
(173, 81),
(173, 84),
(173, 87),
(173, 100),
(173, 120),
(173, 135),
(173, 146),
(174, 51),
(174, 52),
(174, 54),
(174, 59),
(174, 63),
(174, 65),
(174, 69),
(174, 76),
(174, 78),
(174, 80),
(174, 81),
(174, 84),
(174, 87),
(174, 100),
(174, 135),
(174, 146),
(175, 51),
(175, 52),
(175, 54),
(175, 59),
(175, 63),
(175, 65),
(175, 69),
(175, 76),
(175, 78),
(175, 80),
(175, 81),
(175, 84),
(175, 87),
(175, 100),
(175, 135),
(175, 146),
(176, 51),
(176, 52),
(176, 54),
(176, 59),
(176, 63),
(176, 65),
(176, 69),
(176, 76),
(176, 78),
(176, 80),
(176, 81),
(176, 84),
(176, 87),
(176, 100),
(176, 135),
(176, 146),
(177, 51),
(177, 52),
(177, 54),
(177, 59),
(177, 63),
(177, 65),
(177, 69),
(177, 76),
(177, 78),
(177, 80),
(177, 81),
(177, 84),
(177, 87),
(177, 100),
(177, 120),
(177, 135),
(177, 146),
(178, 51),
(178, 52),
(178, 54),
(178, 59),
(178, 63),
(178, 65),
(178, 69),
(178, 76),
(178, 78),
(178, 80),
(178, 81),
(178, 84),
(178, 87),
(178, 100),
(178, 120),
(178, 135),
(178, 146);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related_article`
--

CREATE TABLE `oc_product_related_article` (
  `article_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related_mn`
--

CREATE TABLE `oc_product_related_mn` (
  `product_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related_wb`
--

CREATE TABLE `oc_product_related_wb` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_reward`
--

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(1, 51, 1, 0),
(2, 52, 1, 0),
(3, 53, 1, 0),
(4, 54, 1, 0),
(5, 56, 1, 0),
(6, 57, 1, 0),
(7, 58, 1, 0),
(8, 59, 1, 0),
(9, 60, 1, 0),
(10, 61, 1, 0),
(11, 62, 1, 0),
(12, 63, 1, 0),
(13, 64, 1, 0),
(14, 65, 1, 0),
(15, 66, 1, 0),
(16, 67, 1, 0),
(17, 68, 1, 0),
(18, 69, 1, 0),
(19, 70, 1, 0),
(20, 71, 1, 0),
(21, 72, 1, 0),
(22, 73, 1, 0),
(23, 74, 1, 0),
(24, 75, 1, 0),
(25, 76, 1, 0),
(26, 77, 1, 0),
(27, 78, 1, 0),
(28, 79, 1, 0),
(29, 80, 1, 0),
(30, 81, 1, 0),
(31, 82, 1, 0),
(32, 83, 1, 0),
(33, 84, 1, 0),
(34, 85, 1, 0),
(35, 86, 1, 0),
(36, 87, 1, 0),
(37, 88, 1, 0),
(38, 89, 1, 0),
(39, 90, 1, 0),
(40, 91, 1, 0),
(41, 92, 1, 0),
(42, 93, 1, 0),
(43, 94, 1, 0),
(44, 95, 1, 0),
(45, 96, 1, 0),
(46, 97, 1, 0),
(47, 98, 1, 0),
(48, 99, 1, 0),
(49, 100, 1, 0),
(50, 101, 1, 0),
(51, 102, 1, 0),
(52, 103, 1, 0),
(53, 104, 1, 0),
(54, 105, 1, 0),
(55, 106, 1, 0),
(56, 107, 1, 0),
(57, 108, 1, 0),
(58, 109, 1, 0),
(59, 110, 1, 0),
(60, 111, 1, 0),
(61, 112, 1, 0),
(62, 113, 1, 0),
(63, 114, 1, 0),
(64, 115, 1, 0),
(65, 116, 1, 0),
(66, 117, 1, 0),
(67, 118, 1, 0),
(68, 119, 1, 0),
(69, 120, 1, 0),
(70, 121, 1, 0),
(71, 122, 1, 0),
(72, 123, 1, 0),
(73, 124, 1, 0),
(74, 125, 1, 0),
(75, 127, 1, 0),
(76, 128, 1, 0),
(77, 129, 1, 0),
(78, 130, 1, 0),
(79, 131, 1, 0),
(80, 132, 1, 0),
(81, 133, 1, 0),
(82, 134, 1, 0),
(83, 135, 1, 0),
(84, 136, 1, 0),
(85, 137, 1, 0),
(86, 138, 1, 0),
(87, 139, 1, 0),
(88, 140, 1, 0),
(89, 141, 1, 0),
(90, 142, 1, 0),
(91, 143, 1, 0),
(92, 144, 1, 0),
(93, 145, 1, 0),
(94, 146, 1, 0),
(95, 147, 1, 0),
(96, 148, 1, 0),
(97, 149, 1, 0),
(98, 150, 1, 0),
(99, 151, 1, 0),
(100, 152, 1, 0),
(101, 153, 1, 0),
(102, 154, 1, 0),
(103, 155, 1, 0),
(104, 156, 1, 0),
(105, 157, 1, 0),
(106, 158, 1, 0),
(107, 159, 1, 0),
(108, 160, 1, 0),
(109, 161, 1, 0),
(110, 162, 1, 0),
(111, 163, 1, 0),
(112, 164, 1, 0),
(113, 165, 1, 0),
(114, 166, 1, 0),
(115, 167, 1, 0),
(116, 168, 1, 0),
(117, 169, 1, 0),
(118, 170, 1, 0),
(119, 171, 1, 0),
(120, 172, 1, 0),
(121, 173, 1, 0),
(122, 174, 1, 0),
(123, 175, 1, 0),
(124, 176, 1, 0),
(125, 177, 1, 0),
(126, 178, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_special`
--

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_tab`
--

CREATE TABLE `oc_product_tab` (
  `product_tab_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_tab_desc`
--

CREATE TABLE `oc_product_tab_desc` (
  `product_tab_id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_benefit`
--

CREATE TABLE `oc_product_to_benefit` (
  `product_id` int(11) NOT NULL,
  `benefit_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_category`
--

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES
(51, 1, 0),
(52, 1, 0),
(53, 1, 0),
(54, 1, 0),
(56, 1, 0),
(57, 1, 0),
(58, 1, 0),
(59, 1, 0),
(60, 1, 0),
(61, 1, 0),
(62, 1, 0),
(63, 1, 0),
(64, 1, 0),
(65, 1, 0),
(66, 1, 0),
(67, 1, 0),
(68, 1, 0),
(69, 1, 0),
(70, 2, 0),
(71, 2, 0),
(72, 2, 0),
(73, 2, 0),
(74, 2, 0),
(75, 2, 0),
(76, 2, 0),
(77, 2, 0),
(78, 2, 0),
(79, 3, 0),
(80, 3, 0),
(81, 3, 0),
(82, 3, 0),
(83, 3, 0),
(84, 4, 0),
(85, 4, 0),
(86, 4, 0),
(87, 4, 0),
(88, 4, 0),
(89, 4, 0),
(90, 4, 0),
(91, 4, 0),
(92, 4, 0),
(93, 4, 0),
(94, 4, 0),
(94, 8, 0),
(95, 4, 0),
(96, 1, 0),
(97, 1, 0),
(98, 1, 0),
(99, 7, 0),
(99, 5, 0),
(100, 5, 0),
(101, 8, 0),
(101, 5, 0),
(102, 5, 0),
(103, 5, 0),
(104, 7, 0),
(104, 5, 0),
(105, 5, 0),
(106, 5, 0),
(107, 5, 0),
(108, 1, 0),
(109, 4, 0),
(110, 5, 0),
(111, 5, 0),
(112, 5, 0),
(113, 5, 0),
(114, 1, 0),
(115, 1, 0),
(116, 1, 0),
(117, 1, 0),
(118, 1, 0),
(119, 1, 0),
(120, 9, 0),
(120, 1, 0),
(121, 1, 0),
(122, 1, 0),
(123, 1, 0),
(124, 1, 0),
(125, 1, 0),
(127, 1, 0),
(128, 3, 0),
(129, 2, 0),
(130, 1, 0),
(131, 1, 0),
(132, 3, 0),
(133, 1, 0),
(134, 2, 0),
(135, 3, 0),
(136, 3, 0),
(137, 5, 0),
(137, 7, 0),
(138, 7, 0),
(138, 5, 0),
(139, 7, 0),
(139, 5, 0),
(140, 5, 0),
(140, 7, 0),
(141, 7, 0),
(141, 9, 0),
(141, 6, 0),
(141, 8, 0),
(142, 7, 0),
(142, 9, 0),
(142, 8, 0),
(142, 6, 0),
(143, 9, 0),
(143, 7, 0),
(143, 8, 0),
(143, 6, 0),
(144, 5, 0),
(144, 7, 0),
(145, 1, 0),
(146, 4, 0),
(147, 1, 0),
(148, 1, 0),
(149, 1, 0),
(150, 4, 0),
(151, 7, 0),
(151, 5, 0),
(152, 7, 0),
(152, 5, 0),
(153, 4, 0),
(154, 4, 0),
(155, 7, 0),
(155, 5, 0),
(155, 8, 0),
(156, 7, 0),
(156, 5, 0),
(156, 8, 0),
(157, 5, 0),
(158, 5, 0),
(158, 8, 0),
(158, 7, 0),
(159, 5, 0),
(160, 5, 0),
(161, 5, 0),
(162, 8, 0),
(162, 7, 0),
(162, 5, 0),
(163, 8, 0),
(163, 5, 0),
(163, 7, 0),
(164, 8, 0),
(164, 5, 0),
(164, 7, 0),
(165, 8, 0),
(165, 7, 0),
(165, 5, 0),
(166, 8, 0),
(166, 7, 0),
(166, 5, 0),
(167, 7, 0),
(167, 5, 0),
(167, 8, 0),
(168, 5, 0),
(168, 7, 0),
(168, 8, 0),
(169, 5, 0),
(169, 8, 0),
(169, 7, 0),
(170, 1, 0),
(171, 1, 0),
(172, 1, 0),
(173, 3, 0),
(174, 1, 0),
(175, 1, 0),
(176, 1, 0),
(177, 3, 0),
(178, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_download`
--

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_layout`
--

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_sticker`
--

CREATE TABLE `oc_product_to_sticker` (
  `product_id` int(11) NOT NULL,
  `sticker_id` int(11) NOT NULL,
  `position` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_store`
--

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(122, 0),
(123, 0),
(124, 0),
(125, 0),
(127, 0),
(128, 0),
(129, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(134, 0),
(135, 0),
(136, 0),
(137, 0),
(138, 0),
(139, 0),
(140, 0),
(141, 0),
(142, 0),
(143, 0),
(144, 0),
(145, 0),
(146, 0),
(147, 0),
(148, 0),
(149, 0),
(150, 0),
(151, 0),
(152, 0),
(153, 0),
(154, 0),
(155, 0),
(156, 0),
(157, 0),
(158, 0),
(159, 0),
(160, 0),
(161, 0),
(162, 0),
(163, 0),
(164, 0),
(165, 0),
(166, 0),
(167, 0),
(168, 0),
(169, 0),
(170, 0),
(171, 0),
(172, 0),
(173, 0),
(174, 0),
(175, 0),
(176, 0),
(177, 0),
(178, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring`
--

CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring_description`
--

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return`
--

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_action`
--

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Возмещенный'),
(2, 1, 'Возврат средств'),
(3, 1, 'Отправлена замена');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_history`
--

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_reason`
--

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Получен неисправным (сломанным)'),
(2, 1, 'Получен не тот (ошибочный) товар'),
(3, 1, 'Заказан по ошибке'),
(4, 1, 'Неисправен, пожалуйста укажите/приложите подробности'),
(5, 1, 'Другое (другая причина), пожалуйста укажите/приложите подробности');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_status`
--

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'В ожидании'),
(3, 1, 'Выполнен'),
(2, 1, 'Ожидание товара');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_review`
--

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_review_article`
--

CREATE TABLE `oc_review_article` (
  `review_article_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_review_article`
--

INSERT INTO `oc_review_article` (`review_article_id`, `article_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(11, 123, 0, 'Василий Покупайкин', 'Спасибо за отличный фото обзор, обязательно в ближайшее время приобрету себе такую тушку и напишу дополнение к Вашей статье.', 5, 1, '2014-04-08 05:59:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_setting`
--

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1589, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(1758, 0, 'config', 'config_mail_smtp_username', '', 0),
(1759, 0, 'config', 'config_mail_smtp_password', '', 0),
(1760, 0, 'config', 'config_mail_smtp_port', '25', 0),
(1761, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(1762, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(1763, 0, 'config', 'config_alert_email', 'nzxtua@fex.net', 0),
(1764, 0, 'config', 'config_maintenance', '0', 0),
(1765, 0, 'config', 'config_seo_url', '1', 0),
(1766, 0, 'config', 'config_seo_url_include_path', '1', 0),
(1767, 0, 'config', 'config_seo_url_postfix', '.html', 0),
(1768, 0, 'config', 'config_file_max_size', '300000', 0),
(1769, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(4, 0, 'voucher', 'voucher_sort_order', '8', 0),
(5, 0, 'voucher', 'voucher_status', '1', 0),
(1774, 0, 'config', 'config_encryption', 'RYUDJwW3AYz5wsSm8C4FmRd1OKIfOkfqu97DLrsnt8EDJttG77uqEOQrJFXSiexw9C3WxaMNaZITAxU7IM9YO1bqx083xhlwE8gPgFzsGaFjHVpdZ42kvvAtIKGq1ATpanzs460d4wd4UHp00oIx9LjbxFazSyqRA2V6JitR49QY2xdJWGrm0AkJew6gv4ompDdgZs50fa0DOaipoIjgAU4mFhWamm1Uh9wVp5BGZ1VgUvHfXhSxJSakP4q2uExfg7LPyAldA3oGJ1nnKuLZySgSIIJBVAukXqVxjI06jehyk87esK16ayRRKvAIWFle6gCyhWxUXM8VpC0KpGqVRyX4kvAavy96nfMJHj6lM9mZFMla3KE4qrw8SHGcmJxwmgGA2hZYuomweQIg8CYYmjRswBhgiBpqR7XwOalwzzwb8eFNJ2zfOn9qFK6NUgJLkpqPu1Zky1d9zDyRIL2eSpUMiUR8F1AcqoI8OaxryXY1KBSgeFdxiGCdzWp9TcqtdgeFlQLqSh9sFunPiPHNdEMtIIzTfAEfSU5HHgW8uysKMbVGqaIfWA5E1vuZyrUgfEOX5Bxf2a2rS8P4LtjD7DRi3NqvU1Fzy0G7FhE0913WmNiEJdw8BtbIFCPvLoE361qhtMKIUWHT0av7gQbaEmpVoVYNNSAUBrROFIAFTCCBJpcW7sND4tVjLUQHknA2opkgXXBXjH7HMwReH6wqcY8RoT99QNdFkfc7k01ClVhgwDJcSW25R7KZlnYfSTTQ07XWBDu9821HxDr0EWOsTbToGokbuqwoZ62jYfa2lqewj64Ph8Mh60MXxG024rA1pol29aad0dJVqw6tkNIxKkZIrodKIqkZYVhkRoOliiGNRBPkLTcTlu1EGV9Eyf2F2zLLpPEiSfT3bVaMJVnbK6OvmkUeBXyWEEaxyablC894FbjjEcWbKwZUcNporXuoUQphqyQr6mXqS0eL2jYUJzOyoWSo6bfSWSINnjtWXl6tOwkPQBEIBCIuzdSXBMr9', 0),
(1773, 0, 'config', 'config_shared', '0', 0),
(1772, 0, 'config', 'config_password', '1', 0),
(1771, 0, 'config', 'config_secure', '1', 0),
(1770, 0, 'config', 'config_compression', '0', 0),
(1757, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(1756, 0, 'config', 'config_mail_parameter', '', 0),
(1754, 0, 'config', 'config_ftp_status', '0', 0),
(1755, 0, 'config', 'config_mail_protocol', 'mail', 0),
(1753, 0, 'config', 'config_ftp_root', '', 0),
(1752, 0, 'config', 'config_ftp_password', '', 0),
(1751, 0, 'config', 'config_ftp_username', '', 0),
(1750, 0, 'config', 'config_ftp_port', '21', 0),
(1749, 0, 'config', 'config_ftp_hostname', 'termopara.net', 0),
(1748, 0, 'config', 'config_icon', 'catalog/paraterm-icon.png', 0),
(1747, 0, 'config', 'config_logo', 'catalog/paraterm-logo.png', 0),
(1746, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(1744, 0, 'config', 'config_return_status_id', '2', 0),
(1745, 0, 'config', 'config_captcha', '', 0),
(1743, 0, 'config', 'config_return_id', '0', 0),
(1742, 0, 'config', 'config_affiliate_id', '4', 0),
(1741, 0, 'config', 'config_affiliate_commission', '5', 0),
(1740, 0, 'config', 'config_affiliate_auto', '0', 0),
(1739, 0, 'config', 'config_affiliate_approval', '0', 0),
(1738, 0, 'config', 'config_stock_checkout', '0', 0),
(1737, 0, 'config', 'config_stock_warning', '0', 0),
(1735, 0, 'config', 'config_api_id', '1', 0),
(1736, 0, 'config', 'config_stock_display', '0', 0),
(95, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(96, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'shipping', 'shipping_sort_order', '3', 0),
(98, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(99, 0, 'sub_total', 'sub_total_status', '1', 0),
(100, 0, 'tax', 'tax_status', '1', 0),
(101, 0, 'total', 'total_sort_order', '9', 0),
(102, 0, 'total', 'total_status', '1', 0),
(103, 0, 'tax', 'tax_sort_order', '5', 0),
(104, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(105, 0, 'cod', 'cod_sort_order', '5', 0),
(106, 0, 'cod', 'cod_total', '0.01', 0),
(107, 0, 'cod', 'cod_order_status_id', '1', 0),
(108, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(109, 0, 'cod', 'cod_status', '1', 0),
(110, 0, 'shipping', 'shipping_status', '1', 0),
(111, 0, 'shipping', 'shipping_estimator', '1', 0),
(112, 0, 'coupon', 'coupon_sort_order', '4', 0),
(113, 0, 'coupon', 'coupon_status', '1', 0),
(114, 0, 'flat', 'flat_sort_order', '1', 0),
(115, 0, 'flat', 'flat_status', '1', 0),
(116, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(117, 0, 'flat', 'flat_tax_class_id', '9', 0),
(118, 0, 'flat', 'flat_cost', '5.00', 0),
(119, 0, 'credit', 'credit_sort_order', '7', 0),
(120, 0, 'credit', 'credit_status', '1', 0),
(121, 0, 'reward', 'reward_sort_order', '2', 0),
(122, 0, 'reward', 'reward_status', '1', 0),
(123, 0, 'category', 'category_status', '1', 0),
(124, 0, 'account', 'account_status', '1', 0),
(125, 0, 'affiliate', 'affiliate_status', '1', 0),
(1588, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(1587, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(1586, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(1585, 0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(1584, 0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(1583, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(1582, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(1581, 0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(1580, 0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(1579, 0, 'theme_default', 'theme_default_image_popup_height', '600', 0),
(1578, 0, 'theme_default', 'theme_default_image_popup_width', '600', 0),
(1577, 0, 'theme_default', 'theme_default_image_thumb_height', '300', 0),
(1576, 0, 'theme_default', 'theme_default_image_thumb_width', '360', 0),
(1575, 0, 'theme_default', 'theme_default_image_category_height', '90', 0),
(1574, 0, 'theme_default', 'theme_default_image_category_width', '90', 0),
(1573, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(1572, 0, 'theme_default', 'theme_default_product_limit', '15', 0),
(150, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(151, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(152, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(153, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(154, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(155, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(156, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(157, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(158, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(159, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(160, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(161, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(162, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(164, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(165, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(166, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(167, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(168, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(169, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(171, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(172, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(173, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(174, 0, 'configblog', 'configblog_review_guest', '1', 0),
(175, 0, 'configblog', 'configblog_review_mail', '1', 0),
(176, 0, 'configblog', 'configblog_article_download', '1', 0),
(177, 0, 'configblog', 'configblog_review_status', '1', 0),
(178, 0, 'configblog', 'configblog_article_limit', '20', 0),
(179, 0, 'configblog', 'configblog_article_description_length', '200', 0),
(180, 0, 'configblog', 'configblog_limit_admin', '20', 0),
(181, 0, 'configblog', 'configblog_blog_menu', '1', 0),
(182, 0, 'configblog', 'configblog_article_count', '1', 0),
(183, 0, 'configblog', 'configblog_meta_keyword', 'блог, blog, opencart blog, опенкарт блог', 0),
(184, 0, 'configblog', 'configblog_meta_description', 'Используя блог для Опенкарт вы можете донести информацию клиентам и повысить ранжирование в поисковых системах', 0),
(185, 0, 'configblog', 'configblog_meta_title', 'Встроенный блог для магазина на Опенкарт', 0),
(186, 0, 'configblog', 'configblog_html_h1', 'Блог для магазина на Опенкарт', 0),
(187, 0, 'configblog', 'configblog_name', 'Блог', 0),
(188, 0, 'configblog', 'configblog_image_category_width', '50', 0),
(189, 0, 'configblog', 'configblog_image_category_height', '50', 0),
(190, 0, 'configblog', 'configblog_image_article_width', '150', 0),
(191, 0, 'configblog', 'configblog_image_article_height', '200', 0),
(192, 0, 'configblog', 'configblog_image_related_width', '200', 0),
(193, 0, 'configblog', 'configblog_image_related_height', '200', 0),
(194, 0, 'blog_category', 'blog_category_status', '1', 0),
(1789, 0, 'configcustommenu', 'configcustommenu_custommenu', '1', 0),
(196, 0, 'manufacturer', 'manufacturer_status', '1', 0),
(1734, 0, 'config', 'config_fraud_status_id', '16', 0),
(1733, 0, 'config', 'config_complete_status', '[\"3\",\"5\"]', 1),
(1731, 0, 'config', 'config_order_status_id', '1', 0),
(1732, 0, 'config', 'config_processing_status', '[\"2\",\"3\",\"1\",\"12\",\"5\"]', 1),
(1730, 0, 'config', 'config_checkout_id', '5', 0),
(1728, 0, 'config', 'config_cart_weight', '1', 0),
(1729, 0, 'config', 'config_checkout_guest', '1', 0),
(1727, 0, 'config', 'config_invoice_prefix', 'INV-0000', 0),
(1726, 0, 'config', 'config_account_id', '3', 0),
(1725, 0, 'config', 'config_login_attempts', '7', 0),
(1724, 0, 'config', 'config_customer_price', '0', 0),
(1723, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(1722, 0, 'config', 'config_customer_group_id', '1', 0),
(1721, 0, 'config', 'config_customer_search', '1', 0),
(1720, 0, 'config', 'config_customer_activity', '1', 0),
(1719, 0, 'config', 'config_customer_online', '1', 0),
(1712, 0, 'config', 'config_review_status', '1', 0),
(1713, 0, 'config', 'config_review_guest', '1', 0),
(1714, 0, 'config', 'config_voucher_min', '1', 0),
(1715, 0, 'config', 'config_voucher_max', '1000', 0),
(1716, 0, 'config', 'config_tax', '0', 0),
(1717, 0, 'config', 'config_tax_default', 'shipping', 0),
(1718, 0, 'config', 'config_tax_customer', 'shipping', 0),
(1710, 0, 'config', 'config_product_count', '0', 0),
(1711, 0, 'config', 'config_limit_admin', '50', 0),
(1709, 0, 'config', 'config_weight_class_id', '1', 0),
(1708, 0, 'config', 'config_length_class_id', '1', 0),
(1707, 0, 'config', 'config_currency_auto', '0', 0),
(1706, 0, 'config', 'config_currency', 'UAH', 0),
(1704, 0, 'config', 'config_language', 'ru-ru', 0),
(1705, 0, 'config', 'config_admin_language', 'ru-ru', 0),
(1703, 0, 'config', 'config_zone_id', '3484', 0),
(1702, 0, 'config', 'config_country_id', '220', 0),
(1571, 0, 'theme_default', 'theme_default_status', '1', 0),
(1570, 0, 'theme_default', 'theme_default_directory', 'paraterm', 0),
(1701, 0, 'config', 'config_comment', 'Мы приветствуем Вас в онлайн-магазине ParaTerm.com. На этом сайте Вы можете ознакомиться со всеми выпускаемыми нами изделиями. ', 0),
(1697, 0, 'config', 'config_telephone', '+38 (099) 54-53-900', 0),
(1698, 0, 'config', 'config_fax', '+38 (098) 54-53-900', 0),
(1699, 0, 'config', 'config_image', 'catalog/paraterm-logo-v.png', 0),
(1700, 0, 'config', 'config_open', 'Пн. - Пт. 9:00 - 18:00&lt;br /&gt;Сб. - Вс. 10:00 - 15:00', 0),
(1696, 0, 'config', 'config_email', 'shop@termopara.net', 0),
(1340, 0, 'seomanager', 'seomanager_html_h1_special', '', 0),
(1341, 0, 'seomanager', 'seomanager_meta_title_special', '', 0),
(1342, 0, 'seomanager', 'seomanager_meta_description_special', '', 0),
(1343, 0, 'seomanager', 'seomanager_meta_keyword_special', '', 0),
(1344, 0, 'seomanager', 'seomanager_description_special', '', 0),
(1345, 0, 'seomanager', 'seomanager_html_h1_bestseller', '', 0),
(1346, 0, 'seomanager', 'seomanager_meta_title_bestseller', '', 0),
(1347, 0, 'seomanager', 'seomanager_meta_description_bestseller', '', 0),
(1348, 0, 'seomanager', 'seomanager_meta_keyword_bestseller', '', 0),
(1349, 0, 'seomanager', 'seomanager_description_bestseller', '', 0),
(1350, 0, 'seomanager', 'seomanager_html_h1_latest', '', 0),
(1351, 0, 'seomanager', 'seomanager_meta_title_latest', '', 0),
(1352, 0, 'seomanager', 'seomanager_meta_description_latest', '', 0),
(1353, 0, 'seomanager', 'seomanager_meta_keyword_latest', '', 0),
(1354, 0, 'seomanager', 'seomanager_description_latest', '', 0),
(1355, 0, 'seomanager', 'seomanager_html_h1_mostviewed', '', 0),
(1356, 0, 'seomanager', 'seomanager_meta_title_mostviewed', '', 0),
(1357, 0, 'seomanager', 'seomanager_meta_description_mostviewed', '', 0),
(1358, 0, 'seomanager', 'seomanager_meta_keyword_mostviewed', '', 0),
(1359, 0, 'seomanager', 'seomanager_description_mostviewed', '', 0),
(1590, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(1591, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(1592, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(1593, 0, 'theme_default', 'theme_default_image_location_height', '200', 0),
(1775, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(1776, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(1695, 0, 'config', 'config_geocode', '48.345149, 33.506930', 0),
(1689, 0, 'config', 'config_meta_keyword', 'термопара, termopara, паратерм, paraterm', 0),
(1690, 0, 'config', 'config_theme', 'theme_default', 0),
(1691, 0, 'config', 'config_layout_id', '4', 0),
(1692, 0, 'config', 'config_name', 'paraterm', 0),
(1693, 0, 'config', 'config_owner', 'Dmitry Gerega', 0),
(1694, 0, 'config', 'config_address', '52201, г. Жёлтые Воды, Днепропетровская обл., Украина', 0),
(1688, 0, 'config', 'config_meta_description', 'Интернет-магазин paraterm.com — широкий выбор термопар для бытовых котлов, колонок и газовых плит от производителя.', 0),
(1687, 0, 'config', 'config_meta_title', 'paraterm', 0),
(1777, 0, 'config', 'config_error_display', '1', 0),
(1778, 0, 'config', 'config_error_log', '1', 0),
(1779, 0, 'config', 'config_error_filename', 'error.log', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_sticker`
--

CREATE TABLE `oc_sticker` (
  `sticker_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_sticker`
--

INSERT INTO `oc_sticker` (`sticker_id`, `name`, `status`, `image`) VALUES
(15, 'Лучший Выбор', 1, 'catalog/demo/stiker/best.png'),
(13, 'Новинка', 1, 'catalog/demo/stiker/new.png'),
(14, 'Хит Продаж', 1, 'catalog/demo/stiker/bestseller.png'),
(16, 'Акция', 1, 'catalog/demo/stiker/special.png'),
(17, 'Лучшая цена', 1, 'catalog/demo/stiker/bestprice.png');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_stock_status`
--

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'В наличии'),
(8, 1, 'Предзаказ'),
(5, 1, 'Нет в наличии'),
(6, 1, 'Ожидание 2-3 дня');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_store`
--

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_class`
--

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate`
--

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate_to_customer_group`
--

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rule`
--

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_theme`
--

CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_translation`
--

CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_upload`
--

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_url_alias`
--

CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `seomanager` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`, `seomanager`) VALUES
(900, 'manufacturer_id=8', 'paraterm', 0),
(861, 'information_id=4', 'about_us', 0),
(997, 'product_id=140', 'stakan-mednij-100mm-naruzhnaja-rezba-1-2', 0),
(996, 'product_id=139', 'stakan-mednij-100mm-vnutrennjaja-rezba-1-2', 0),
(995, 'product_id=138', 'zapalnik-dlja-avtomatiki-plamja', 0),
(994, 'product_id=137', 'zapalnik-dlja-avtomatiki-apok-1', 0),
(993, 'product_id=136', 'termopara-grill-beko', 0),
(992, 'product_id=135', 'termopara-duhovki-beko', 0),
(991, 'product_id=134', 'termopara-kolonki-beretta-aqua', 0),
(990, 'product_id=133', 'termopara-arbat-1200-m8', 0),
(989, 'product_id=132', 'termopara-duhovki-hansa', 0),
(988, 'product_id=131', 'termopara-aogv-35', 0),
(987, 'product_id=130', 'termopara-aogv-29', 0),
(986, 'product_id=129', 'termopara-beretta-idrabagno-staraja', 0),
(985, 'product_id=128', 'termopara-duhovki-orion-orsk', 0),
(828, 'manufacturer_id=9', 'canon', 0),
(829, 'manufacturer_id=5', 'htc', 0),
(830, 'manufacturer_id=7', 'hewlett-packard', 0),
(831, 'manufacturer_id=6', 'palm', 0),
(832, 'manufacturer_id=10', 'sony', 0),
(841, 'information_id=6', 'delivery', 0),
(842, 'information_id=3', 'privacy', 0),
(843, 'information_id=5', 'terms', 0),
(862, 'common/home', '', 1),
(863, 'information/contact', 'contacts', 1),
(864, 'information/sitemap', 'sitemaps', 1),
(865, 'product/manufacturer', 'brands', 1),
(866, 'product/special', 'specials', 1),
(867, 'blog/latest', 'blog', 1),
(868, 'blog_category_id=70', 'obzori', 0),
(869, 'blog_category_id=69', 'novosti', 0),
(870, 'blog_category_id=71', 'anonsi', 0),
(871, 'article_id=125', 'pervaja-novost', 0),
(872, 'article_id=123', 'obzor-pervij', 0),
(873, 'article_id=124', 'vazhnaja-statja', 0),
(874, 'article_id=120', 'cms-dlja-internet-magazinov-opencart-pro-v2-x', 0),
(875, 'account/account', 'account', 1),
(876, 'account/login', 'signin', 1),
(877, 'account/logout', 'signout', 1),
(878, 'account/newsletter', 'newsletters', 1),
(879, 'account/register', 'signup', 1),
(880, 'account/order', 'orders', 1),
(881, 'account/password', 'password', 1),
(882, 'account/wishlist', 'wishlist', 1),
(883, 'checkout/cart', 'cart', 1),
(884, 'checkout/checkout', 'checkout', 1),
(885, 'product/search', 'search', 1),
(886, 'product/compare', 'compare', 1),
(887, 'product/latest', 'latest', 1),
(888, 'product/mostviewed', 'mostviewed', 1),
(889, 'product/bestseller', 'bestsellers', 1),
(890, 'account/address', 'account-address', 1),
(891, 'account/download', 'account-downloads', 1),
(892, 'account/edit', 'account-edit', 1),
(893, 'account/forgotten', 'forgotten-password', 1),
(894, 'account/return/insert', 'return-insert', 1),
(895, 'account/transaction', 'transactions', 1),
(896, 'account/voucher', 'vouchers', 1),
(897, 'affiliate/account', 'affiliate', 1),
(898, 'account/return/add', 'return-add', 1),
(899, 'affiliate/login', 'affiliate-login', 1),
(984, 'product_id=127', 'termopara-termo-350-m9', 0),
(983, 'product_id=125', 'termopara-termo-350-m8', 0),
(982, 'product_id=124', 'termopara-sit-a1-600-m8', 0),
(981, 'product_id=123', 'termopara-sit-a2-320-m9', 0),
(980, 'product_id=122', 'termopara-sit-a3-900-m9', 0),
(979, 'product_id=121', 'termopara-sit-a3-600-m9', 0),
(978, 'product_id=120', 'termopara-900-u', 0),
(977, 'product_id=119', 'termopara-sit-a2-600-m9', 0),
(976, 'product_id=118', 'termopara-sit-a2-400-m9', 0),
(975, 'product_id=117', 'termopara-sit-a1-850-m9', 0),
(974, 'product_id=116', 'termopara-arbat-900-m9', 0),
(973, 'product_id=115', 'termopara-arbat-600-m9', 0),
(972, 'product_id=114', 'termopara-arbat-345-m9', 0),
(971, 'product_id=113', 'mednaja-trubka-dlja-smesitelja-100sm', 0),
(970, 'product_id=112', 'mednaja-trubka-dlja-smesitelja-80sm', 0),
(969, 'product_id=111', 'mednaja-trubka-dlja-smesitelja-60sm', 0),
(968, 'product_id=110', 'mednaja-trubka-dlja-smesitelja-50sm', 0),
(967, 'product_id=109', 'trubka-zapalnika-avtomatiki-apok-950mm', 0),
(966, 'product_id=108', 'termopara-sit-a1-1200-m9', 0),
(965, 'product_id=107', 'mednaja-trubka-dlja-smesitelja-40sm', 0),
(964, 'product_id=106', 'termoreguljator-avtomatiki-apok-1-2kz', 0),
(963, 'product_id=105', 'termoreguljator-avtomatiki-apok-1-2ks', 0),
(962, 'product_id=104', 'termoreguljator-avtomatiki-apok-1-1ks', 0),
(961, 'product_id=103', 'mednaja-trubka-dlja-smesitelja-30sm', 0),
(960, 'product_id=102', 'membrana-vodjanogo-reguljatora-vpg-chernaja', 0),
(959, 'product_id=101', 'membrana-vodjanogo-reguljatora-vpg-belaja', 0),
(958, 'product_id=100', 'klapan-otsekatel-avtomatiki-apok-1', 0),
(1038, 'product_id=99', 'bimetallicheskaja-plastina-avtomatiki-apok-1', 0),
(956, 'product_id=98', 'termopara-honeywell-600-11-32', 0),
(955, 'product_id=97', 'termopara-termo-350-m9-universalnaja', 0),
(954, 'product_id=96', 'termopara-termo-350-m8-universalnaja', 0),
(953, 'product_id=95', 'impulsnaja-trubka-avtomatiki-apok-1', 0),
(952, 'product_id=94', 'trubka-zapalnika-beretta-idrabagno', 0),
(951, 'product_id=93', 'trubka-zapalnika-avtomatik-evrokaz-fakel', 0),
(950, 'product_id=92', 'trubka-zapalnika-avtomatik-arbat-komfort-plamja', 0),
(949, 'product_id=91', 'impulsnaja-trubka-avtomatiki-kare-1000-4', 0),
(948, 'product_id=90', 'impulsnaja-trubka-avtomatiki-kare-500-4', 0),
(947, 'product_id=89', 'trubka-zapalnika-avtomatiki-eurosit-600-6', 0),
(946, 'product_id=88', 'trubka-zapalnika-avtomatiki-eurosit-600-4', 0),
(945, 'product_id=87', 'trubka-zapalnika-avtomatiki-eurosit-400-4', 0),
(944, 'product_id=86', 'trubka-zapalnika-avtomatiki-eurosit-400-6', 0),
(943, 'product_id=85', 'trubka-zapalnika-avtomatiki-eurosit-300-6', 0),
(942, 'product_id=84', 'trubka-zapalnika-avtomatiki-eurosit-300-4', 0),
(941, 'product_id=83', 'termopara-konforki-electrolux-500', 0),
(940, 'product_id=82', 'termopara-konforki-indesit-ariston-500-m8', 0),
(939, 'product_id=81', 'termopara-konforki-ariston-indesit-500-m6', 0),
(938, 'product_id=80', 'termopara-duhovki-ariston-indesit-1200-m8', 0),
(937, 'product_id=79', 'termopara-duhovki-i-grilja-indesit-1200-m8', 0),
(936, 'product_id=78', 'termopara-kolonki-termet-aqua', 0),
(935, 'product_id=77', 'termopara-kolonki-termet-termaq-g19-01', 0),
(934, 'product_id=76', 'termopara-kolonki-termet-g19-01', 0),
(933, 'product_id=75', 'termopara-kolonki-termet-g17-30', 0),
(932, 'product_id=74', 'termopara-kolonki-vaillant-mag-pro', 0),
(931, 'product_id=73', 'termopara-kolonki-vaillant-atmomag', 0),
(930, 'product_id=72', 'termopara-kolonki-junkers-bosch', 0),
(929, 'product_id=71', 'termopara-kolonki-demrad', 0),
(928, 'product_id=70', 'termopara-kolonki-beretta-idrabagno', 0),
(927, 'product_id=69', 'termopara-honeywell-900-m10', 0),
(926, 'product_id=68', 'termopara-sit-a1-600-m10', 0),
(925, 'product_id=67', 'termopara-sit-a1-600-m9', 0),
(924, 'product_id=66', 'termopara-sit-a1-400-m9', 0),
(923, 'product_id=65', 'termopara-sit-a1-320-m9', 0),
(922, 'product_id=64', 'termopara-sit-a3-600-m10', 0),
(921, 'product_id=63', 'termopara-sit-a3-400-m10', 0),
(920, 'product_id=62', 'termopara-sit-a3-400-m9', 0),
(919, 'product_id=61', 'termopara-arbat-900-m8', 0),
(918, 'product_id=60', 'termopara-arbat-600-m8', 0),
(917, 'product_id=59', 'termopara-arbat-345-m8', 0),
(916, 'product_id=58', 'termopara-aogv-32-u', 0),
(915, 'product_id=57', 'termopara-aogv-23-dani', 0),
(914, 'product_id=56', 'termopara-aogv-17-dani', 0),
(913, 'product_id=54', 'termopara-aogv-11-dani', 0),
(912, 'product_id=53', 'termopara-aogv-7-5-dani', 0),
(911, 'product_id=52', 'termopara-aogv-11-17', 0),
(910, 'product_id=51', 'termopara-aogv-80', 0),
(1039, 'category_id=1', 'termopary-dlya-kotlov', 0),
(1040, 'category_id=2', 'termopary-dlya-kolonok', 0),
(1041, 'category_id=3', 'termopary-dlya-gazovyh-plit', 0),
(1042, 'category_id=4', 'gazoprovodnye-trubki', 0),
(1043, 'category_id=5', 'drugie-zapchasti', 0),
(1044, 'category_id=6', 'krepezhnie-zapchasti', 0),
(907, 'category_id=7', 'dlja-kotlov', 0),
(908, 'category_id=8', 'dlja-kolonok', 0),
(909, 'category_id=9', 'dlja-gazplit', 0),
(998, 'product_id=141', 'gajka-razreznaja-m8h1', 0),
(999, 'product_id=142', 'gajka-razreznaja-m9h1', 0),
(1000, 'product_id=143', 'gajka-razreznaja-m10h1', 0),
(1001, 'product_id=144', 'stakan-mednij-105-16mm-naruzhnaja-rezba-1-2', 0),
(1002, 'product_id=145', 'termopara-sit-a1-400-m10', 0),
(1003, 'product_id=146', 'trubka-zapalnika-avtomatiki-apok-1200mm', 0),
(1004, 'product_id=147', 'termopara-honeywell-900-11-32', 0),
(1005, 'product_id=148', 'termopara-sit-a1-1200-m8', 0),
(1006, 'product_id=149', 'termopara-sit-a1-850-m10', 0),
(1007, 'product_id=150', 'impulsnaja-trubka-avtomatiki-kare-350-4', 0),
(1008, 'product_id=151', 'membrana-termoregulatora-avtomatiki-kare', 0),
(1009, 'product_id=152', 'sharikovij-klapan-avtomatiki-apok-1', 0),
(1010, 'product_id=153', 'trubka-zapalnika-honeywell-300mm-m10-m10', 0),
(1011, 'product_id=154', 'trubka-zapalnika-honeywell-400mm-m10-7-16', 0),
(1012, 'product_id=155', 'datchik-tiagy-60c', 0),
(1013, 'product_id=156', 'datchik-tiagy-65c', 0),
(1014, 'product_id=157', 'datchik-tiagy-70c', 0),
(1015, 'product_id=158', 'datchik-tiagy-75c', 0),
(1016, 'product_id=159', 'datchik-tiagy-80c', 0),
(1017, 'product_id=160', 'datchik-tiagy-85c', 0),
(1018, 'product_id=161', 'datchik-tiagy-90c', 0),
(1019, 'product_id=162', 'datchik-tiagy-95c', 0),
(1020, 'product_id=163', 'datchik-tiagy-100c', 0),
(1021, 'product_id=164', 'datchik-tiagy-105c', 0),
(1022, 'product_id=165', 'datchik-tiagy-110c', 0),
(1023, 'product_id=166', 'datchik-tiagy-115c', 0),
(1024, 'product_id=167', 'datchik-tiagy-120c', 0),
(1025, 'product_id=168', 'datchik-tiagy-125c', 0),
(1026, 'product_id=169', 'datchik-tiagy-130c', 0),
(1027, 'product_id=170', 'termopara-honeywell-600-М10', 0),
(1028, 'product_id=171', 'termopara-honeywell-750-М10', 0),
(1029, 'product_id=172', 'termopara-honeywell-750-11-32', 0),
(1030, 'product_id=173', 'termopara-gazovogo-grilja-sit-a1-900-m9', 0),
(1031, 'product_id=174', 'termopara-analog-sit-a1-600-m9', 0),
(1032, 'product_id=175', 'termopara-termo-600-m9-universalnaja', 0),
(1033, 'product_id=176', 'termopara-analog-honeywell-900-М10', 0),
(1034, 'product_id=177', 'termopara-analog-duhovki-i-grilja-indesit-1200-m8', 0),
(1035, 'product_id=178', 'termopara-analog-duhovki-ariston-1200-m8', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user`
--

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'paraterm', 'acd1ba0faf31cb22ee9ec421ecc740eb5d86e5b6', '5gTPVVX3n', 'Deniz', 'True', 'nzxtua@fex.net', 'catalog/nzxtua.jpg', '', '127.0.0.1', 1, '2019-01-09 00:10:37');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user_group`
--

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Администратор', '{\"access\":[\"blog\\/article\",\"blog\\/category\",\"blog\\/review\",\"blog\\/setting\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/benefit\",\"design\\/custommenu\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/sticker\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/blog_sitemap\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/feed\\/sitemap_pro\",\"extension\\/feed\\/yandex_market\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/ajax_viewed\",\"extension\\/module\\/alphabetm\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/bestsellerpercategory\",\"extension\\/module\\/blog_category\",\"extension\\/module\\/blog_featured\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/blog_popular\",\"extension\\/module\\/cachemanager\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/category4level\",\"extension\\/module\\/categorywall\",\"extension\\/module\\/coolbanner\",\"extension\\/module\\/custom_banner\",\"extension\\/module\\/custom_footer\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/featured_article\",\"extension\\/module\\/featured_product\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/imgcategory\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/latestpercategory\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/manufacturer\",\"extension\\/module\\/manufacturerpercategory\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/popular\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/product_tab\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/specialpercategory\",\"extension\\/module\\/store\",\"extension\\/module\\/turbo\",\"extension\\/module\\/viewed\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/shipping\\/xshipping\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"howto\\/blogun\",\"howto\\/gogettop\",\"howto\\/howtosms\",\"howto\\/seopult\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"pro\\/license\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"search\\/search\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/export_import\",\"tool\\/log\",\"tool\\/seomanager\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"blog\\/article\",\"blog\\/category\",\"blog\\/review\",\"blog\\/setting\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/benefit\",\"design\\/custommenu\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/sticker\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/blog_sitemap\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/feed\\/sitemap_pro\",\"extension\\/feed\\/yandex_market\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/ajax_viewed\",\"extension\\/module\\/alphabetm\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/bestsellerpercategory\",\"extension\\/module\\/blog_category\",\"extension\\/module\\/blog_featured\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/blog_popular\",\"extension\\/module\\/cachemanager\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/category4level\",\"extension\\/module\\/categorywall\",\"extension\\/module\\/coolbanner\",\"extension\\/module\\/custom_banner\",\"extension\\/module\\/custom_footer\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/featured_article\",\"extension\\/module\\/featured_product\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/imgcategory\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/latestpercategory\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/manufacturer\",\"extension\\/module\\/manufacturerpercategory\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/popular\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/product_tab\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/specialpercategory\",\"extension\\/module\\/store\",\"extension\\/module\\/turbo\",\"extension\\/module\\/viewed\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/shipping\\/xshipping\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"howto\\/blogun\",\"howto\\/gogettop\",\"howto\\/howtosms\",\"howto\\/seopult\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"pro\\/license\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"search\\/search\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/export_import\",\"tool\\/log\",\"tool\\/seomanager\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}'),
(10, 'Демонстрация', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher`
--

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_history`
--

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme`
--

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme_description`
--

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class`
--

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class_description`
--

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Килограммы', 'кг'),
(2, 1, 'Граммы', 'г'),
(5, 1, 'Фунты', 'lb'),
(6, 1, 'Унции', 'oz');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone`
--

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M\'Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu\'a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Арагацотн', 'AGT', 1),
(181, 11, 'Арарат', 'ARR', 1),
(182, 11, 'Армавир', 'ARM', 1),
(183, 11, 'Гегаркуник', 'GEG', 1),
(184, 11, 'Котайк', 'KOT', 1),
(185, 11, 'Лори', 'LOR', 1),
(186, 11, 'Ширак', 'SHI', 1),
(187, 11, 'Сюник', 'SYU', 1),
(188, 11, 'Тавуш', 'TAV', 1),
(189, 11, 'Вайоц Дзор', 'VAY', 1),
(190, 11, 'Ереван', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore\'s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Брест', 'BR', 1),
(338, 20, 'Гомель', 'HO', 1),
(339, 20, 'Минск', 'HM', 1),
(340, 20, 'Гродно', 'HR', 1),
(341, 20, 'Могилев', 'MA', 1),
(342, 20, 'Минская область', 'MI', 1),
(343, 20, 'Витебск', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George\'s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith\'s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M\'Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O\'Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '\'Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma\'iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa\'id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina\'', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina\'', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d\'Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand\'Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta\'mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be\'er Sheva', 'BS', 1),
(1613, 104, 'Bika\'at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '\'Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al \'Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa\'', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa\'', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma\'an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Алматинская область', 'AL', 1),
(1717, 109, 'Алматы - город республ-го значения', 'AC', 1),
(1718, 109, 'Акмолинская область', 'AM', 1),
(1719, 109, 'Актюбинская область', 'AQ', 1),
(1720, 109, 'Астана - город республ-го значения', 'AS', 1),
(1721, 109, 'Атырауская область', 'AT', 1),
(1722, 109, 'Западно-Казахстанская область', 'BA', 1),
(1723, 109, 'Байконур - город республ-го значения', 'BY', 1),
(1724, 109, 'Мангистауская область', 'MA', 1),
(1725, 109, 'Южно-Казахстанская область', 'ON', 1),
(1726, 109, 'Павлодарская область', 'PA', 1),
(1727, 109, 'Карагандинская область', 'QA', 1),
(1728, 109, 'Костанайская область', 'QO', 1),
(1729, 109, 'Кызылординская область', 'QY', 1),
(1730, 109, 'Восточно-Казахстанская область', 'SH', 1),
(1731, 109, 'Северо-Казахстанская область', 'SO', 1),
(1732, 109, 'Жамбылская область', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P\'yongan-bukto', 'PYB', 1),
(1769, 112, 'P\'yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P\'yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 1),
(1774, 113, 'Ch\'ungch\'ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch\'on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t\'ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al \'Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra\'', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale\'s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha\'s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al \'Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati\'', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke\'s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa\'id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Республика Хакасия', 'KK', 1),
(2722, 176, 'Забайкальский край', 'ZAB', 1),
(2723, 176, 'Чукотский АО', 'CHU', 1),
(2724, 176, 'Архангельская область', 'ARK', 1),
(2725, 176, 'Астраханская область', 'AST', 1),
(2726, 176, 'Алтайский край', 'ALT', 1),
(2727, 176, 'Белгородская область', 'BEL', 1),
(2728, 176, 'Еврейская АО', 'YEV', 1),
(2729, 176, 'Амурская область', 'AMU', 1),
(2730, 176, 'Брянская область', 'BRY', 1),
(2731, 176, 'Чувашская Республика', 'CU', 1),
(2732, 176, 'Челябинская область', 'CHE', 1),
(2733, 176, 'Карачаево-Черкесия', 'KC', 1),
(2735, 176, 'Таймырский АО', 'TDN', 1),
(2736, 176, 'Республика Калмыкия', 'KL', 1),
(2738, 176, 'Республика Алтай', 'AL', 1),
(2739, 176, 'Чеченская Республика', 'CE', 1),
(2740, 176, 'Иркутская область', 'IRK', 1),
(2741, 176, 'Ивановская область', 'IVA', 1),
(2742, 176, 'Удмуртская Республика', 'UD', 1),
(2743, 176, 'Калининградская область', 'KGD', 1),
(2744, 176, 'Калужская область', 'KLU', 1),
(2745, 176, 'Краснодарский край', 'KDA', 1),
(2746, 176, 'Республика Татарстан', 'TA', 1),
(2747, 176, 'Кемеровская область', 'KEM', 1),
(2748, 176, 'Хабаровский край', 'KHA', 1),
(2749, 176, 'Ханты-Мансийский АО - Югра', 'KHM', 1),
(2750, 176, 'Костромская область', 'KOS', 1),
(2751, 176, 'Московская область', 'MOS', 1),
(2752, 176, 'Красноярский край', 'KYA', 1),
(2753, 176, 'Коми-Пермяцкий АО', 'KOP', 1),
(2754, 176, 'Курганская область', 'KGN', 1),
(2755, 176, 'Курская область', 'KRS', 1),
(2756, 176, 'Республика Тыва', 'TY', 1),
(2757, 176, 'Липецкая область', 'LIP', 1),
(2758, 176, 'Магаданская область', 'MAG', 1),
(2759, 176, 'Республика Дагестан', 'DA', 1),
(2760, 176, 'Республика Адыгея', 'AD', 1),
(2761, 176, 'Москва', 'MOW', 1),
(2762, 176, 'Мурманская область', 'MUR', 1),
(2763, 176, 'Республика Кабардино-Балкария', 'KB', 1),
(2764, 176, 'Ненецкий АО', 'NEN', 1),
(2765, 176, 'Республика Ингушетия', 'IN', 1),
(2766, 176, 'Нижегородская область', 'NIZ', 1),
(2767, 176, 'Новгородская область', 'NGR', 1),
(2768, 176, 'Новосибирская область', 'NVS', 1),
(2769, 176, 'Омская область', 'OMS', 1),
(2770, 176, 'Орловская область', 'ORL', 1),
(2771, 176, 'Оренбургская область', 'ORE', 1),
(2772, 176, 'Корякский АО', 'KOR', 1),
(2773, 176, 'Пензенская область', 'PNZ', 1),
(2774, 176, 'Пермский край', 'PER', 1),
(2775, 176, 'Камчатский край', 'KAM', 1),
(2776, 176, 'Республика Карелия', 'KR', 1),
(2777, 176, 'Псковская область', 'PSK', 1),
(2778, 176, 'Ростовская область', 'ROS', 1),
(2779, 176, 'Рязанская область', 'RYA', 1),
(2780, 176, 'Ямало-Ненецкий АО', 'YAN', 1),
(2781, 176, 'Самарская область', 'SAM', 1),
(2782, 176, 'Республика Мордовия', 'MO', 1),
(2783, 176, 'Саратовская область', 'SAR', 1),
(2784, 176, 'Смоленская область', 'SMO', 1),
(2785, 176, 'Санкт-Петербург', 'SPE', 1),
(2786, 176, 'Ставропольский край', 'STA', 1),
(2787, 176, 'Республика Коми', 'KO', 1),
(2788, 176, 'Тамбовская область', 'TAM', 1),
(2789, 176, 'Томская область', 'TOM', 1),
(2790, 176, 'Тульская область', 'TUL', 1),
(2791, 176, 'Ленинградская область', 'LEN', 1),
(2792, 176, 'Тверская область', 'TVE', 1),
(2793, 176, 'Тюменская область', 'TYU', 1),
(2794, 176, 'Республика Башкортостан', 'BA', 1),
(2795, 176, 'Ульяновская область', 'ULY', 1),
(2796, 176, 'Республика Бурятия', 'BU', 1),
(2798, 176, 'Республика Северная Осетия', 'SE', 1),
(2799, 176, 'Владимирская область', 'VLA', 1),
(2800, 176, 'Приморский край', 'PRI', 1),
(2801, 176, 'Волгоградская область', 'VGG', 1),
(2802, 176, 'Вологодская область', 'VLG', 1),
(2803, 176, 'Воронежская область', 'VOR', 1),
(2804, 176, 'Кировская область', 'KIR', 1),
(2805, 176, 'Республика  Саха / Якутия', 'SA', 1),
(2806, 176, 'Ярославская область', 'YAR', 1),
(2807, 176, 'Свердловская область', 'SVE', 1),
(2808, 176, 'Республика Марий Эл', 'ME', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A\'ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa\'asaleleaga', 'FA', 1),
(2856, 181, 'Gaga\'emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa\'itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va\'a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '\'Asir', 'AS', 1),
(2882, 184, 'Ha\'il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand\' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand\' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A\'ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa\'iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t\'ou', 'NT', 1),
(3145, 206, 'P\'eng-hu', 'PH', 1),
(3146, 206, 'P\'ing-tung', 'PT', 1),
(3147, 206, 'T\'ai-chung', 'TG', 1),
(3148, 206, 'T\'ai-nan', 'TA', 1),
(3149, 206, 'T\'ai-pei county', 'TP', 1),
(3150, 206, 'T\'ai-tung', 'TT', 1),
(3151, 206, 'T\'ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T\'ai-chung', 'TH', 1),
(3157, 206, 'T\'ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T\'ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha\'apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava\'u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Черкасская область', '71', 1),
(3481, 220, 'Черниговская область', '74', 1),
(3482, 220, 'Черновицкая область', '77', 1),
(3483, 220, 'Крым', '43', 1),
(3484, 220, 'Днепропетровская область', '12', 1),
(3485, 220, 'Донецкая область', '14', 1),
(3486, 220, 'Ивано-Франковская область', '26', 1),
(3487, 220, 'Херсонская область', '65', 1),
(3488, 220, 'Хмельницкая область', '68', 1),
(3489, 220, 'Кировоградская область', '35', 1),
(3490, 220, 'Киев', '30', 1),
(3491, 220, 'Киевская область', '32', 1),
(3492, 220, 'Луганская область', '09', 1),
(3493, 220, 'Львовская область', '46', 1),
(3494, 220, 'Николаевская область', '48', 1),
(3495, 220, 'Одесская область', '51', 1),
(3496, 220, 'Полтавская область', '53', 1),
(3497, 220, 'Ровненская область', '56', 1),
(3498, 220, 'Севастополь', '40', 1),
(3499, 220, 'Сумская область', '59', 1),
(3500, 220, 'Тернопольская область', '61', 1),
(3501, 220, 'Винницкая область', '05', 1),
(3502, 220, 'Волынская область', '07', 1),
(3503, 220, 'Закарпатская область', '21', 1),
(3504, 220, 'Запорожская область', '23', 1),
(3505, 220, 'Житомирская область', '18', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '\'Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R\'as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg\'ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma\'rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa\'dah', 'SD', 1),
(3805, 235, 'San\'a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta\'izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Харьковская область', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone_to_geo_zone`
--

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- Индексы таблицы `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  ADD PRIMARY KEY (`affiliate_activity_id`);

--
-- Индексы таблицы `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  ADD PRIMARY KEY (`affiliate_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  ADD PRIMARY KEY (`affiliate_transaction_id`);

--
-- Индексы таблицы `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Индексы таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Индексы таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Индексы таблицы `oc_article`
--
ALTER TABLE `oc_article`
  ADD PRIMARY KEY (`article_id`);

--
-- Индексы таблицы `oc_article_description`
--
ALTER TABLE `oc_article_description`
  ADD PRIMARY KEY (`article_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_article_image`
--
ALTER TABLE `oc_article_image`
  ADD PRIMARY KEY (`article_image_id`);

--
-- Индексы таблицы `oc_article_related`
--
ALTER TABLE `oc_article_related`
  ADD PRIMARY KEY (`article_id`,`related_id`);

--
-- Индексы таблицы `oc_article_related_mn`
--
ALTER TABLE `oc_article_related_mn`
  ADD PRIMARY KEY (`article_id`,`manufacturer_id`);

--
-- Индексы таблицы `oc_article_related_product`
--
ALTER TABLE `oc_article_related_product`
  ADD PRIMARY KEY (`article_id`,`product_id`);

--
-- Индексы таблицы `oc_article_related_wb`
--
ALTER TABLE `oc_article_related_wb`
  ADD PRIMARY KEY (`article_id`,`category_id`);

--
-- Индексы таблицы `oc_article_to_blog_category`
--
ALTER TABLE `oc_article_to_blog_category`
  ADD PRIMARY KEY (`article_id`,`blog_category_id`);

--
-- Индексы таблицы `oc_article_to_download`
--
ALTER TABLE `oc_article_to_download`
  ADD PRIMARY KEY (`article_id`,`download_id`);

--
-- Индексы таблицы `oc_article_to_layout`
--
ALTER TABLE `oc_article_to_layout`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Индексы таблицы `oc_article_to_store`
--
ALTER TABLE `oc_article_to_store`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Индексы таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Индексы таблицы `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Индексы таблицы `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Индексы таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Индексы таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Индексы таблицы `oc_benefit`
--
ALTER TABLE `oc_benefit`
  ADD PRIMARY KEY (`benefit_id`);

--
-- Индексы таблицы `oc_benefit_description`
--
ALTER TABLE `oc_benefit_description`
  ADD PRIMARY KEY (`benefit_id`,`language_id`);

--
-- Индексы таблицы `oc_blog_category`
--
ALTER TABLE `oc_blog_category`
  ADD PRIMARY KEY (`blog_category_id`);

--
-- Индексы таблицы `oc_blog_category_description`
--
ALTER TABLE `oc_blog_category_description`
  ADD PRIMARY KEY (`blog_category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_blog_category_path`
--
ALTER TABLE `oc_blog_category_path`
  ADD PRIMARY KEY (`blog_category_id`,`path_id`);

--
-- Индексы таблицы `oc_blog_category_to_layout`
--
ALTER TABLE `oc_blog_category_to_layout`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Индексы таблицы `oc_blog_category_to_store`
--
ALTER TABLE `oc_blog_category_to_store`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Индексы таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Индексы таблицы `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Индексы таблицы `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Индексы таблицы `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Индексы таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Индексы таблицы `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Индексы таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Индексы таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Индексы таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Индексы таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Индексы таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Индексы таблицы `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Индексы таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Индексы таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Индексы таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Индексы таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Индексы таблицы `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Индексы таблицы `oc_custommenu`
--
ALTER TABLE `oc_custommenu`
  ADD PRIMARY KEY (`custommenu_id`);

--
-- Индексы таблицы `oc_custommenu_child`
--
ALTER TABLE `oc_custommenu_child`
  ADD PRIMARY KEY (`custommenu_child_id`),
  ADD KEY `custommenu_id` (`custommenu_id`);

--
-- Индексы таблицы `oc_custommenu_child_description`
--
ALTER TABLE `oc_custommenu_child_description`
  ADD PRIMARY KEY (`custommenu_child_id`,`language_id`),
  ADD KEY `custommenu_id` (`custommenu_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Индексы таблицы `oc_custommenu_child_to_store`
--
ALTER TABLE `oc_custommenu_child_to_store`
  ADD PRIMARY KEY (`custommenu_child_id`,`store_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Индексы таблицы `oc_custommenu_description`
--
ALTER TABLE `oc_custommenu_description`
  ADD PRIMARY KEY (`custommenu_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Индексы таблицы `oc_custommenu_to_store`
--
ALTER TABLE `oc_custommenu_to_store`
  ADD PRIMARY KEY (`custommenu_id`,`store_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Индексы таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Индексы таблицы `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Индексы таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Индексы таблицы `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Индексы таблицы `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Индексы таблицы `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Индексы таблицы `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Индексы таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Индексы таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Индексы таблицы `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Индексы таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Индексы таблицы `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Индексы таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Индексы таблицы `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Индексы таблицы `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Индексы таблицы `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Индексы таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Индексы таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Индексы таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Индексы таблицы `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Индексы таблицы `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Индексы таблицы `oc_manufacturer_description`
--
ALTER TABLE `oc_manufacturer_description`
  ADD PRIMARY KEY (`manufacturer_id`,`language_id`);

--
-- Индексы таблицы `oc_manufacturer_to_layout`
--
ALTER TABLE `oc_manufacturer_to_layout`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Индексы таблицы `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Индексы таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Индексы таблицы `oc_menu`
--
ALTER TABLE `oc_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Индексы таблицы `oc_menu_description`
--
ALTER TABLE `oc_menu_description`
  ADD PRIMARY KEY (`menu_id`,`language_id`);

--
-- Индексы таблицы `oc_menu_module`
--
ALTER TABLE `oc_menu_module`
  ADD PRIMARY KEY (`menu_module_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Индексы таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Индексы таблицы `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Индексы таблицы `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Индексы таблицы `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Индексы таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Индексы таблицы `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Индексы таблицы `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  ADD PRIMARY KEY (`order_custom_field_id`);

--
-- Индексы таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Индексы таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Индексы таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- Индексы таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Индексы таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Индексы таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Индексы таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Индексы таблицы `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Индексы таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Индексы таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Индексы таблицы `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Индексы таблицы `oc_product_related_article`
--
ALTER TABLE `oc_product_related_article`
  ADD PRIMARY KEY (`article_id`,`product_id`);

--
-- Индексы таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Индексы таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_tab`
--
ALTER TABLE `oc_product_tab`
  ADD PRIMARY KEY (`product_tab_id`);

--
-- Индексы таблицы `oc_product_to_benefit`
--
ALTER TABLE `oc_product_to_benefit`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `benefit_id` (`benefit_id`);

--
-- Индексы таблицы `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Индексы таблицы `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_product_to_sticker`
--
ALTER TABLE `oc_product_to_sticker`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `sticker_id` (`sticker_id`);

--
-- Индексы таблицы `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Индексы таблицы `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Индексы таблицы `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Индексы таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Индексы таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Индексы таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Индексы таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Индексы таблицы `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_review_article`
--
ALTER TABLE `oc_review_article`
  ADD PRIMARY KEY (`review_article_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Индексы таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Индексы таблицы `oc_sticker`
--
ALTER TABLE `oc_sticker`
  ADD PRIMARY KEY (`sticker_id`);

--
-- Индексы таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Индексы таблицы `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Индексы таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Индексы таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Индексы таблицы `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Индексы таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Индексы таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Индексы таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Индексы таблицы `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Индексы таблицы `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Индексы таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Индексы таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Индексы таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Индексы таблицы `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Индексы таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Индексы таблицы `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Индексы таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Индексы таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  MODIFY `affiliate_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  MODIFY `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  MODIFY `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_article`
--
ALTER TABLE `oc_article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT для таблицы `oc_article_image`
--
ALTER TABLE `oc_article_image`
  MODIFY `article_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3981;

--
-- AUTO_INCREMENT для таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT для таблицы `oc_benefit`
--
ALTER TABLE `oc_benefit`
  MODIFY `benefit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблицы `oc_blog_category`
--
ALTER TABLE `oc_blog_category`
  MODIFY `blog_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT для таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT для таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_custommenu`
--
ALTER TABLE `oc_custommenu`
  MODIFY `custommenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT для таблицы `oc_custommenu_child`
--
ALTER TABLE `oc_custommenu_child`
  MODIFY `custommenu_child_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT для таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT для таблицы `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_menu`
--
ALTER TABLE `oc_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  MODIFY `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT для таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1015;

--
-- AUTO_INCREMENT для таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=379;

--
-- AUTO_INCREMENT для таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT для таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT для таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;

--
-- AUTO_INCREMENT для таблицы `oc_product_tab`
--
ALTER TABLE `oc_product_tab`
  MODIFY `product_tab_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_review_article`
--
ALTER TABLE `oc_review_article`
  MODIFY `review_article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1790;

--
-- AUTO_INCREMENT для таблицы `oc_sticker`
--
ALTER TABLE `oc_sticker`
  MODIFY `sticker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT для таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1045;

--
-- AUTO_INCREMENT для таблицы `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4232;

--
-- AUTO_INCREMENT для таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
