(define (problem hanoi_multiagent_problem)
  (:domain hanoi_multiagent)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ; types: disk and peg are already declared via :objects and domain typing

    ; Initial stack on left: top->bottom A, B, C, D, E, F, G, H, I, J
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

    ; Clear predicates: topmost disk A is clear; pegs middle and right empty thus clear
    (clear A)
    (clear middle)
    (clear right)

    ; Capability constraints: which agent may move which disks
    (can_move_agent1 A)
    (can_move_agent1 B)
    (can_move_agent1 C)
    (can_move_agent1 D)

    (can_move_agent2 E)
    (can_move_agent2 F)
    (can_move_agent2 G)

    (can_move_agent3 H)
    (can_move_agent3 I)
    (can_move_agent3 J)

    ; Size ordering (smaller X Y means X is smaller than Y)
    ; A is smallest, J largest. Enumerate all pairs where first is smaller than second.
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
    ; Goal: left peg has (top->bottom) D, E, F, G, H, I, J
    ; which corresponds to: D on E, E on F, F on G, G on H, H on I, I on J, J on left
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ; middle peg has (top->bottom) A, B, C
    (on A B)
    (on B C)
    (on C middle)

    ; right peg empty is implicit; no disk should be on right (not enforced explicitly)
  ))
)