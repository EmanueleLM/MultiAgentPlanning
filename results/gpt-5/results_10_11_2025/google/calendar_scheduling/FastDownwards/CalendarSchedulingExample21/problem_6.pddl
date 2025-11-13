(define (problem calendar-schedulingexample21-ordered-fixed)
  (:domain calendar-meeting-ordered-slots-fixed)
  (:objects
    s-0900-1000 s-1000-1100 - slot
  )
  (:init
    (cursor s-0900-1000)
    (next s-0900-1000 s-1000-1100)

    (slot60 s-0900-1000)
    (slot60 s-1000-1100)
    (within-work s-0900-1000)
    (within-work s-1000-1100)

    (free bobby s-0900-1000)
    (free bobby s-1000-1100)
    (free scott s-0900-1000)
    (free scott s-1000-1100)
    (free kimberly s-0900-1000)
    (free kimberly s-1000-1100)

    (feasible s-0900-1000)
    (feasible s-1000-1100)
  )
  (:goal
    (and
      (scheduled)
    )
  )
)