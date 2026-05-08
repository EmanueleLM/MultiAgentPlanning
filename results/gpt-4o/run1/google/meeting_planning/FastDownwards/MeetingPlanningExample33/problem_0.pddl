(define (problem visit_sf_problem)
  (:domain san_francisco_visit)
  (:objects
    sunset_district union_square - location
    sarah - friend
  )
  (:init
    (at_location sunset_district)
    (friend_available sarah union_square)
  )
  (:goal (and 
    (met_friend sarah)
  ))
)