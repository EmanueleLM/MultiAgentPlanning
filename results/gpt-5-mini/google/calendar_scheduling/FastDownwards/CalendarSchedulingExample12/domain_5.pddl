(define (domain schedule_meeting)
  (:requirements :strips :typing)
  (:types person slot meeting)

  (:predicates
    (available ?p - person ?s - slot)         ; person is free for this 30-min slot
    (unscheduled ?m - meeting)               ; meeting not yet scheduled
    (scheduled ?m - meeting)                 ; meeting scheduled
    (scheduled_at ?m - meeting ?s - slot)    ; meeting scheduled starting at slot ?s
    (next ?s1 - slot ?s2 - slot)             ; ?s2 immediately follows ?s1 (next half-hour)
  )

  (:action schedule
    :parameters (?m - meeting ?s - slot ?t - slot)
    :precondition (and
      (unscheduled ?m)
      (next ?s ?t)

      ;; require both half-hour slots free for every required participant
      (available david ?s)
      (available david ?t)

      (available debra ?s)
      (available debra ?t)

      (available kevin ?s)
      (available kevin ?t)
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled ?m)
      (scheduled_at ?m ?s)

      ;; consume those two half-hour slots for each participant (meeting occupies them)
      (not (available david ?s))
      (not (available david ?t))

      (not (available debra ?s))
      (not (available debra ?t))

      (not (available kevin ?s))
      (not (available kevin ?t))
    )
  )
)