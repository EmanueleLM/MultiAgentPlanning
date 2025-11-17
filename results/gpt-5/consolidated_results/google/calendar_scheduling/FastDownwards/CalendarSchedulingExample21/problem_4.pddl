(define (problem calendar-schedulingexample21-ordered)
  (:domain calendar-meeting-ordered-slots)
  (:objects
    bobby scott kimberly - participant
    s-0900-1000 s-1000-1100 - slot
  )
  (:init
    ; ordered slot chain (earliest to latest)
    (cursor s-0900-1000)
    (next s-0900-1000 s-1000-1100)

    ; slot properties (duration and within work window)
    (slot60 s-0900-1000)
    (slot60 s-1000-1100)
    (within-work s-0900-1000)
    (within-work s-1000-1100)

    ; attendees
    (attendee bobby)
    (attendee scott)
    (attendee kimberly)

    ; distinctness relations
    (distinct bobby scott)
    (distinct bobby kimberly)
    (distinct scott bobby)
    (distinct scott kimberly)
    (distinct kimberly bobby)
    (distinct kimberly scott)

    ; availability (all three are free on both candidate slots)
    (free bobby s-0900-1000)
    (free bobby s-1000-1100)
    (free scott s-0900-1000)
    (free scott s-1000-1100)
    (free kimberly s-0900-1000)
    (free kimberly s-1000-1100)

    ; feasibility summary used to prevent advancing past the earliest feasible slot
    (feasible s-0900-1000)
    (feasible s-1000-1100)
  )
  (:goal
    (and
      (scheduled)
    )
  )
)