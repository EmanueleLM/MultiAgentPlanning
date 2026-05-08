(define (problem logistics16)
  (:domain logistics-with-phases)
  (:objects
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    package_0 package_1 package_2 package_3 - package

    location_0_0 location_0_1 location_1_0 location_1_1 - location

    city_0 city_1 - city

    p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p_done - phase
  )

  (:init
    (airport location_0_0)
    (airport location_1_0)

    (loc-in location_0_0 city_0)
    (loc-in location_0_1 city_0)
    (loc-in location_1_0 city_1)
    (loc-in location_1_1 city_1)

    (at-plane airplane_0 location_0_0)
    (at-plane airplane_1 location_0_0)
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)

    (at-pkg package_0 location_1_1)
    (at-pkg package_1 location_1_0)
    (at-pkg package_2 location_1_1)
    (at-pkg package_3 location_0_0)

    (current-phase p0)
    (phase-next p0 p1)  (phase-next p1 p2)  (phase-next p2 p3)  (phase-next p3 p4)
    (phase-next p4 p5)  (phase-next p5 p6)  (phase-next p6 p7)  (phase-next p7 p8)
    (phase-next p8 p9)  (phase-next p9 p10) (phase-next p10 p11) (phase-next p11 p12)
    (phase-next p12 p13) (phase-next p13 p14) (phase-next p14 p15) (phase-next p15 p16)
    (phase-next p16 p17) (phase-next p17 p18) (phase-next p18 p19) (phase-next p19 p20)
    (phase-next p20 p21) (phase-next p21 p22) (phase-next p22 p23) (phase-next p23 p24)
    (phase-next p24 p25) (phase-next p25 p26) (phase-next p26 p27) (phase-next p27 p28)
    (phase-next p28 p29) (phase-next p29 p_done)

    (phase-act p0) (phase-act p1) (phase-act p2) (phase-act p3) (phase-act p4)
    (phase-act p5) (phase-act p6) (phase-act p7) (phase-act p8) (phase-act p9)
    (phase-act p10) (phase-act p11) (phase-act p12) (phase-act p13) (phase-act p14)
    (phase-act p15) (phase-act p16) (phase-act p17) (phase-act p18) (phase-act p19)
    (phase-act p20) (phase-act p21) (phase-act p22) (phase-act p23) (phase-act p24)
    (phase-act p25) (phase-act p26) (phase-act p27) (phase-act p28) (phase-act p29)
  )

  (:goal (and
    (at-pkg package_0 location_0_0)
    (at-pkg package_1 location_1_1)
    (at-pkg package_2 location_0_1)
    (at-pkg package_3 location_1_1)
  ))
)