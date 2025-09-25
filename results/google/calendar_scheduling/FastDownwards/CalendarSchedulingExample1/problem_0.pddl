(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    t9 t10 t11 t12 t13 t14 t15 t16 t17 - time
    raymond billy donald - agent
  )

  (:init
    ;; no proposed meeting at start
    (none-proposed)

    ;; work hours (9am-5pm)
    (workhour t9) (workhour t10) (workhour t11) (workhour t12) (workhour t13)
    (workhour t14) (workhour t15) (workhour t16) (workhour t17)

    ;; availability
    ;; Raymond available at: 9,10,11,14,15
    (available-raymond t9) (available-raymond t10) (available-raymond t11)
    (available-raymond t14) (available-raymond t15)

    ;; Billy available at: 10,11,12,14
    (available-billy t10) (available-billy t11) (available-billy t12) (available-billy t14)

    ;; Donald available at: 11,14,15
    (available-donald t11) (available-donald t14) (available-donald t15)

    ;; initial cost
    (= (total-cost) 0)

    ;; preference penalties (lower is better). These steer the solver toward
    ;; preferred slots. Values chosen so t11 is preferred overall.
    ;; Raymond penalties
    (= (penalty-raymond t9) 6) (= (penalty-raymond t10) 4) (= (penalty-raymond t11) 0)
    (= (penalty-raymond t12) 8) (= (penalty-raymond t13) 8) (= (penalty-raymond t14) 5)
    (= (penalty-raymond t15) 3) (= (penalty-raymond t16) 10) (= (penalty-raymond t17) 10)

    ;; Billy penalties
    (= (penalty-billy t9) 10) (= (penalty-billy t10) 2) (= (penalty-billy t11) 3)
    (= (penalty-billy t12) 4) (= (penalty-billy t13) 10) (= (penalty-billy t14) 0)
    (= (penalty-billy t15) 8) (= (penalty-billy t16) 10) (= (penalty-billy t17) 10)

    ;; Donald penalties
    (= (penalty-donald t9) 10) (= (penalty-donald t10) 10) (= (penalty-donald t11) 1)
    (= (penalty-donald t12) 10) (= (penalty-donald t13) 10) (= (penalty-donald t14) 2)
    (= (penalty-donald t15) 5) (= (penalty-donald t16) 10) (= (penalty-donald t17) 10)
  )

  ;; Goal: there exists a time t such that it has been proposed and all three
  ;; agents have agreed on that same time. Minimize total-cost to respect preferences.
  (:goal (exists (?t - time)
            (and
              (proposed ?t)
              (agreed-raymond ?t)
              (agreed-billy ?t)
              (agreed-donald ?t)
            )
          )
  )

  (:metric minimize (total-cost))
)