(define (problem schedule-single-30min-monday)
  (:domain meeting-scheduling)
  (:objects
    samantha brian arthur matthew marilyn mark andrea - person
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  ;; Slot mapping for clarity (30-minute start slots from 09:00 to 16:30):
  ;; s0=09:00, s1=09:30, s2=10:00, s3=10:30, s4=11:00, s5=11:30,
  ;; s6=12:00, s7=12:30, s8=13:00, s9=13:30, s10=14:00, s11=14:30,
  ;; s12=15:00, s13=15:30, s14=16:00, s15=16:30

  (:init
    ;; Samantha free slots (all 09:00-16:30 start times except busy 11:00( s4 ), 13:00( s8 ), 15:30( s13 ), 16:30( s15 ))
    (free samantha s0) (free samantha s1) (free samantha s2) (free samantha s3)
    (free samantha s5) (free samantha s6) (free samantha s7)
    (free samantha s9) (free samantha s10) (free samantha s11) (free samantha s12) (free samantha s14)

    ;; Brian free entire day
    (free brian s0) (free brian s1) (free brian s2) (free brian s3)
    (free brian s4) (free brian s5) (free brian s6) (free brian s7)
    (free brian s8) (free brian s9) (free brian s10) (free brian s11)
    (free brian s12) (free brian s13) (free brian s14) (free brian s15)

    ;; Arthur busy 13:30-14:00 (s9) and 16:00-16:30 (s14)
    (free arthur s0) (free arthur s1) (free arthur s2) (free arthur s3) (free arthur s4)
    (free arthur s5) (free arthur s6) (free arthur s7) (free arthur s8)
    (free arthur s10) (free arthur s11) (free arthur s12) (free arthur s13) (free arthur s15)

    ;; Matthew free entire day
    (free matthew s0) (free matthew s1) (free matthew s2) (free matthew s3)
    (free matthew s4) (free matthew s5) (free matthew s6) (free matthew s7)
    (free matthew s8) (free matthew s9) (free matthew s10) (free matthew s11)
    (free matthew s12) (free matthew s13) (free matthew s14) (free matthew s15)

    ;; Marilyn busy: 09:00-10:00 (s0,s1), 10:30-11:30 (s3,s4), 12:00-13:00 (s6,s7),
    ;; 14:00-14:30 (s10), 16:00-16:30 (s14)
    (free marilyn s2) (free marilyn s5) (free marilyn s8) (free marilyn s9)
    (free marilyn s11) (free marilyn s12) (free marilyn s13) (free marilyn s15)

    ;; Mark busy: 09:30-11:00 (s1,s2,s3), 11:30-13:30 (s5,s6,s7,s8),
    ;; 14:00-14:30 (s10), 15:00-16:00 (s12,s13)
    (free mark s0) (free mark s4) (free mark s9) (free mark s11) (free mark s14) (free mark s15)

    ;; Andrea busy: 09:30-11:00 (s1,s2,s3), 11:30-14:30 (s5,s6,s7,s8,s9,s10),
    ;; and 15:00-15:30 (s12)
    (free andrea s0) (free andrea s4) (free andrea s11) (free andrea s13) (free andrea s14) (free andrea s15)
  )

  ;; Goal: schedule the single 30-minute meeting at the earliest slot that satisfies every hard constraint.
  ;; Computed common available slot across all participants is s11 (14:30-15:00).
  (:goal (meeting-at s11))
)