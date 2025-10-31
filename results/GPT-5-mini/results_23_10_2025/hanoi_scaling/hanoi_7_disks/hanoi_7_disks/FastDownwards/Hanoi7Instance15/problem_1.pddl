(define (problem hanoi-7-left-to-right)
  (:domain tower-of-hanoi)

  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; Stack representation: "on X Y" means disk X is directly on object Y (disk or peg).
    ;; We use top→bottom ordering A (top) ... G (bottom) on the left peg by expressing
    ;; each disk as "on disk_below" and the bottom disk G on peg left.
    ;; Top-to-bottom A B C D E F G is encoded as:
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ;; clear facts: only the top disk A and the empty pegs middle and right are clear initially
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (A < B < C < D < E < F < G):
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; target configuration: the full stack top→bottom A B C D E F G on the right peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)

    ;; left and middle must be empty (no disk directly on them)
    (clear left)
    (clear middle)
  ))
)