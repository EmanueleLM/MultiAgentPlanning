(define (problem hanoi3agents10disks-instance20)
  (:domain hanoi-multiagent-10disks)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
  )

  (:init
    ;; Initial stack on the left peg (top-down): A B C D E F G H I J
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

    ;; Clear facts: top disk A is clear; the two other pegs are empty
    (clear A)
    (clear middle)
    (clear right)

    ;; Agent permissions (enforce which agent may move which disk)
    (allowed agent_1 A)
    (allowed agent_1 B)
    (allowed agent_1 C)
    (allowed agent_1 D)

    (allowed agent_2 E)
    (allowed agent_2 F)
    (allowed agent_2 G)

    (allowed agent_3 H)
    (allowed agent_3 I)
    (allowed agent_3 J)

    ;; Size ordering: A < B < C < D < E < F < G < H < I < J
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
    ;; Left peg should contain (top->bottom) E F G H I J
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; Middle peg should contain (top->bottom) B D
    (on B D)
    (on D middle)

    ;; Right peg should contain (top->bottom) A C
    (on A C)
    (on C right)
  ))
)