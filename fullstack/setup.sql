DROP TABLE IF EXISTS passenger;

CREATE TABLE IF NOT EXISTS passenger (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name varchar(100),
  email varchar(200),
  modified timestamp default CURRENT_TIMESTAMP NOT NULL,
  INDEX `modified_index` (`modified`)
);

DELIMITER |

CREATE TRIGGER update_modified BEFORE UPDATE ON passenger
  FOR EACH ROW
  BEGIN
    SET NEW.modified = CURRENT_TIMESTAMP;
  END;
  |
  
DELIMITER ;

SHOW TRIGGERS;