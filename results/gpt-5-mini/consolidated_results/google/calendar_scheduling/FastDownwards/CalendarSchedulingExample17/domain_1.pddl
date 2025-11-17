(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)

  ;; Participants declared as domain-level constants so actions can refer to them directly.
  (:constants
    margaret donna helen - participant
  )

  (:predicates
    (free ?p - participant ?t - timeslot)    ; participant p is free at timeslot t
    (feasible ?t - timeslot)                ; timeslot is feasible (audited intersection / respects preferences)
    (scheduled ?t - timeslot)               ; meeting has been scheduled at timeslot t
  )

  ;; Action: schedule the meeting at a timeslot if that timeslot is audited feasible
  ;; and all required participants are free at that timeslot.
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (feasible ?t)
      (free margaret ?t)
      (free donna ?t)
      (free helen ?t)
      (not (scheduled ?t))
    )
    :effect (and
      (scheduled ?t)
      (not (free margaret ?t))
      (not (free donna ?t))
      (not (free helen ?t))
    )
  )
)