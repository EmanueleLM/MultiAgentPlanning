(define (problem meet-carol-problem-classical)
  (:domain meet-visitors-classical)
  (:objects
    visitor carol - person
    nob_hill sunset_district - location
  )
  (:init
    (= (time) 0)
    (= (total-cost) 0)
    (= (carol-start) 300)
    (= (carol-end) 690)
    (at visitor nob_hill)
    (at carol sunset_district)
  )
  (:goal (accounted carol))
  (:metric minimize (total-cost))
)