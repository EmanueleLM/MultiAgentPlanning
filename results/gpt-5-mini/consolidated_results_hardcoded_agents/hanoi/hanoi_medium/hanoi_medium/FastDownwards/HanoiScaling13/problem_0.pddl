(define (problem hanoi5)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ; initial stacking: top-to-bottom on the right peg: A on B on C on D on E on right
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ; clear: only the top disk and empty pegs are clear initially
    (clear A)
    (clear left)
    (clear middle)
    ; right peg is not clear because E is on it
    ; disks B, C, D, E are not clear (not listed)

    ; size ordering (A smallest, E largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal
    (and
      ; final stacking: all disks on the middle peg in same top-to-bottom order A,B,C,D,E
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E middle)
    )
  )
)