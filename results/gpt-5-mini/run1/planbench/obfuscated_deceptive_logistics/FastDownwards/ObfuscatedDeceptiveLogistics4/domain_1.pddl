(define (domain sequence-assembly)
  (:requirements :strips :typing :negative-preconditions)
  (:types object agent phase)
  (:constants planning sensing auditing - phase)

  (:predicates
    (next ?a - object ?b - object)
    (proposed ?a - object ?b - object)
    (sensed ?a - object ?b - object)
    (locked ?a - object ?b - object)
    (free-successor ?a - object)
    (free-predecessor ?a - object)
    (at-phase ?p - phase)
    (planner-ready ?ag - agent)
    (sensor-ready ?ag - agent)
    (auditor-ready ?ag - agent)
  )

  (:action planner-propose
    :parameters (?pl - agent ?x - object ?y - object)
    :precondition (and
      (planner-ready ?pl)
      (at-phase planning)
      (free-successor ?x)
      (free-predecessor ?y)
      (not (proposed ?x ?y))
      (not (sensed ?x ?y))
      (not (locked ?x ?y))
    )
    :effect (and
      (proposed ?x ?y)
      (not (at-phase planning))
      (at-phase sensing)
    )
  )

  (:action sensor-confirm
    :parameters (?sen - agent ?x - object ?y - object)
    :precondition (and
      (sensor-ready ?sen)
      (at-phase sensing)
      (proposed ?x ?y)
      (not (sensed ?x ?y))
      (not (locked ?x ?y))
    )
    :effect (and
      (sensed ?x ?y)
      (not (proposed ?x ?y))
      (not (at-phase sensing))
      (at-phase auditing)
    )
  )

  (:action auditor-lock
    :parameters (?aud - agent ?x - object ?y - object)
    :precondition (and
      (auditor-ready ?aud)
      (at-phase auditing)
      (sensed ?x ?y)
      (free-successor ?x)
      (free-predecessor ?y)
      (not (locked ?x ?y))
    )
    :effect (and
      (next ?x ?y)
      (locked ?x ?y)
      (not (sensed ?x ?y))
      (not (free-successor ?x))
      (not (free-predecessor ?y))
      (not (at-phase auditing))
      (at-phase planning)
    )
  )
)