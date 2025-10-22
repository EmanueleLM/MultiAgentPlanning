(define (problem hanoi-5)
  (:domain tower-of-hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left peg: bottom E, then D, then C, then B, then A on top
    (on E left)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; clear objects: topmost disk and empty pegs
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: A smallest, then B, then C, then D, then E largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal
    (and
      ;; entire stack moved to right peg with same relative order
      (on E right)
      (on D E)
      (on C D)
      (on B C)
      (on A B)
    )
  )
)