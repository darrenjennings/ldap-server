#!bin/bash

# If you wish to add more users/groups, modify the script below
set -e

orgUnits=(mathematicians scientists)
for i in "${orgUnits[@]}"
do
    samba-tool ou create "OU=$i"
done

for i in $( seq 1 5 )
do
   samba-tool group add "test-group-$i"
done

samba-tool user create euclid --uid euclid --surname euclid --userou OU=mathematicians damng00dcoffEE
samba-tool user create einstein --surname einstein --uid einstein --userou OU=scientists damng00dcoffEE

users=(User1 User2 Ophelia Desdemona Katherina Hamlet Othello Petruchio MacBeth)
for i in "${users[@]}"
do
    samba-tool user create $i damng00dcoffEE
done

samba-tool group addmembers test-group-1 User1,User2,MacBeth
samba-tool group addmembers test-group-2 Ophelia,Desdemona,Katherina
samba-tool group addmembers test-group-3 Hamlet,Othello,Petruchio,MacBeth,Desdemona
samba-tool group addmembers test-group-4 euclid,einstein
