(define (problem meeting-scheduling-problem)
  (:domain multi-agent-meeting)

  (:init
     ;; Bradley's known availability: 11:30, 15:00, 15:30, 16:30
     (free Bradley t11_30)
     (free Bradley t15_00)
     (free Bradley t15_30)
     (free Bradley t16_30)

     ;; Brandon's availability: all slots except 13:00, 13:30, 15:30, 16:30
     (free Brandon t09_00)
     (free Brandon t09_30)
     (free Brandon t10_00)
     (free Brandon t10_30)
     (free Brandon t11_00)
     (free Brandon t11_30)
     (free Brandon t12_00)
     (free Brandon t12_30)
     (free Brandon t14_00)
     (free Brandon t14_30)
     (free Brandon t15_00)
     (free Brandon t16_00)

     ;; Jerry is free for all slots
     (free Jerry t09_00)
     (free Jerry t09_30)
     (free Jerry t10_00)
     (free Jerry t10_30)
     (free Jerry t11_00)
     (free Jerry t11_30)
     (free Jerry t12_00)
     (free Jerry t12_30)
     (free Jerry t13_00)
     (free Jerry t13_30)
     (free Jerry t14_00)
     (free Jerry t14_30)
     (free Jerry t15_00)
     (free Jerry t15_30)
     (free Jerry t16_00)
     (free Jerry t16_30)
  )

  (:goal (or
     (scheduled t11_30)
     (scheduled t15_00)
     (scheduled t15_30)
     (scheduled t16_30)))
)