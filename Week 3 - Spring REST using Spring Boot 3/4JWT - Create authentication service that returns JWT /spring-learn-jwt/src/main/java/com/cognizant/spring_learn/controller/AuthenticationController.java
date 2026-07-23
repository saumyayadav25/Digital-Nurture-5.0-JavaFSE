package com.cognizant.spring_learn.controller;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.Jwts;

import javax.crypto.SecretKey;
import io.jsonwebtoken.security.Keys;

import java.nio.charset.StandardCharsets;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import javax.crypto.SecretKey;
import java.util.HashMap;
import java.util.Map;

@RestController
public class AuthenticationController {

    private static final Logger LOGGER =
            LoggerFactory.getLogger(AuthenticationController.class);

    @GetMapping("/authenticate")
    public Map<String, String> authenticate(
            @RequestHeader("Authorization") String authHeader) {

        LOGGER.info("START");
        LOGGER.debug("Authorization Header: {}", authHeader);

//        Map<String, String> map = new HashMap<>();
//        map.put("token", "");
        String user = getUser(authHeader);

        LOGGER.debug("Authenticated User: {}", user);

        String token = generateJwt(user);

        Map<String, String> map = new HashMap<>();
        map.put("token", token);

        LOGGER.info("END");

        return map;
    }

    private String getUser(String authHeader) {

        LOGGER.info("START");

        // Remove "Basic "
        String encodedCredentials = authHeader.substring(6);

        LOGGER.debug("Encoded Credentials: {}", encodedCredentials);

        // Decode Base64
        byte[] decodedBytes = Base64.getDecoder().decode(encodedCredentials);

        String credentials = new String(decodedBytes, StandardCharsets.UTF_8);

        LOGGER.debug("Decoded Credentials: {}", credentials);

        // Extract username
        String user = credentials.substring(0, credentials.indexOf(":"));

        LOGGER.debug("User: {}", user);

        LOGGER.info("END");

        return user;
    }

    private String generateJwt(String user) {

        LOGGER.info("START");

        SecretKey key = Keys.hmacShaKeyFor(
                "secretkeysecretkeysecretkey12345"
                        .getBytes(StandardCharsets.UTF_8));

        String token = Jwts.builder()
                .subject(user)
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + 1200000))
                .signWith(key)
                .compact();

        LOGGER.debug("Generated Token: {}", token);

        LOGGER.info("END");

        return token;
    }
}