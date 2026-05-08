(define (domain blocks-world-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block step)

  (:predicates
    (on ?b - block ?c - block)
    (on-table ?b - block)
    (clear ?b - block)
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)
    (current ?t - step)
    (next ?t - step ?t2 - step)
  )

  (:action pick-up-agent
    :parameters (?ag - agent ?b - block ?t - step ?t2 - step)
    :precondition (and
      (handempty ?ag)
      (on-table ?b)
      (clear ?b)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-table ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (not (clear ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action unstack-agent
    :parameters (?ag - agent ?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
      (handempty ?ag)
      (on ?b ?c)
      (clear ?b)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?b ?c))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (clear ?c)
      (not (clear ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action put-down-agent
    :parameters (?ag - agent ?b - block ?t - step ?t2 - step)
    :precondition (and
      (holding ?ag ?b)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (on-table ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
      (clear ?b)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action stack-agent
    :parameters (?ag - agent ?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
      (holding ?ag ?b)
      (clear ?c)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
      (not (current ?t))
      (current ?t2)
    )
  )
)