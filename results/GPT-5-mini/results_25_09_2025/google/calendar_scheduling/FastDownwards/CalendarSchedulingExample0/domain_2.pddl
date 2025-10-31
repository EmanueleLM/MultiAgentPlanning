(define (domain multi-agent-meeting)
  (:requirements :strips :typing)
  (:types agent slot)
  (:constants michelle steven jerry - agent)

  (:predicates
    (available ?a - agent ?s - slot)
    (agreed ?a - agent ?s - slot)
    (meeting ?s - slot)
  )

  (:action michelle-agree
    :parameters (?s - slot)
    :precondition (available michelle ?s)
    :effect (agreed michelle ?s)
  )

  (:action steven-agree
    :parameters (?s - slot)
    :precondition (available steven ?s)
    :effect (agreed steven ?s)
  )

  (:action jerry-agree
    :parameters (?s - slot)
    :precondition (available jerry ?s)
    :effect (agreed jerry ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (agreed michelle ?s) (agreed steven ?s) (agreed jerry ?s))
    :effect (meeting ?s)
  )
)