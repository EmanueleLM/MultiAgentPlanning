(define (problem visit_friends)
  (:domain san_francisco_visit)
  (:objects 
    bayview pacific_heights - location
    thomas self - person
    arrival_time_bayview - time
    meeting_start_thomas meeting_end_thomas duration_105 - time
  )
  (:init 
    (at self bayview arrival_time_bayview)
    (at thomas pacific_heights meeting_start_thomas)
    (before arrival_time_bayview meeting_start_thomas)
    (before meeting_start_thomas meeting_end_thomas)
    (meeting_possible thomas pacific_heights meeting_start_thomas meeting_end_thomas duration_105)
  )
  (:goal (met thomas))
)