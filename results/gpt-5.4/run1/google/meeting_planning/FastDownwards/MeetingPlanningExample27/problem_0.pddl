(define (problem san_francisco_meet_margaret_instance)
  (:domain san_francisco_meet_margaret)

  (:objects
    visitor - traveler
    margaret - person

    marina_district pacific_heights - location

    t_0900 t_0915 t_0930 t_0945
    t_1000 t_1015 t_1030 t_1045
    t_1100 t_1115 t_1130 t_1145
    t_1200 t_1215 t_1230 t_1245
    t_1300 t_1315 t_1330 t_1345
    t_1400 t_1415 t_1430 t_1445
    t_1500 t_1515 t_1530 t_1545
    t_1600 t_1615 t_1630 t_1645
    t_1700 t_1715 t_1730 t_1745
    t_1800 t_1815 t_1830 t_1845
    t_1900 t_1915 t_1930 t_1945 - timepoint
  )

  (:init
    (at visitor marina_district)
    (current_time t_0900)

    (connected marina_district pacific_heights)
    (connected pacific_heights marina_district)

    (next_time t_0900 t_0915)
    (next_time t_0915 t_0930)
    (next_time t_0930 t_0945)
    (next_time t_0945 t_1000)
    (next_time t_1000 t_1015)
    (next_time t_1015 t_1030)
    (next_time t_1030 t_1045)
    (next_time t_1045 t_1100)
    (next_time t_1100 t_1115)
    (next_time t_1115 t_1130)
    (next_time t_1130 t_1145)
    (next_time t_1145 t_1200)
    (next_time t_1200 t_1215)
    (next_time t_1215 t_1230)
    (next_time t_1230 t_1245)
    (next_time t_1245 t_1300)
    (next_time t_1300 t_1315)
    (next_time t_1315 t_1330)
    (next_time t_1330 t_1345)
    (next_time t_1345 t_1400)
    (next_time t_1400 t_1415)
    (next_time t_1415 t_1430)
    (next_time t_1430 t_1445)
    (next_time t_1445 t_1500)
    (next_time t_1500 t_1515)
    (next_time t_1515 t_1530)
    (next_time t_1530 t_1545)
    (next_time t_1545 t_1600)
    (next_time t_1600 t_1615)
    (next_time t_1615 t_1630)
    (next_time t_1630 t_1645)
    (next_time t_1645 t_1700)
    (next_time t_1700 t_1715)
    (next_time t_1715 t_1730)
    (next_time t_1730 t_1745)
    (next_time t_1745 t_1800)
    (next_time t_1800 t_1815)
    (next_time t_1815 t_1830)
    (next_time t_1830 t_1845)
    (next_time t_1845 t_1900)
    (next_time t_1900 t_1915)
    (next_time t_1915 t_1930)
    (next_time t_1930 t_1945)

    (margaret_available pacific_heights t_1900)
    (margaret_available pacific_heights t_1915)
    (margaret_available pacific_heights t_1930)
  )

  (:goal
    (and
      (met margaret)
    )
  )
)