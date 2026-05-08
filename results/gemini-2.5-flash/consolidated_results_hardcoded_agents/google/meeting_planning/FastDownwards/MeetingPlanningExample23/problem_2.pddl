(define (problem meeting-planning-23-temporal)
  (:domain meeting-scheduler-temporal)

  (:init
    (at bayview)
    (= (current-time) 540) ; 9:00 AM
    (= (john-met-duration) 0)
  )

  (:goal
    (and
      (john-meeting-completed)
      (>= (john-met-duration) 75)
    )
  )

  ; Metric: Minimize the final time (current-time) to complete the required meeting, 
  ; ensuring the optimal schedule uses exactly 75 minutes for John starting at 1050.
  (:metric minimize (current-time))
)