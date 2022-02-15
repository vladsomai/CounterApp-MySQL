
drop procedure if exists insertTpDescription;

delimiter //
CREATE procedure insertTpDescription(adapter_codeParam int, fixture_typeParam varchar(30), supplierParam varchar(30), quantityParam int, part_numberParam TEXT)
BEGIN

DECLARE project_idParam int;
select entry_id into project_idParam from Projects where adapter_code = adapter_codeParam and fixture_type = fixture_typeParam;

if (project_idParam) then
insert into tp_description(project_id, supplier, quantity, part_number) values
(
project_idParam,
supplierParam,
quantityParam,
part_numberParam
);
else
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The adapter code does not exist with the specified fixture type!', MYSQL_ERRNO = 1001;
end if;

END;
//
delimiter ;


call insertTpDescription(1704,"ICT","INGUN", 256, "GKS 100 291  090 A2000");
