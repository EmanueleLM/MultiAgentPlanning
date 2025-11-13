(define (problem sf-meet-nancy-problem)
  (:domain sf-meet-nancy)
  (:objects
    sunset_district haight_ashbury - location
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
  )
  (:init
    (at sunset_district)
    (at-slot t0900)
    (progress-p0)
    (at-haight haight_ashbury)

    (next t0900 t0915)
    (next t0915 t0930)
    (next t0930 t0945)
    (next t0945 t1000)
    (next t1000 t1015)
    (next t1015 t1030)
    (next t1030 t1045)
    (next t1045 t1100)
    (next t1100 t1115)
    (next t1115 t1130)
    (next t1130 t1145)
    (next t1145 t1200)
    (next t1200 t1215)
    (next t1215 t1230)
    (next t1230 t1245)
    (next t1245 t1300)
    (next t1300 t1315)
    (next t1315 t1330)
    (next t1330 t1345)
    (next t1345 t1400)
    (next t1400 t1415)
    (next t1415 t1430)
    (next t1430 t1445)
    (next t1445 t1500)
    (next t1500 t1515)
    (next t1515 t1530)
    (next t1530 t1545)
    (next t1545 t1600)
    (next t1600 t1615)
    (next t1615 t1630)
    (next t1630 t1645)
    (next t1645 t1700)
    (next t1700 t1715)
    (next t1715 t1730)
    (next t1730 t1745)
    (next t1745 t1800)
    (next t1800 t1815)
    (next t1815 t1830)
    (next t1830 t1845)
    (next t1845 t1900)
    (next t1900 t1915)
    (next t1915 t1930)
    (next t1930 t1945)
    (next t1945 t2000)
    (next t2000 t2015)
    (next t2015 t2030)
    (next t2030 t2045)
    (next t2045 t2100)
    (next t2100 t2115)
    (next t2115 t2130)
    (next t2130 t2145)

    (within-nancy-window t1930)
    (within-nancy-window t1945)
    (within-nancy-window t2000)
    (within-nancy-window t2015)
    (within-nancy-window t2030)
    (within-nancy-window t2045)
    (within-nancy-window t2100)
    (within-nancy-window t2115)
    (within-nancy-window t2130)
  )
  (:goal (and
    (progress-p5)
  ))
)