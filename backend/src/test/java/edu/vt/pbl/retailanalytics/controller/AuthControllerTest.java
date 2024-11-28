package edu.vt.pbl.retailanalytics.controller;

import edu.vt.pbl.retailanalytics.config.UserAuthenticationProvider;
import edu.vt.pbl.retailanalytics.dtos.CredentialsDto;
import edu.vt.pbl.retailanalytics.dtos.SignUpDto;
import edu.vt.pbl.retailanalytics.dtos.UserDto;
import edu.vt.pbl.retailanalytics.services.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

@ExtendWith(MockitoExtension.class)
class AuthControllerTest {

    @Mock
    private UserService userService;

    @Mock
    private UserAuthenticationProvider userAuthenticationProvider;

    @InjectMocks
    private AuthController authController;

    private MockMvc mockMvc;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.standaloneSetup(authController).build();
    }

    @Test
    void login_ShouldReturnUserDto() throws Exception {
        CredentialsDto credentialsDto = new CredentialsDto("testUser", "testPassword");
        UserDto userDto = new UserDto(1L, "Test", "User", "testUser", "token");

        when(userService.login(any(CredentialsDto.class))).thenReturn(userDto);
        when(userAuthenticationProvider.createToken(any(UserDto.class))).thenReturn("token");

        mockMvc.perform(post("/login")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"login\":\"testUser\",\"password\":\"testPassword\"}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.login").value("testUser"));
    }

    @Test
    void register_ShouldReturnCreatedUserDto() throws Exception {
        SignUpDto signUpDto = new SignUpDto("Test", "User", "testUser", "testPassword");
        UserDto createdUser = new UserDto(1L, "Test", "User", "testUser", "token");

        when(userService.register(any(SignUpDto.class))).thenReturn(createdUser);
        when(userAuthenticationProvider.createToken(any(UserDto.class))).thenReturn("token");

        mockMvc.perform(post("/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"firstName\":\"Test\",\"lastName\":\"User\",\"login\":\"testUser\",\"password\":\"testPassword\"}"))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.login").value("testUser"));
    }
}