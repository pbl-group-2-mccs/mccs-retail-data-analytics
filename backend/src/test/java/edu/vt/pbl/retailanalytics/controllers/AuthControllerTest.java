package edu.vt.pbl.retailanalytics.controllers;

import edu.vt.pbl.retailanalytics.config.UserAuthenticationProvider;
import edu.vt.pbl.retailanalytics.dtos.CredentialsDto;
import edu.vt.pbl.retailanalytics.dtos.SignUpDto;
import edu.vt.pbl.retailanalytics.dtos.UserDto;
import edu.vt.pbl.retailanalytics.entites.User;
import edu.vt.pbl.retailanalytics.services.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import com.fasterxml.jackson.databind.ObjectMapper;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class AuthControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private UserService userService;

    @MockBean
    private UserAuthenticationProvider userAuthenticationProvider;

    private User createTestUser() {
        return User.builder()
                .id(1L)
                .firstName("Test")
                .lastName("User")
                .login("test@test.com")
                .password("hashedPassword")
                .build();
    }

    private UserDto createTestUserDto() {
        return UserDto.builder()
                .id(1L)
                .firstName("Test")
                .lastName("User")
                .login("test@test.com")
                .token("generated_token")
                .build();
    }

    private CredentialsDto createTestCredentials() {
        return new CredentialsDto(
                "test@test.com",
                "password".toCharArray()
        );
    }

    private SignUpDto createTestSignUpDto() {
        return new SignUpDto(
                "Test",
                "User",
                "test@test.com",
                "password".toCharArray()
        );
    }

    @Test
    void loginSuccess() throws Exception {
        CredentialsDto credentials = createTestCredentials();
        UserDto userDto = createTestUserDto();
        
        when(userService.login(any(CredentialsDto.class))).thenReturn(userDto);
        when(userAuthenticationProvider.createToken(any(UserDto.class))).thenReturn("generated_token");

        mockMvc.perform(post("/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(credentials)))
                .andExpect(status().isOk());
    }

    @Test
    void registerSuccess() throws Exception {
        SignUpDto signUpDto = createTestSignUpDto();
        UserDto userDto = createTestUserDto();
        
        when(userService.register(any(SignUpDto.class))).thenReturn(userDto);
        when(userAuthenticationProvider.createToken(any(UserDto.class))).thenReturn("generated_token");

        mockMvc.perform(post("/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(signUpDto)))
                .andExpect(status().isCreated());
    }
} 