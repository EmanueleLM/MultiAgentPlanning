(define (domain blocksworld-phased)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent phase)

  (:predicates
    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)
    (on ?b - block ?under - block)
    (on-table ?b - block)
    (clear ?b - block)
    (requires-phase ?b - block ?s - block ?p - phase)
    (phase-active ?p - phase)
    (phase-completed ?p - phase)
    (next-phase ?p - phase ?q - phase)
  )

  (:action pickup-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (handempty ?ag) (clear ?b) (on-table ?b))
    :effect (and
      (not (on-table ?b))
      (holding ?ag ?b)
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action unstack
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and (handempty ?ag) (clear ?b) (on ?b ?under))
    :effect (and
      (not (on ?b ?under))
      (holding ?ag ?b)
      (not (handempty ?ag))
      (clear ?under)
      (not (clear ?b))
    )
  )

  (:action putdown-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (holding ?ag ?b))
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on-table ?b)
      (clear ?b)
    )
  )

  (:action stack-onto
    :parameters (?ag - agent ?b - block ?s - block ?p - phase ?q - phase)
    :precondition (and
      (holding ?ag ?b)
      (clear ?s)
      (requires-phase ?b ?s ?p)
      (phase-active ?p)
      (next-phase ?p ?q)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on ?b ?s)
      (not (clear ?s))
      (clear ?b)
      (phase-completed ?p)
      (not (phase-active ?p))
      (phase-active ?q)
    )
  )
)