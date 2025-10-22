(define (problem hanoi-8-instance17)
  (:domain hanoi)

  (:objects
    A B C D E F G H - disk
    left_peg middle_peg right_peg - peg
  )

  (:init
    (on A left_peg)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)

    (clear A)
    (clear middle_peg)
    (clear right_peg)

    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )

  (:goal (and
    (on A right_peg)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (clear left_peg)
    (clear middle_peg)
  ))
)