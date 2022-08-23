#!/bin/bash

nohup mvn clean compile exec:java@catalogue-server & 
sleep 40
mvn clean test -Dtest=ServerVerticleDeboardTest
mvn test -Dtest=ApiServerVerticlePreprareTest
mvn test -Dtest=ApiServerVerticleTest
mvn test -Dtest=ServerVerticleDeboardTest
mvn test -Dtest=DatabaseServiceTest
mv target/jacoco.exec target/DatabaseServiceTest.exec
mvn clean test -Dtest=ConstraintsValidationTest,ExceptionHandlerTest,QueryMapperTest,RespBuilderTest,AuditingServiceTest,QueryBuilderTest,JwtAuthServiceImplTest,AuthorizationRequestTest,JwtDataTest,DatabaseServiceTest,ElasticClientTest,QueryDecoderTest,SummarizerTest,DataBrokerServiceTest,GeocodingServiceTest,NLPSearchServiceTest,RatingServiceTest,ValidatorServiceTest
mv target/jacoco.exec target/jacoco2.exec
