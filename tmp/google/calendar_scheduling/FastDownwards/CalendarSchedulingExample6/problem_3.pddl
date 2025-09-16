(define (problem monday-meeting)
  (:domain multi-agent-meeting)

  (:objects
     t9 t10 t11 t12 t13 t14 t15 t16 - time
  )

  (:init
     (free thomas t9)  (free thomas t10) (free thomas t11) (free thomas t12)
     (free thomas t13) (free thomas t14) (free thomas t15) (free thomas t16)

     (free jerry t9)   (free jerry t10)  (free jerry t11)  (free jerry t12)
     (free jerry t13)  (free jerry t14)  (free jerry t15)  (free jerry t16)

     (free dylan t9)   (free dylan t10)  (free dylan t11)  (free dylan t12)
     (free dylan t13)  (free dylan t14)  (free dylan t15)  (free dylan t16)
  )

  (:goal (meeting-scheduled t11))
)