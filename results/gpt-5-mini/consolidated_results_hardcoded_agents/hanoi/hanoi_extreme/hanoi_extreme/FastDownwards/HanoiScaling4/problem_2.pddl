(define (problem hanoi7-problem)
  (:domain hanoi7)
  (:objects
    left middle right - peg
    A B C D E F G - disk
  )

  (:init
    ;; initial immediate-support (top-to-bottom): A on B, B on C, C on D, D on E, E on F, F on G, G on left
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg G left)

    ;; top-of-peg facts: A is top of left initially
    (top A left)

    ;; middle and right pegs start empty
    (empty middle)
    (empty right)

    ;; static size ordering (A smallest, G largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; final immediate-support stack on middle peg: A on B, B on C, C on D, D on E, E on F, F on G, G on middle
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg G middle)

    ;; top-of-peg: A must be the top on middle
    (top A middle)

    ;; left and right must be empty in the final state
    (empty left)
    (empty right)
  ))