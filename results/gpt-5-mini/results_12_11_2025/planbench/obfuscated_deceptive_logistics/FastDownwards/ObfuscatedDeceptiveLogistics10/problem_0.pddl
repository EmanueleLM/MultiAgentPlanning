(define (problem orchestrated_problem)
  (:domain orchestrated_domain)

  (:objects
    ; Agents
    object_0 - agent
    object_1 - agent

    ; Locations
    object_2 object_3 object_4 object_5 object_6 - location

    ; Items
    object_7 object_8 object_9 object_10 object_11 - item
  )

  (:init
    ; Initial agent positions
    (at object_0 object_2)
    (at object_1 object_2)

    ; Initial item positions (three items to be processed)
    (item-at object_7 object_2)
    (item-at object_8 object_2)
    (item-at object_9 object_2)

    ; Other items exist but are not required to be processed
    (item-at object_10 object_3)
    (item-at object_11 object_4)
  )

  ; Goals: enforce terminal conditions for the audited causal plan:
  ; each required item must be stored (which enforces the full sequence:
  ; prepared -> transported -> inspected -> stored).
  (:goal (and
    (stored object_7)
    (stored object_8)
    (stored object_9)
  ))