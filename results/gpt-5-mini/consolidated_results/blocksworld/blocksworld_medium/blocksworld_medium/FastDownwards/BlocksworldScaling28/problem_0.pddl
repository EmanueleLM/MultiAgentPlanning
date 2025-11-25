(define (problem two-agent-transfer-problem)
  (:domain two-agent-transfer)
  (:objects
    ;; agents
    picker stacker - agent

    ;; items and their sources
    item1 item2 - item
    source1 source2 - source

    ;; buffer slots (explicit tokens for capacity)
    slot1 slot2 - slot

    ;; pallet slots (explicit tokens for destination stacking)
    pslot1 pslot2 - pslot
  )

  (:init
    ;; item locations (public initial state)
    (at-source item1 source1)
    (at-source item2 source2)

    ;; all buffer slots start available (tokens)
    (slot-available slot1)
    (slot-available slot2)

    ;; all pallet slots start available (tokens)
    (pallet-slot-available pslot1)
    (pallet-slot-available pslot2)

    ;; both agents start with free grippers
    (free-gripper picker)
    (free-gripper stacker)

    ;; No holdings, no items in slots, no items on pallets initially:
    ;; (These are omitted because predicates false by default in STRIPS PDDL)
  )

  ;; Requested goal: both items must be stacked onto specified pallet slots.
  ;; These are hard constraints (must be achieved).
  (:goal (and
    (on-pallet item1 pslot1)
    (on-pallet item2 pslot2)
  ))
)