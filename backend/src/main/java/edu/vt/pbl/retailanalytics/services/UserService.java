package edu.vt.pbl.retailanalytics.services;

import edu.vt.pbl.retailanalytics.dtos.CredentialsDto;
import edu.vt.pbl.retailanalytics.dtos.SignUpDto;
import edu.vt.pbl.retailanalytics.dtos.UserDto;
import edu.vt.pbl.retailanalytics.entites.User;
import edu.vt.pbl.retailanalytics.exceptions.AppException;
import edu.vt.pbl.retailanalytics.mappers.UserMapper;
import edu.vt.pbl.retailanalytics.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.nio.CharBuffer;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UserService {
    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;
    private final UserMapper userMapper;

    public UserDto login(CredentialsDto credentialsDto) {
        User user = userRepository.findByLogin(credentialsDto.login())
                .orElseThrow(() -> new AppException("Unknown User", HttpStatus.NOT_FOUND));

        if (passwordEncoder.matches(CharBuffer.wrap(credentialsDto.password()), user.getPassword())){
            return userMapper.toUserDto(user);
        }
        throw new AppException("Invalid password",HttpStatus.BAD_REQUEST);
    }

    public UserDto register(SignUpDto userDto) {
        Optional<User> optionalUser = userRepository.findByLogin(userDto.login());
        if (optionalUser.isPresent()){
            throw new AppException("Login already exists", HttpStatus.BAD_REQUEST);
        }

        User user = userMapper.signUpToUser(userDto);
        user.setPassword(passwordEncoder.encode(CharBuffer.wrap(userDto.password())));

        User savedUser = userRepository.save(user);
        return userMapper.toUserDto(savedUser);
    }

    public UserDto findByLogin(String login) {
    User user = userRepository.findByLogin(login)
            .orElseThrow(() -> new AppException("Unknown user", HttpStatus.NOT_FOUND));
    return userMapper.toUserDto(user);
    }
}
