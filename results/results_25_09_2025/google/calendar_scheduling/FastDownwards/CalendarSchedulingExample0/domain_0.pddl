(define (domain multi-agent-meeting)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)   ; agent is available for the full 60-min slot ?s
    (agreed ?a - agent ?s - slot)      ; agent has agreed to slot ?s
    (meeting ?s - slot)                ; meeting scheduled at slot ?s
  )

  ;; Distinct actions for each agent to indicate their agreement to a specific slot
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

  ;; Finalize the meeting once all three have agreed on the same slot
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (agreed michelle ?s) (agreed steven ?s) (agreed jerry ?s))
    :effect (meeting ?s)
  )
)