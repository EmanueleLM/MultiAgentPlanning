(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:constants jason william frances rachel - agent)
  (:predicates
    (free ?a - agent ?s - slot)
    (attended ?a - agent ?s - slot)
    (scheduled ?s - slot)
  )

  (:action attend-jason
    :parameters (?s - slot)
    :precondition (free jason ?s)
    :effect (attended jason ?s)
  )

  (:action attend-william
    :parameters (?s - slot)
    :precondition (free william ?s)
    :effect (attended william ?s)
  )

  (:action attend-frances
    :parameters (?s - slot)
    :precondition (free frances ?s)
    :effect (attended frances ?s)
  )

  (:action attend-rachel
    :parameters (?s - slot)
    :precondition (free rachel ?s)
    :effect (attended rachel ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and
      (attended jason ?s)
      (attended william ?s)
      (attended frances ?s)
      (attended rachel ?s)
    )
    :effect (scheduled ?s)
  )
)