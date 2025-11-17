(define (domain schedule-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (within_work_hours ?t - timeslot)
    (scheduled ?t - timeslot)
  )

  ;; Schedule the fixed meeting requiring all three named participants to be available
  ;; for the chosen contiguous 30-minute timeslot. The action marks the timeslot as
  ;; scheduled and removes those availability facts so the timeslot cannot be reused.
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (within_work_hours ?t)
      (available scott ?t)
      (available gabriel ?t)
      (available christine ?t)
      (not (scheduled ?t))
    )
    :effect (and
      (scheduled ?t)
      (not (available scott ?t))
      (not (available gabriel ?t))
      (not (available christine ?t))
    )
  )
)