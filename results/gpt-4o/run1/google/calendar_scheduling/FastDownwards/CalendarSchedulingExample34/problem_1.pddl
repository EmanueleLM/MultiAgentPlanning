(define (problem schedule_meeting_problem)
  (:domain meeting_scheduling)
  (:objects
    willie richard noah - participant
    t9_00 t10_00 t10_30 t11_00 t11_30 t12_00
    t12_30 t13_00 t13_30 t14_00 t14_30 t15_00
    t15_30 t16_00 - time_slot
  )
  (:init
    (free willie t9_00) (free willie t10_00) (free willie t10_30) (free willie t11_00)
    (free willie t11_30) (free willie t12_00) (free willie t12_30) (free willie t13_00)
    (free willie t13_30) (free willie t14_00) (free willie t14_30) (free willie t15_00)
    (free willie t15_30) (free willie t16_00)
    (free richard t9_00) (free richard t10_30) (free richard t12_00) (free richard t12_30)
    (free richard t13_00) (free richard t14_00) (free richard t14_30) (free richard t15_00)
    (free richard t15_30) (free richard t16_00)
    (free noah t9_00) (free noah t10_30) (free noah t11_00) (free noah t11_30)
    (free noah t13_00) (free noah t13_30) (free noah t14_00)
    (valid_time_slot t9_00) (valid_time_slot t10_00) (valid_time_slot t10_30)
    (valid_time_slot t11_00) (valid_time_slot t11_30) (valid_time_slot t12_00)
    (valid_time_slot t12_30) (valid_time_slot t13_00) (valid_time_slot t13_30)
    (valid_time_slot t14_00) (valid_time_slot t14_30) (valid_time_slot t15_00)
    (valid_time_slot t15_30) (valid_time_slot t16_00)
    (next t9_00 t10_00) (next t10_00 t10_30) (next t10_30 t11_00)
    (next t11_00 t11_30) (next t11_30 t12_00) (next t12_00 t12_30)
    (next t12_30 t13_00) (next t13_00 t13_30) (next t13_30 t14_00)
    (next t14_00 t14_30) (next t14_30 t15_00) (next t15_00 t15_30)
    (next t15_30 t16_00)
  )
  (:goal
    (exists (?t - time_slot)
      (meeting_scheduled ?t)
    )
  )
)