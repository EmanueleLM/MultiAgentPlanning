(define (problem meetingplanningexample11-problem)
  (:domain meetingplanningexample11)
  (:objects
    Nob_Hill Sunset_District - location
    Carol - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330
    t1400 t1430 t1500 t1530 t1600 t1630 t1700 t1730 t1800 t1830
    t1900 t1930 t2000 t2030 - slot
  )
  (:init
    (at Nob_Hill)
    (time t0900)

    ; time successor relation (30-minute slots)
    (next t0900 t0930)
    (next t0930 t1000)
    (next t1000 t1030)
    (next t1030 t1100)
    (next t1100 t1130)
    (next t1130 t1200)
    (next t1200 t1230)
    (next t1230 t1300)
    (next t1300 t1330)
    (next t1330 t1400)
    (next t1400 t1430)
    (next t1430 t1500)
    (next t1500 t1530)
    (next t1530 t1600)
    (next t1600 t1630)
    (next t1630 t1700)
    (next t1700 t1730)
    (next t1730 t1800)
    (next t1800 t1830)
    (next t1830 t1900)
    (next t1900 t1930)
    (next t1930 t2000)
    (next t2000 t2030)

    ; directed roads and their minute costs
    (road Nob_Hill Sunset_District)
    (road Sunset_District Nob_Hill)
    (= (tt Nob_Hill Sunset_District) 25)
    (= (tt Sunset_District Nob_Hill) 27)

    ; Carol's meeting location and availability window
    (meet-loc Carol Sunset_District)
    (available Carol t1400)
    (available Carol t1430)
    (available Carol t1500)
    (available Carol t1530)
    (available Carol t1600)
    (available Carol t1630)
    (available Carol t1700)
    (available Carol t1730)
    (available Carol t1800)
    (available Carol t1830)
    (available Carol t1900)
    (available Carol t1930)
    (available Carol t2000)
    (available Carol t2030)

    ; meeting progression starts at stage 0
    (meeting-stage0)
    (= (total-cost) 0)
  )
  (:goal (and
    (meeting-complete)
  ))
  (:metric minimize (total-cost))
)