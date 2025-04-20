-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 15, 2019 at 05:05 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.1.17-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `socialmedia_link` varchar(256) NOT NULL,
  `sample_writing_link` varchar(256) DEFAULT NULL,
  `interested_tech` varchar(150) NOT NULL,
  `comments` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `message` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `message`, `created_at`, `updated_at`) VALUES
('364fb23d-fe8b-4716-ba51-e06fa9c06924', 'xyz', 'xyz@email.com', 'nope', '2019-09-15 07:58:47', '2019-09-15 07:58:47'),
('ab994c49-508f-451a-a708-3d11f5c3ba2a', 'xyzxyz', 'abc@email.com', 'nope', '2019-09-15 08:00:15', '2019-09-15 08:00:15'),
('5ee50164-4519-49d3-bba1-19876e2efd53', 'xyzxyz', 'sds@sds.cc', 'nope', '2019-09-15 08:01:04', '2019-09-15 08:01:04');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `created_at`, `updated_at`) VALUES
('ae4c54bf-a75f-487b-bb0a-c752ccf93fd5', 'mofi0islam@gmail.com', '2019-09-07 07:23:36', '2019-09-07 07:23:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_request`
--

CREATE TABLE `password_reset_request` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `token` varchar(256) NOT NULL,
  `iv` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `password_reset_request`
--

INSERT INTO `password_reset_request` (`id`, `user_id`, `token`, `iv`, `created_at`, `updated_at`) VALUES
('10eba671-6bd7-4936-bf0b-48778ad42b1d', '08e69b82-8175-462c-aa53-7ea5f2fe815c', '081fe836-c3d5-42aa-8428-3bdfd07b0cd4', 'b52c68c4c858995ace731a3c11b53546', '2019-09-07 07:23:36', '2019-08-04 11:53:40'),
('ac51ca78-955f-4a29-aa27-80cc794f321b', '08e69b82-8175-462c-aa53-7ea5f2fe815c', 'ae5ef4d1-781a-444c-8c3f-efc55bdfbd40', '08a1f16d6d7b18beb76e4d6cd60f1676', '2019-09-07 07:23:36', '2019-08-04 10:38:34'),
('c9019061-923c-40cd-951b-d9333c093165', '08e69b82-8175-462c-aa53-7ea5f2fe815c', 'ab291024-9d9a-4089-a1d3-4cf7c649a071', '3dc3a9aa5affc972c204718a25461e0a', '2019-09-07 07:23:36', '2019-08-04 11:41:58'),
('f3841aef-b39e-4814-a5f0-af93c452fcd2', '08e69b82-8175-462c-aa53-7ea5f2fe815c', 'fada7a15-32e2-4c17-acb9-b414e1374b89', 'b7a0dbe50b740f1e34e0abe58b7a85a8', '2019-09-07 07:23:36', '2019-08-04 10:34:41');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` varchar(50) NOT NULL,
  `title` varchar(256) NOT NULL,
  `cover_img` varchar(256) DEFAULT NULL,
  `body` text NOT NULL,
  `subject` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` varchar(50) DEFAULT NULL,
  `users_id` varchar(50) NOT NULL,
  `views` int(11) DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'pending',
  `comments` int(11) DEFAULT '0',
  `meta_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `cover_img`, `body`, `subject`, `created_at`, `updated_at`, `deleted_at`, `users_id`, `views`, `status`, `comments`, `meta_desc`) VALUES
('1568be6d-e0fe-4c65-9a9c-bd8d6f6cf4ac', 'Web Components How and WHY?', 'https://images.unsplash.com/photo-1508921340878-ba53e1f016ec?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem\r\n                Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a\r\n                galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,\r\n                but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in\r\n                the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with\r\n                desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n            \r\nIt is a long established ```fact that a reader will ``` be distracted by the\r\n                readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a\r\n                more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it\r\n                look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as\r\n                their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their\r\n                infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose\r\n                (injected humour and the like).\r\n\r\n\r\n```js\r\nconst pluckDeep = key => obj => key.split(\'.\').reduce((accum, key) => accum[key], obj)\r\n\r\n    const compose = (...fns) => res => fns.reduce((accum, next) => next(accum), res)\r\n\r\n    const unfold = (f, seed) => {\r\n    const go = (f, seed, acc) => {\r\n        const res = f(seed)\r\n        return res ? go(f, res[1], acc.concat([res[0]])) : acc\r\n    }\r\n    return go(f, seed, [])\r\n    }\r\n```\r\n\r\n### Where does it come from?\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a\r\n                piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a\r\n                Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,\r\n                consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical\r\n                literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of\r\n                \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book\r\n                is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem\r\n                Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n                The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.\r\n                Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their\r\n                exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\n```php\r\n$container[\'settings\'] = [\r\n                    \'displayErrorDetails\' => true,\r\n\r\n                    \'logger\' => [\r\n                        \'name\' => \'slim-app\',\r\n                        \'level\' => Monolog\\Logger::DEBUG,\r\n                        \'path\' => __DIR__ . \'/../logs/app.log\',\r\n                    ],\r\n                ];\r\n\r\n                $container[\'renderer\'] = function(){\r\n                    $view = new Slim\\Views\\PhpRenderer(\"/public/templates\");\r\n                    $view->setLayout(\"layout.php\");\r\n                    return $view;\r\n                };\r\n\r\n                $container[\'db\'] = new Medoo\\Medoo($config[\'database\']);\r\n```\r\n\r\n![image](https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80 \"\")\r\n\r\n### Where can I get some?\r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority\r\n                have suffered alteration in some form, by injected humour, or randomised words which don\'t look even\r\n                slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t\r\n                anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend\r\n                to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses\r\n                a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate\r\n                Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition,\r\n                injected humour, or non-characteristic words etc.\r\n\r\n```php\r\nrequire \'./vendor/autoload.php\';\r\n            require \'./config.php\';\r\n\r\n            $app = new Slim\\App($container);\r\n\r\n            $app->get(\'/\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"index.php\", [\"title\" => \"Token.io blog\"]);\r\n            });\r\n\r\n            $app->get(\'/post\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"post.php\", [\"name\" => \"Mofiqul\"]);\r\n            });\r\n\r\n\r\n            $app->get(\'/users\', require(\'./routes/users.php\'));\r\n\r\n            $app->run();\r\n```\r\n### Conclusion\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor\r\n                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt\r\n                in culpa qui officia deserunt mollit anim id est laborum', 'javascript', '2019-09-07 07:23:37', '2019-09-07 07:23:37', NULL, '08e69b82-8175-462c-aa53-7ea5f2fe815c', 1018, 'pending', 10, NULL),
('2530e3dc-2518-44f3-b538-159023c9fe7a', 'Getting started with sklearn part II', 'https://images.unsplash.com/photo-1484417894907-623942c8ee29?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem\r\n                Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a\r\n                galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,\r\n                but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in\r\n                the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with\r\n                desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n            \r\nIt is a long established ```fact that a reader will ``` be distracted by the\r\n                readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a\r\n                more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it\r\n                look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as\r\n                their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their\r\n                infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose\r\n                (injected humour and the like).\r\n\r\n\r\n```js\r\nconst pluckDeep = key => obj => key.split(\'.\').reduce((accum, key) => accum[key], obj)\r\n\r\n    const compose = (...fns) => res => fns.reduce((accum, next) => next(accum), res)\r\n\r\n    const unfold = (f, seed) => {\r\n    const go = (f, seed, acc) => {\r\n        const res = f(seed)\r\n        return res ? go(f, res[1], acc.concat([res[0]])) : acc\r\n    }\r\n    return go(f, seed, [])\r\n    }\r\n```\r\n\r\n### Where does it come from?\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a\r\n                piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a\r\n                Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,\r\n                consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical\r\n                literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of\r\n                \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book\r\n                is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem\r\n                Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n                The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.\r\n                Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their\r\n                exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\n```php\r\n$container[\'settings\'] = [\r\n                    \'displayErrorDetails\' => true,\r\n\r\n                    \'logger\' => [\r\n                        \'name\' => \'slim-app\',\r\n                        \'level\' => Monolog\\Logger::DEBUG,\r\n                        \'path\' => __DIR__ . \'/../logs/app.log\',\r\n                    ],\r\n                ];\r\n\r\n                $container[\'renderer\'] = function(){\r\n                    $view = new Slim\\Views\\PhpRenderer(\"/public/templates\");\r\n                    $view->setLayout(\"layout.php\");\r\n                    return $view;\r\n                };\r\n\r\n                $container[\'db\'] = new Medoo\\Medoo($config[\'database\']);\r\n```\r\n\r\n![image](https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80 \"\")\r\n\r\n### Where can I get some?\r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority\r\n                have suffered alteration in some form, by injected humour, or randomised words which don\'t look even\r\n                slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t\r\n                anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend\r\n                to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses\r\n                a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate\r\n                Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition,\r\n                injected humour, or non-characteristic words etc.\r\n\r\n```php\r\nrequire \'./vendor/autoload.php\';\r\n            require \'./config.php\';\r\n\r\n            $app = new Slim\\App($container);\r\n\r\n            $app->get(\'/\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"index.php\", [\"title\" => \"Token.io blog\"]);\r\n            });\r\n\r\n            $app->get(\'/post\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"post.php\", [\"name\" => \"Mofiqul\"]);\r\n            });\r\n\r\n\r\n            $app->get(\'/users\', require(\'./routes/users.php\'));\r\n\r\n            $app->run();\r\n```\r\n### Conclusion\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor\r\n                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt\r\n                in culpa qui officia deserunt mollit anim id est laborum', 'python', '2019-09-07 07:23:37', '2019-09-07 07:23:37', NULL, '08e69b82-8175-462c-aa53-7ea5f2fe815c', 15, 'approved', 0, NULL),
('3bc304e7-124c-4ab0-9612-2350e1b16e2f', 'Getting Stated with IOT', 'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem\r\n                Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a\r\n                galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,\r\n                but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in\r\n                the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with\r\n                desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n            \r\nIt is a long established ```fact that a reader will ``` be distracted by the\r\n                readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a\r\n                more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it\r\n                look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as\r\n                their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their\r\n                infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose\r\n                (injected humour and the like).\r\n\r\n\r\n```js\r\nconst pluckDeep = key => obj => key.split(\'.\').reduce((accum, key) => accum[key], obj)\r\n\r\n    const compose = (...fns) => res => fns.reduce((accum, next) => next(accum), res)\r\n\r\n    const unfold = (f, seed) => {\r\n    const go = (f, seed, acc) => {\r\n        const res = f(seed)\r\n        return res ? go(f, res[1], acc.concat([res[0]])) : acc\r\n    }\r\n    return go(f, seed, [])\r\n    }\r\n```\r\n\r\n### Where does it come from?\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a\r\n                piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a\r\n                Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,\r\n                consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical\r\n                literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of\r\n                \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book\r\n                is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem\r\n                Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n                The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.\r\n                Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their\r\n                exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\n```php\r\n$container[\'settings\'] = [\r\n                    \'displayErrorDetails\' => true,\r\n\r\n                    \'logger\' => [\r\n                        \'name\' => \'slim-app\',\r\n                        \'level\' => Monolog\\Logger::DEBUG,\r\n                        \'path\' => __DIR__ . \'/../logs/app.log\',\r\n                    ],\r\n                ];\r\n\r\n                $container[\'renderer\'] = function(){\r\n                    $view = new Slim\\Views\\PhpRenderer(\"/public/templates\");\r\n                    $view->setLayout(\"layout.php\");\r\n                    return $view;\r\n                };\r\n\r\n                $container[\'db\'] = new Medoo\\Medoo($config[\'database\']);\r\n```\r\n\r\n![image](https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80 \"\")\r\n\r\n### Where can I get some?\r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority\r\n                have suffered alteration in some form, by injected humour, or randomised words which don\'t look even\r\n                slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t\r\n                anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend\r\n                to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses\r\n                a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate\r\n                Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition,\r\n                injected humour, or non-characteristic words etc.\r\n\r\n```php\r\nrequire \'./vendor/autoload.php\';\r\n            require \'./config.php\';\r\n\r\n            $app = new Slim\\App($container);\r\n\r\n            $app->get(\'/\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"index.php\", [\"title\" => \"Token.io blog\"]);\r\n            });\r\n\r\n            $app->get(\'/post\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"post.php\", [\"name\" => \"Mofiqul\"]);\r\n            });\r\n\r\n\r\n            $app->get(\'/users\', require(\'./routes/users.php\'));\r\n\r\n            $app->run();\r\n```\r\n### Conclusion\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor\r\n                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt\r\n                in culpa qui officia deserunt mollit anim id est laborum', 'javascript', '2019-09-07 07:23:37', '2019-09-07 07:23:37', '2019-07-21 15:47:08', '8489e92f-d7e4-4e1d-8409-d99e4832a278', 1001, 'approved', 10, NULL),
('52455647-e674-4d10-95b2-19aa04896e08', 'Laravel ORM Introduction', 'https://images.unsplash.com/photo-1484417894907-623942c8ee29?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem\r\n                Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a\r\n                galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,\r\n                but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in\r\n                the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with\r\n                desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n            \r\nIt is a long established ```fact that a reader will ``` be distracted by the\r\n                readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a\r\n                more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it\r\n                look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as\r\n                their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their\r\n                infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose\r\n                (injected humour and the like).\r\n\r\n\r\n```js\r\nconst pluckDeep = key => obj => key.split(\'.\').reduce((accum, key) => accum[key], obj)\r\n\r\n    const compose = (...fns) => res => fns.reduce((accum, next) => next(accum), res)\r\n\r\n    const unfold = (f, seed) => {\r\n    const go = (f, seed, acc) => {\r\n        const res = f(seed)\r\n        return res ? go(f, res[1], acc.concat([res[0]])) : acc\r\n    }\r\n    return go(f, seed, [])\r\n    }\r\n```\r\n\r\n### Where does it come from?\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a\r\n                piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a\r\n                Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,\r\n                consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical\r\n                literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of\r\n                \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book\r\n                is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem\r\n                Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n                The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.\r\n                Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their\r\n                exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\n```php\r\n$container[\'settings\'] = [\r\n                    \'displayErrorDetails\' => true,\r\n\r\n                    \'logger\' => [\r\n                        \'name\' => \'slim-app\',\r\n                        \'level\' => Monolog\\Logger::DEBUG,\r\n                        \'path\' => __DIR__ . \'/../logs/app.log\',\r\n                    ],\r\n                ];\r\n\r\n                $container[\'renderer\'] = function(){\r\n                    $view = new Slim\\Views\\PhpRenderer(\"/public/templates\");\r\n                    $view->setLayout(\"layout.php\");\r\n                    return $view;\r\n                };\r\n\r\n                $container[\'db\'] = new Medoo\\Medoo($config[\'database\']);\r\n```\r\n\r\n![image](https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80 \"\")\r\n\r\n### Where can I get some?\r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority\r\n                have suffered alteration in some form, by injected humour, or randomised words which don\'t look even\r\n                slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t\r\n                anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend\r\n                to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses\r\n                a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate\r\n                Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition,\r\n                injected humour, or non-characteristic words etc.\r\n\r\n```php\r\nrequire \'./vendor/autoload.php\';\r\n            require \'./config.php\';\r\n\r\n            $app = new Slim\\App($container);\r\n\r\n            $app->get(\'/\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"index.php\", [\"title\" => \"Token.io blog\"]);\r\n            });\r\n\r\n            $app->get(\'/post\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"post.php\", [\"name\" => \"Mofiqul\"]);\r\n            });\r\n\r\n\r\n            $app->get(\'/users\', require(\'./routes/users.php\'));\r\n\r\n            $app->run();\r\n```\r\n### Conclusion\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor\r\n                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt\r\n                in culpa qui officia deserunt mollit anim id est laborum', 'javascript', '2019-09-07 07:23:37', '2019-09-07 07:23:37', NULL, '08e69b82-8175-462c-aa53-7ea5f2fe815c', 1012, 'approved', 10, NULL),
('926de0b9-9054-42c1-8cc7-372d834af937', 'Getting started with sklearn', 'https://images.unsplash.com/photo-1495055154266-57bbdeada43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem\r\n                Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a\r\n                galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,\r\n                but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in\r\n                the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with\r\n                desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n            \r\nIt is a long established ```fact that a reader will ``` be distracted by the\r\n                readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a\r\n                more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it\r\n                look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as\r\n                their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their\r\n                infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose\r\n                (injected humour and the like).\r\n\r\n\r\n```js\r\nconst pluckDeep = key => obj => key.split(\'.\').reduce((accum, key) => accum[key], obj)\r\n\r\n    const compose = (...fns) => res => fns.reduce((accum, next) => next(accum), res)\r\n\r\n    const unfold = (f, seed) => {\r\n    const go = (f, seed, acc) => {\r\n        const res = f(seed)\r\n        return res ? go(f, res[1], acc.concat([res[0]])) : acc\r\n    }\r\n    return go(f, seed, [])\r\n    }\r\n```\r\n\r\n### Where does it come from?\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a\r\n                piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a\r\n                Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,\r\n                consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical\r\n                literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of\r\n                \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book\r\n                is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem\r\n                Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n                The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.\r\n                Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their\r\n                exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\n```php\r\n$container[\'settings\'] = [\r\n                    \'displayErrorDetails\' => true,\r\n\r\n                    \'logger\' => [\r\n                        \'name\' => \'slim-app\',\r\n                        \'level\' => Monolog\\Logger::DEBUG,\r\n                        \'path\' => __DIR__ . \'/../logs/app.log\',\r\n                    ],\r\n                ];\r\n\r\n                $container[\'renderer\'] = function(){\r\n                    $view = new Slim\\Views\\PhpRenderer(\"/public/templates\");\r\n                    $view->setLayout(\"layout.php\");\r\n                    return $view;\r\n                };\r\n\r\n                $container[\'db\'] = new Medoo\\Medoo($config[\'database\']);\r\n```\r\n\r\n![image](https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80 \"\")\r\n\r\n### Where can I get some?\r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority\r\n                have suffered alteration in some form, by injected humour, or randomised words which don\'t look even\r\n                slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t\r\n                anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend\r\n                to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses\r\n                a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate\r\n                Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition,\r\n                injected humour, or non-characteristic words etc.\r\n\r\n```php\r\nrequire \'./vendor/autoload.php\';\r\n            require \'./config.php\';\r\n\r\n            $app = new Slim\\App($container);\r\n\r\n            $app->get(\'/\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"index.php\", [\"title\" => \"Token.io blog\"]);\r\n            });\r\n\r\n            $app->get(\'/post\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"post.php\", [\"name\" => \"Mofiqul\"]);\r\n            });\r\n\r\n\r\n            $app->get(\'/users\', require(\'./routes/users.php\'));\r\n\r\n            $app->run();\r\n```\r\n### Conclusion\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor\r\n                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt\r\n                in culpa qui officia deserunt mollit anim id est laborum', 'python', '2019-09-07 07:23:37', '2019-09-07 07:23:37', NULL, '08e69b82-8175-462c-aa53-7ea5f2fe815c', 0, 'approved', 0, NULL),
('c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', 'Creating react app from scratch', 'https://images.unsplash.com/photo-1555371363-27a37f8e8c46?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem\r\n                Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a\r\n                galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,\r\n                but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in\r\n                the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with\r\n                desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n            \r\nIt is a long established ```fact that a reader will ``` be distracted by the\r\n                readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a\r\n                more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it\r\n                look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as\r\n                their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their\r\n                infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose\r\n                (injected humour and the like).\r\n\r\n\r\n```js\r\nconst pluckDeep = key => obj => key.split(\'.\').reduce((accum, key) => accum[key], obj)\r\n\r\n    const compose = (...fns) => res => fns.reduce((accum, next) => next(accum), res)\r\n\r\n    const unfold = (f, seed) => {\r\n    const go = (f, seed, acc) => {\r\n        const res = f(seed)\r\n        return res ? go(f, res[1], acc.concat([res[0]])) : acc\r\n    }\r\n    return go(f, seed, [])\r\n    }\r\n```\r\n\r\n### Where does it come from?\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a\r\n                piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a\r\n                Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,\r\n                consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical\r\n                literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of\r\n                \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book\r\n                is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem\r\n                Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n                The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.\r\n                Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their\r\n                exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\n```php\r\n$container[\'settings\'] = [\r\n                    \'displayErrorDetails\' => true,\r\n\r\n                    \'logger\' => [\r\n                        \'name\' => \'slim-app\',\r\n                        \'level\' => Monolog\\Logger::DEBUG,\r\n                        \'path\' => __DIR__ . \'/../logs/app.log\',\r\n                    ],\r\n                ];\r\n\r\n                $container[\'renderer\'] = function(){\r\n                    $view = new Slim\\Views\\PhpRenderer(\"/public/templates\");\r\n                    $view->setLayout(\"layout.php\");\r\n                    return $view;\r\n                };\r\n\r\n                $container[\'db\'] = new Medoo\\Medoo($config[\'database\']);\r\n```\r\n\r\n![image](https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80 \"\")\r\n\r\n### Where can I get some?\r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority\r\n                have suffered alteration in some form, by injected humour, or randomised words which don\'t look even\r\n                slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t\r\n                anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend\r\n                to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses\r\n                a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate\r\n                Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition,\r\n                injected humour, or non-characteristic words etc.\r\n\r\n```php\r\nrequire \'./vendor/autoload.php\';\r\n            require \'./config.php\';\r\n\r\n            $app = new Slim\\App($container);\r\n\r\n            $app->get(\'/\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"index.php\", [\"title\" => \"Token.io blog\"]);\r\n            });\r\n\r\n            $app->get(\'/post\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"post.php\", [\"name\" => \"Mofiqul\"]);\r\n            });\r\n\r\n\r\n            $app->get(\'/users\', require(\'./routes/users.php\'));\r\n\r\n            $app->run();\r\n```\r\n### Conclusion\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor\r\n                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt\r\n                in culpa qui officia deserunt mollit anim id est laborum', 'php', '2019-09-07 07:23:37', '2019-09-07 07:23:37', NULL, '08e69b82-8175-462c-aa53-7ea5f2fe815c', 1010, 'approved', 10, NULL),
('ee3786fd-ccf6-4b4e-bc1f-5f96efdfe202', 'Slim PHP Dynamic router', 'https://images.unsplash.com/photo-1541462608143-67571c6738dd?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem\r\n                Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a\r\n                galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,\r\n                but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in\r\n                the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with\r\n                desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n            \r\nIt is a long established ```fact that a reader will ``` be distracted by the\r\n                readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a\r\n                more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it\r\n                look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as\r\n                their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their\r\n                infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose\r\n                (injected humour and the like).\r\n\r\n\r\n```js\r\nconst pluckDeep = key => obj => key.split(\'.\').reduce((accum, key) => accum[key], obj)\r\n\r\n    const compose = (...fns) => res => fns.reduce((accum, next) => next(accum), res)\r\n\r\n    const unfold = (f, seed) => {\r\n    const go = (f, seed, acc) => {\r\n        const res = f(seed)\r\n        return res ? go(f, res[1], acc.concat([res[0]])) : acc\r\n    }\r\n    return go(f, seed, [])\r\n    }\r\n```\r\n\r\n### Where does it come from?\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a\r\n                piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a\r\n                Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,\r\n                consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical\r\n                literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of\r\n                \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book\r\n                is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem\r\n                Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n                The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.\r\n                Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their\r\n                exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\n```php\r\n$container[\'settings\'] = [\r\n                    \'displayErrorDetails\' => true,\r\n\r\n                    \'logger\' => [\r\n                        \'name\' => \'slim-app\',\r\n                        \'level\' => Monolog\\Logger::DEBUG,\r\n                        \'path\' => __DIR__ . \'/../logs/app.log\',\r\n                    ],\r\n                ];\r\n\r\n                $container[\'renderer\'] = function(){\r\n                    $view = new Slim\\Views\\PhpRenderer(\"/public/templates\");\r\n                    $view->setLayout(\"layout.php\");\r\n                    return $view;\r\n                };\r\n\r\n                $container[\'db\'] = new Medoo\\Medoo($config[\'database\']);\r\n```\r\n\r\n![image](https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80 \"\")\r\n\r\n### Where can I get some?\r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority\r\n                have suffered alteration in some form, by injected humour, or randomised words which don\'t look even\r\n                slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t\r\n                anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend\r\n                to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses\r\n                a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate\r\n                Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition,\r\n                injected humour, or non-characteristic words etc.\r\n\r\n```php\r\nrequire \'./vendor/autoload.php\';\r\n            require \'./config.php\';\r\n\r\n            $app = new Slim\\App($container);\r\n\r\n            $app->get(\'/\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"index.php\", [\"title\" => \"Token.io blog\"]);\r\n            });\r\n\r\n            $app->get(\'/post\', function ($request, $response, $args) {\r\n                return $this->renderer->render($response, \"post.php\", [\"name\" => \"Mofiqul\"]);\r\n            });\r\n\r\n\r\n            $app->get(\'/users\', require(\'./routes/users.php\'));\r\n\r\n            $app->run();\r\n```\r\n### Conclusion\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor\r\n                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt\r\n                in culpa qui officia deserunt mollit anim id est laborum', 'php', '2019-09-07 07:23:37', '2019-09-07 07:23:37', NULL, '08e69b82-8175-462c-aa53-7ea5f2fe815c', 1000, 'blocked', 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL,
  `post_id` varchar(150) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`) VALUES
(1, 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', 1),
(2, 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', 2),
(3, '1568be6d-e0fe-4c65-9a9c-bd8d6f6cf4ac', 3),
(4, '3bc304e7-124c-4ab0-9612-2350e1b16e2f', 1),
(5, '52455647-e674-4d10-95b2-19aa04896e08', 5),
(6, 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', 1),
(8, 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', 2),
(9, '52455647-e674-4d10-95b2-19aa04896e08', 1),
(10, '52455647-e674-4d10-95b2-19aa04896e08', 2),
(11, 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', 3);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` varchar(50) NOT NULL,
  `post_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` varchar(50) DEFAULT NULL,
  `deleted_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `post_id`, `user_id`, `body`, `created_at`, `updated_at`, `deleted_at`) VALUES
('0fc93c08-9db1-43f7-8529-a76d7d9fc852', 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', '08e69b82-8175-462c-aa53-7ea5f2fe815c', 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n*     Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n*     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2019-09-07 07:23:38', '2019-07-21 16:39:14', NULL),
('0fe63f4a-adaa-4ce7-b6ce-bd5609d32a0d', 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', '08e69b82-8175-462c-aa53-7ea5f2fe815c', 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n*     Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n*     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2019-09-07 07:23:38', '2019-07-22 14:30:40', '2019-07-22 14:30:40'),
('1a42c7fb-90fd-4754-9b7e-0185b9dabc13', 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', '08e69b82-8175-462c-aa53-7ea5f2fe815c', '```testing```', '2019-09-07 07:23:38', '2019-08-01 13:44:14', '2019-08-01 13:44:14'),
('3bbf0d2a-e76f-497a-ab1d-d1a41d7c1d41', 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', '08e69b82-8175-462c-aa53-7ea5f2fe815c', '**No reason.. just blocked and update** ', '2019-09-07 07:23:38', '2019-08-01 13:44:20', '2019-08-01 13:44:20'),
('7203dfc7-67d6-45fd-9711-a4b92a9f31ab', 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', '08e69b82-8175-462c-aa53-7ea5f2fe815c', 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n*     Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n*     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2019-09-07 07:23:38', '2019-07-22 14:31:19', '2019-07-22 14:31:19'),
('7856ae83-6f4d-40e7-861d-27c90d6d6165', 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', '08e69b82-8175-462c-aa53-7ea5f2fe815c', 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n*     Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n*     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2019-09-07 07:23:38', '2019-08-01 13:32:19', '2019-08-01 13:32:19'),
('a0df63f2-7c85-4b0f-bb91-28b1af505b16', 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', '8489e92f-d7e4-4e1d-8409-d99e4832a278', '``` another testing```', '2019-09-07 07:23:38', '2019-08-01 13:24:26', NULL),
('d674f54e-d5d1-43f6-bc48-e8232435240b', 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', '08e69b82-8175-462c-aa53-7ea5f2fe815c', 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n*     Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n*     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2019-09-07 07:23:38', '2019-07-22 14:31:11', '2019-07-22 14:31:11'),
('e2db7543-06c2-450b-a525-2b656faae93e', 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', '08e69b82-8175-462c-aa53-7ea5f2fe815c', '**No reason.. just blocked**', '2019-09-07 07:23:38', '2019-07-22 14:30:50', '2019-07-22 14:30:50'),
('fa13ef9f-f81c-4c62-ac92-3b5c1e0d8a22', 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', '08e69b82-8175-462c-aa53-7ea5f2fe815c', 'this is updated comment', '2019-09-07 07:23:38', '2019-08-01 13:44:48', NULL),
('faf91138-73f3-4980-99ad-5e59c23aec2e', 'c75473fa-edfa-49f5-99a9-8d6fe4d3e58a', '08e69b82-8175-462c-aa53-7ea5f2fe815c', 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n*     Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n*     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2019-09-07 07:23:38', '2019-07-22 14:31:05', '2019-07-22 14:31:05');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'javascript'),
(2, 'php'),
(3, 'nodejs'),
(4, 'typescript'),
(5, 'python'),
(6, 'mysql'),
(7, 'vuejs'),
(8, 'slimphp');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(50) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'member',
  `email` varchar(150) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1',
  `avatar` varchar(150) DEFAULT NULL,
  `work` varchar(256) DEFAULT NULL,
  `facebook` varchar(256) DEFAULT NULL,
  `linkedin` varchar(256) DEFAULT NULL,
  `twitter` varchar(256) DEFAULT NULL,
  `github` varchar(256) DEFAULT NULL,
  `website` varchar(256) DEFAULT NULL,
  `about` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `role`, `email`, `password`, `is_active`, `avatar`, `work`, `facebook`, `linkedin`, `twitter`, `github`, `website`, `about`, `created_at`, `updated_at`) VALUES
('08e69b82-8175-462c-aa53-7ea5f2fe815c', 'Mofiqul Islam ', 'mofiqul', 'admin', 'mofiqul@synchlab.dev', '$2y$10$kWOz3uB/5uZOWmyNSSU2HOpKJI76obEzrXMWzOGXv/7Z/nJH40cIi', 1, 'http://localhost:4001/images/avatar/810895e9daf9ddd9.jpg', 'Developer | Open source lover  ', 'https://facebook.com/injamul ', 'https://linkedin.com ', 'https://twitter.com/injamul ', 'https://github.com/injamul ', 'https://techgi.in/ ', '### About me\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n[Know more about me](http://somewhere.com) \r\n\r\n ', '2019-07-20 10:46:30', '2019-08-04 06:24:19'),
('57038278-fe3d-43bf-9e2c-3ea285516512', 'My Gmail', 'gmail', 'member', 'mofi0islam@gmail.com', '$2y$10$Kty3r.bWa70X0MV.EiWQo.KDd1Om/Pc7xLHFIcCOtrTPRyo0nFGeG', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-04 06:38:23', '2019-08-04 06:38:23'),
('8489e92f-d7e4-4e1d-8409-d99e4832a278', 'Injamul Haque', 'injamul', 'member', 'injamul@synchlab.dev', '$2y$10$3YhCCtRtinWM7LFP23gW6O1Y8zGvQbn3oV6GKg1GGIAM0AL/n0CdC', 1, 'http://localhost:4001/images/avatar/9bb84c8b29476293.png', 'Web Developer', 'https://facebook.com/injamul', 'https://linkedin.com', 'https://twitter.com/injamul', 'https://github.com/injamul', 'https://techgi.in/', 'Hello world', '2019-07-20 10:45:20', '2019-08-01 11:24:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_request`
--
ALTER TABLE `password_reset_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
