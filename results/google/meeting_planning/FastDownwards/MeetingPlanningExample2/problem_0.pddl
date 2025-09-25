(define (problem schedule-meeting)
  (:domain scheduling)
  (:objects
    visitor jessica - agent
    haight sunset - location
  )
  (:init
    ; initial locations
    (at visitor haight)
    (at jessica sunset)

    ; start time = 0 corresponds to 9:00AM
    (= (time) 0)
  )
  (:goal (met visitor jessica))
)