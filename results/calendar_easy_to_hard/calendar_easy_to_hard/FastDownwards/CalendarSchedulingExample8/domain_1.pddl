(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types agent slot day duration)
  (:constants adam jerry matthew - agent)
  (:predicates
    (slot ?s - slot)
    (agent ?a - agent)
    (available ?a - agent ?s - slot)
    (agreed ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
    (day ?d - day)
    (meeting-duration ?n - duration)
  )

  (:action adam-agree
    :parameters (?s - slot)
    :precondition (available adam ?s)
    :effect (agreed adam ?s)
  )

  (:action jerry-agree
    :parameters (?s - slot)
    :precondition (available jerry ?s)
    :effect (agreed jerry ?s)
  )

  (:action matthew-agree
    :parameters (?s - slot)
    :precondition (available matthew ?s)
    :effect (agreed matthew ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (agreed adam ?s) (agreed jerry ?s) (agreed matthew ?s))
    :effect (meeting-scheduled ?s)
  )
)