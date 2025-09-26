(define (problem SatelliteImagingFleet-problem)
  (:domain SatelliteImagingFleet)

  (:objects
    satellite0 satellite1 satellite2 satellite3 satellite4 satellite5 - satellite

    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 instrument10 instrument11 - instrument

    image1 image2 thermograph0 thermograph3 thermograph4 - mode

    GroundStation0 GroundStation1 GroundStation2 GroundStation3 GroundStation4
    Phenomenon5 Phenomenon6 Phenomenon7 Phenomenon11 Phenomenon12 Phenomenon13 Phenomenon18
    Planet8 Planet15 Planet16 Planet17 Planet21 Planet23
    Star9 Star10 Star14 Star19 Star20 Star22 Star24 - direction
  )

  (:init
    (onboard instrument0 satellite0)
    (onboard instrument1 satellite0)
    (onboard instrument2 satellite0)
    (onboard instrument3 satellite1)
    (onboard instrument4 satellite2)
    (onboard instrument5 satellite2)
    (onboard instrument6 satellite2)
    (onboard instrument7 satellite3)
    (onboard instrument8 satellite3)
    (onboard instrument9 satellite4)
    (onboard instrument10 satellite4)
    (onboard instrument11 satellite5)

    (supports instrument0 image1)
    (supports instrument0 thermograph0)

    (supports instrument1 image2)
    (supports instrument1 thermograph3)

    (supports instrument2 image1)
    (supports instrument2 thermograph3)
    (supports instrument2 thermograph4)

    (supports instrument3 image2)
    (supports instrument3 thermograph0)
    (supports instrument3 thermograph4)

    (supports instrument4 image1)
    (supports instrument4 thermograph0)
    (supports instrument4 thermograph4)

    (supports instrument5 thermograph4)

    (supports instrument6 image1)
    (supports instrument6 thermograph3)

    (supports instrument7 image2)
    (supports instrument7 thermograph3)

    (supports instrument8 thermograph0)
    (supports instrument8 thermograph4)

    (supports instrument9 image1)
    (supports instrument9 image2)
    (supports instrument9 thermograph0)

    (supports instrument10 image1)
    (supports instrument10 thermograph3)

    (supports instrument11 image2)
    (supports instrument11 thermograph0)

    (calib-target instrument0 GroundStation2)
    (calib-target instrument1 GroundStation0)
    (calib-target instrument2 GroundStation2)
    (calib-target instrument3 GroundStation2)
    (calib-target instrument4 GroundStation1)
    (calib-target instrument5 GroundStation4)
    (calib-target instrument6 GroundStation0)
    (calib-target instrument7 GroundStation4)
    (calib-target instrument8 GroundStation2)
    (calib-target instrument9 GroundStation2)
    (calib-target instrument10 GroundStation0)
    (calib-target instrument11 GroundStation1)

    (pointing satellite0 Phenomenon12)
    (pointing satellite1 GroundStation1)
    (pointing satellite2 GroundStation2)
    (pointing satellite3 GroundStation4)
    (pointing satellite4 Planet15)
    (pointing satellite5 Phenomenon11)

    (power-available satellite0)
    (power-available satellite1)
    (power-available satellite2)
    (power-available satellite3)
    (power-available satellite4)
    (power-available satellite5)

    (sat-idle satellite0)
    (sat-idle satellite1)
    (sat-idle satellite2)
    (sat-idle satellite3)
    (sat-idle satellite4)
    (sat-idle satellite5)

    (= (count-mode image1) 0)
    (= (count-mode thermograph0) 0)
    (= (count-mode image2) 0)
    (= (count-mode thermograph4) 0)
    (= (count-mode thermograph3) 0)
  )

  (:goal (and
    (have-image Phenomenon5 image1)
    (have-image Phenomenon7 thermograph0)
    (have-image Planet8 image2)
    (have-image Star9 thermograph0)
    (have-image Star10 thermograph3)
    (have-image Phenomenon12 thermograph0)
    (have-image Phenomenon13 image1)
    (have-image Star14 thermograph4)
    (have-image Planet15 image2)
    (have-image Planet17 image2)
    (have-image Phenomenon18 image1)
    (have-image Star19 thermograph4)
    (have-image Star20 thermograph4)
    (have-image Planet21 thermograph0)
    (have-image Star22 thermograph3)
    (have-image Planet23 image1)

    (pointing satellite0 Planet21)
    (pointing satellite2 Star14)
    (pointing satellite5 Planet17)

    (= (count-mode image1) 4)
    (= (count-mode thermograph0) 4)
    (= (count-mode image2) 3)
    (= (count-mode thermograph4) 3)
    (= (count-mode thermograph3) 2)
  ))

  (:metric minimize (total-time))
)