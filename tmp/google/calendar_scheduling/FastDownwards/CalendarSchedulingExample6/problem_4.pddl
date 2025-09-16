(define (problem monday-meeting)
  (:domain multi-agent-meeting)

  (:init
     ; Thomas is free at all times
     (free thomas t9) (free thomas t10) (free thomas t11) (free thomas t12)
     (free thomas t13) (free thomas t14) (free thomas t15) (free thomas t16)

     ; Dylan is free at certain times (not at t10 and t13 due to busy intervals)
     (free dylan t9) (free dylan t11) (free dylan t12) (free dylan t14)
     (free dylan t15) (free dylan t16)

     ; Jerry is free only at t15 (representing busy times elsewhere)
     (free jerry t15)
  )

  (:goal (meeting-scheduled t15))
)