(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types timeslot participant)

  ;; Predicates:
  ;; (free_heather ?t)    - Heather is free at timeslot ?t
  ;; (free_nicholas ?t)  - Nicholas is free at timeslot ?t
  ;; (free_zachary ?t)   - Zachary is free at timeslot ?t
  ;; (choosable ?t)      - This timeslot is allowed per preference resolution (only preferred pre-14:00 slots are choosable when present)
  ;; (scheduled ?t)      - The meeting has been scheduled at timeslot ?t
  ;; (meeting_scheduled) - A meeting has been scheduled (goal)
  (:predicates
    (free_heather ?t - timeslot)
    (free_nicholas ?t - timeslot)
    (free_zachary ?t - timeslot)
    (choosable ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting_scheduled)
  )

  ;; Single action: schedule meeting at a given timeslot.
  ;; Preconditions enforce that all participants are free at that timeslot.
  ;; Also requires the slot to be marked choosable to enforce the soft preference
  ;; by making the recommended pre-14:00 slot the only choosable one when available.
  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (free_heather ?t)
      (free_nicholas ?t)
      (free_zachary ?t)
      (choosable ?t)
      (not (meeting_scheduled))
    )
    :effect (and
      (scheduled ?t)
      (meeting_scheduled)
    )
  )
)