(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:constants diane kelly deborah - person)

  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (available ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action schedule-meeting-diane-kelly-deborah
    :parameters (?s - slot)
    :precondition (and
      (available diane ?s)
      (available kelly ?s)
      (available deborah ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)