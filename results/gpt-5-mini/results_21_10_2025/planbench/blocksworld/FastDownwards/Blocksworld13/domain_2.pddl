(define (domain blocksworld-multi)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (block ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (on ?x - block ?y - block)
    (on-table ?b - block)
    (clear ?b - block)
  )

  (:action pick-up
    :parameters (?ag - agent ?b - block)
    :precondition (and (handempty ?ag) (on-table ?b) (clear ?b))
    :effect (and
      (holding ?ag ?b)
      (not (on-table ?b))
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action unstack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and (handempty ?ag) (on ?b ?s) (clear ?b))
    :effect (and
      (holding ?ag ?b)
      (not (on ?b ?s))
      (not (handempty ?ag))
      (not (clear ?b))
      (clear ?s)
    )
  )

  (:action put-down
    :parameters (?ag - agent ?b - block)
    :precondition (and (holding ?ag ?b))
    :effect (and
      (on-table ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  (:action stack
    :parameters (?ag - agent ?b - block ?dest - block)
    :precondition (and (holding ?ag ?b) (clear ?dest))
    :effect (and
      (on ?b ?dest)
      (handempty ?ag)
      (clear ?b)
      (not (holding ?ag ?b))
      (not (clear ?dest))
    )
  )
)