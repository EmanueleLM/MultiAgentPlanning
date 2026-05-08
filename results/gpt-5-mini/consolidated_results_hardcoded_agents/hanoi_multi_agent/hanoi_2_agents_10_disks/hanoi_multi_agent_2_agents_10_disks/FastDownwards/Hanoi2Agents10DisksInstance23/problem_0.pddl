(define (problem hanoi-10disks-agents)
  (:domain hanoi-3peg-agents)

  (:objects
    ; disks (A smallest ... J largest)
    A B C D E F G H I J - disk
    ; pegs
    left middle right - peg
  )

  (:init
    ; Initial stacked order (top -> bottom): A,B,C,D,E,F,G,H,I,J on left peg
    ; Represented as direct-on relations: top disk A is on B, ..., I on J, J on left peg.
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg  J left)

    ; Clear predicates: only the top disk A is clear; middle/right pegs are empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ; Agent move permissions: agent_1 can move A-E; agent_2 can move F-J
    (agent1-disk A)
    (agent1-disk B)
    (agent1-disk C)
    (agent1-disk D)
    (agent1-disk E)

    (agent2-disk F)
    (agent2-disk G)
    (agent2-disk H)
    (agent2-disk I)
    (agent2-disk J)

    ; Size relations (smaller X Y) for all X strictly smaller than Y
    ; A is smaller than B..J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    ; B smaller than C..J
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    ; C smaller than D..J
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    ; D smaller than E..J
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    ; E smaller than F..J
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    ; F smaller than G..J
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    ; G smaller than H..J
    (smaller G H) (smaller G I) (smaller G J)
    ; H smaller than I..J
    (smaller H I) (smaller H J)
    ; I smaller than J
    (smaller I J)
  )

  (:goal (and
    ; Goal stacks:
    ; left peg top->bottom: B, E, F, G, H, I, J  -> relations: B on E, E on F, F on G, G on H, H on I, I on J, J on left
    (on-disk B E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg J left)

    ; middle peg has D
    (on-peg D middle)

    ; right peg top->bottom: A, C  -> A on C, C on right
    (on-disk A C)
    (on-peg C right)
  ))
)