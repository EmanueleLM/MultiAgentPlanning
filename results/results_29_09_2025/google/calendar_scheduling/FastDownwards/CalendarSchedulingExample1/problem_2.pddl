(define (problem schedule-meeting-mon)
  (:domain meeting-scheduling)
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - time
  )

  (:init
    (available raymond s09_30) (available raymond s10_00) (available raymond s10_30) (available raymond s11_00)
    (available raymond s12_00) (available raymond s12_30) (available raymond s13_30) (available raymond s14_00)
    (available raymond s14_30) (available raymond s15_30) (available raymond s16_00) (available raymond s16_30)

    (available billy s09_00) (available billy s09_30) (available billy s10_30)
    (available billy s11_00) (available billy s11_30)
    (available billy s13_00) (available billy s13_30) (available billy s14_00) (available billy s14_30)

    (available donald s09_30) (available donald s11_00) (available donald s11_30)
    (available donald s13_00) (available donald s13_30) (available donald s14_30)
    (available donald s15_00) (available donald s15_30)
  )

  (:goal (scheduled s09_30))
)