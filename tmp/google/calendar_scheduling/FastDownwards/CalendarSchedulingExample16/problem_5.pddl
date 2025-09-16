(define (problem schedule-monday-merged)
  (:domain integrated-meeting)
  (:objects
     t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time-slot
     p1 p2 p3 p4 p5 - participant
  )
  (:init
     (a1_busy p1 t0930)
     (a1_busy p2 t1330)
     (a1_busy p3 t1430)
     (a1_busy p4 t1530)
     (a1_busy p5 t1630)

     (a2_work_time t0900) (a2_work_time t0930) (a2_work_time t1000) (a2_work_time t1030)
     (a2_work_time t1100) (a2_work_time t1130) (a2_work_time t1200) (a2_work_time t1230)
     (a2_work_time t1300) (a2_work_time t1330) (a2_work_time t1400) (a2_work_time t1430)
     (a2_work_time t1500) (a2_work_time t1530) (a2_work_time t1600) (a2_work_time t1630)

     (a2_free p1 t0900) (a2_free p1 t0930) (a2_free p1 t1000) (a2_free p1 t1030)
     (a2_free p1 t1100) (a2_free p1 t1130) (a2_free p1 t1200) (a2_free p1 t1230)
     (a2_free p1 t1300) (a2_free p1 t1330) (a2_free p1 t1400) (a2_free p1 t1430)
     (a2_free p1 t1500) (a2_free p1 t1530) (a2_free p1 t1600) (a2_free p1 t1630)

     (a2_free p2 t0900) (a2_free p2 t0930) (a2_free p2 t1000) (a2_free p2 t1030)
     (a2_free p2 t1100) (a2_free p2 t1130) (a2_free p2 t1200) (a2_free p2 t1230)
     (a2_free p2 t1300) (a2_free p2 t1330) (a2_free p2 t1400) (a2_free p2 t1430)
     (a2_free p2 t1500) (a2_free p2 t1530) (a2_free p2 t1600) (a2_free p2 t1630)

     (a2_free p3 t0900) (a2_free p3 t0930) (a2_free p3 t1000) (a2_free p3 t1030)
     (a2_free p3 t1100) (a2_free p3 t1130) (a2_free p3 t1200) (a2_free p3 t1230)
     (a2_free p3 t1300) (a2_free p3 t1330) (a2_free p3 t1400) (a2_free p3 t1430)
     (a2_free p3 t1500) (a2_free p3 t1530) (a2_free p3 t1600) (a2_free p3 t1630)

     (a2_free p4 t0900) (a2_free p4 t0930) (a2_free p4 t1000) (a2_free p4 t1030)
     (a2_free p4 t1100) (a2_free p4 t1130) (a2_free p4 t1200) (a2_free p4 t1230)
     (a2_free p4 t1300) (a2_free p4 t1330) (a2_free p4 t1400) (a2_free p4 t1430)
     (a2_free p4 t1500) (a2_free p4 t1530) (a2_free p4 t1600) (a2_free p4 t1630)

     (a2_free p5 t0900) (a2_free p5 t0930) (a2_free p5 t1000) (a2_free p5 t1030)
     (a2_free p5 t1100) (a2_free p5 t1130) (a2_free p5 t1200) (a2_free p5 t1230)
     (a2_free p5 t1300) (a2_free p5 t1330) (a2_free p5 t1400) (a2_free p5 t1430)
     (a2_free p5 t1500) (a2_free p5 t1530) (a2_free p5 t1600) (a2_free p5 t1630)

     (a3_available t1000)
     (a3_available t1230)
  )
  (:goal (and
     (a1_meeting_scheduled t1000)
     (a2_meeting_scheduled t1000)
     (a3_meeting_at t1000)
  ))
)