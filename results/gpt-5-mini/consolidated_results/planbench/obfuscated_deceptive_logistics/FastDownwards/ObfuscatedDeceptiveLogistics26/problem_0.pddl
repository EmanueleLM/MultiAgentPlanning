;; Scenario_A: collect two objects into memory slots
(define (problem Scenario_A)
  (:domain synthesized_domain_from_inspector_and_auditor)

  (:objects
    ;; agents
    agent_0 - agent

    ;; objects (global set as provided)
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj

    ;; locations
    loc_0 loc_1 loc_2 loc_3 loc_4 - loc

    ;; slots (memory)
    slot_0 slot_1 - slot

    ;; texture types and indices (unused in this scenario but declared to match types)
    tex_smooth tex_rough - texture_type
    idx_0 idx_1 idx_2 idx_3 idx_4 - idx
  )

  (:init
    ;; Agent initially holds nothing
    (handempty agent_0)

    ;; Reachability (agent can reach these locations and slots)
    (reachable agent_0 loc_0)
    (reachable agent_0 loc_1)
    (reachable agent_0 loc_2)
    (reachable agent_0 loc_3)
    (reachable agent_0 slot_0)
    (reachable agent_0 slot_1)

    ;; Objects initial locations
    (at object_0 loc_0)
    (at object_1 loc_1)
    (at object_2 loc_2)
    (at object_3 loc_0)
    (at object_4 loc_3)
    ;; other objects placed arbitrarily (not relevant)
    (at object_5 loc_4)
    (at object_6 loc_4)
    (at object_7 loc_4)
    (at object_8 loc_4)
    (at object_9 loc_4)
    (at object_10 loc_4)
    (at object_11 loc_4)
    (at object_12 loc_4)
    (at object_13 loc_4)
    (at object_14 loc_4)

    ;; Slots initially free
    (slot_free slot_0)
    (slot_free slot_1)

    ;; Some classification predicates (examples)
    (is_vase object_4)
    (is_spring object_2)
    (is_cat object_3)
  )

  ;; Goal: object_1 and object_4 must be collected and occupy the two memory slots
  (:goal
    (and
      (collected object_1)
      (collected object_4)
      (occupant slot_0 object_1)
      (occupant slot_1 object_4)
    )
  )
)