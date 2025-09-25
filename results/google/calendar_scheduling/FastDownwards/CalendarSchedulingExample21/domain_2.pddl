(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:constants bobby scott kimberly - agent)

  (:predicates
    (free ?a - agent ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (confirmed-bobby ?s - slot)
    (confirmed-scott ?s - slot)
    (confirmed-kimberly ?s - slot)
    (meeting-scheduled)
  )

  (:action confirm-bobby
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (next ?s ?s2) (free bobby ?s) (free bobby ?s2))
    :effect (and (confirmed-bobby ?s))
  )

  (:action confirm-scott
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (next ?s ?s2) (free scott ?s) (free scott ?s2))
    :effect (and (confirmed-scott ?s))
  )

  (:action confirm-kimberly
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (next ?s ?s2) (free kimberly ?s) (free kimberly ?s2))
    :effect (and (confirmed-kimberly ?s))
  )

  (:action finalize-meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (next ?s ?s2) (confirmed-bobby ?s) (confirmed-scott ?s) (confirmed-kimberly ?s))
    :effect (and (meeting-scheduled))
  )
)