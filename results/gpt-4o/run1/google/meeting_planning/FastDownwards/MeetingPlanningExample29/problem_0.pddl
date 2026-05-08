(define (problem meeting_with_nancy)
  (:domain san_francisco_meeting)
  (:objects 
    visitor - person
    nancy - person
    location_sunset location_haight - location
    time_9am time_915am time_930am time_745pm time_830pm time_930pm time_945pm - time
  )
  (:init 
    (at visitor location_sunset)
    (current_time time_9am)
    (next_time time_9am time_915am)
    (next_time time_915am time_930am)
    (next_time time_745pm time_830pm)
    (next_time time_830pm time_930pm)
    (next_time time_930pm time_945pm)
    (can_meet nancy visitor time_830pm)
    (can_meet nancy visitor time_930pm)
  )
  (:goal 
    (and 
      (meeting_set visitor nancy location_haight time_830pm)
      (meeting_set visitor nancy location_haight time_930pm)
    )
  )
)