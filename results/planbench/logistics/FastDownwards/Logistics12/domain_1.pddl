(define (domain orchestrator)
  (:requirements :typing :negative-preconditions)
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
    (earliest-slot ?s - slot)
  )

  (:action paltry
    :parameters (?ag - agent ?s - slot)
    :precondition (and (available-slot ?s) (earliest-slot ?s))
    :effect (and (reserved ?s ?ag) (not (available-slot ?s)))
  )

  (:action sip
    :parameters (?ag - agent ?c - cup)
    :precondition (and (has ?ag ?c) (full ?c))
    :effect (and (empty ?c) (not (full ?c)))
  )

  (:action clip
    :parameters (?ag - agent ?cl - clip ?d - document)
    :precondition (and (has ?ag ?cl) (attachable ?cl ?d) (not (attached ?cl ?d)))
    :effect (and (attached ?cl ?d))
  )

  (:action wretched
    :parameters (?ag - agent ?o - object)
    :precondition (and (has ?ag ?o) (not (damaged ?o)))
    :effect (and (damaged ?o))
  )

  (:action memory
    :parameters (?ag - agent ?m - memo)
    :precondition (and (has ?ag ?m) (not (memorized ?ag ?m)))
    :effect (and (memorized ?ag ?m))
  )

  (:action tightfisted
    :parameters (?ag - agent ?o - object)
    :precondition (and (has ?ag ?o) (not (refuses ?ag ?o)))
    :effect (and (refuses ?ag ?o))
  )
)