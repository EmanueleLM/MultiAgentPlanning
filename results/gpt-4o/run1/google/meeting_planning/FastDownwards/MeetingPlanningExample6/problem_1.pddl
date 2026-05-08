(define (problem meet_kenneth)
  (:domain san_francisco_day_trip)
  
  (:objects
    self - person
    fishermans_wharf nob_hill - location
    kenneth - person
    time_900am time_215pm time_345pm time_745pm - time)
  
  (:init
    (at self fishermans_wharf time_900am)
    (connected fishermans_wharf nob_hill)
    (connected nob_hill fishermans_wharf)
    (can_meet kenneth nob_hill time_215pm time_745pm))
  
  (:goal
    (and 
      (met kenneth)
      (exists (?meet_start ?meet_end - time)
        (and (schedule kenneth nob_hill ?meet_start ?meet_end)
             (or (and (equal ?meet_start time_215pm) (equal ?meet_end time_345pm))
                 (and (equal ?meet_start time_345pm) (equal ?meet_end time_745pm))
                 (and (equal ?meet_start time_215pm) (equal ?meet_end time_745pm))))
      )))
)