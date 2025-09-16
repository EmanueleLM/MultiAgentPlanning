(define (problem integrated-meeting)
  (:domain meeting-all)
  (:init
     ; Madison free times
     (free madison t0900) (free madison t1000) (free madison t1030) (free madison t1100)
     (free madison t1200) (free madison t1230) (free madison t1300) (free madison t1330)
     (free madison t1400) (free madison t1430) (free madison t1500) (free madison t1530)
     (free madison t1600) (free madison t1630)

     ; Madison busy times
     (busy madison t0930) (busy madison t1130)

     ; Diana free times
     (free diana t0900) (free diana t0930) (free diana t1000) (free diana t1030)
     (free diana t1100) (free diana t1200) (free diana t1130) (free diana t1230)
     (free diana t1300) (free diana t1330) (free diana t1400) (free diana t1430)
     (free diana t1500) (free diana t1530) (free diana t1600) (free diana t1630)

     ; Diana busy times
     (busy diana t1100) (busy diana t1300)

     ; Shirley free times
     (free shirley t1200) (free shirley t1230) (free shirley t1300) (free shirley t1500)

     ; Shirley busy times
     (busy shirley t0900) (busy shirley t0930) (busy shirley t1000) (busy shirley t1030)
     (busy shirley t1100) (busy shirley t1130) (busy shirley t1330) (busy shirley t1400)
     (busy shirley t1430) (busy shirley t1530) (busy shirley t1600) (busy shirley t1630)
  )
  (:goal (meeting_scheduled))
)