(define (problem visit_san_francisco)
  (:domain meet_friends)
  
  (:objects 
    self - person
    the_castro sunset_district - location
    time_930am time_215pm time_330pm time_445pm time_800pm - time
  )

  (:init 
    (at_location self the_castro)
    (current_time time_930am)
    (can_meet_deborah self)
  )

  (:goal (and
    (meeting_done)
    (visited sunset_district)
  ))
)