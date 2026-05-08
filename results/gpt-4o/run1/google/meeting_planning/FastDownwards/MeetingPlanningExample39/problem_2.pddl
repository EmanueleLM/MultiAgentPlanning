(define (problem meet_friends_san_francisco)
  (:domain san_francisco_meeting)
  (:objects
    fishermans_wharf nob_hill - location
    stephanie - person
    time_9am time_911am time_445pm time_605pm time_945pm - time_stage
  )
  (:init
    (current_location fishermans_wharf)
    (at stephanie nob_hill)
    (time_at time_9am)
    (can_travel fishermans_wharf nob_hill time_9am time_911am)
    (can_travel nob_hill fishermans_wharf time_9am time_911am)
    (available stephanie time_445pm time_945pm)
  )
  (:goal
    (and (met stephanie) (met_duration_achieved) (current_location nob_hill))
  )
)