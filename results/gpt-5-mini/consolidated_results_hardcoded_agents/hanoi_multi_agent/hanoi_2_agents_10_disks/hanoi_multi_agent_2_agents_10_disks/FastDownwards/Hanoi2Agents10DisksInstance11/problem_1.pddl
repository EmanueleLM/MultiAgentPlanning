(define (problem Hanoi2Agents10DisksInstance11)
  (:domain hanoi_agents)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 - agent
  )

  (:init
    ;; Initial stack on left: top A, then B, C, D, E, F, G, H, I, J (J on peg left)
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

    ;; Clear facts: top disk A is clear; middle and right pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; Size ordering: smaller X Y for every X smaller than Y
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ;; Agent move permissions (enforce private-information constraints)
    (can-move agent_1 A) (can-move agent_1 B) (can-move agent_1 C) (can-move agent_1 D) (can-move agent_1 E)
    (can-move agent_2 F) (can-move agent_2 G) (can-move agent_2 H) (can-move agent_2 I) (can-move agent_2 J)
  )

  (:goal (and
    ;; Goal configuration (as specified):
    ;; left peg top-to-bottom A, C, F, G, H, I, J
    (on A C)
    (on C F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; middle peg top-to-bottom B, D
    (on B D)
    (on D middle)

    ;; right peg top-to-bottom E
    (on E right)
  ))
)