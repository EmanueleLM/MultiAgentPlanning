(define (domain multi-agent-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:constants roy kathryn amy - agent)

  (:predicates
    (free ?a - agent ?s - slot)
    (accepted ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
    (finalized)
  )

  (:action roy-accept
    :parameters (?s - slot)
    :precondition (and (free roy ?s))
    :effect (and (accepted roy ?s)
                 (not (free roy ?s)))
  )

  (:action kathryn-accept
    :parameters (?s - slot)
    :precondition (and (free kathryn ?s))
    :effect (and (accepted kathryn ?s)
                 (not (free kathryn ?s)))
  )

  (:action amy-accept
    :parameters (?s - slot)
    :precondition (and (free amy ?s))
    :effect (and (accepted amy ?s)
                 (not (free amy ?s)))
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (accepted roy ?s) (accepted kathryn ?s) (accepted amy ?s) (not (finalized)))
    :effect (and (meeting-scheduled ?s) (finalized))
  )
)