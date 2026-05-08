(define (domain calendar_scheduling_example39)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)

  (:predicates
    (busy ?p - person ?t - time_slot)
    (work_slot ?t - time_slot)
    (meeting_unscheduled)
    (meeting_at ?t - time_slot)
  )

  ;; Schedule a meeting for three participants at a given time slot.
  ;; Preconditions: meeting still unscheduled, slot is within working hours,
  ;; and each participant is not busy at that slot.
  (:action schedule_meeting
    :parameters (?t - time_slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (meeting_unscheduled)
      (work_slot ?t)
      (not (busy ?p1 ?t))
      (not (busy ?p2 ?t))
      (not (busy ?p3 ?t))
    )
    :effect (and
      (meeting_at ?t)
      (not (meeting_unscheduled))
    )
  )
)