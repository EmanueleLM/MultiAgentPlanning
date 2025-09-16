(define (problem meet-steph-twoagents-problem)
  (:domain meet-steph-twoagents)

  ; Objects: planners, Stephanie, Alex, and locations
  (:objects planner stephanie alex Marina Mission - location
            planner stephanie alex - person)

  (:init
     (= (time) 0)              ; 9:00 AM baseline
     (at planner Marina)        ; planner starts at Marina
     (at stephanie Marina)       ; Stephanie starts at Marina
     (at alex Mission)           ; Alex (availability) starts at Mission
  )

  (:goal (met planner stephanie))
)