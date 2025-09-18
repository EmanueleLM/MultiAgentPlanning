(define (problem schedule-meeting-monday-integrated)
  (:domain meeting-scheduling)

  (:objects
    alexander elizabeth walter - person
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ;; Alexander busy: 09:30-10:00 (s1), 10:30-11:00 (s3), 12:30-13:00 (s7), 14:30-15:00 (s11), 16:00-17:00 (s14 s15)
    (busy alexander s1)
    (busy alexander s3)
    (busy alexander s7)
    (busy alexander s11)
    (busy alexander s14)
    (busy alexander s15)

    ;; Elizabeth busy: 09:00-09:30 (s0), 11:30-12:30 (s5 s6), 13:00-14:30 (s8 s9 s10)
    (busy elizabeth s0)
    (busy elizabeth s5)
    (busy elizabeth s6)
    (busy elizabeth s8)
    (busy elizabeth s9)
    (busy elizabeth s10)

    ;; Walter busy: 09:00-14:30 (s0..s10), 15:30-17:00 (s13 s14 s15)
    (busy walter s0)
    (busy walter s1)
    (busy walter s2)
    (busy walter s3)
    (busy walter s4)
    (busy walter s5)
    (busy walter s6)
    (busy walter s7)
    (busy walter s8)
    (busy walter s9)
    (busy walter s10)
    (busy walter s13)
    (busy walter s14)
    (busy walter s15)
  )

  (:goal (meeting-scheduled))
)