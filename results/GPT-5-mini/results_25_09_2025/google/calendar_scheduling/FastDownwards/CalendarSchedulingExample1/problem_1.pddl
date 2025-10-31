(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    t9 t10 t11 t12 t13 t14 t15 t16 t17 - time
    raymond billy donald - agent
  )

  (:init
    (none-proposed)

    (workhour t9) (workhour t10) (workhour t11) (workhour t12) (workhour t13)
    (workhour t14) (workhour t15) (workhour t16) (workhour t17)

    (available-raymond t9) (available-raymond t10) (available-raymond t11)
    (available-raymond t14) (available-raymond t15)

    (available-billy t10) (available-billy t11) (available-billy t12) (available-billy t14)

    (available-donald t11) (available-donald t14) (available-donald t15)
  )

  (:goal (goal-satisfied))
)