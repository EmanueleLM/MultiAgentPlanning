(define (domain calendar-scheduling)
  (:requirements :typing :strips :negative-preconditions)
  (:types participant timeslot)

  (:predicates
    (busy ?p - participant ?s - timeslot)
    (within-work ?s - timeslot)
    (scheduled ?s - timeslot)
    (assigned ?p - participant ?s - timeslot)
    (next ?s1 - timeslot ?s2 - timeslot)
  )

  ;; This action schedules the required 30-minute meeting at a single timeslot.
  ;; It is written specifically for the three known participants to enforce
  ;; that all three must be free at the chosen timeslot (no parameter repetition).
  (:action schedule-meeting-at-slot
    :parameters (?s - timeslot)
    :precondition (and
      (within-work ?s)
      (not (scheduled ?s))
      (not (busy donna ?s))
      (not (busy john ?s))
      (not (busy billy ?s))
    )
    :effect (and
      (scheduled ?s)
      (assigned donna ?s)
      (assigned john ?s)
      (assigned billy ?s)
    )
  )
)