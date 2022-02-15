drop table if exists tp_description;

CREATE TABLE tp_description (
    entry_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    project_id INT  NOT NULL,
    supplier VARCHAR(30) NOT NULL,
    quantity INT NOT NULL,
    part_number TEXT NOT NULL,
    FOREIGN KEY(project_id)
       REFERENCES Projects(entry_id)
);