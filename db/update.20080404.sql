CREATE TABLE sessions2(
 sesskey VARCHAR( 64 ) NOT NULL DEFAULT '',
 expiry TIMESTAMP NOT NULL ,
 expireref VARCHAR( 250 ) DEFAULT '',
 created TIMESTAMP NOT NULL ,
 modified TIMESTAMP NOT NULL ,
 sessdata TEXT DEFAULT '',
 PRIMARY KEY ( sesskey )
 );

create INDEX sess2_expiry on sessions2( expiry );
create INDEX sess2_expireref on sessions2 ( expireref );