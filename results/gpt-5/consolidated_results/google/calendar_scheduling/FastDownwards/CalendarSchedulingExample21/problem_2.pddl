(define (problem calendar-schedulingexample21)
  (:domain meeting-choice-earliest)
  (:objects
    bobby scott kimberly - participant
    s-0900-1000 s-1000-1100 - slot
  )
  (:init
    ; Earliest-first ordering over auditor-approved candidate slots
    (current s-0900-1000)
    (next s-0900-1000 s-1000-1100)

    ; Meeting not yet scheduled
    (unscheduled)

    ; Slot properties: both are exactly 60 minutes and within Monday 09:00-17:00
    (slot60 s-0900-1000)
    (slot60 s-1000-1100)
    (within-work s-0900-1000)
    (within-work s-1000-1100)

    ; Participants' availability on candidate slots (auditor-approved)
    (free bobby s-0900-1000)
    (free bobby s-1000-1100)

    (free scott s-0900-1000)
    (free scott s-1000-1100)

    (free kimberly s-0900-1000)
    (free kimberly s-1000-1100)

    ; Precomputed feasibility: all participants are free on each candidate slot
    (all-free s-0900-1000)
    (all-free s-1000-1100)
  )
  (:goal
    (and
      (scheduled)
    )
  )
)