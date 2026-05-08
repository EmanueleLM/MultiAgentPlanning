(define (problem meet-jessica-problem)
  (:domain meeting-with-jessica)

  (:objects
    ;; timeslots from 09:00 to 21:00 in 15-minute increments
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
    t2100 - timeslot

    haight_ashbury sunset_district - location
  )

  (:init
    ;; initial agent location
    (at haight_ashbury)
    ;; initially not co-located with Jessica
    ;; (at_jessica_location) is false unless at sunset_district via travel action

    ;; time starts at 09:00
    (current t0900)

    ;; stage flags: start in stage0
    (stage0)

    ;; next relations for contiguous 15-minute slots
    (next t0900 t0915) (next t0915 t0930) (next t0930 t0945) (next t0945 t1000)
    (next t1000 t1015) (next t1015 t1030) (next t1030 t1045) (next t1045 t1100)
    (next t1100 t1115) (next t1115 t1130) (next t1130 t1145) (next t1145 t1200)
    (next t1200 t1215) (next t1215 t1230) (next t1230 t1245) (next t1245 t1300)
    (next t1300 t1315) (next t1315 t1330) (next t1330 t1345) (next t1345 t1400)
    (next t1400 t1415) (next t1415 t1430) (next t1430 t1445) (next t1445 t1500)
    (next t1500 t1515) (next t1515 t1530) (next t1530 t1545) (next t1545 t1600)
    (next t1600 t1615) (next t1615 t1630) (next t1630 t1645) (next t1645 t1700)
    (next t1700 t1715) (next t1715 t1730) (next t1730 t1745) (next t1745 t1800)
    (next t1800 t1815) (next t1815 t1830) (next t1830 t1845) (next t1845 t1900)
    (next t1900 t1915) (next t1915 t1930) (next t1930 t1945) (next t1945 t2000)
    (next t2000 t2015) (next t2015 t2030) (next t2030 t2045) (next t2045 t2100)

    ;; Jessica availability: from 15:15 to 20:15 inclusive
    (avail_jessica t1515) (avail_jessica t1530) (avail_jessica t1545)
    (avail_jessica t1600) (avail_jessica t1615) (avail_jessica t1630)
    (avail_jessica t1645) (avail_jessica t1700) (avail_jessica t1715)
    (avail_jessica t1730) (avail_jessica t1745) (avail_jessica t1800)
    (avail_jessica t1815) (avail_jessica t1830) (avail_jessica t1845)
    (avail_jessica t1900) (avail_jessica t1915) (avail_jessica t1930)
    (avail_jessica t1945) (avail_jessica t2000) (avail_jessica t2015)
  )

  ;; Goal: meeting completed (stage6)
  (:goal (and
    (stage6)
  ))
)