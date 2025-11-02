(define (problem cooperative-hanoi-problem)
  (:domain cooperative-hanoi)
  (:objects
    A B C - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 - step
  )

  (:init
    ; Initial positions: all three disks start on the left peg (A = smallest on top)
    (on-peg A left)
    (on-peg B left)
    (on-peg C left)

    ; Ownership constraints (from the user input):
    ; agent_1 may move disks A–J; here A,B,C are owned by agent_1
    (agent1_owned A)
    (agent1_owned B)
    (agent1_owned C)
    ; agent_2 does not own any of A,B,C in this scenario (so it will perform no moves)

    ; Step control: start at s1
    (step s1)

    ; Step ordering (next relation)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)

    ; Allowed moves per step (these encode the validated, ordered move list provided by agent_1)
    ; Step 1: agent_1: move disk A from left to right
    (allowed-move s1 A left right)
    ; Step 2: agent_1: move disk B from left to middle
    (allowed-move s2 B left middle)
    ; Step 3: agent_1: move disk A from right to middle
    (allowed-move s3 A right middle)
    ; Step 4: agent_1: move disk C from left to right
    (allowed-move s4 C left right)
    ; Step 5: agent_1: move disk A from middle to left
    (allowed-move s5 A middle left)
    ; Step 6: agent_1: move disk B from middle to right
    (allowed-move s6 B middle right)

    ; Note: agent_2 has no allowed-move facts (agent_2 will perform no moves)
  )

  ; Goal: disks B and C must be on the right peg (as required)
  (:goal (and
    (on-peg B right)
    (on-peg C right)
  ))
)