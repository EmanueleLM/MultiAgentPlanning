(define (problem hanoi6-problem)
  (:domain hanoi6)
  (:objects
     A B C D E F - disk
     left middle right - peg
  )

  (:init
    ; Initial positions: all disks stacked (top-to-bottom) A..F on middle peg.
    (pos A middle)
    (pos B middle)
    (pos C middle)
    (pos D middle)
    (pos E middle)
    (pos F middle)

    ; Static size ordering (smaller < larger). These are used in action preconditions.
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  ; Goal: all disks on left peg (top-to-bottom A..F). This implies middle and right empty.
  (:goal (and
    (pos A left)
    (pos B left)
    (pos C left)
    (pos D left)
    (pos E left)
    (pos F left)
  ))
)