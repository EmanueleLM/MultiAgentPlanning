(define (problem schedule_monday)
  (:domain calendar_scheduling)
  (:objects 
    julie sean lori - person
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    ;; Timeline: s1 (9:00) to s16 (16:30-17:00)
    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6)
    (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11)
    (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16)

    ;; Julie Busy: 9:00-9:30 (s1), 11:00-11:30 (s5), 12:00-12:30 (s7), 13:30-14:00 (s10), 16:00-17:00 (s15, s16)
    ;; Julie Free: s2, s3, s4, s6, s8, s9, s11, s12, s13, s14
    (is_free julie s2) (is_free julie s3) (is_free julie s4) (is_free julie s6) (is_free julie s8)
    (is_free julie s9) (is_free julie s11) (is_free julie s12) (is_free julie s13) (is_free julie s14)

    ;; Sean Busy: 9:00-9:30 (s1), 13:00-13:30 (s9), 15:00-15:30 (s13), 16:00-16:30 (s15)
    ;; Sean Free: s2, s3, s4, s5, s6, s7, s8, s10, s11, s12, s14, s16
    (is_free sean s2) (is_free sean s3) (is_free sean s4) (is_free sean s5) (is_free sean s6)
    (is_free sean s7) (is_free sean s8) (is_free sean s10) (is_free sean s11) (is_free sean s12)
    (is_free sean s14) (is_free sean s16)

    ;; Lori Busy: 10:00-10:30 (s3), 11:00-13:00 (s5, s6, s7, s8), 15:30-17:00 (s14, s15, s16)
    ;; Lori Free: s1, s2, s4, s9, s10, s11, s12, s13
    (is_free lori s1) (is_free lori s2) (is_free lori s4) (is_free lori s9) (is_free lori s10)
    (is_free lori s11) (is_free lori s12) (is_free lori s13)
  )
  (:goal (scheduled julie sean lori))
)