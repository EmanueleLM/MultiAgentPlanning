(define (problem meet-steph-twoagents-time-problem)
  (:domain meet-steph-twoagents-time)

  (:objects you stephanie - person marina mission - location)

  (:init
     (at you marina)
     (at stephanie mission)
     (= (clock) 0)
  )

  (:goal (met you stephanie))
)