(define (problem Hanoi2Agents10DisksInstance0-problem)
  (:domain hanoi-multiagent)

  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left peg (top -> bottom): A,B,C,D,E,F,G,H,I,J
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

    ;; Clear facts: top of left stack (A) and empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; Agent move permissions
    (agent1_disk A) (agent1_disk B) (agent1_disk C) (agent1_disk D) (agent1_disk E)
    (agent2_disk F) (agent2_disk G) (agent2_disk H) (agent2_disk I) (agent2_disk J)

    ;; Size order (smaller relations). A < B < C < D < E < F < G < H < I < J
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

  (:goal
    (and
      ;; left peg (top -> bottom): E, F, G, H, I, J
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J left)

      ;; middle peg (top -> bottom): B, D
      (on B D)
      (on D middle)

      ;; right peg (top -> bottom): A, C
      (on A C)
      (on C right)

      ;; explicit top-of-pegs (they must be clear in final config)
      (clear E)
      (clear B)
      (clear A)
    )
  )
)