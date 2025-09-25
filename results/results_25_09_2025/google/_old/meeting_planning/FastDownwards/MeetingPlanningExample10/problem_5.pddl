(define (problem meet-james-combined-problem-fd)
  (:domain meet-james-combined-fd)

  (:objects
    visitor james - person
    golden_gate_park marina_district - location
    t540 t599 t615 t630 t645 t660 t675 t690 t705 t720 t735 t750 t765 t780 t795 t810 - timepoint
  )

  (:init
    (travel16 t599 t615)

    (later t540 t599)
    (later t599 t615)
    (later t615 t630)
    (later t630 t645)
    (later t645 t660)
    (later t660 t675)
    (later t675 t690)
    (later t690 t705)
    (later t705 t720)
    (later t720 t735)
    (later t735 t750)
    (later t750 t765)
    (later t765 t780)
    (later t780 t795)
    (later t795 t810)

    (meeting15 t615 t630)
    (meeting15 t630 t645)
    (meeting15 t645 t660)
    (meeting15 t660 t675)
    (meeting15 t675 t690)
    (meeting15 t690 t705)
    (meeting15 t705 t720)
    (meeting15 t720 t735)
    (meeting15 t735 t750)
    (meeting15 t750 t765)
    (meeting15 t765 t780)
    (meeting15 t780 t795)
    (meeting15 t795 t810)

    (avail-interval james marina_district t615 t630)
    (avail-interval james marina_district t630 t645)
    (avail-interval james marina_district t645 t660)
    (avail-interval james marina_district t660 t675)
    (avail-interval james marina_district t675 t690)
    (avail-interval james marina_district t690 t705)
    (avail-interval james marina_district t705 t720)
    (avail-interval james marina_district t720 t735)
    (avail-interval james marina_district t735 t750)
    (avail-interval james marina_district t750 t765)
    (avail-interval james marina_district t765 t780)
    (avail-interval james marina_district t780 t795)
    (avail-interval james marina_district t795 t810)

    (at visitor golden_gate_park t540)

    (at james marina_district t615)
    (at james marina_district t630)
    (at james marina_district t645)
    (at james marina_district t660)
    (at james marina_district t675)
    (at james marina_district t690)
    (at james marina_district t705)
    (at james marina_district t720)
    (at james marina_district t735)
    (at james marina_district t750)
    (at james marina_district t765)
    (at james marina_district t780)
    (at james marina_district t795)

    (= (total-cost) 0)
  )

  (:goal (met visitor james))

  (:metric minimize (total-cost))
)