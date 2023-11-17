-- CreateTable
CREATE TABLE `film` (
    `film_id` INTEGER NOT NULL,
    `image_path` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`film_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `filmwatchlist` (
    `wl_id` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    `film_id` INTEGER NOT NULL,

    INDEX `film_id`(`film_id`),
    PRIMARY KEY (`wl_id`, `user_id`, `film_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `userpremium` (
    `user_id` INTEGER NOT NULL,
    `role` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `watchlist` (
    `wl_id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `wl_title` VARCHAR(255) NULL,
    `wl_description` VARCHAR(255) NULL,

    INDEX `user_id`(`user_id`),
    PRIMARY KEY (`wl_id`, `user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `filmwatchlist` ADD CONSTRAINT `filmwatchlist_ibfk_1` FOREIGN KEY (`wl_id`, `user_id`) REFERENCES `watchlist`(`wl_id`, `user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `filmwatchlist` ADD CONSTRAINT `filmwatchlist_ibfk_3` FOREIGN KEY (`film_id`) REFERENCES `film`(`film_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `watchlist` ADD CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userpremium`(`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;
