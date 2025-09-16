(define (problem integrated-meeting)
  (:domain meeting-all)
  (:init
     (free madison t6) (free madison t7)
     (free diana   t6) (free diana   t7)
     (free shirley t6) (free shirley t7)

     (busy madison t1100) (busy madison t1300)
     (busy diana   t1100) (busy diana   t1300)
     (busy shirley t1100) (busy shirley t1300)
  )
  (:goal (meeting_scheduled))
)