(define (problem orchestrator-multiagent-problem)
  (:domain orchestrator_multiagent)
  (:objects
    actorA actorB - agent
    item-paltry item-sip item-clip item-wretched item-memory item-tightfisted - item
    slot1 slot2 slot3 - slot
  )
  (:init
    (has actorA item-paltry)
    (has actorA item-sip)
    (has actorA item-clip)
    (has actorB item-wretched)
    (has actorB item-memory)
    (has actorB item-tightfisted)
    (unavailable slot1)
    (free-slot slot2)
    (free-slot slot3)
  )
  (:goal
    (and
      (done-paltry actorA)
      (done-sip actorA)
      (done-clip actorA)
      (done-wretched actorB)
      (done-memory actorB)
      (done-tightfisted actorB)
    )
  )
)