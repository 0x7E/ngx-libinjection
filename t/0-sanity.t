use Test::Nginx::Socket;

repeat_each(2);
plan tests => repeat_each() * 2 * blocks();

no_shuffle();
run_tests();

__DATA__

=== TEST 1: sanity (1/2)
--- config
    location /foo {
        libinjection on;
        echo hi;
    }
--- request
GET /foo
--- error_code: 200
--- no_error_log
[error]



=== TEST 2: sanity (2/2)
--- config
    location /foo {
        libinjection off;
        echo hi;
    }
--- request
GET /foo
--- error_code: 200
--- no_error_log
[error]
