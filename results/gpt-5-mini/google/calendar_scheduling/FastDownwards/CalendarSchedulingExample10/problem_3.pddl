(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    diana ethan janet - participant
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot
  )

  (:init
    (free diana t09_00)
    (free diana t09_30)
    (free diana t10_00)
    (free diana t10_30)
    (free diana t11_00)
    (free diana t12_00)
    (free diana t12_30)
    (free diana t13_30)
    (free diana t14_00)
    (free diana t14_30)
    (free diana t15_00)
    (free diana t15_30)
    (free diana t16_00)
    (free diana t16_30)

    (free ethan t09_00) (free ethan t09_30) (free ethan t10_00) (free ethan t10_30)
    (free ethan t11_00) (free ethan t11_30) (free ethan t12_00) (free ethan t12_30)
    (free ethan t13_00) (free ethan t13_30) (free ethan t14_00) (free ethan t14_30)
    (free ethan t15_00) (free ethan t15_30) (free ethan t16_00) (free ethan t16_30)

    (free janet t10_00)
    (free janet t10_30)
    (free janet t11_00)
    (free janet t11_30)
  )

  (:goal (meeting-scheduled))
)