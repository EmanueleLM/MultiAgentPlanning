(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    satellite0 satellite1 satellite2 satellite3 satellite4 - satellite
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 - instrument
    image3 image4 thermograph0 thermograph1 thermograph2 - mode
    GroundStation2 GroundStation3 Phenomenon5 Phenomenon12 Phenomenon18 Phenomenon27
    Planet6 Planet7 Planet8 Planet9 Planet10 Planet11 Planet13 Planet15 Planet16 Planet17 Planet20 Planet23 Planet24 Planet25 Planet28 Planet29
    Star0 Star1 Star4 Star14 Star19 Star21 Star22 Star26 - direction
  )

  (:init
    ;; on-board relations
    (on-board instrument0 satellite0)
    (on-board instrument1 satellite0)
    (on-board instrument2 satellite1)
    (on-board instrument3 satellite2)
    (on-board instrument4 satellite2)
    (on-board instrument5 satellite3)
    (on-board instrument6 satellite4)
    (on-board instrument7 satellite4)
    (on-board instrument8 satellite4)

    ;; supports
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

    ;; calibration targets
    (calib-target instrument0 GroundStation3)
    (calib-target instrument1 GroundStation3)
    (calib-target instrument2 GroundStation3)
    (calib-target instrument3 Star1)
    (calib-target instrument4 GroundStation3)
    (calib-target instrument5 GroundStation3)
    (calib-target instrument6 Star4)
    (calib-target instrument7 Star0)
    (calib-target instrument8 GroundStation3)

    ;; initial pointing
    (pointing satellite0 Star19)
    (pointing satellite1 Planet17)
    (pointing satellite2 Planet7)
    (pointing satellite3 Star4)
    (pointing satellite4 Phenomenon5)

    ;; power availability and usage
    (power-available satellite0)
    (power-available satellite1)
    (power-available satellite2)
    (power-available satellite3)
    (power-available satellite4)

    ;; no satellite is busy initially
    ;; (power-busy ...) none initially

    ;; instruments initially powered? all false: do not assert (powered ...)
    ;; instruments initially calibrated? all false: do not assert (calibrated ...)

    ;; numeric counts initialised to 0
    (= (count-mode image3) 0)
    (= (count-mode image4) 0)
    (= (count-mode thermograph0) 0)
    (= (count-mode thermograph1) 0)
    (= (count-mode thermograph2) 0)
  )

  (:goal (and
    ;; explicit image goals (direction + mode)
    (image-taken thermograph1 Phenomenon5)
    (image-taken image4 Planet6)
    (image-taken image3 Planet7)
    (image-taken image3 Planet8)
    (image-taken thermograph0 Planet9)
    (image-taken thermograph1 Planet10)
    (image-taken thermograph2 Planet11)
    (image-taken image3 Phenomenon12)
    (image-taken thermograph1 Planet13)
    (image-taken image3 Star14)
    (image-taken thermograph0 Planet15)
    (image-taken image3 Planet16)
    (image-taken image4 Planet17)
    (image-taken image3 Phenomenon18)
    (image-taken thermograph0 Star19)
    (image-taken thermograph1 Star21)
    (image-taken image4 Star22)
    (image-taken thermograph1 Planet23)
    (image-taken thermograph2 Planet24)
    (image-taken thermograph1 Planet25)
    (image-taken thermograph0 Star26)
    (image-taken thermograph1 Phenomenon27)
    (image-taken thermograph2 Planet28)
    (image-taken thermograph0 Planet29)

    ;; final pointing constraints
    (pointing satellite1 Phenomenon5)
    (pointing satellite2 Planet11)
    (pointing satellite4 Planet11)

    ;; mode count constraints (numeric goals)
    (= (count-mode thermograph1) 7)
    (= (count-mode image3) 6)
    (= (count-mode thermograph0) 5)
    (= (count-mode image4) 3)
    (= (count-mode thermograph2) 3)
  ))

  (:metric minimize (total-time))
)