//name.cue
name: "Daniel"
//disposition.cue
disposition: "oblivious"
% cue export name.cue disposition.cue
{
    "name": "Daniel",
    "disposition": "oblivious"
}
% cue export --out yaml name.cue disposition.cue
name: Daniel
disposition: oblivious
works_fine: true
"needs-quotes": true
//string_value.cue
foo: "baz"
//integer_value.cue
foo: 100
% cue export string_value.cue integer_value.cue
foo: conflicting values "baz" and 100 (mismatched types string and int):
    integer_value.cue:1:6
    string_value.cue:1:6
//string_value.cue
foo: "baz"
//integer_value.cue
foo: "100"  // a string now
% cue export string_value.cue integer_value.cue
foo: conflicting values "100" and "baz":
    integer_value.cue:1:6
    string_value.cue:1:6
street: "1 Infinite Loop"
street: string
//type-only.cue
amount: float
% cue eval type-only.cue
amount: float
% cue export type-only.cue
amount: incomplete value float
//concrete-value.cue
amount: 3.14
% cue export type-only.cue concrete-value.cue
{
    "amount": 3.14
}
// default-port.cue
port: int | *8080
% cue eval default-port.cue
port: 8080
//severity-enum.cue
severity: "high" | "medium" | "low"
severity: "unknown"
% cue eval severity-enum.cue
severity: 3 errors in empty disjunction:
severity: conflicting values "high" and "unknown":
    ./severity-enum.cue:1:11
    ./severity-enum.cue:1:48
severity: conflicting values "low" and "unknown":
    ./severity-enum.cue:1:31
    ./severity-enum.cue:1:48
severity: conflicting values "medium" and "unknown":
    ./severity-enum.cue:1:20
    ./severity-enum.cue:1:48
// definitions.cue

#DashboardPort: 1337

configs: {
    host: "localhost"
    port: #DashboardPort
}

#Address: {
    street: string
    city: string
    zip?: int  // ? makes zip optional
}

some_address: #Address & {
  street: "1 Rocket Rd"
  city: "Hawthorne"
}

more_addresses: [...#Address] & [
  {street: "1600 Amphitheatre Parkway", city: "Mountain View", zip: "94043"},
  {street: "1 Hacker Way", city: "Menlo Park"}
]
% cue export --out yaml definitions.cue
configs:
  host: localhost
  port: 1337
some_address:
  street: 1 Rocket Rd
  city: Hawthorne
more_addresses:
  - street: 1600 Amphitheatre Parkway
    city: Mountain View
    zip: "94043"
  - street: 1 Hacker Way
    city: Menlo Park
#Country: {
  name: =~"^\\p{Lu}" // Must start with an upper-case letter
  pop: >800 & <9_000_000_000 // More than 800, fewer than 9 billion
}

vatican_city: #Country & {
  name: "Vatican City"
  pop: 825
}
//paths.cue

// path-value pairs
outer: middle1: inner: 3
outer: middle2: inner: 7

// collection-constraint pair
outer: [string]: inner: int
% cue export paths.cue
{
    "outer": {
        "middle1": {
            "inner": 3
        },
        "middle2": {
            "inner": 7
        }
    }
}
//templates.cue

container: [Name=_]: {
    name:     Name
    replicas: uint | *1
    command:  string
}

container: sidecar: command: "envoy"

container: service: {
    command:  "fibonacci"
    replicas: 2
}
% cue eval templates.cue
container: {
    sidecar: {
        name:     "sidecar"
        replicas: 1
        command:  "envoy"
    }
    service: {
        name:     "service"
        command:  "fibonacci"
        replicas: 2
    }
}
//scopes-and-references.cue
v: "top-level v"
b: v // a reference
a: {
    b: v // matches the top-level v
}

let V = v
a: {
    v: "a's inner v"
    c: v // matches the inner v
    d: V // matches the top-level v now shadowed by a.v
}
av: a.v // matches a's v
% cue eval --out yaml scopes-and-references.cue
v: top-level v
b: top-level v
a:
  b: top-level v
  v: a's inner v
  c: a's inner v
  d: top-level v
av: a's inner v
//hiddens.cue
"_foo": 2
_foo:   3
foo:    4
_#foo:  5
#foo : 6
% cue eval hiddens.cue
"_foo": 2
foo:    4
#foo:   6

% cue export hiddens.cue
{
    "_foo": 2,
    "foo": 4
}
//interpolation.cue

#expense: 90
#revenue: 100
message: "Your profit was $\( #revenue - #expense)"

cat: {
    type: "Cuddly"
    "is\(type)":    true
}
% cue export interpolation.cue
{
    "message": "Your profit was $10",
    "cat": {
        "type": "Cuddly",
        "isCuddly": true
    }
}
//getting-out-of-hand-now.cue
import "strings"  // we'll come back to this

// operators are nice
g: 5 / 3         // CUE can do math
h: 3 * "blah"    // and Python-like string repetition
i: 3 * [1, 2, 3] // with lists too
j: 8 < 10        // and supports boolean ops

// conditionals are also nice
price: number
// Require a justification if price is too high
if price > 100 {
    justification: string
}
price:         200
justification: "impulse buy"

// list comprehensions are powerful and compact
#items: [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
comp: [ for x in #items if x rem 2 == 0 {x*x}]

// and... well you can do this too
#a: [ "Apple", "Google", "SpaceX"]
for k, v in #a {
    "\( strings.ToLower(v) )": {
        pos:     k + 1
        name:    v
        nameLen: len(v)
    }
}
% cue export getting-out-of-hand-now.cue
{
    "g": 1.66666666666666666666667,
    "h": "blahblahblah",
    "i": [1, 2, 3, 1, 2, 3, 1, 2, 3],
    "j": true,
    "apple": {
        "pos": 1,
        "name": "Apple",
        "nameLen": 5
    },
    "google": {
        "pos": 2,
        "name": "Google",
        "nameLen": 6
    },
    "price": 200,
    "justification": "impulse buy",
    "comp": [
        4,
        16,
        36,
        64
    ],
    "spacex": {
        "pos": 3,
        "name": "SpaceX",
        "nameLen": 6
    }
}
//a.cue
package config

foo: 100
bar: int
//b.cue
package config

bar: 200
mkdir mymodule && cd mymodule
cue mod init example.com/mymodule
mymodule
├── config
│   ├── a.cue
│   └── b.cue
├── cue.mod
│   ├── module.cue
│   ├── pkg
│   └── usr
└── main.cue
% cue eval
configuredBar: 200
//main.cue

package main
import "example.com/mymodule/config"

configuredBar: config.bar
//a.cue
package config

foo: 100
bar: int
//b.cue
package config

bar: 200
cue eval                                                                     2022-01-06 17:51:24
configuredBar: conflicting values string and 200 (mismatched types string and int):
    ./config/a.cue:4:6
    ./config/b.cue:3:6
    ./main.cue:5:16
