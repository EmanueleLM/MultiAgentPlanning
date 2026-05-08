(define (problem san_francisco_meet_stephanie_instance)
  (:domain san_francisco_meet_stephanie)

  (:objects
    marina_district mission_district - location
    stephanie - person
    t900 t930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 - time
    m0 m1 m2 m3 m4 - meeting_stage
  )

  (:init
    (at marina_district)
    (current_time t900)

    (connected marina_district mission_district)
    (connected mission_district marina_district)

    (next_time t900 t930)
    (next_time t930 t1000)
    (next_time t1000 t1030)
    (next_time t1030 t1100)
    (next_time t1100 t1130)
    (next_time t1130 t1200)
    (next_time t1200 t1230)
    (next_time t1230 t1300)
    (next_time t1300 t1330)

    (available stephanie t1030)
    (available stephanie t1100)
    (available stephanie t1130)
    (available stephanie t1200)
    (available stephanie t1230)

    (meeting_progress stephanie m0)

    (next_meeting_stage m0 m1)
    (next_meeting_stage m1 m2)
    (next_meeting_stage m2 m3)
    (next_meeting_stage m3 m4)
  )

  (:goal
    (and
      (meeting_progress stephanie m4)
      (at mission_district)
    )
  )
)