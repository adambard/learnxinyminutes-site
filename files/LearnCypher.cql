// Friend-of-a-friend
(user)-[:KNOWS]-(friend)-[:KNOWS]-(foaf)

// Shortest path
path = shortestPath( (user)-[:KNOWS*..5]-(other) )

// Collaborative filtering
(user)-[:PURCHASED]->(product)<-[:PURCHASED]-()-[:PURCHASED]->(otherProduct)

// Tree navigation
(root)<-[:PARENT*]-(leaf:Category)-[:ITEM]->(data:Product)
CREATE (a:Person {name:"Théo Gauchoux"})
RETURN a
CREATE (a:Person)-[k:KNOWS]-(b:Person)
RETURN a,k,b
MATCH (n)
RETURN n
MATCH (a:Person)
RETURN a
MATCH (a:Person {name:"Théo Gauchoux"})
RETURN a
MATCH (a)-[:KNOWS]-(b)
RETURN a,b
MATCH (a)-[:MANAGES]->(b)
RETURN a,b
MATCH (p:Person {name:"Théo Gauchoux"})-[s:LIVES_IN]->(city:City)
WHERE s.since = 2015
RETURN p,state
MATCH (a), (b)
WHERE a.name = "Jacquie" AND b.name = "Michel"
CREATE (a)-[:KNOWS]-(b)
MATCH (p:Person)
WHERE p.name = "Théo Gauchoux"
SET p.age = 23
MATCH (p:Person)
WHERE p.name = "Théo Gauchoux"
SET p = {name: "Michel", age: 23}
MATCH (p:Person)
WHERE p.name = "Théo Gauchoux"
SET p += {studies: "IT Engineering"}
MATCH (p:Person)
WHERE p.name = "Théo Gauchoux"
SET p:Internship
MATCH (p:Person)-[relationship]-()
WHERE p.name = "Théo Gauchoux"
DELETE relationship, p
MATCH (p:Person)
WHERE p.name = "Théo Gauchoux"
REMOVE p.age
MATCH (p:Person)
WHERE p.name = "Théo Gauchoux"
DELETE p:Person
MATCH (n)
OPTIONAL MATCH (n)-[r]-()
DELETE n, r
