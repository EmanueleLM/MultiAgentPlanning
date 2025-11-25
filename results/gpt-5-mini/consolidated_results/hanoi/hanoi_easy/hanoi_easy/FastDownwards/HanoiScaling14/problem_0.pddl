(define (problem hanoi-4)
  (:domain tower-of-hanoi)
  (:objects
    d1 d2 d3 d4 - disk
    A B C - peg
  )
  (:init
    ;; initial stack on peg A: bottom d4, then d3, d2, top d1
    (on d4 A)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)
    ;; top-clear places
    (clear d1)
    (clear B)
    (clear C)
    ;; size ordering facts (smaller)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)
  )
  (:goal (and
    ;; final stack on peg C: bottom d4, then d3, d2, top d1
    (on d4 C)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)
  ))
)