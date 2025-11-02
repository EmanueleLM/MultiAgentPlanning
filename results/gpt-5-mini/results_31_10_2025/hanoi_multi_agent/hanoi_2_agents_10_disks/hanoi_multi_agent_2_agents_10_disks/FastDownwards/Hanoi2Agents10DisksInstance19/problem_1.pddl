(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)

  (:objects
    agent_1 agent_2 - agent
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ; initial locations: all disks are on the left peg; top-to-bottom: A (top), B, C, D, E, F, G, H, I, J (bottom)
    (on A left)
    (on B left)
    (on C left)
    (on D left)
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)

    ; top facts: A is the topmost disk on the left peg
    (top A left)

    ; empty pegs initially
    (empty middle)
    (empty right)

    ; static directly_above relation describing the initial adjacency (upper directly above lower)
    (directly_above A B)
    (directly_above B C)
    (directly_above C D)
    (directly_above D E)
    (directly_above E F)
    (directly_above F G)
    (directly_above G H)
    (directly_above H I)
    (directly_above I J)

    ; size ordering (smaller X Y) for all X smaller than Y according to A < B < ... < J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; agent move capabilities (strict constraints)
    (can_move agent_1 A)
    (can_move agent_1 B)
    (can_move agent_1 C)
    (can_move agent_1 D)
    (can_move agent_1 E)

    (can_move agent_2 F)
    (can_move agent_2 G)
    (can_move agent_2 H)
    (can_move agent_2 I)
    (can_move agent_2 J)
  )

  ; Goal: disk A must be on the right peg; all other disks remain on the left peg; the middle peg must be empty.
  ; The goal does not explicitly encode an ordering predicate beyond disk locations, since the domain enforces
  ; legal stacking (no larger on smaller) and the initial adjacency facts constrain legal reconfigurations relevant to the plan.
  (:goal (and
    (on B left)
    (on C left)
    (on D left)
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)

    (on A right)

    (empty middle)
  ))
)