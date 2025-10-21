(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    (available brian s1) (available brian s2) (available brian s3) (available brian s4)
    (available brian s5) (available brian s6) (available brian s7) (available brian s8)
    (available brian s9) (available brian s10) (available brian s11) (available brian s12)
    (available brian s13) (available brian s14) (available brian s15) (available brian s16)

    (available billy s1) (available billy s2) (available billy s4) (available billy s5)
    (available billy s7) (available billy s8) (available billy s9) (available billy s10)
    (available billy s12) (available billy s13)

    (available patricia s8) (available patricia s9) (available patricia s11) (available patricia s15)
  )

  (:goal (meeting-made))
)