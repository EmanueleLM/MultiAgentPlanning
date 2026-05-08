(define (problem san_francisco_meet_mary_instance)
  (:domain san_francisco_meet_mary)

  (:objects
    nob_hill marina_district - location
    traveler mary - person
    t0900 t0911 t2000 t2200 - time
  )

  (:init
    (at traveler nob_hill)
    (at mary marina_district)
    (current_time t0900)
    (available mary marina_district t2000 t2200)
    (travel_nh_to_md nob_hill marina_district t0900 t0911)
    (next_time t0911 t2000)
  )

  (:goal
    (and
      (met mary)
      (at traveler marina_district)
      (current_time t2200)
    )
  )
)