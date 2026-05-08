(define (domain calendar-scheduling)
  (:requirements :typing :strips :negative-preconditions :existential-preconditions)
  (:types participant timeslot)

  (:predicates
    (busy ?p - participant ?s - timeslot)
    (within_work ?s - timeslot)
    (scheduled ?s - timeslot)
    (invited ?p - participant)
    (assigned ?p - participant ?s - timeslot)
  )

  ;; Schedule the meeting at a given timeslot if the slot is within work hours,
  ;; not already scheduled, all participants are invited, and none are busy at that slot.
  (:action schedule-at-slot
    :parameters (?s - timeslot)
    :precondition (and
      (within_work ?s)
      (not (scheduled ?s))
      (invited donna) (invited john) (invited billy)
      (not (busy donna ?s)) (not (busy john ?s)) (not (busy billy ?s))
    )
    :effect (and
      (scheduled ?s)
      (assigned donna ?s)
      (assigned john ?s)
      (assigned billy ?s)
    )
  )
)