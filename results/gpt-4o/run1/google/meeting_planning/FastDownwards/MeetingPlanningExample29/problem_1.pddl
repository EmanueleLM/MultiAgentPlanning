(define (problem meeting_with_nancy)
  (:domain san_francisco_meeting)
  (:objects 
    visitor nancy - person
    location_sunset location_haight - location
    time_9am time_915am time_930am time_945am time_8pm time_845pm time_915pm time_945pm - time
  )
  (:init 
    (at visitor location_sunset)
    (current_time time_9am)
    (next_time time_9am time_915am)
    (next_time time_915am time_930am)
    (next_time time_930am time_945am)
    (next_time time_8pm time_845pm)
    (next_time time_845pm time_915pm)
    (next_time time_915pm time_945pm)
    (can_meet visitor nancy)
  )
  (:goal 
    (and 
      (meeting_set visitor nancy location_haight)
    )
  )
)