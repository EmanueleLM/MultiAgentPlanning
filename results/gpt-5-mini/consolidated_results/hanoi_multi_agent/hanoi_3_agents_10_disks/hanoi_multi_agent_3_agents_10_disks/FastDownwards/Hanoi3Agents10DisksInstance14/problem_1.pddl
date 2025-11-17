(define (problem hanoi-three-pegs-multiagent)
  (:domain hanoi-multiagent)

  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    ;; place is implicit via disk and peg types
  )

  (:init
    ;; type facts (explicit)
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F) (disk G) (disk H) (disk I) (disk J)
    (peg left) (peg middle) (peg right)

    ;; agent permissions (strict)
    (agent1-disk A) (agent1-disk B) (agent1-disk C) (agent1-disk D)
    (agent2-disk E) (agent2-disk F) (agent2-disk G)
    (agent3-disk H) (agent3-disk I) (agent3-disk J)

    ;; initial stack on left: top-to-bottom A, B, C, D, E, F, G, H, I, J
    ;; representation: each disk is "on" the object immediately below it;
    ;; bottom-most disk J is on the left peg.
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

    ;; initially only the top disk A is clear; middle and right pegs are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ;; size order (smaller relations) - strict total order A < B < C < D < E < F < G < H < I < J
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
    ;; Goal configuration (as required by the human specification):
    ;; left peg top-to-bottom C, D, E, F, G, H, I, J
    ;; middle peg has A
    ;; right peg has B
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    (on A middle)
    (on B right)
  ))
)