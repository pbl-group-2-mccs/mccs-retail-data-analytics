package edu.vt.pbl.retailanalytics.mappers;

import edu.vt.pbl.retailanalytics.dtos.SignUpDto;
import edu.vt.pbl.retailanalytics.dtos.UserDto;

import edu.vt.pbl.retailanalytics.entites.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface UserMapper {
    @Mapping(target = "token", ignore = true)
    UserDto toUserDto(User user);

    @Mapping(target = "password", ignore = true)
    @Mapping(target = "id", ignore = true)
    User signUpToUser(SignUpDto signUpDto);

}
