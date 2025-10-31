(define (problem Hanoi2Agents10DisksInstance5)
  (:domain hanoi-2agents)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )
  (:init
    ; initial stacked-on relations (top->bottom: A,B,C,D,E,F,G,H,I,J on left peg)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ; clear = nothing directly on that object (top disks / empty pegs)
    (clear A)
    (clear middle)
    (clear right)

    ; agent move permissions
    (can_move_agent_1 A)
    (can_move_agent_1 B)
    (can_move_agent_1 C)
    (can_move_agent_1 D)
    (can_move_agent_1 E)

    (can_move_agent_2 F)
    (can_move_agent_2 G)
    (can_move_agent_2 H)
    (can_move_agent_2 I)
    (can_move_agent_2 J)

    ; size ordering facts: smaller X Y when X is strictly smaller than Y
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)
  )
  (:goal (and
    ; Goal arrangement exactly as specified:
    ; left peg (top→bottom): B, E, F, G, H, I, J  => B on E, E on F, ..., J on left
    (on B E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ; middle peg (top→bottom): A, C => A on C, C on middle
    (on A C)
    (on C middle)

    ; right peg (top→bottom): D => D on right
    (on D right)
  ))
)