(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    m1 - meeting
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
    Theresa Charles Betty - person
  )

  (:init
    ;; successor (30-minute steps) from 09:00 to 17:00
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
    (next s10 s11)
    (next s11 s12)
    (next s12 s13)
    (next s13 s14)
    (next s14 s15)
    (next s15 s16)

    ;; Free slots per participant (computed from provided busy intervals)
    ;; Theresa busy: s1, s8, s9, s11, s12, s16
    (free Theresa s2)
    (free Theresa s3)
    (free Theresa s4)
    (free Theresa s5)
    (free Theresa s6)
    (free Theresa s7)
    (free Theresa s10)
    (free Theresa s13)
    (free Theresa s14)
    (free Theresa s15)

    ;; Charles busy: s3, s6, s7, s11, s12, s13
    (free Charles s1)
    (free Charles s2)
    (free Charles s4)
    (free Charles s5)
    (free Charles s8)
    (free Charles s9)
    (free Charles s10)
    (free Charles s14)
    (free Charles s15)
    (free Charles s16)

    ;; Betty busy: s1, s2, s3, s7, s9, s10, s13, s14
    (free Betty s4)
    (free Betty s5)
    (free Betty s6)
    (free Betty s8)
    (free Betty s11)
    (free Betty s12)
    (free Betty s15)
    (free Betty s16)

    (unscheduled m1)
  )

  ;; Goal: schedule the single meeting for two consecutive slots (60 minutes).
  ;; Validated feasible window: s4 (10:30-11:00) + s5 (11:00-11:30) => 10:30-11:30
  (:goal (scheduled m1 s4 s5))
)