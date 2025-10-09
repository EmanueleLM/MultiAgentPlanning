(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types slot agent)
  (:predicates
    (free ?s - slot ?a - agent)
    (meeting-scheduled)
    (chosen-slot ?s - slot)
  )

  (:action choose
    :parameters (?s - slot)
    :precondition (and (free ?s donna) (free ?s john) (free ?s billy))
    :effect (and (meeting-scheduled) (chosen-slot ?s))
  )
)