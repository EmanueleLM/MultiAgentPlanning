(define (problem san_francisco_meet_john_instance)
  (:domain san_francisco_meet_john)

  (:objects
    john - person
    t0900 t0915 t0930 t0945 t1000 t1015 t1030 t1045
    t1100 t1115 t1130 t1145 t1200 t1215 t1230 t1245
    t1300 t1315 t1330 t1345 t1400 t1415 t1430 t1445
    t1500 t1515 t1530 t1545 t1600 t1615 t1630 t1645
    t1700 t1715 t1730 t1745 t1800 t1815 t1830 t1845
    t1900 t1915 t1930 t1945 t2000 t2015 t2030 t2045
    t2100 - time
    m0 m1 m2 m3 m4 m5 - meet_stage
  )

  (:init
    (connected bayview russian_hill)
    (connected russian_hill bayview)

    (travel_two_step bayview russian_hill)
    (travel_two_step russian_hill bayview)

    (next_time t0900 t0915)
    (next_time t0915 t0930)
    (next_time t0930 t0945)
    (next_time t0945 t1000)
    (next_time t1000 t1015)
    (next_time t1015 t1030)
    (next_time t1030 t1045)
    (next_time t1045 t1100)
    (next_time t1100 t1115)
    (next_time t1115 t1130)
    (next_time t1130 t1145)
    (next_time t1145 t1200)
    (next_time t1200 t1215)
    (next_time t1215 t1230)
    (next_time t1230 t1245)
    (next_time t1245 t1300)
    (next_time t1300 t1315)
    (next_time t1315 t1330)
    (next_time t1330 t1345)
    (next_time t1345 t1400)
    (next_time t1400 t1415)
    (next_time t1415 t1430)
    (next_time t1430 t1445)
    (next_time t1445 t1500)
    (next_time t1500 t1515)
    (next_time t1515 t1530)
    (next_time t1530 t1545)
    (next_time t1545 t1600)
    (next_time t1600 t1615)
    (next_time t1615 t1630)
    (next_time t1630 t1645)
    (next_time t1645 t1700)
    (next_time t1700 t1715)
    (next_time t1715 t1730)
    (next_time t1730 t1745)
    (next_time t1745 t1800)
    (next_time t1800 t1815)
    (next_time t1815 t1830)
    (next_time t1830 t1845)
    (next_time t1845 t1900)
    (next_time t1900 t1915)
    (next_time t1915 t1930)
    (next_time t1930 t1945)
    (next_time t1945 t2000)
    (next_time t2000 t2015)
    (next_time t2015 t2030)
    (next_time t2030 t2045)
    (next_time t2045 t2100)

    (meeting_next m0 m1)
    (meeting_next m1 m2)
    (meeting_next m2 m3)
    (meeting_next m3 m4)
    (meeting_next m4 m5)

    (john_available t1730)
    (john_available t1745)
    (john_available t1800)
    (john_available t1815)
    (john_available t1830)
    (john_available t1845)
    (john_available t1900)
    (john_available t1915)
    (john_available t1930)
    (john_available t1945)
    (john_available t2000)
    (john_available t2015)
    (john_available t2030)
    (john_available t2045)

    (at traveler bayview)
    (current_time t0900)
    (meeting_stage m0)
  )

  (:goal
    (and
      (meeting_stage m5)
    )
  )
)