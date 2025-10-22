(define (problem hanoi-6-instance2)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left: top->bottom A,B,C,D,E,F encoded as on relations:
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; Clear facts: only the top disk A is clear, and empty pegs middle & right are clear.
    (clear A)
    (clear middle)
    (clear right)

    ;; Static size ordering (A < B < C < D < E < F)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal
    (and
      ;; All disks stacked on right in the same order top->bottom A,B,C,D,E,F
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F right)

      ;; source pegs empty as required by the specification
      (clear left)
      (clear middle)
    )
  )
)