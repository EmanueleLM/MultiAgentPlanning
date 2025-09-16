(define (problem schedule-monday-merged)
  (:domain integrated-meeting)
  (:objects
     t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time-slot
     P1 P2 P3 P4 P5 - participant
     alice bob - person
  )
  (:init
     (a1_busy P1 t0930)
     (a1_busy P1 t1000)
     (a1_busy P2 t1330)
     (a1_busy P3 t1430)
     (a1_busy P4 t1530)
     (a1_busy P5 t1630)

     (a2_work_time t0900) (a2_work_time t0930) (a2_work_time t1000) (a2_work_time t1030)
     (a2_work_time t1100) (a2_work_time t1130) (a2_work_time t1200) (a2_work_time t1230)
     (a2_work_time t1300) (a2_work_time t1330) (a2_work_time t1400) (a2_work_time t1430)
     (a2_work_time t1500) (a2_work_time t1530) (a2_work_time t1600) (a2_work_time t1630)

     (a2_free alice t0900) (a2_free alice t0930) (a2_free alice t1000) (a2_free alice t1030)
     (a2_free alice t1100) (a2_free alice t1130) (a2_free alice t1200) (a2_free alice t1230)
     (a2_free alice t1300) (a2_free alice t1330) (a2_free alice t1400) (a2_free alice t1430)
     (a2_free alice t1500) (a2_free alice t1530) (a2_free alice t1600) (a2_free alice t1630)

     (a2_free bob t0900) (a2_free bob t0930) (a2_free bob t1000) (a2_free bob t1030)
     (a2_free bob t1100) (a2_free bob t1130) (a2_free bob t1200) (a2_free bob t1230)
     (a2_free bob t1300) (a2_free bob t1330) (a2_free bob t1400) (a2_free bob t1430)
     (a2_free bob t1500) (a2_free bob t1530) (a2_free bob t1600) (a2_free bob t1630)

     (a3_available t1000)
     (a3_available t1230)
  )
  (:goal (exists (?t - time-slot)
           (and
             (a1_meeting_scheduled ?t)
             (a2_meeting_scheduled ?t)
             (a3_meeting_at ?t)
           )))
)