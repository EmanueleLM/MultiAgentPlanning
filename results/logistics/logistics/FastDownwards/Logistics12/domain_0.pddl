(define (domain orchestrator)
  (:requirements :typing :adl :negative-preconditions)
  (:types agent cup clip document memo slot coin - object)

  (:predicates
    (has ?a - agent ?o - object)
    (full ?c - cup)
    (empty ?c - cup)
    (attachable ?cl - clip ?d - document)
    (attached ?cl - clip ?d - document)
    (memorized ?a - agent ?m - memo)
    (available-slot ?s - slot)
    (reserved ?s - slot ?a - agent)
    (damaged ?o - object)
    (refuses ?a - agent ?o - object)
    (earlier ?s1 - slot ?s2 - slot)
  )

  ; paltry: reserve the earliest available slot for an agent
  (:action paltry
    :parameters (?ag - agent ?s - slot)
    :precondition (and
      (available-slot ?s)
      ; no earlier slot ?t is still available (ensures earliest is chosen)
      (forall (?t - slot) (not (and (earlier ?t ?s) (available-slot ?t))))
    )
    :effect (and
      (reserved ?s ?ag)
      (not (available-slot ?s))
    )
  )

  ; sip: consume a full cup making it empty
  (:action sip
    :parameters (?ag - agent ?c - cup)
    :precondition (and (has ?ag ?c) (full ?c))
    :effect (and (empty ?c) (not (full ?c)))
  )

  ; clip: attach a clip to a document
  (:action clip
    :parameters (?ag - agent ?cl - clip ?d - document)
    :precondition (and (has ?ag ?cl) (attachable ?cl ?d) (not (attached ?cl ?d)))
    :effect (and (attached ?cl ?d))
  )

  ; wretched: mark an object as damaged
  (:action wretched
    :parameters (?ag - agent ?o - object)
    :precondition (and (has ?ag ?o) (not (damaged ?o)))
    :effect (and (damaged ?o))
  )

  ; memory: store a memo in the agent's memory
  (:action memory
    :parameters (?ag - agent ?m - memo)
    :precondition (and (has ?ag ?m) (not (memorized ?ag ?m)))
    :effect (and (memorized ?ag ?m))
  )

  ; tightfisted: agent explicitly refuses to transfer a specific object (persistent constraint)
  (:action tightfisted
    :parameters (?ag - agent ?o - object)
    :precondition (and (has ?ag ?o) (not (refuses ?ag ?o)))
    :effect (and (refuses ?ag ?o))
  )
)