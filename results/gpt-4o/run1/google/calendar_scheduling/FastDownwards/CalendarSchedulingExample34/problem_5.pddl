(define (problem schedule_meeting_problem)
  (:domain meeting_scheduling)
  (:objects
    willie richard noah - participant
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30 t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 - time_slot
  )
  (:init
    (free willie t9_00) (free willie t9_30) (free willie t10_00) (free willie t10_30)
    (free willie t11_00) (free willie t11_30) (free willie t12_00) (free willie t12_30)
    (free willie t13_00) (free willie t13_30) (free willie t14_00) (free willie t14_30)
    (free willie t15_00) (free willie t15_30) (free willie t16_00)
    
    (free richard t9_00) (free richard t9_30)
    (free richard t10_30) (free richard t12_00) (free richard t12_30)
    (free richard t14_00) (free richard t14_30) (free richard t15_00) (free richard t15_30)
    
    (free noah t9_00) (free noah t9_30)
    (free noah t10_30) (free noah t11_00) (free noah t11_30)
    (free noah t13_00) (free noah t13_30)

    ; Represent consecutive slots for 30 min each, combining two for a 1-hour slot
    (consecutive t9_00 t9_30) (consecutive t9_30 t10_00)
    (consecutive t10_00 t10_30) (consecutive t10_30 t11_00)
    (consecutive t11_00 t11_30) (consecutive t11_30 t12_00)
    (consecutive t12_00 t12_30) (consecutive t12_30 t13_00)
    (consecutive t13_00 t13_30) (consecutive t13_30 t14_00)
    (consecutive t14_00 t14_30) (consecutive t14_30 t15_00)
    (consecutive t15_00 t15_30) (consecutive t15_30 t16_00)
  )
  (:goal
    (exists (?t1 - time_slot ?t2 - time_slot)
      (and (meeting_scheduled ?t1) (consecutive ?t1 ?t2))
    )
  )
)