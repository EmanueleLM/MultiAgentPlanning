(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    person
    time_slot
  )
  (:constants thomas dylan jerry - person)
  (:predicates
    (available ?p - person ?s - time_slot)
    (meeting_scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (available thomas ?s)
      (available dylan ?s)
      (available jerry ?s)
    )
    :effect (meeting_scheduled ?s)
  )