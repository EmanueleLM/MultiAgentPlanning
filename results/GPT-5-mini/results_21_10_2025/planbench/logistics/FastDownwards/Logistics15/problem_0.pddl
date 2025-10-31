(define (problem scenario-1)
  (:domain orchestrator)
  (:objects
    alice bob - agent
    kitchen desk - loc
    drink1 cliptool1 item1 mem1 coin1 paltry1 - item
  )

  (:init
    ;; Locations
    (at alice kitchen)
    (at bob desk)

    ;; Available resources/items
    (available drink1)
    (available paltry1)

    ;; Possessions
    (has alice cliptool1)
    (has alice item1)
    (has alice drink1)
    (has bob mem1)
    (has bob coin1)

    ;; Default facts: not explicitly listed negatives are assumed false in init
  )

  ;; Goals for scenario 1:
  ;; - Alice must be satiated (she should sip the drink).
  ;; - item1 must be clipped (requires alice to have cliptool1 and item1; then clip).
  (:goal (and
    (satiated alice)
    (clipped item1)
  ))
)