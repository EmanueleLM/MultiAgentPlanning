(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (free ?p - participant ?t - timeslot)    ; participant ?p is free at timeslot ?t
    (before_noon ?t - timeslot)              ; timeslot occurs before 12:00
    (meeting_scheduled)                      ; a meeting has been scheduled
    (scheduled_at ?t - timeslot)             ; meeting is scheduled at timeslot ?t
  )

  (:action schedule-meeting
    :parameters (?a - participant ?b - participant ?c - participant ?t - timeslot)
    :precondition (and
      (free ?a ?t)
      (free ?b ?t)
      (free ?c ?t)
      (before_noon ?t)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?t)
      (not (free ?a ?t))
      (not (free ?b ?t))
      (not (free ?c ?t))
    )
  )
)