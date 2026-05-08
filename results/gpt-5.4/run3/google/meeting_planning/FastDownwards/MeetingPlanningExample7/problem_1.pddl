(define (problem san_francisco_meet_john_instance)
  (:domain san_francisco_meet_john)

  (:objects
    richmond_district north_beach - location
    t0900 t1457 t1515 t1630 - timepoint
  )

  (:init
    (at richmond_district)
    (current_time t0900)

    (connected richmond_district north_beach)

    (next_time t0900 t1457)

    (travel_departure richmond_district north_beach t1457)
    (travel_arrival richmond_district north_beach t1515)

    (available_start john north_beach t1515)
    (meeting_end john t1515 t1630)
  )

  (:goal
    (and
      (met john)
      (at north_beach)
      (current_time t1630)
    )
  )
)