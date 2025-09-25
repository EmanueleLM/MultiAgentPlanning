(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    you john - agent
    richmond north-beach - location
  )
  (:init
    (at you richmond)
    (at john north-beach)
    (= (current-time) 540)
  )
  (:goal (met-you-john))
)