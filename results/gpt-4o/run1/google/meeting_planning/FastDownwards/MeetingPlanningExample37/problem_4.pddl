(define (problem visit_jeffrey)
  (:domain san_francisco_meeting)
  (:objects 
    bayview financial_district - location
    you - person
  )
  (:init
    (at you bayview)
    (can_travel bayview financial_district)
    (can_travel financial_district bayview)
  )
  (:goal
    (and
      (visited_jeffrey you))
  )
)