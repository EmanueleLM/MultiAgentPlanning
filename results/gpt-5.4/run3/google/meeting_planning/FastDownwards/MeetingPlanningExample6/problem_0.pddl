(define (problem san_francisco_meeting_kenneth_instance)
  (:domain san_francisco_meeting_kenneth)

  (:objects
    fishermans_wharf nob_hill - location
    kenneth - person
    t_0900 t_0911 t_1415 t_1445 t_1515 t_1545 - timepoint
    m0 m30 m60 m90 - meet_stage
  )

  (:init
    (at fishermans_wharf)
    (current_time t_0900)
    (meeting_stage m0)

    (person_at kenneth nob_hill)

    (travel_edge fishermans_wharf nob_hill)
    (travel_edge nob_hill fishermans_wharf)
    (travel_arrives fishermans_wharf nob_hill t_0900 t_0911)

    (next_time t_0900 t_0911)
    (next_time t_0911 t_1415)
    (next_time t_1415 t_1445)
    (next_time t_1445 t_1515)
    (next_time t_1515 t_1545)

    (available_at kenneth t_1415)
    (available_at kenneth t_1445)
    (available_at kenneth t_1515)
  )

  (:goal
    (and
      (met_minimum kenneth)
      (at nob_hill)
      (current_time t_1545)
      (meeting_stage m90)
      (not (in_meeting kenneth))
    )
  )
)