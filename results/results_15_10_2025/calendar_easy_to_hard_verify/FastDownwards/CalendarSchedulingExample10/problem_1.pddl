(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:init
    (available denise s09_10) (available denise s10_11) (available denise s11_12)
    (available denise s12_13) (available denise s13_14) (available denise s14_15)
    (available denise s15_16) (available denise s16_17)

    (available joseph s09_10) (available joseph s10_11) (available joseph s11_12)
    (available joseph s12_13) (available joseph s13_14) (available joseph s14_15)
    (available joseph s15_16) (available joseph s16_17)

    (available henry s11_12)

    (available christian s11_12) (available christian s12_13) (available christian s13_14)

    (meeting-not-scheduled)
  )

  (:goal (and (meeting-scheduled)))
)