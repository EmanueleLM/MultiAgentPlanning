(define (problem visit_friends)
  (:domain san_francisco_visit)
  (:objects 
    bayview pacific_heights - location
    thomas self - person
    t9am t12_15pm t5_15pm t2pm - time
  )
  (:init 
    (at self bayview)
    (at thomas pacific_heights)
    (can_meet thomas pacific_heights)
    (time_available pacific_heights t12_15pm t5_15pm)
    (before t9am t12_15pm)
    (before t12_15pm t2pm)
    (before t2pm t5_15pm)
  )
  (:goal (met thomas))
)