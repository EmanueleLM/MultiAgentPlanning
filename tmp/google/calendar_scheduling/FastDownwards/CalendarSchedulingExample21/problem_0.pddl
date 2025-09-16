(define (problem monday-meeting-integrated)
  (:domain integrated-meeting-scheduler)
  (:objects
     t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - slot
     bobby scott kimberly - person
  )
  (:init
     ; Bobby's availability (free slots and Bobby is available all slots)
     (free-a t1) (free-a t2) (free-a t3) (free-a t4)
     (free-a t7) (free-a t9) (free-a t11) (free-a t13)

     (available-a bobby t1) (available-a bobby t2) (available-a bobby t3) (available-a bobby t4)
     (available-a bobby t5) (available-a bobby t6) (available-a bobby t7) (available-a bobby t8)
     (available-a bobby t9) (available-a bobby t10) (available-a bobby t11) (available-a bobby t12)
     (available-a bobby t13) (available-a bobby t14) (available-a bobby t15) (available-a bobby t16)

     ; Scott's free 60-minute start-blocks (represented as 30-min start slots t1..t15)
     (free-bp scott t1) (free-bp scott t2) (free-bp scott t3) (free-bp scott t4)
     (free-bp scott t5) (free-bp scott t6) (free-bp scott t7) (free-bp scott t8)
     (free-bp scott t9) (free-bp scott t10) (free-bp scott t11) (free-bp scott t12)
     (free-bp scott t13) (free-bp scott t14) (free-bp scott t15)

     ; Scott's adjacency for start-slots
     (adjacent-b t1 t2) (adjacent-b t2 t3) (adjacent-b t3 t4) (adjacent-b t4 t5)
     (adjacent-b t5 t6) (adjacent-b t6 t7) (adjacent-b t7 t8) (adjacent-b t8 t9)
     (adjacent-b t9 t10) (adjacent-b t10 t11) (adjacent-b t11 t12) (adjacent-b t12 t13)
     (adjacent-b t13 t14) (adjacent-b t14 t15)

     ; Kimberly's availability (8 known free slots)
     (free-c t1) (free-c t2) (free-c t3) (free-c t4)
     (free-c t7) (free-c t9) (free-c t11) (free-c t13)

     ; Kimberly's adjacency across 30-min slots
     (adjacent-c t1 t2) (adjacent-c t2 t3) (adjacent-c t3 t4) (adjacent-c t4 t5)
     (adjacent-c t5 t6) (adjacent-c t6 t7) (adjacent-c t7 t8) (adjacent-c t8 t9)
     (adjacent-c t9 t10) (adjacent-c t10 t11) (adjacent-c t11 t12) (adjacent-c t12 t13)
     (adjacent-c t13 t14) (adjacent-c t14 t15) (adjacent-c t15 t16)
  )
  (:goal (meeting-scheduled))
)