(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item place)

  (:constants
    kitchen - place
  )

  (:predicates
    (at ?i - item ?p - place)
    (at-agent ?a - agent ?p - place)
    (holding ?a - agent ?i - item)
    (cleaned ?i - item)
    (clipped ?i - item)
    (sipped ?i - item)
    (consumed ?i - item)
    (remembers ?a - agent ?i - item)
    (hoarded ?i - item)
    (wretched_state ?i - item ?t - item)
    (damaged ?i - item)
    (paltryed ?i - item ?p - place)
  )

  (:action paltry
    :parameters (?ag - agent ?obj - item ?loc - place)
    :precondition (and
      (at-agent ?ag ?loc)
      (at ?obj ?loc)
      (not (cleaned ?obj))
    )
    :effect (and
      (cleaned ?obj)
      (paltryed ?obj ?loc)
      (not (at ?obj ?loc))
    )
  )

  (:action sip
    :parameters (?ag - agent ?obj - item ?loc - place)
    :precondition (and
      (at-agent ?ag ?loc)
      (at ?obj ?loc)
      (not (consumed ?obj))
    )
    :effect (and
      (sipped ?obj)
      (consumed ?obj)
      (not (at ?obj ?loc))
    )
  )

  (:action clip
    :parameters (?ag - agent ?obj - item ?tool - item)
    :precondition (and
      (at-agent ?ag kitchen)
      (at ?obj kitchen)
      (at ?tool kitchen)
      (not (clipped ?obj))
    )
    :effect (and
      (clipped ?obj)
      (damaged ?tool)
    )
  )

  (:action memory
    :parameters (?ag - agent ?obj - item ?token - item)
    :precondition (and
      (holding ?ag ?token)
    )
    :effect (and
      (remembers ?ag ?obj)
      (not (holding ?ag ?token))
    )
  )

  (:action tightfisted
    :parameters (?ag - agent ?obj - item ?loc - place)
    :precondition (and
      (at-agent ?ag ?loc)
      (at ?obj ?loc)
      (not (hoarded ?obj))
    )
    :effect (and
      (hoarded ?obj)
      (not (at ?obj ?loc))
    )
  )

  (:action wretched
    :parameters (?ag - agent ?obj - item ?tool - item ?loc - place)
    :precondition (and
      (at-agent ?ag ?loc)
      (at ?obj ?loc)
      (at ?tool ?loc)
      (not (wretched_state ?obj ?tool))
    )
    :effect (and
      (wretched_state ?obj ?tool)
      (damaged ?obj)
      (not (at ?obj ?loc))
    )
  )
)