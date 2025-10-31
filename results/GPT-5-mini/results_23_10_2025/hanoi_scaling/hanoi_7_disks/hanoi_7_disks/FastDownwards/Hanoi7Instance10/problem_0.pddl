(define (problem hanoi-7)
  (:domain hanoi-sequential)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 - disk
    pegA pegB pegC - peg
  )

  (:init
    ;; Initial stack on pegA: top d1, then d2, ..., bottom d7 on pegA
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 pegA)

    ;; Clear predicates: only the top disk and the empty pegs are clear
    (clear d1)
    (clear pegB)
    (clear pegC)

    ;; Hand is initially empty
    (handempty)

    ;; Size ordering: d1 is smallest, d7 is largest (explicit pairwise smaller relations)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7)
    (smaller d5 d6) (smaller d5 d7)
    (smaller d6 d7)
  )

  (:goal (and
    ;; Goal: move the whole stack to pegC in the same order (d1 top ... d7 bottom)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 pegC)
  ))
)