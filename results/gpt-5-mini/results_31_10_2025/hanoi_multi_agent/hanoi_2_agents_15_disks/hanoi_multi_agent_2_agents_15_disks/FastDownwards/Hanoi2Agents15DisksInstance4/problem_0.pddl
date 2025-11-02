(define (problem hanoi-coop-problem)
  (:domain hanoi-cooperative)
  (:objects
    ; disks (A smallest -> D largest)
    A B C D - disk
    ; pegs
    left middle right - peg
    ; steps (we use 16 steps including final completion marker)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - step
    ; agents
    agent1 agent2 - agent
  )

  (:init
    ; initial stacking on left peg:
    ; D on left peg, C on D, B on C, A on B
    (on D left)
    (on C D)
    (on B C)
    (on A B)

    ; clear predicates: only top disk A is clear; middle and right pegs empty
    (clear A)
    (not (clear B)) ; implicit, but include explicit negative-preconditions not in :init; PDDL initial state lists only positive facts.
    ; Because PDDL initial state is a set of positive atoms, we list only positives:
    ; Pegs middle and right are empty (clear)
    (clear middle)
    (clear right)
    ; left is not clear because D is on it => do not list (clear left)

    ; static size ordering (A < B < C < D)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)

    ; permissions: only agent1 is permitted to move disks A-D
    (permits agent1 A)
    (permits agent1 B)
    (permits agent1 C)
    (permits agent1 D)
    ; agent2 has no permits (no (permits agent2 ...) facts)

    ; phase control: start at s1
    (phase s1)

    ; next step chain (static)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
    (next s10 s11)
    (next s11 s12)
    (next s12 s13)
    (next s13 s14)
    (next s14 s15)
    (next s15 s16)

    ; allowed-move mapping encoding the exact cooperative sequence (15 moves)
    ; 1) A left -> middle
    (allowed-move s1 A left middle)
    ; 2) B left -> right
    (allowed-move s2 B left right)
    ; 3) A middle -> right
    (allowed-move s3 A middle right)
    ; 4) C left -> middle
    (allowed-move s4 C left middle)
    ; 5) A right -> left
    (allowed-move s5 A right left)
    ; 6) B right -> middle
    (allowed-move s6 B right middle)
    ; 7) A left -> middle
    (allowed-move s7 A left middle)
    ; 8) D left -> right
    (allowed-move s8 D left right)
    ; 9) A middle -> left
    (allowed-move s9 A middle left)
    ; 10) B middle -> right
    (allowed-move s10 B middle right)
    ; 11) A left -> right
    (allowed-move s11 A left right)
    ; 12) C middle -> left
    (allowed-move s12 C middle left)
    ; 13) A right -> left
    (allowed-move s13 A right left)
    ; 14) B right -> middle
    (allowed-move s14 B right middle)
    ; 15) A left -> right
    (allowed-move s15 A left right)
  )

  (:goal
    (and
      ; all disks moved to right peg in correct stacking:
      (on D right)
      (on C D)
      (on B C)
      (on A B)
    )
  )
)