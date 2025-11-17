(define (domain calendar-scheduling)
  (:requirements :typing :strips :negative-preconditions)
  (:types participant timeslot)

  (:predicates
    (busy ?p - participant ?t - timeslot)
    (within-work ?t - timeslot)
    (scheduled ?t - timeslot)
    (assigned ?p - participant ?t - timeslot)
  )

  ;; This action schedules the required 30-minute meeting at a single timeslot.
  ;; It enforces contiguous occupancy by marking the timeslot as scheduled and
  ;; assigning each required participant. The participants are referenced by
  ;; their object names to make the three required participants explicit.
  (:action schedule-meeting-at-slot
    :parameters (?t - timeslot)
    :precondition (and
      (within-work ?t)
      (not (scheduled ?t))
      (not (busy p_donna ?t))
      (not (busy p_john ?t))
      (not (busy p_billy ?t))
    )
    :effect (and
      (scheduled ?t)
      (assigned p_donna ?t)
      (assigned p_john ?t)
      (assigned p_billy ?t)
    )
  )
)