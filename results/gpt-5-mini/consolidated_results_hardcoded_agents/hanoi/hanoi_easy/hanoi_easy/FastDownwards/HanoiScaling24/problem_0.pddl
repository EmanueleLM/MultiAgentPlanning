(define (problem hanoi-4-3pegs-problem)
  (:domain hanoi-4disks-3pegs)

  ;; No additional objects are required here because disks and pegs are declared as domain constants.
  ;; Initial state: all disks stacked on peg1 with d1 at bottom, then d2 on d1, d3 on d2, d4 on d3.
  ;; clear facts: d4 is top of the stack (so clear), peg2 and peg3 are empty (clear).
  (:init
    ;; Stack on peg1
    (on d1 peg1)
    (on d2 d1)
    (on d3 d2)
    (on d4 d3)

    ;; Clear places (only those that are true at start)
    (clear d4)
    (clear peg2)
    (clear peg3)
  )

  ;; Goal: move the entire ordered stack (d1 bottom -> d4 top) to peg3.
  (:goal
    (and
      (on d1 peg3)
      (on d2 d1)
      (on d3 d2)
      (on d4 d3)
    )
  )
)