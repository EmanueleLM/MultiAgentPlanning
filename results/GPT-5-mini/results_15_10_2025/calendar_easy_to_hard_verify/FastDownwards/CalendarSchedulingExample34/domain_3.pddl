(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)
  (:constants christine janice bobby elizabeth tyler edward - person)
  (:predicates
    (busy ?p - person ?s - slot)
    (preferred ?s - slot)
    (scheduled ?s - slot)
    (scheduled-preferred)
    (meeting-scheduled)
  )

  (:action schedule-preferred
    :parameters (?s - slot)
    :precondition (and
      (preferred ?s)
      (not (busy christine ?s))
      (not (busy janice ?s))
      (not (busy bobby ?s))
      (not (busy elizabeth ?s))
      (not (busy tyler ?s))
      (not (busy edward ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
      (scheduled-preferred)
    )
  )

  (:action schedule-nonpreferred
    :parameters (?s - slot)
    :precondition (and
      (not (preferred ?s))
      (not (busy christine ?s))
      (not (busy janice ?s))
      (not (busy bobby ?s))
      (not (busy elizabeth ?s))
      (not (busy tyler ?s))
      (not (busy edward ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)