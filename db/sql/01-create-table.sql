CREATE TABLE `animal`.dog (
	id INT PRIMARY KEY auto_increment,
	breedId INT NOT NULL,
	colorId INT NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE INDEX IDX_BREED ON `animal`.dog(breedId);
CREATE INDEX IDX_COLOR ON `animal`.dog(colorId);
