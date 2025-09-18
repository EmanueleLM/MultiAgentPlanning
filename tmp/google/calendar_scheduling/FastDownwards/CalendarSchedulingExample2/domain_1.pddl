(define (domain multi-agent-meeting)
  (:requirements :strips :typing)
  (:types slot)
  (:predicates
    (slot ?s - slot)
    (free-roy ?s - slot)
    (free-kathryn ?s - slot)
    (free-amy ?s - slot)
    (scheduled-roy ?s - slot)
    (scheduled-kathryn ?s - slot)
    (scheduled-amy ?s - slot)
    (meeting-scheduled ?s - slot)
    (preferred-amy ?s - slot)
    (meeting-confirmed)
  )

  (:action roy_schedule
    :parameters (?s - slot)
    :precondition (free-roy ?s)
    :effect (and (scheduled-roy ?s) (not (free-roy ?s)))
  )

  (:action kathryn_schedule
    :parameters (?s - slot)
    :precondition (free-kathryn ?s)
    :effect (and (scheduled-kathryn ?s) (not (free-kathryn ?s)))
  )

  (:action amy_schedule
    :parameters (?s - slot)
    :precondition (free-amy ?s)
    :effect (and (scheduled-amy ?s) (not (free-amy ?s)))
  )

  (:action confirm_meeting
    :parameters (?s - slot)
    :precondition (and (scheduled-roy ?s) (scheduled-kathryn ?s) (scheduled-amy ?s))
    :effect (and (meeting-scheduled ?s) (meeting-confirmed))
  )
)