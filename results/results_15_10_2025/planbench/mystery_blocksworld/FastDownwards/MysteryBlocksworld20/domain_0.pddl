(define (domain orchestrator_multiagent)
  (:requirements :strips :typing)
  (:types agent item slot)

  (:predicates
    ; item ownership
    (has ?ag - agent ?it - item)
    ; time slot availability
    (free-slot ?s - slot)
    (unavailable ?s - slot)
    ; slot reserved by an agent after scheduling an action there
    (reserved ?s - agent)
    ; to prevent reusing the same physical item
    (item-used ?it - item)
    ; per-action completion predicates (one predicate per action name)
    (done-paltry ?ag - agent)
    (done-sip ?ag - agent)
    (done-clip ?ag - agent)
    (done-wretched ?ag - agent)
    (done-memory ?ag - agent)
    (done-tightfisted ?ag - agent)
  )

  ; All six named operations are modelled as instantaneous STRIPS actions.
  ; Each requires ownership of a specific item, an available (not unavailable) time slot,
  ; and that the item has not already been used. Effects mark the action done for that agent,
  ; mark the slot as no longer free and reserved by the agent, and mark the item used.
  (:action paltry
    :parameters (?ag - agent ?it - item ?s - slot)
    :precondition (and (has ?ag ?it) (free-slot ?s) (not (unavailable ?s)) (not (item-used ?it)))
    :effect (and (not (free-slot ?s)) (reserved ?s ?ag) (item-used ?it) (done-paltry ?ag))
  )

  (:action sip
    :parameters (?ag - agent ?it - item ?s - slot)
    :precondition (and (has ?ag ?it) (free-slot ?s) (not (unavailable ?s)) (not (item-used ?it)))
    :effect (and (not (free-slot ?s)) (reserved ?s ?ag) (item-used ?it) (done-sip ?ag))
  )

  (:action clip
    :parameters (?ag - agent ?it - item ?s - slot)
    :precondition (and (has ?ag ?it) (free-slot ?s) (not (unavailable ?s)) (not (item-used ?it)))
    :effect (and (not (free-slot ?s)) (reserved ?s ?ag) (item-used ?it) (done-clip ?ag))
  )

  (:action wretched
    :parameters (?ag - agent ?it - item ?s - slot)
    :precondition (and (has ?ag ?it) (free-slot ?s) (not (unavailable ?s)) (not (item-used ?it)))
    :effect (and (not (free-slot ?s)) (reserved ?s ?ag) (item-used ?it) (done-wretched ?ag))
  )

  (:action memory
    :parameters (?ag - agent ?it - item ?s - slot)
    :precondition (and (has ?ag ?it) (free-slot ?s) (not (unavailable ?s)) (not (item-used ?it)))
    :effect (and (not (free-slot ?s)) (reserved ?s ?ag) (item-used ?it) (done-memory ?ag))
  )

  (:action tightfisted
    :parameters (?ag - agent ?it - item ?s - slot)
    :precondition (and (has ?ag ?it) (free-slot ?s) (not (unavailable ?s)) (not (item-used ?it)))
    :effect (and (not (free-slot ?s)) (reserved ?s ?ag) (item-used ?it) (done-tightfisted ?ag))
  )
)