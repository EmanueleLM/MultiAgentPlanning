(define (problem SatelliteImagingFleet-problem)
  (:domain SatelliteImagingFleet)

  (:objects
    satellite0 satellite1 satellite2 satellite3 satellite4 - satellite

    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 - instrument

    image3 image4 thermograph0 thermograph1 thermograph2 - mode

    GroundStation2 GroundStation3 Phenomenon5 Phenomenon12 Phenomenon18 Phenomenon27
    Planet6 Planet7 Planet8 Planet9 Planet10 Planet11 Planet13 Planet15 Planet16 Planet17 Planet20 Planet23 Planet24 Planet25 Planet28 Planet29
    Star0 Star1 Star4 Star14 Star19 Star21 Star22 Star26 - direction
  )

  (:init
    ;; onboard assignments
    (onboard instrument0 satellite0)
    (onboard instrument1 satellite0)
    (onboard instrument2 satellite1)
    (onboard instrument3 satellite2)
    (onboard instrument4 satellite2)
    (onboard instrument5 satellite3)
    (onboard instrument6 satellite4)
    (onboard instrument7 satellite4)
    (onboard instrument8 satellite4)

    ;; supports (static)
    (supports instrument0 image4)
    (supports instrument1 image4)
    (supports instrument1 thermograph1)
    (supports instrument2 image4)
    (supports instrument2 thermograph0)
    (supports instrument2 thermograph2)
    (supports instrument3 image3)
    (supports instrument3 image4)
    (supports instrument4 image3)
    (supports instrument5 image4)
    (supports instrument5 thermograph1)
    (supports instrument6 image3)
    (supports instrument6 thermograph0)
    (supports instrument6 thermograph1)
    (supports instrument7 thermograph0)
    (supports instrument7 thermograph2)
    (supports instrument8 image3)
    (supports instrument8 thermograph2)

    ;; calibration targets (static)
    (calib-target instrument0 GroundStation3)
    (calib-target instrument1 GroundStation3)
    (calib-target instrument2 GroundStation3)
    (calib-target instrument3 Star1)
    (calib-target instrument4 GroundStation3)
    (calib-target instrument5 GroundStation3)
    (calib-target instrument6 Star4)
    (calib-target instrument7 Star0)
    (calib-target instrument8 GroundStation3)

    ;; initial pointing per satellite
    (pointing satellite0 Star19)
    (pointing satellite1 Planet17)
    (pointing satellite2 Planet7)
    (pointing satellite3 Star4)
    (pointing satellite4 Phenomenon5)

    ;; initial stable pointing flags (satellite has been pointing before any turns)
    (pointing-stable satellite0 Star19)
    (pointing-stable satellite1 Planet17)
    (pointing-stable satellite2 Planet7)
    (pointing-stable satellite3 Star4)
    (pointing-stable satellite4 Phenomenon5)

    ;; initial power availability
    (power-available satellite0)
    (power-available satellite1)
    (power-available satellite2)
    (power-available satellite3)
    (power-available satellite4)

    ;; instruments initially unpowered and uncalibrated: absence of powered/calibrated predicates

    ;; initialize counts
    (= (count-mode thermograph1) 0)
    (= (count-mode image3) 0)
    (= (count-mode thermograph0) 0)
    (= (count-mode image4) 0)
    (= (count-mode thermograph2) 0)
  )

  (:goal (and
    ;; image goals
    (have-image Phenomenon5 thermograph1)
    (have-image Planet6 image4)
    (have-image Planet7 image3)
    (have-image Planet8 image3)
    (have-image Planet9 thermograph0)
    (have-image Planet10 thermograph1)
    (have-image Planet11 thermograph2)
    (have-image Phenomenon12 image3)
    (have-image Planet13 thermograph1)
    (have-image Star14 image3)
    (have-image Planet15 thermograph0)
    (have-image Planet16 image3)
    (have-image Planet17 image4)
    (have-image Phenomenon18 image3)
    (have-image Star19 thermograph0)
    (have-image Star21 thermograph1)
    (have-image Star22 image4)
    (have-image Planet23 thermograph1)
    (have-image Planet24 thermograph2)
    (have-image Planet25 thermograph1)
    (have-image Star26 thermograph0)
    (have-image Phenomenon27 thermograph1)
    (have-image Planet28 thermograph2)
    (have-image Planet29 thermograph0)

    ;; final pointing constraints
    (pointing satellite1 Phenomenon5)
    (pointing satellite2 Planet11)
    (pointing satellite4 Planet11)

    ;; mode counts match required totals
    (= (count-mode thermograph1) 7)
    (= (count-mode image3) 6)
    (= (count-mode thermograph0) 5)
    (= (count-mode image4) 3)
    (= (count-mode thermograph2) 3)
  ))

  (:metric minimize (total-time))
)