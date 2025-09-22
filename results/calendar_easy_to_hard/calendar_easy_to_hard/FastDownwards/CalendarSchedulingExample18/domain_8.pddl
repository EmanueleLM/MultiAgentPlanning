(define (domain combined-schedule)
  (:requirements :typing :negative-preconditions)
  (:types slot person)

  (:predicates
    (within-work-hours ?s - slot)
    (slot-free ?s - slot)
    (busy ?p - person ?s - slot)
    (meeting-booked)
    (meeting-at ?s - slot)
    (attends ?p - person ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (within-work-hours ?s)
      (slot-free ?s)
      (not (meeting-booked))
      (not (busy brian ?s))
      (not (busy billy ?s))
      (not (busy patricia ?s))
    )
    :effect (and
      (meeting-booked)
      (meeting-at ?s)
      (attends brian ?s)
      (attends billy ?s)
      (attends patricia ?s)
      (not (slot-free ?s))
    )
  )
)