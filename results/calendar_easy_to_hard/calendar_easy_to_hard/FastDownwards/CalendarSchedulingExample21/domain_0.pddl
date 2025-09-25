(define (domain meeting-scheduling-multiagent)
  (:requirements :strips :typing)
  (:types agent time)

  (:predicates
    (available ?ag - agent ?t - time)            ; agent is free for this 30-min slot
    (succ ?t - time ?t2 - time)                  ; t2 is the next 30-min slot after t
    (reserved-by-bobby ?t - time)                ; bobby reserved meeting starting at t
    (reserved-by-scott ?t - time)                ; scott reserved meeting starting at t
    (reserved-by-kimberly ?t - time)             ; kimberly reserved meeting starting at t
    (meeting-scheduled)
  )

  ;; Bobby chooses a start time (requires he is available in both consecutive 30-min slots)
  (:action bobby-select
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (available bobby ?t)
      (available bobby ?t2)
      (succ ?t ?t2)
    )
    :effect (reserved-by-bobby ?t)
  )

  ;; Scott chooses a start time (requires he is available in both consecutive 30-min slots)
  (:action scott-select
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (available scott ?t)
      (available scott ?t2)
      (succ ?t ?t2)
    )
    :effect (reserved-by-scott ?t)
  )

  ;; Kimberly chooses a start time (requires she is available in both consecutive 30-min slots)
  (:action kimberly-select
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (available kimberly ?t)
      (available kimberly ?t2)
      (succ ?t ?t2)
    )
    :effect (reserved-by-kimberly ?t)
  )

  ;; Confirm the meeting once all three agents reserved the same start time
  (:action confirm-meeting
    :parameters (?t - time)
    :precondition (and
      (reserved-by-bobby ?t)
      (reserved-by-scott ?t)
      (reserved-by-kimberly ?t)
    )
    :effect (meeting-scheduled)
  )
)