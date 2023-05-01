ALTER TABLE `users` ADD  `coins` int(11) NOT NULL DEFAULT 0;
ALTER TABLE `users` ADD  `boutique_id` int(11) NOT NULL;

CREATE TABLE `shop_history` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `shop_reviews` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `review` varchar(255) NOT NULL,
  `star` int(11) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `shop_history`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `shop_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

ALTER TABLE `shop_reviews`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `shop_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

