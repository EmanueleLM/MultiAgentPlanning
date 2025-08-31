(define (problem meet-orchestrated-problem)
  (:domain meet-orchestrated)
  (:objects
    traveler james - person
    marina alamo - location
    t540 t555 t570 t585 t600 t615 t630 t645 t660 t675
    t690 t705 t720 t735 t750 t765 t780 t795 t810 t825
    t840 t855 t870 t885 t900 t915 t930 t945 t960 t975
    t990 t1005 t1020 t1035 t1050 t1065 t1080 t1095 t1110 t1125
    t1140 t1155 t1170 t1185 t1200 - time
  )

  (:init
    (next t540 t555) (next t555 t570) (next t570 t585) (next t585 t600)
    (next t600 t615) (next t615 t630) (next t630 t645) (next t645 t660)
    (next t660 t675) (next t675 t690) (next t690 t705) (next t705 t720)
    (next t720 t735) (next t735 t750) (next t750 t765) (next t765 t780)
    (next t780 t795) (next t795 t810) (next t810 t825) (next t825 t840)
    (next t840 t855) (next t855 t870) (next t870 t885) (next t885 t900)
    (next t900 t915) (next t915 t930) (next t930 t945) (next t945 t960)
    (next t960 t975) (next t975 t990) (next t990 t1005) (next t1005 t1020)
    (next t1020 t1035) (next t1035 t1050) (next t1050 t1065) (next t1065 t1080)
    (next t1080 t1095) (next t1095 t1110) (next t1110 t1125) (next t1125 t1140)
    (next t1140 t1155) (next t1155 t1170) (next t1170 t1185) (next t1185 t1200)

    (allowed-at traveler t540) (allowed-at traveler t555) (allowed-at traveler t570)
    (allowed-at traveler t585) (allowed-at traveler t600) (allowed-at traveler t615)
    (allowed-at traveler t630) (allowed-at traveler t645) (allowed-at traveler t660)
    (allowed-at traveler t675) (allowed-at traveler t690) (allowed-at traveler t705)
    (allowed-at traveler t720) (allowed-at traveler t735) (allowed-at traveler t750)
    (allowed-at traveler t765) (allowed-at traveler t780) (allowed-at traveler t795)
    (allowed-at traveler t810) (allowed-at traveler t825) (allowed-at traveler t840)
    (allowed-at traveler t855) (allowed-at traveler t870) (allowed-at traveler t885)
    (allowed-at traveler t900) (allowed-at traveler t915) (allowed-at traveler t930)
    (allowed-at traveler t945) (allowed-at traveler t960) (allowed-at traveler t975)
    (allowed-at traveler t990) (allowed-at traveler t1005) (allowed-at traveler t1020)
    (allowed-at traveler t1035) (allowed-at traveler t1050) (allowed-at traveler t1065)
    (allowed-at traveler t1080) (allowed-at traveler t1095) (allowed-at traveler t1110)
    (allowed-at traveler t1125) (allowed-at traveler t1140) (allowed-at traveler t1155)
    (allowed-at traveler t1170) (allowed-at traveler t1185) (allowed-at traveler t1200)

    (allowed-at james t945) (allowed-at james t960) (allowed-at james t975)
    (allowed-at james t990) (allowed-at james t1005) (allowed-at james t1020)
    (allowed-at james t1035) (allowed-at james t1050) (allowed-at james t1065)
    (allowed-at james t1080) (allowed-at james t1095) (allowed-at james t1110)
    (allowed-at james t1125) (allowed-at james t1140) (allowed-at james t1155)
    (allowed-at james t1170) (allowed-at james t1185) (allowed-at james t1200)

    (at traveler marina t540)

    (at james alamo t945) (at james alamo t960) (at james alamo t975)
    (at james alamo t990) (at james alamo t1005) (at james alamo t1020)
    (at james alamo t1035) (at james alamo t1050) (at james alamo t1065)
    (at james alamo t1080) (at james alamo t1095) (at james alamo t1110)
    (at james alamo t1125) (at james alamo t1140) (at james alamo t1155)
    (at james alamo t1170) (at james alamo t1185) (at james alamo t1200)

    (= (total-cost) 0)
  )

  (:goal (met traveler james))
  (:metric minimize (total-cost))
)