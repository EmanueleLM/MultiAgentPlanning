(define (domain calendar_scheduling_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:constants jeffrey virginia melissa - participant)
  (:predicates
    (work_slot ?s - slot)
    (before_14 ?s - slot)
    (busy ?p - participant ?s - slot)
    (meeting_scheduled)
    (meeting_at ?s - slot)
    (meeting_before_14)
  )

  ;; Schedule a 30-minute meeting for Jeffrey, Virginia and Melissa at a single slot.
  ;; Preconditions enforce the slot is a work slot, the chosen slot starts before 14:00
  ;; (Melissa's soft preference treated here as a hard constraint to match the requested goal),
  ;; the meeting has not already been scheduled, and all three participants are free at that slot.
  (:action schedule_meeting_jeffrey_virginia_melissa
    :parameters (?s - slot)
    :precondition (and
      (work_slot ?s)
      (before_14 ?s)
      (not (meeting_scheduled))
      (not (busy jeffrey ?s))
      (not (busy virginia ?s))
      (not (busy melissa ?s))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?s)
      (busy jeffrey ?s)
      (busy virginia ?s)
      (busy melissa ?s)
      (meeting_before_14)
    )
  )
)