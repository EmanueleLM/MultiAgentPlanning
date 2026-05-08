(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:init
    (at traveler nob_hill)
    (at carol sunset_district)
    (current_time t0900)
    (carol_available t1400)
  )

  (:goal
    (and
      (met carol)
    )
  )
)