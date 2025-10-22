(define (problem Hanoi5Instance4) 
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

    ;; only the topmost disk and empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (A smallest ... E largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal
    (and
      ;; entire stack moved to right peg with the same relative order
      (on E right)
      (on D E)
      (on C D)
      (on B C)
      (on A B)
    )
  )
)