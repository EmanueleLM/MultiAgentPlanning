(define (problem san_francisco_betty_meeting_instance)
  (:domain san_francisco_betty_meeting)

  (:objects
    marina_district richmond_district - location
    betty - person
    t_0900 t_2019 t_2030 t_2145 t_2200 - time
  )

  (:init
    (at marina_district)
    (current t_0900)

    (next t_0900 t_2019)
    (next t_2019 t_2030)
    (next t_2030 t_2145)
    (next t_2145 t_2200)

    (travel_edge marina_district richmond_district t_2019 t_2030)

    (available betty richmond_district t_2030 t_2200)
    (meeting_block betty richmond_district t_2030 t_2145)
  )

  (:goal
    (and
      (met betty)
      (at richmond_district)
      (current t_2145)
    )
  )
)