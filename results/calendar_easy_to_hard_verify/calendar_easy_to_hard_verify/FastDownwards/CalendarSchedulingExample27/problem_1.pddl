(define (problem CalendarSchedulingExample27-problem)
  (:domain calendar-scheduling)
  (:init
    ;; Walter: free all slots
    (free walter s1) (free walter s2) (free walter s3) (free walter s4)
    (free walter s5) (free walter s6) (free walter s7) (free walter s8)
    (free walter s9) (free walter s10) (free walter s11) (free walter s12)
    (free walter s13) (free walter s14) (free walter s15) (free walter s16)

    ;; Danielle: free all slots
    (free danielle s1) (free danielle s2) (free danielle s3) (free danielle s4)
    (free danielle s5) (free danielle s6) (free danielle s7) (free danielle s8)
    (free danielle s9) (free danielle s10) (free danielle s11) (free danielle s12)
    (free danielle s13) (free danielle s14) (free danielle s15) (free danielle s16)

    ;; Julia: busy 09:30-10:00 (s2), 10:30-11:00 (s4), 13:30-14:00 (s10), 16:00-16:30 (s15)
    ;; therefore free: s1, s3, s5, s6, s7, s8, s9, s11, s12, s13, s14, s16
    (free julia s1) (free julia s3) (free julia s5) (free julia s6)
    (free julia s7) (free julia s8) (free julia s9) (free julia s11)
    (free julia s12) (free julia s13) (free julia s14) (free julia s16)

    ;; Samuel: busy 09:00-11:00 (s1-s4), 11:30-12:30 (s6-s7), 13:00-14:30 (s9-s11), 15:00-15:30 (s13), 16:00-17:00 (s15-s16)
    ;; therefore free: s5, s8, s12, s14
    (free samuel s5) (free samuel s8) (free samuel s12) (free samuel s14)

    ;; Lori: busy 10:00-10:30 (s3), 11:00-11:30 (s5), 12:00-12:30 (s7), 13:00-14:30 (s9-s11), 15:00-17:00 (s13-s16)
    ;; therefore free: s1, s2, s4, s6, s8, s12
    (free lori s1) (free lori s2) (free lori s4) (free lori s6) (free lori s8) (free lori s12)
  )
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)