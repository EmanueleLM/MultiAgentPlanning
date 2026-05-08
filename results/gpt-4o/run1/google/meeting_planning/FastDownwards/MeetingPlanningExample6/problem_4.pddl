(define (problem meet_kenneth)
  (:domain san_francisco_day_trip)
  
  (:objects
    self - person
    fishermans_wharf nob_hill - location
    kenneth - person
    time_900am time_211pm time_245pm time_345pm time_745pm - time)
  
  (:init
    (at self fishermans_wharf time_900am)
    (connected fishermans_wharf nob_hill)
    (connected nob_hill fishermans_wharf)
    (can_meet kenneth nob_hill time_211pm time_745pm))
  
  (:goal
    (and 
      (met kenneth)
      (exists (?meet_start ?meet_end - time)
        (and (schedule kenneth nob_hill ?meet_start ?meet_end)
             (at self nob_hill ?meet_start) 
             (at self nob_hill ?meet_end)
        )))
)