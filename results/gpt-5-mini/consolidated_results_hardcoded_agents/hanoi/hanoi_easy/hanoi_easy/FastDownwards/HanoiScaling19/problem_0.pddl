(define (problem hanoi-4-problem)
  (:domain tower-of-hanoi-4)

  (:objects
    d1 d2 d3 d4 - disk
    a b c - peg
  )

  (:init
    ;; initial stack on peg a: bottom d4, then d3, then d2, then top d1
    (on d4 a)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; clear facts: only the topmost disk and the empty pegs are clear
    (clear d1)
    (clear b)
    (clear c)

    ;; size ordering (static): smaller < larger
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4)
    (smaller d2 d3) (smaller d2 d4)
    (smaller d3 d4)
  )

  ;; Goal: entire tower moved to peg c in same order (d4 bottom, d3 on d4, d2 on d3, d1 on d2)
  (:goal (and
    (on d4 c)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)
  ))
)