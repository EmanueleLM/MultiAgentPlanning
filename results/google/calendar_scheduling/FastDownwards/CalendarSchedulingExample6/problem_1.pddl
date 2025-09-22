(define (problem schedule-60min-meeting-all)
  (:domain integrated-meeting-planning)

  (:objects
    thomas dylan jerry - participant
    monday - day
    t9_00  t9_30  t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
    d60 - duration
  )

  (:init
    (participant thomas) (participant dylan) (participant jerry)
    (day monday)

    (next t9_00 t9_30)   (next t9_30 t10_00) (next t10_00 t10_30) (next t10_30 t11_00)
    (next t11_00 t11_30) (next t11_30 t12_00) (next t12_00 t12_30) (next t12_30 t13_00)
    (next t13_00 t13_30) (next t13_30 t14_00) (next t14_00 t14_30) (next t14_30 t15_00)
    (next t15_00 t15_30) (next t15_30 t16_00) (next t16_00 t16_30)

    (in-work-hours t9_00) (in-work-hours t9_30) (in-work-hours t10_00) (in-work-hours t10_30)
    (in-work-hours t11_00) (in-work-hours t11_30) (in-work-hours t12_00) (in-work-hours t12_30)
    (in-work-hours t13_00) (in-work-hours t13_30) (in-work-hours t14_00) (in-work-hours t14_30)
    (in-work-hours t15_00) (in-work-hours t15_30) (in-work-hours t16_00)

    (feasible-exists)

    (feasible-slot t14_30)
    (slot-on-day t14_30 monday)
    (slot-duration t14_30 d60)

    (free dylan t9_00) (free dylan t9_30) (free dylan t10_00)
    (free dylan t11_00) (free dylan t11_30) (free dylan t12_00) (free dylan t12_30)
    (free dylan t13_00)
    (free dylan t14_00) (free dylan t14_30) (free dylan t15_00) (free dylan t15_30)
    (free dylan t16_00) (free dylan t16_30)

    (known jerry)
    (free jerry t11_00)
    (free jerry t14_30)
    (free jerry t15_00)
    (free jerry t15_30)

    (free-on thomas monday)
    (free thomas t14_30)
    (free thomas t15_00)
  )

  (:goal (and
    (meeting-scheduled)
    (meeting-at t14_30)
    (scheduled-day monday)
    (slot-duration t14_30 d60)
  ))
)