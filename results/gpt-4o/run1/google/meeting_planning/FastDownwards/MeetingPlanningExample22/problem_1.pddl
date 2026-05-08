(define (problem san_francisco_meetup)
  (:domain san_francisco_scheduling)

  (:objects
    presidio union_square - location
    andrew - person
    self - person
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 - stage
  )

  (:init
    (at self presidio)
    (can_travel_to presidio union_square)
    (can_travel_to union_square presidio)
    (at andrew union_square)
    (current_time_stage stage_0)
    (time_stage stage_0) ; 9:00AM
    (time_stage stage_1) ; 11:15AM
    (time_stage stage_2) ; 11:45AM
    (time_stage stage_3) ; 12:30PM
    (time_stage stage_4) ; 1:15PM
    (time_stage stage_5) ; 2:00PM
    (time_stage stage_6) ; 2:45PM
    (time_stage stage_7) ; 3:30PM
    (time_stage stage_8) ; 4:15PM
    (time_stage stage_9) ; 5:15PM
    (not (visited union_square))
    (not (met andrew))
  )

  (:goal (and
    (met andrew)
    (visited union_square)
    (current_time_stage stage_9)
  ))
)