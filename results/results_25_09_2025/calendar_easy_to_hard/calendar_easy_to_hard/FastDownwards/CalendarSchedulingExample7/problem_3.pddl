(define (problem schedule-meeting-monday)
  (:domain schedule-meeting)
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    (meeting-unscheduled)
    (free nicholas s09_00) (free nicholas s09_30) (free nicholas s10_00) (free nicholas s10_30)
    (free nicholas s11_00) (free nicholas s11_30) (free nicholas s12_00) (free nicholas s12_30)
    (free nicholas s13_00) (free nicholas s13_30) (free nicholas s14_00) (free nicholas s14_30)
    (free nicholas s15_00) (free nicholas s15_30) (free nicholas s16_00) (free nicholas s16_30)
    (free heather s09_30) (free heather s10_00)
    (free heather s11_00) (free heather s11_30)
    (free heather s12_00) (free heather s12_30)
    (free heather s13_30) (free heather s14_00)
    (free heather s15_00) (free heather s15_30)
    (free heather s16_30)
    (free zachary s10_30) (free zachary s12_00) (free zachary s13_00) (free zachary s16_30)
    (preferred s10_30) (preferred s12_00) (preferred s13_00)
  )
  (:goal (meeting-scheduled))
)