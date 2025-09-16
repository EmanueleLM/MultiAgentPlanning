(define (problem monday-30min-meeting-merged)
  (:domain meeting-scheduler-merged)

  (:init
     ; All three participants are available at 12:00-12:30 (t1200) for the merged scheduling
     (available kathryn t1200)
     (available charlotte t1200)
     (available lauren t1200)
  )

  (:goal (meeting_at t1200))
)