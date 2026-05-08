(define (problem hanoi-10-multiagent)
  (:domain hanoi-multiagent)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )
  (:init
    ;; Initial stacking: left peg from top to bottom A B C D E F G H I J
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ;; Clear (topmost) objects: only A is topmost; middle and right pegs are empty
    (clear A)
    (clear middle)
    (clear right)

    ;; Disk size ordering: A < B < C < D < E < F < G < H < I < J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ;; Agent-specific permissions (as provided): agent_1 is permitted to move disk A; agent_2 has no permitted moves initially.
    (can-move-agent1 A)
    ;; (no can-move-agent2 facts) -- agent_2 has no permitted moves at initial state
  )

  (:goal (and
    ;; Goal configuration:
    ;; left peg from top to bottom E F G H I J
    (on E left)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ;; middle peg from top to bottom A
    (on A middle)

    ;; right peg from top to bottom B C D
    (on B right)
    (on C B)
    (on D C)
  ))
)