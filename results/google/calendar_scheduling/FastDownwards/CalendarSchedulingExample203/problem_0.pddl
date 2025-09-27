(define (problem schedule-monday)
  (:domain meeting)
  (:objects elijah janet brian carl timothy - participant
            s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
            s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot)
  (:init
    (available elijah s09_00) (available elijah s09_30)
    (available elijah s11_00) (available elijah s11_30)
    (available elijah s12_30) (available elijah s13_00)
    (available elijah s13_30) (available elijah s14_00)
    (available elijah s14_30) (available elijah s15_30)
    (available elijah s16_00) (available elijah s16_30)

    (available janet s09_00) (available janet s10_30)
    (available janet s11_00) (available janet s11_30)
    (available janet s12_00) (available janet s12_30)
    (available janet s13_00) (available janet s15_30)
    (available janet s16_00) (available janet s16_30)

    ;; Brian has a hard constraint: no meetings on Monday -> no (available brian ...) facts

    (available carl s09_00) (available carl s16_30)

    (available timothy s09_00) (available timothy s09_30)
    (available timothy s10_00) (available timothy s12_00)
    (available timothy s12_30) (available timothy s13_00)
    (available timothy s14_00) (available timothy s16_00)
  )
  (:goal
    (or
      (scheduled s09_00) (scheduled s09_30) (scheduled s10_00) (scheduled s10_30)
      (scheduled s11_00) (scheduled s11_30) (scheduled s12_00) (scheduled s12_30)
      (scheduled s13_00) (scheduled s13_30) (scheduled s14_00) (scheduled s14_30)
      (scheduled s15_00) (scheduled s15_30) (scheduled s16_00) (scheduled s16_30)
    )
  )
)