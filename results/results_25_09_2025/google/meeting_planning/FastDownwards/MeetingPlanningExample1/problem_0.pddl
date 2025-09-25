(define (problem meet-problem)
  (:domain meet-domain)
  (:objects
    you betty - agent
    Richmond Financial - location
  )
  (:init
    (at you Richmond)
    ;; Betty is not initially marked available; she will become available by action when time >= 1035
    (= (time) 540) ; 09:00 = 9*60 = 540 minutes
  )
  (:goal (met))
  (:metric minimize (time))
)