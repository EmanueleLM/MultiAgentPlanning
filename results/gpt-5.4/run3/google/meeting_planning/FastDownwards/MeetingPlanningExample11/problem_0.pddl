(define (problem san_francisco_meet_carol_instance)
  (:domain san_francisco_meet_carol)

  (:objects
    nob_hill sunset_district - location
    carol - person
    t_9_00am t_9_25am t_2_00pm t_3_15pm t_8_30pm - timepoint
  )

  (:init
    (at nob_hill)
    (current_time t_9_00am)

    (connected nob_hill sunset_district)

    (travel_arrives nob_hill sunset_district t_9_00am t_9_25am)

    (next_time t_9_25am t_2_00pm)
    (next_time t_2_00pm t_3_15pm)
    (next_time t_3_15pm t_8_30pm)

    (person_at carol sunset_district)
    (available_at carol t_2_00pm)
    (available_at carol t_3_15pm)
    (available_at carol t_8_30pm)
  )

  (:goal
    (and
      (met carol)
      (at sunset_district)
      (current_time t_3_15pm)
    )
  )
)