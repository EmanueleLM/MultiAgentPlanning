(define (problem meeting-planning-23)
  (:domain meeting-scheduler)
  (:init
    (at bayview)
    (can-travel bayview russian-hill)
    (time-is T540) ; Start time 9:00 AM
    (meeting-75-required) 
  )

  (:goal
    (and
      (john-met)
    )
  )
)