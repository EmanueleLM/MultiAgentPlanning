(define (problem hanoi-4-3)
  (:domain hanoi)
  (:objects
    d1 d2 d3 d4 - disk
    p1 p2 p3    - peg
  )

  (:init
    ;; initial tower on peg p1: bottom d4, then d3, then d2, top d1
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 p1)

    ;; clear places: topmost disk and empty pegs are clear
    (clear d1)
    (clear p2)
    (clear p3)

    ;; size ordering (strict): d1 < d2 < d3 < d4
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4)
    (smaller d2 d3) (smaller d2 d4)
    (smaller d3 d4)
  )

  ;; Goal: the full tower replicated on peg p3 with same ordering
  (:goal (and
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 p3)
  ))
)