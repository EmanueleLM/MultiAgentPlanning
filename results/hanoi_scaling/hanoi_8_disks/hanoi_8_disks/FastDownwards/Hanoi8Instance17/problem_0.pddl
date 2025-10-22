(define (problem hanoi-8)
  (:domain hanoi)

  (:objects
    A B C D E F G H - disk
    left_peg middle_peg right_peg - peg
  )

  (:init
    ;; initial stacking on left_peg: A (top) on left_peg, B on A, C on B, ..., H on G (bottom)
    (on A left_peg)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)

    ;; clear objects: top disk A is clear; middle and right pegs are empty (clear)
    (clear A)
    (clear middle_peg)
    (clear right_peg)

    ;; size relations (A smallest, H largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )

  (:goal
    (and
      ;; final stacking on right_peg: A (top) on right_peg, B on A, C on B, ..., H on G (bottom)
      (on A right_peg)
      (on B A)
      (on C B)
      (on D C)
      (on E D)
      (on F E)
      (on G F)
      (on H G)

      ;; left and middle pegs must be empty in final configuration
      (clear left_peg)
      (clear middle_peg)
    )
  )
)