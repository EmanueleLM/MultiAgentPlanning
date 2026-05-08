(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: top-to-bottom A B C D E F G H I J
    ;; encode as on(X, Y) meaning X directly on Y (Y is disk or peg)
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

    ;; only topmost disk on the initial stack is clear; empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: A < B < C < D < E < F < G < H < I < J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ;; agent movement permissions
    (can-move-agent1 A) (can-move-agent1 B) (can-move-agent1 C) (can-move-agent1 D)
    (can-move-agent2 E) (can-move-agent2 F) (can-move-agent2 G)
    (can-move-agent3 H) (can-move-agent3 I) (can-move-agent3 J)
  )

  (:goal (and
    ;; left peg target stack top-to-bottom: D E F G H I J
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; middle peg has only C (top-to-bottom: C)
    (on C middle)

    ;; right peg top-to-bottom: A B  (A on B, B on right)
    (on A B)
    (on B right)
  ))
)