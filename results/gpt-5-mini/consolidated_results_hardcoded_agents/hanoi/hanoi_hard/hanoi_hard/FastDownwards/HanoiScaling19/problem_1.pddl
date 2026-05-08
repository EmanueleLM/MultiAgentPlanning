(define (problem hanoi6)
  (:domain hanoi)
  (:objects
    pegL pegM pegR - peg
    diskA diskB diskC diskD diskE diskF - disk
  )
  (:init
    ; Initial stack on pegR: from top to bottom A, B, C, D, E, F
    (on-disk diskA diskB)
    (on-disk diskB diskC)
    (on-disk diskC diskD)
    (on-disk diskD diskE)
    (on-disk diskE diskF)
    (on-peg diskF pegR)

    ; Initial clear facts: only the top disk has nothing on it; left and middle pegs empty
    (clear-disk diskA)
    (clear-peg pegL)
    (clear-peg pegM)

    ; Size ordering: diskA smallest, diskF largest
    (smaller diskA diskB) (smaller diskA diskC) (smaller diskA diskD) (smaller diskA diskE) (smaller diskA diskF)
    (smaller diskB diskC) (smaller diskB diskD) (smaller diskB diskE) (smaller diskB diskF)
    (smaller diskC diskD) (smaller diskC diskE) (smaller diskC diskF)
    (smaller diskD diskE) (smaller diskD diskF)
    (smaller diskE diskF)
  )

  (:goal (and
    ; Final stack on pegL: from top to bottom A, B, C, D, E, F
    (on-disk diskA diskB)
    (on-disk diskB diskC)
    (on-disk diskC diskD)
    (on-disk diskD diskE)
    (on-disk diskE diskF)
    (on-peg diskF pegL)

    ; Other pegs empty
    (clear-peg pegM)
    (clear-peg pegR)
  ))
)