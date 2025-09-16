(define (problem monday-meeting-integrated)
  (:domain integrated-meeting-scheduler)
  (:objects
     t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - slot
     bobby scott kimberly - person
  )
  (:init
     ; Bobby: free all slots and available all slots
     (free-a t1) (free-a t2) (free-a t3) (free-a t4)
     (free-a t5) (free-a t6) (free-a t7) (free-a t8)
     (free-a t9) (free-a t10) (free-a t11) (free-a t12)
     (free-a t13) (free-a t14) (free-a t15) (free-a t16)
     (available-a bobby t1) (available-a bobby t2) (available-a bobby t3) (available-a bobby t4)
     (available-a bobby t5) (available-a bobby t6) (available-a bobby t7) (available-a bobby t8)
     (available-a bobby t9) (available-a bobby t10) (available-a bobby t11) (available-a bobby t12)
     (available-a bobby t13) (available-a bobby t14) (available-a bobby t15) (available-a bobby t16)

     ; Scott: free except t6 and t14
     (free-bp scott t1) (free-bp scott t2) (free-bp scott t3) (free-bp scott t4)
     (free-bp scott t5) (free-bp scott t7) (free-bp scott t8) (free-bp scott t9)
     (free-bp scott t10) (free-bp scott t11) (free-bp scott t12) (free-bp scott t13)
     (free-bp scott t15)
     (adjacent-b t1 t2) (adjacent-b t2 t3) (adjacent-b t3 t4) (adjacent-b t4 t5)
     (adjacent-b t5 t6) (adjacent-b t6 t7) (adjacent-b t7 t8) (adjacent-b t8 t9)
     (adjacent-b t9 t10) (adjacent-b t10 t11) (adjacent-b t11 t12) (adjacent-b t12 t13)
     (adjacent-b t13 t14) (adjacent-b t14 t15)

     ; Kimberly: free times
     (free-c t1) (free-c t2) (free-c t3) (free-c t4)
     (free-c t7) (free-c t9) (free-c t11) (free-c t13)

     ; Kimberly adjacency
     (adjacent-c t1 t2) (adjacent-c t2 t3) (adjacent-c t3 t4) (adjacent-c t4 t5)
     (adjacent-c t5 t6) (adjacent-c t6 t7) (adjacent-c t7 t8) (adjacent-c t8 t9)
     (adjacent-c t9 t10) (adjacent-c t10 t11) (adjacent-c t11 t12) (adjacent-c t12 t13)
     (adjacent-c t13 t14) (adjacent-c t14 t15) (adjacent-c t15 t16)

     ; Bobby's two-slot consecutivity
     (consecutive-a t1 t2)
  )
  (:goal (meeting-scheduled))
)