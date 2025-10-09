(define (problem CalendarSchedulingExample47)
  (:domain calendar-scheduling)
  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )
  (:init
    ;; Alice: free all slots 0..15
    (free alice s0) (free alice s1) (free alice s2) (free alice s3)
    (free alice s4) (free alice s5) (free alice s6) (free alice s7)
    (free alice s8) (free alice s9) (free alice s10) (free alice s11)
    (free alice s12) (free alice s13) (free alice s14) (free alice s15)

    ;; Daniel: busy 10:00-10:30 (s2), 15:00-16:00 (s12,s13), 16:30-17:00 (s15)
    (free daniel s0) (free daniel s1) (free daniel s3) (free daniel s4)
    (free daniel s5) (free daniel s6) (free daniel s7) (free daniel s8)
    (free daniel s9) (free daniel s10) (free daniel s11) (free daniel s14)

    ;; Scott: busy 09:00-10:00 (s0,s1), 12:00-13:00 (s6,s7), 14:00-14:30 (s10), 16:00-16:30 (s14)
    (free scott s2) (free scott s3) (free scott s4) (free scott s5)
    (free scott s8) (free scott s9) (free scott s11) (free scott s12)
    (free scott s13) (free scott s15)

    ;; Lori: busy 12:30-13:00 (s7), 16:00-16:30 (s14)
    (free lori s0) (free lori s1) (free lori s2) (free lori s3)
    (free lori s4) (free lori s5) (free lori s6) (free lori s8)
    (free lori s9) (free lori s10) (free lori s11) (free lori s12)
    (free lori s13) (free lori s15)

    ;; Cynthia: busy 09:00-09:30 (s0), 11:00-11:30 (s4), 12:00-13:00 (s6,s7),
    ;; 13:30-14:30 (s9,s10), 15:30-16:30 (s13,s14)
    (free cynthia s1) (free cynthia s2) (free cynthia s3) (free cynthia s5)
    (free cynthia s8) (free cynthia s11) (free cynthia s12) (free cynthia s15)

    ;; Jeffrey: busy 09:00-11:30 (s0..s4), 12:00-16:00 (s6..s13), 16:30-17:00 (s15)
    (free jeffrey s5) (free jeffrey s14)

    ;; Hannah: busy 09:00-11:00 (s0,s1,s2), 12:00-12:30 (s6),
    ;; 13:00-15:00 (s8,s9,s10,s11), 16:30-17:00 (s15)
    (free hannah s3) (free hannah s4) (free hannah s5) (free hannah s7)
    (free hannah s12) (free hannah s13) (free hannah s14)
  )
  (:goal (meeting-scheduled))
)