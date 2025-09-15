(define (problem schedule-monday-integrated)
  (:domain integrated-scheduling)

  (:objects
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - timeslot

    meeting1 - meeting
  )

  (:init
    (time t9_00) (time t9_30) (time t10_00) (time t10_30)
    (time t11_00) (time t11_30) (time t12_00) (time t12_30)
    (time t13_00) (time t13_30) (time t14_00) (time t14_30)
    (time t15_00) (time t15_30) (time t16_00) (time t16_30)

    (next t9_00 t9_30) (next t9_30 t10_00) (next t10_00 t10_30) (next t10_30 t11_00)
    (next t11_00 t11_30) (next t11_30 t12_00) (next t12_00 t12_30) (next t12_30 t13_00)
    (next t13_00 t13_30) (next t13_30 t14_00) (next t14_00 t14_30) (next t14_30 t15_00)
    (next t15_00 t15_30) (next t15_30 t16_00) (next t16_00 t16_30)

    (startable t9_00) (startable t9_30) (startable t10_00) (startable t10_30)
    (startable t11_00) (startable t11_30) (startable t12_00) (startable t12_30)
    (startable t13_00) (startable t13_30) (startable t14_00) (startable t14_30)
    (startable t15_00) (startable t15_30) (startable t16_00)

    (meeting meeting1)

    (free-michelle t9_00) (free-michelle t9_30)
    (free-michelle t10_00) (free-michelle t10_30)
    (free-michelle t12_00) (free-michelle t12_30)
    (free-michelle t13_00) (free-michelle t13_30)
    (free-michelle t14_00) (free-michelle t14_30)
    (free-michelle t15_00) (free-michelle t15_30)
    (free-michelle t16_00) (free-michelle t16_30)

    (free-steven-start t9_30)
    (free-steven-start t10_00)
    (free-steven-start t10_30)
    (free-steven-start t12_00)
    (free-steven-start t12_30)
    (free-steven-start t14_00)
    (free-steven-start t14_30)
    (free-steven-start t16_00)

    (free-jerry t14_30)
    (free-jerry t15_00)
  )

  (:goal (meeting-finalized meeting1))
)