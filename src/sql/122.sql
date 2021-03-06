ALTER TABLE `events` ADD `payout_rule` ENUM('binary','linear','') NOT NULL DEFAULT 'binary' AFTER `event_payout_block`;
ALTER TABLE `game_defined_events` ADD `payout_rule` ENUM('binary','linear','') NOT NULL DEFAULT 'binary' AFTER `event_payout_block`;
ALTER TABLE `games` ADD `default_payout_rule` ENUM('binary','linear','') NOT NULL DEFAULT 'binary' AFTER `send_round_notifications`;
ALTER TABLE `entities` ADD `currency_id` INT NULL DEFAULT NULL AFTER `default_image_id`;
UPDATE `currencies` c JOIN entities en ON c.name=en.entity_name SET en.currency_id=c.currency_id;
ALTER TABLE `events` ADD `track_max_price` FLOAT NULL DEFAULT NULL AFTER `payout_rule`;
ALTER TABLE `events` ADD `track_min_price` FLOAT NULL DEFAULT NULL AFTER `track_max_price`;
ALTER TABLE `game_defined_events` ADD `track_max_price` FLOAT NULL DEFAULT NULL AFTER `payout_rule`;
ALTER TABLE `game_defined_events` ADD `track_min_price` FLOAT NULL DEFAULT NULL AFTER `track_max_price`;
ALTER TABLE `events` ADD `track_name_short` VARCHAR(50) NULL DEFAULT NULL AFTER `track_min_price`;
ALTER TABLE `game_defined_events` ADD `track_name_short` VARCHAR(50) NULL DEFAULT NULL AFTER `track_min_price`;
ALTER TABLE `currencies` ADD INDEX (`name`);
ALTER TABLE `game_blocks` DROP `internal_block_id`;
ALTER TABLE `game_defined_events` ADD `track_payout_price` FLOAT NULL DEFAULT NULL AFTER `track_min_price`;
ALTER TABLE `events` ADD `track_payout_price` FLOAT NULL DEFAULT NULL AFTER `track_min_price`;
ALTER TABLE `game_defined_events` ADD `track_entity_id` INT NULL DEFAULT NULL AFTER `track_payout_price`;
ALTER TABLE `events` ADD `track_entity_id` INT NULL DEFAULT NULL AFTER `track_payout_price`;