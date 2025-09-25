(define (problem schedule-meeting-fd)
  (:domain meeting-scheduling-fd)
  (:objects
    raymond billy donald - agent
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - timeslot
  )
  (:init
    (workhour t9_00) (workhour t9_30) (workhour t10_00) (workhour t10_30)
    (workhour t11_00) (workhour t11_30) (workhour t12_00) (workhour t12_30)
    (workhour t13_00) (workhour t13_30) (workhour t14_00) (workhour t14_30)
    (workhour t15_00) (workhour t15_30) (workhour t16_00) (workhour t16_30)

    (available raymond t9_30) (available raymond t10_00) (available raymond t10_30)
    (available raymond t11_00) (available raymond t12_00) (available raymond t12_30)
    (available raymond t13_30) (available raymond t14_00) (available raymond t14_30)
    (available raymond t15_30) (available raymond t16_00) (available raymond t16_30)

    (available billy t9_00) (available billy t9_30) (available billy t10_30)
    (available billy t11_00) (available billy t11_30) (available billy t13_00)
    (available billy t13_30) (available billy t14_00) (available billy t14_30)

    (available donald t9_30) (available donald t11_00) (available donald t11_30)
    (available donald t13_00) (available donald t13_30) (available donald t14_30)
    (available donald t15_00) (available donald t15_30)

    (late t15_00) (late t15_30) (late t16_00) (late t16_30)

    (prefers-avoid-late billy)
  )
  (:goal
    (meeting-scheduled-all)
  )
)