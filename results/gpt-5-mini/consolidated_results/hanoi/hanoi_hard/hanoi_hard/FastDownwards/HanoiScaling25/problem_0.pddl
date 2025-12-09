(define (problem hanoi-6)
  (:domain tower-of-hanoi)
  (:objects
    pegA pegB pegC
    d1 d2 d3 d4 d5 d6
  )
  (:init
    ;; initial direct-support links (classic stack on pegA: d6 bottom, then d5..d1 top)
    (on d6 pegA)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; clear facts: only the top-most disk and empty pegs are clear
    (clear d1)
    (clear pegB)
    (clear pegC)

    ;; disk size (static) relations: smaller di dj when i < j
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
  )

  ;; goal: entire tower moved to pegC preserving order (d6 bottom ... d1 top)
  (:goal (and
    (on d6 pegC)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)
  ))
)