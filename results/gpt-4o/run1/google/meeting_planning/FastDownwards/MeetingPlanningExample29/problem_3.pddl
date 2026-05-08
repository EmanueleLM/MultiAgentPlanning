(define (problem meeting_with_nancy)
  (:domain san_francisco_meeting)
  (:objects 
    visitor nancy - person
    location_sunset location_haight - location
    time_9am time_915am time_930am time_945am 
    time_700pm time_715pm time_730pm time_745pm 
    time_800pm time_815pm time_830pm time_845pm 
    time_900pm time_915pm time_930pm time_945pm - time
  )
  (:init 
    (at visitor location_sunset)
    (at nancy location_haight)
    (current_time time_9am)
    (next_time time_9am time_915am)
    (next_time time_915am time_930am)
    (next_time time_930am time_945am)
    (next_time time_700pm time_715pm)
    (next_time time_715pm time_730pm)
    (next_time time_730pm time_745pm)
    (next_time time_745pm time_800pm)
    (next_time time_800pm time_815pm)
    (next_time time_815pm time_830pm)
    (next_time time_830pm time_845pm)
    (next_time time_845pm time_900pm)
    (next_time time_900pm time_915pm)
    (next_time time_915pm time_930pm)
    (next_time time_930pm time_945pm)
    (meeting_possible visitor nancy location_haight time_730pm time_845pm)
  )
  (:goal 
    (and 
      (meeting_planned visitor nancy location_haight)
    )
  )
)