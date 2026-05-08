(define (domain calendar_scheduling_example39)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)
  (:predicates
    (busy ?p - person ?t - time_slot)
    (work_slot ?t - time_slot)
    (meeting_unscheduled)
    (meeting_at ?t - time_slot)
  )

  ;; This action is specific to this instance: the meeting must include
  ;; emily, victoria, and nancy. We hardcode those participants so a plan
  ;; cannot schedule the meeting with the same person repeated.
  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and
      (meeting_unscheduled)
      (work_slot ?t)
      (not (busy emily ?t))
      (not (busy victoria ?t))
      (not (busy nancy ?t))
    )
    :effect (and
      (meeting_at ?t)
      (not (meeting_unscheduled))
    )
  )
)