(define (problem orchestrator-instance-1)
  (:domain orchestrator-domain)
  (:objects
    loader1 assembler1 - agent
    item1 item2 - item
    depot handoff assembly - location
  )

  (:init
    ;; Agent initial locations
    (at loader1 depot)
    (at assembler1 assembly)

    ;; Items initial locations
    (item-at item1 depot)
    (item-at item2 depot)

    ;; Hands free initially
    (free loader1)
    (free assembler1)

    ;; No item has been picked, transported, or assembled initially
    ;; (Absence of picked/transported/assembled facts implies false)
  )

  ;; Goals: both items must be assembled, and final mandatory terminal conditions for agents fixed.
  ;; - assembled item1 and item2 must be true (terminal task completion)
  ;; - loader1 must be back at depot
  ;; - assembler1 must remain at assembly
  (:goal
    (and
      (assembled item1)
      (assembled item2)
      (at loader1 depot)
      (at assembler1 assembly)
    )
  )
)