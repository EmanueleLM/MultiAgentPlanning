(define (problem visit_friends)
  (:domain san_francisco_visit)
  (:objects 
    bayview pacific_heights - location
    thomas self - person
    arrival_time_bayview meeting_start_thomas meeting_end_thomas - time
  )
  (:init 
    (at self bayview)
    (at thomas pacific_heights)
    (can_meet thomas pacific_heights)
    (time_available bayview arrival_time_bayview meeting_start_thomas)
    (time_available pacific_heights meeting_start_thomas meeting_end_thomas)
    (before arrival_time_bayview meeting_start_thomas)
    (before meeting_start_thomas meeting_end_thomas)
  )
  (:goal (met thomas))
)