(define (problem san_francisco_meet_john_instance)
  (:domain san_francisco_meet_john)

  (:objects
    richmond_district north_beach - place
    john - person
    t0900 t0917 t1515 t1630 t1715 - time
  )

  (:init
    (at richmond_district)
    (current_time t0900)

    (john_at john north_beach)

    (connected richmond_district north_beach)
    (connected north_beach richmond_district)

    (next_time t0917 t1515)
    (next_time t1630 t1715)
  )

  (:goal
    (and
      (met_minimum john)
    )
  )
)