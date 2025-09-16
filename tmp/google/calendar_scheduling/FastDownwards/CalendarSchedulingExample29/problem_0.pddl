(define (problem integrated-meeting)
  (:domain meeting-all)
  (:init
     ;; Agent 3 has a feasible 60-minute window at 12:00-13:00 represented by t6 and t7
     (free madison t6) (free madison t7)
     (free diana t6) (free diana t7)
     (free shirley t6) (free shirley t7)
     
     ;; Agent 2 has some busy intervals; these do not block the 12:00-13:00 window
     (busy madison t1100) (busy madison t1300)
     (busy diana t1100) (busy diana t1300)
     (busy shirley t1100) (busy shirley t1300)
     
     ;; (Optional) other times may be free by closed world assumption; not explicitly stated
  )
  (:goal (meeting_scheduled))
)