(define (problem meet_friends_san_francisco)
  (:domain san_francisco_meeting)
  (:objects
    fishermans_wharf nob_hill - location
    stephanie - person
    time_9am time_445pm time_945pm time_120_minutes time_11_minutes - time
  )
  (:init
    (current_location fishermans_wharf)
    (at stephanie nob_hill)
    (time_at time_9am)
    (visited fishermans_wharf)
    (can_travel fishermans_wharf nob_hill time_11_minutes)
    (can_travel nob_hill fishermans_wharf time_11_minutes)
    (available stephanie time_445pm time_945pm)
  )
  (:goal
    (and (met stephanie) 
         (current_location nob_hill))
  )
)