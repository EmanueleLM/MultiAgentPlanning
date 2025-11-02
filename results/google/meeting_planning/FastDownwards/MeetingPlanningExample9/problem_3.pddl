(define (problem meetingplanningexample9_problem_strips)
  (:domain meetingplanningexample9_strips)
  (:objects
    union_square nob_hill - location
    mary - person
    t540 t720 t729 t804 - timepoint
  )
  (:init
    (at union_square)
    (friend-location mary nob_hill)
    (time t540)
    (before-noon t540)
    (plus9 t720 t729)
    (plus75 t729 t804)
    (start-ok t729)
  )
  (:goal (met mary))
)