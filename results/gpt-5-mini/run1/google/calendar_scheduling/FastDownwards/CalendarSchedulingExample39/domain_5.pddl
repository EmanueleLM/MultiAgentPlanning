(define (domain calendar_scheduling_example39)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)

  (:predicates
    (busy ?p - person ?t - time_slot)
    (work_slot ?t - time_slot)
    (meeting_unscheduled)
    (meeting_at ?t - time_slot)
  )

  ;; Schedule a meeting for the three specific participants (emily, victoria, nancy).
  ;; This action no longer takes person parameters to prevent trivial solutions that
  ;; reuse the same person object multiple times. It requires that each real
  ;; participant is not busy at the chosen slot.
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