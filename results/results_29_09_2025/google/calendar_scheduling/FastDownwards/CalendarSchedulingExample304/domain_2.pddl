(define (domain calendar-scheduling)
  (:requirements :strips :negative-preconditions :typing :action-costs)
  (:types participant slot)
  (:predicates
    (busy ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
    (before13 ?s - slot)
  )
  (:action schedule-before13
    :parameters (?s - slot)
    :precondition (and
      (before13 ?s)
      (not (busy christine ?s))
      (not (busy janice ?s))
      (not (busy bobby ?s))
      (not (busy elizabeth ?s))
      (not (busy tyler ?s))
      (not (busy edward ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
    :cost 0
  )
  (:action schedule-after13
    :parameters (?s - slot)
    :precondition (and
      (not (before13 ?s))
      (not (busy christine ?s))
      (not (busy janice ?s))
      (not (busy bobby ?s))
      (not (busy elizabeth ?s))
      (not (busy tyler ?s))
      (not (busy edward ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
    :cost 1
  )
)