(define (problem meet-steph-twoagents-problem)
  (:domain meet-steph-twoagents)

  (:objects planner stephanie - person Marina Mission - location)

  (:init
     (at planner Marina)
     (at stephanie Marina)
  )

  (:goal (met planner stephanie))
)