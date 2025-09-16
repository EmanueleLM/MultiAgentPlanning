(define (problem meet-steph-twoagents-problem)
  (:domain meet-steph-twoagents)

  (:objects planner stephanie marina mission - location)

  (:init
     (at planner marina)
     (at stephanie marina)
  )

  (:goal (met planner stephanie))
)