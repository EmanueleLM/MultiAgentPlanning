(define (problem schedule_meeting_problem)
  (:domain meeting_scheduling)
  (:objects
    willie richard noah - participant
    t9_00 t10_00 t11_00 t12_00 t13_00 t14_00 t15_00 t16_00 - time_slot
  )
  (:init
    (free willie t9_00) (free willie t10_00) (free willie t11_00)
    (free willie t12_00) (free willie t13_00) (free willie t14_00)
    (free willie t15_00) (free willie t16_00)
    
    (free richard t9_00) (free richard t10_00)
    (free richard t12_00) (free richard t12_30)
    (free richard t13_00) (free richard t14_00)
    (free richard t14_30) (free richard t15_00)
    
    (free noah t9_00)
    (free noah t10_30) (free noah t11_00)
    (free noah t13_00)
    
    (next t9_00 t10_00) (next t10_00 t11_00) (next t11_00 t12_00)
    (next t12_00 t13_00) (next t13_00 t14_00) (next t14_00 t15_00)
    (next t15_00 t16_00)
  )
  (:goal
    (exists (?t - time_slot)
      (meeting_scheduled ?t)
    )
  )
)