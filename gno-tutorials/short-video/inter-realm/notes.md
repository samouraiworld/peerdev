# Interrealm
Protected way to interact with foreign code.

Graph of a transaction, interacting with two realms (C -> A -> B) | Origin / Provenance
Explain reentrency attack, and why it's happening. 

Normal state :
(C --[$1]-> A --> B --< A --[transaction_complete]-< C)

Reentrency attack :
(A --[1$]-> B --> A --[1$]-> B --> A --[1$]-> ...)

-> Add a less permissive communication method => Borrowing
(C --[$1]-> A {B()} --[transaction_complete]-< C)

Meanwhile original method is explicit
(C --[$1]-> A -|cross|-> B --< A --[transaction_complete]-< C)

# Some specific case
Calling the receiver (Reentrency attack)
(C --[$1]-> A -|cross|-> B -|cross|-> A -|cross|-> B --< A --< B --< A --[transaction_complete]-< C)

Calling a Package :
(C --[$1]-> A {P()} --[transaction_complete]-< C)
In some way, calling a package is like borrowing.

--> = Control flow
--< = Return Control
{} = method call
[v] = value transfer
|k| = keyword


---
# Borrowing
-> Tu peux borrow un object par obj.call().
Tu as accès au Realm depuis le scope de Call.
Tu peux uniqument ajouter de la donnée persistente par l'intermédiaire d'une donnée de ta scope + permissive (Sinon Unreal object).
e.g : API sur un service web
---

# Crossing
-> Tu peux cross un realm par cross(obj.call)().
Tu as accès au Realm depuis le scope de Obj. CurrentRealm.addr == obj.addr.
Tu peux tout faire. + permissif, donc explicite.
Nécessaire si tu as besoin d'interagir avec une scope superieur.
e.g : SSH sur un serveur web

=> Cross je le vois comme un sudo.

---


En d'autre mot, je pense qu'il est impossible de modifier le receiver sans borrow / cross pour éviter les reentrency attack. 
e.g : Machine 1 -- SSH1 -> Machine 2 -- SSH2 -> Machine 1.
C'est une généralisation du concept. Si on est capable de modifier le receiver, on couperait la chaîne, et on donnerait les droits à un Realm potentiellement malicieux. 

1 => 2 [-- 1 ->] 3
=> Cross
-> Borrow 
Ce que je comprend, si tu veux accéder à un realm d'un realm, t'as pas forcément besoin de cross