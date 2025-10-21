(define (domain paltry_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location object)

  (:predicates
    (at ?a - agent ?l - location)
    (atobj ?o - object ?l - location)
    (has ?a - agent ?o - object)
    (available ?o - object)
    (processed ?o - object)
    (attached ?clip - object ?note - object)
    (remembered ?a - agent ?note - object)
    (locked ?o - object)
  )

  ;; Action paltry: pick up an object that is available at the agent's location
  (:action paltry
    :parameters (?ag - agent ?o - object ?l - location)
    :precondition (and
      (at ?ag ?l)
      (atobj ?o ?l)
      (available ?o)
    )
    :effect (and
      (has ?ag ?o)
      (not (atobj ?o ?l))
      (not (available ?o))
    )
  )

  ;; Action sip: consume an object the agent holds, producing a processed result
  (:action sip
    :parameters (?ag - agent ?cup - object)
    :precondition (and
      (has ?ag ?cup)
    )
    :effect (and
      (processed ?cup)
      (not (has ?ag ?cup))
    )
  )

  ;; Action clip: attach a clip to a note when the agent holds both
  (:action clip
    :parameters (?ag - agent ?clip - object ?note - object)
    :precondition (and
      (has ?ag ?clip)
      (has ?ag ?note)
      (not (attached ?clip ?note))
    )
    :effect (and
      (attached ?clip ?note)
      (processed ?note)
      (not (has ?ag ?clip))
    )
  )

  ;; Action wretched: steal a coin from another agent if coin is not locked and both at same location
  (:action wretched
    :parameters (?thief - agent ?victim - agent ?coin - object ?l - location)
    :precondition (and
      (at ?thief ?l)
      (at ?victim ?l)
      (has ?victim ?coin)
      (not (locked ?coin))
    )
    :effect (and
      (has ?thief ?coin)
      (not (has ?victim ?coin))
    )
  )

  ;; Action memory: agent reads/recalls a note it currently holds
  (:action memory
    :parameters (?ag - agent ?note - object)
    :precondition (and
      (has ?ag ?note)
    )
    :effect (and
      (remembered ?ag ?note)
    )
  )

  ;; Action tightfisted: agent locks an object (e.g., coin) it holds, preventing transfers
  (:action tightfisted
    :parameters (?ag - agent ?o - object)
    :precondition (and
      (has ?ag ?o)
    )
    :effect (and
      (locked ?o)
    )
  )
)