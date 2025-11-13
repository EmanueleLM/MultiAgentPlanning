(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    m1 - meeting
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
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

    ;; slots that are free for all participants (encoded once as a global invariant)
    (available s4)
    (available s5)

    (unscheduled m1)
  )

  ;; Goal: schedule the single meeting for two consecutive slots (60 minutes).
  (:goal (scheduled m1 s4 s5))
)