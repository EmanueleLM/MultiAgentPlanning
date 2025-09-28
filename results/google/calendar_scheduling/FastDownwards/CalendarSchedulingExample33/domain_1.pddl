(define (domain meeting-schedule)
  (:requirements :typing :strips)
  (:types person slot)
  (:constants theresa alexander virginia lisa natalie victoria - person)
  (:predicates
    (available ?p - person ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (available theresa ?s)
      (available alexander ?s)
      (available virginia ?s)
      (available lisa ?s)
      (available natalie ?s)
      (available victoria ?s)
    )
    :effect (meeting-scheduled ?s)
  )
)