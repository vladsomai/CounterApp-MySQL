drop procedure if exists selectTpDescription;

delimiter //
CREATE procedure selectTpDescription(adapter_codeParam int, fixture_typeParam varchar(30))
BEGIN

DECLARE project_idParam int;
select entry_id into project_idParam from Projects where adapter_code = adapter_codeParam and fixture_type = fixture_typeParam;

if (project_idParam) then

select * from tp_description where project_id = project_idParam;
else
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The adapter code does not exist with the specified fixture type!', MYSQL_ERRNO = 1001;
end if;

END;
//
delimiter ;

call selectTpDescription(1730,"FCT");