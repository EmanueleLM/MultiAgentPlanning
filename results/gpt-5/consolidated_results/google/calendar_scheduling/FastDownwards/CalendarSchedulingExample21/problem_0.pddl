(define (problem monday-meeting-0900-1700-one-hour)
  (:domain meeting-choice)
  (:objects
    bobby scott kimberly - participant
    s-0900-1000 s-1000-1100 - slot
  )
  (:init
    ; Ordering pointer ensures earliest-feasible selection
    (current s-0900-1000)
    (next s-0900-1000 s-1000-1100)

    ; Meeting not yet scheduled
    (unscheduled)

    ; Slot properties: both are one hour and within work hours (09:00-17:00)
    (slot60 s-0900-1000)
    (slot60 s-1000-1100)
    (within-work s-0900-1000)
    (within-work s-1000-1100)

    ; Participants' free facts for candidate slots (auditor-approved only)
    (free bobby s-0900-1000)
    (free bobby s-1000-1100)

    (free scott s-0900-1000)
    (free scott s-1000-1100)

    (free kimberly s-0900-1000)
    (free kimberly s-1000-1100)

    ; Precomputed feasibility for “all participants free” on each candidate slot
    (all-free s-0900-1000)
    (all-free s-1000-1100)
  )
  (:goal
    (and
      (scheduled)
    )
  )
)