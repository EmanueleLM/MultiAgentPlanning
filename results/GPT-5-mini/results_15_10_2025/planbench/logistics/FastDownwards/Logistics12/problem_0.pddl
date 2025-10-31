(define (problem orchestrator-problem)
  (:domain orchestrator)

  (:objects
    actor observer - agent
    cup1 - cup
    clip1 - clip
    doc1 - document
    memo1 - memo
    slotA slotB - slot
    coin1 - coin
  )

  (:init
    ; actor possessions and states
    (has actor cup1)
    (full cup1)
    (has actor clip1)
    (attachable clip1 doc1)
    (has actor memo1)

    ; slot availability and ordering (slotA is earlier than slotB)
    (available-slot slotA)
    (available-slot slotB)
    (earlier slotA slotB)

    ; observer possessions and hard refusal (tightfisted preference enforced)
    (has observer coin1)
    (refuses observer coin1)
  )

  (:goal
    (and
      (memorized actor memo1)
      (attached clip1 doc1)
      (empty cup1)
      (reserved slotA actor)
    )
  )
)