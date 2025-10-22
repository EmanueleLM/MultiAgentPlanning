(define (problem hanoi6-problem)
  (:domain hanoi-6)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ; initial stack encoded top->below as on(top, below)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ; clear facts: only the top-most disk of left (A) is clear; middle and right pegs are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ; size relations between disks (A smallest ... F largest)
    ; A smaller than B, C, D, E, F
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    ; B smaller than C, D, E, F
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    ; C smaller than D, E, F
    (smaller C D) (smaller C E) (smaller C F)
    ; D smaller than E, F
    (smaller D E) (smaller D F)
    ; E smaller than F
    (smaller E F)

    ; pegs are treated as placeables larger than any disk (so any disk may be placed on an empty peg)
    ; smaller <disk> <peg> for each disk and each peg
    (smaller A left) (smaller A middle) (smaller A right)
    (smaller B left) (smaller B middle) (smaller B right)
    (smaller C left) (smaller C middle) (smaller C right)
    (smaller D left) (smaller D middle) (smaller D right)
    (smaller E left) (smaller E middle) (smaller E right)
    (smaller F left) (smaller F middle) (smaller F right)
  )

  (:goal
    (and
      ; goal stack on right peg encoded top->below as on(top, below)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F right)
    )
  )
)