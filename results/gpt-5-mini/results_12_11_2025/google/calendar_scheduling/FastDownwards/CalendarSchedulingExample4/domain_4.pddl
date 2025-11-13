(define (domain calendar-scheduling)
  (:requirements :typing :strips :negative-preconditions)
  (:types participant timeslot)

  (:predicates
    (busy ?p - participant ?s - timeslot)        ; participant p is busy at timeslot s
    (within-work ?s - timeslot)                 ; timeslot s is within the meeting work window
    (scheduled ?s - timeslot)                   ; meeting scheduled at timeslot s
    (assigned ?p - participant ?s - timeslot)   ; participant p is assigned to meeting at s
  )

  ;; Schedules the meeting at a concrete timeslot only if that timeslot is within work hours,
  ;; not already scheduled, and none of the three named participants are busy at that timeslot.
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