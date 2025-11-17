(define (problem hanoi-coop-problem)
  (:domain hanoi-coop)

  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ;; initial direct-stack relations (top-to-bottom A..J on left)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg J left)

    ;; the only top disk initially is A
    (clear-disk A)

    ;; peg emptiness
    (empty-peg middle)
    (empty-peg right)

    ;; all disks initially located at peg left
    (at A left)
    (at B left)
    (at C left)
    (at D left)
    (at E left)
    (at F left)
    (at G left)
    (at H left)
    (at I left)
    (at J left)

    ;; size ordering (smaller relations): A < B < C < D < E < F < G < H < I < J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ;; agent permissions
    (agent1 A) (agent1 B) (agent1 C) (agent1 D) (agent1 E)
    (agent2 F) (agent2 G) (agent2 H) (agent2 I) (agent2 J)
  )

  (:goal (and
    ;; Goal configuration:
    ;; left peg top-to-bottom: C, D, E, F, G, H, I, J
    ;; middle peg top-to-bottom: A, B
    ;; right peg: empty

    ;; Middle stack: A on B, and B is directly on peg middle
    (on-disk A B)
    (on-peg B middle)

    ;; Left stack: C on D, D on E, ..., I on J, and J on left peg
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg J left)

    ;; ensure disk locations (at) reflect final pegs
    (at A middle)
    (at B middle)
    (at C left)
    (at D left)
    (at E left)
    (at F left)
    (at G left)
    (at H left)
    (at I left)
    (at J left)

    ;; right peg must be empty
    (empty-peg right)
  ))
)