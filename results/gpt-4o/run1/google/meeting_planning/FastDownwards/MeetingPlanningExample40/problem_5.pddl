(define (problem visit_san_francisco)
  (:domain meet_friends)
  
  (:objects 
    self - person
    the_castro sunset_district - location
    time_900am time_215pm time_232pm time_235pm time_350pm time_800pm time_915pm - time
  )

  (:init 
    (at_location self the_castro)
    (current_time time_900am)
  )

  (:goal (and
    (meeting_done self)
    (visited sunset_district)
  ))
)