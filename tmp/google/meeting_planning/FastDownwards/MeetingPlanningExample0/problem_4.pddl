(define (problem meet-steph-twoagents-problem)
  (:domain meet-steph-twoagents)

  (:objects planner stephanie - person marina mission - location)

  (:init
     (at planner marina)
     (at stephanie mission)
  )

  (:goal (met planner stephanie))
)