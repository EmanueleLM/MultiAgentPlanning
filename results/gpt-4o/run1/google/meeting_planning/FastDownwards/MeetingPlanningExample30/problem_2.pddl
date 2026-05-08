(define (problem san_francisco_visit_problem)
  (:domain san_francisco_visit)

  (:init
    (at you richmond_district)
    (at stephanie north_beach)
    (stage_reached stage_0)
  )

  (:goal (and
    (visited you north_beach)
    (visited you richmond_district)
    (met_stephanie)
  ))
)