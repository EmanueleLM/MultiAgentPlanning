(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: top-to-bottom A B C D E F G H I J
    ;; encoding: on(X,Y) means X is directly on Y (Y is disk or peg)
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

    ;; clear locations (only topmost disk A and empty pegs)
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: smaller relations (A smallest, J largest)
    ;; A smaller than B..J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    ;; B smaller than C..J
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    ;; C smaller than D..J
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    ;; D smaller than E..J
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    ;; E smaller than F..J
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    ;; F smaller than G..J
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    ;; G smaller than H..J
    (smaller G H) (smaller G I) (smaller G J)
    ;; H smaller than I,J
    (smaller H I) (smaller H J)
    ;; I smaller than J
    (smaller I J)

    ;; agent movement permissions (hard constraints)
    (can-move-agent1 A) (can-move-agent1 B) (can-move-agent1 C) (can-move-agent1 D)
    (can-move-agent2 E) (can-move-agent2 F) (can-move-agent2 G)
    (can-move-agent3 H) (can-move-agent3 I) (can-move-agent3 J)
  )

  (:goal (and
    ;; left peg goal stack top-to-bottom: D E F G H I J
    ;; encoded as on(D,E) ... on(J,left)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; middle peg top-to-bottom: C only
    (on C middle)

    ;; right peg top-to-bottom: A B (A on B, B on right)
    (on A B)
    (on B right)
  ))
)