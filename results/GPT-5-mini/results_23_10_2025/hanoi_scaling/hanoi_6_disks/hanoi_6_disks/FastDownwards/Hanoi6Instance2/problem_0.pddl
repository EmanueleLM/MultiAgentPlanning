(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; initial top and above relations for left peg: top->bottom A,B,C,D,E,F (A is top)
    (top left A)
    (above A B)
    (above B C)
    (above C D)
    (above D E)
    (above E F)
    (above F left)

    ;; other pegs empty
    (empty middle)
    (empty right)

    ;; static size ordering (A < B < C < D < E < F)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal
    (and
      ;; All disks stacked on right in same order top->bottom A,B,C,D,E,F
      (top right A)
      (above A B)
      (above B C)
      (above C D)
      (above D E)
      (above E F)
      (above F right)

      ;; source pegs empty
      (empty left)
      (empty middle)
    )
  )
)