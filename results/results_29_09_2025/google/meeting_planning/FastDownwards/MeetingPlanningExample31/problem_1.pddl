(define (problem meet-anthony-problem)
  (:domain meet-friends)
  (:objects
    traveler anthony nobhill alamosquare
  )
  (:init
    (at traveler nobhill)
    (at anthony alamosquare)
    (= (time) 540)
    (= (met-count) 0)
    (= (anthony-start) 435)
    (= (anthony-end) 780)
  )
  (:goal (and))
)