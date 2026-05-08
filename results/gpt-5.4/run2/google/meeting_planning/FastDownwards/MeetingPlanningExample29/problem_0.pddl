(define (problem san_francisco_meet_nancy_instance)
  (:domain san_francisco_meet_nancy)

  (:objects
    you - traveler
    sunset_district haight_ashbury - location
    nancy - friend
    t0900 t0915 t0930 t0945
    t1000 t1015 t1030 t1045
    t1100 t1115 t1130 t1145
    t1200 t1215 t1230 t1245
    t1300 t1315 t1330 t1345
    t1400 t1415 t1430 t1445
    t1500 t1515 t1530 t1545
    t1600 t1615 t1630 t1645
    t1700 t1715 t1730 t1745
    t1800 t1815 t1830 t1845
    t1900 t1915 t1930 t1945
    t2000 t2015 t2030 t2045
    t2100 t2115 t2130 t2145 - time
    m0 m1 m2 m3 m4 m5 - meeting_stage
  )

  (:init
    (at you sunset_district)

    (road sunset_district haight_ashbury)
    (road haight_ashbury sunset_district)

    (current_time t0900)

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
    (next_time t2100 t2115)
    (next_time t2115 t2130)
    (next_time t2130 t2145)

    (friend_at nancy haight_ashbury)

    (available nancy t1930)
    (available nancy t1945)
    (available nancy t2000)
    (available nancy t2015)
    (available nancy t2030)
    (available nancy t2045)
    (available nancy t2100)
    (available nancy t2115)
    (available nancy t2130)

    (meeting_progress nancy m0)

    (next_stage m1 m2)
    (next_stage m2 m3)
    (next_stage m3 m4)
  )

  (:goal
    (and
      (met_minimum nancy)
      (meeting_progress nancy m5)
    )
  )
)