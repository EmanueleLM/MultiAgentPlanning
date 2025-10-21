(define (problem schedule-meeting-monday)
  (:domain meeting-scheduler)

  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    (available diana s09_00)
    (available diana s09_30)
    (available diana s10_00)
    (available diana s10_30)
    (available diana s11_00)
    (available diana s12_00)
    (available diana s12_30)
    (available diana s13_30)
    (available diana s14_00)
    (available diana s14_30)
    (available diana s15_00)
    (available diana s15_30)
    (available diana s16_00)
    (available diana s16_30)

    (available ethan s09_00)
    (available ethan s09_30)
    (available ethan s10_00)
    (available ethan s10_30)
    (available ethan s11_00)
    (available ethan s11_30)
    (available ethan s12_00)
    (available ethan s12_30)
    (available ethan s13_00)
    (available ethan s13_30)
    (available ethan s14_00)
    (available ethan s14_30)
    (available ethan s15_00)
    (available ethan s15_30)
    (available ethan s16_00)
    (available ethan s16_30)

    (available janet s10_00)
    (available janet s10_30)
    (available janet s11_00)
    (available janet s11_30)
  )

  (:goal (meeting-scheduled))
)