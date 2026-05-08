(define (problem san_francisco_joshua_meeting_instance)
  (:domain san_francisco_joshua_meeting)

  (:objects
    union_square chinatown - location
    joshua - person
    t_9_00am t_6_00pm t_7_15pm t_9_30pm - time
  )

  (:init
    (at union_square)

    (connected union_square chinatown)
    (connected chinatown union_square)

    (current_time t_9_00am)

    (next_time t_9_00am t_6_00pm)
    (next_time t_6_00pm t_7_15pm)
    (next_time t_7_15pm t_9_30pm)

    (person_at joshua chinatown)
    (available joshua t_6_00pm t_9_30pm)
  )

  (:goal
    (and
      (met joshua)
      (current_time t_7_15pm)
      (at chinatown)
    )
  )
)