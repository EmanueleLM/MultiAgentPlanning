(define (problem hanoi-5-problem)
  (:domain hanoi-5)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; Immediate supports (stack middle: top A, then B, C, D, bottom E)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E middle)

    ;; Transitive on-peg membership for every disk (all start on middle)
    (on-peg A middle)
    (on-peg B middle)
    (on-peg C middle)
    (on-peg D middle)
    (on-peg E middle)

    ;; Clear/top facts
    (clear A)

    ;; Peg emptiness
    (peg-empty left)
    (peg-empty right)
    ;; middle is not empty (do not assert peg-empty middle)

    ;; Static size ordering (A smallest, E largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal
    (and
      ;; Exact stack order on right peg: A on B on C on D on E on right
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E right)

      ;; Transitive membership: all disks on right peg
      (on-peg A right)
      (on-peg B right)
      (on-peg C right)
      (on-peg D right)
      (on-peg E right)

      ;; Left and middle pegs empty
      (peg-empty left)
      (peg-empty middle)
    )
  )
)