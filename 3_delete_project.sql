drop procedure if exists deleteProject;

delimiter //
CREATE PROCEDURE deleteProject(adapter_codeParam int, fixture_typeParam VARCHAR(30))
BEGIN

DECLARE project_idParam int;

if (select exists(select * from Projects where adapter_code=adapter_codeParam and fixture_type=fixture_typeParam)) then
select entry_id into project_idParam from Projects where adapter_code = adapter_codeParam and fixture_type = fixture_typeParam;

#first, delete all the foreign keys from tp_description table
delete from tp_description where project_id = project_idParam;

#delete the actual row
delete from Projects 
where adapter_code = adapter_codeParam and fixture_type = fixture_typeParam;
else
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The adapter code does not exist with the specified fixture type!', MYSQL_ERRNO = 1001;
end if;
END;
//
delimiter ;

call deleteProject(1704, "ICT");
