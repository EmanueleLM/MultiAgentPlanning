(define (problem satellite-orchestration-problem)
  (:domain satellite-orchestration)

  (:objects
    satellite0 satellite1 satellite2 satellite3 satellite4 - satellite
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 instrument10 instrument11 instrument12 - instrument
    image1 thermograph0 thermograph2 thermograph3 thermograph4 - mode
    GroundStation2 Phenomenon5 Phenomenon12 Phenomenon13 Phenomenon16 Phenomenon17 Phenomenon18 Phenomenon21 Phenomenon24 Planet6 Planet7 Planet11 Planet14 Planet19 Planet20 Planet23 Star0 Star1 Star3 Star4 Star8 Star9 Star10 Star15 Star22 - direction
  )

  (:init
    ;; Onboard relations
    (onboard satellite0 instrument0)
    (onboard satellite0 instrument1)
    (onboard satellite0 instrument2)

    (onboard satellite1 instrument3)
    (onboard satellite1 instrument4)
    (onboard satellite1 instrument5)
    (onboard satellite1 instrument6)

    (onboard satellite2 instrument7)
    (onboard satellite2 instrument8)
    (onboard satellite2 instrument9)

    (onboard satellite3 instrument10)
    (onboard satellite3 instrument11)

    (onboard satellite4 instrument12)

    ;; Initial pointing
    (pointing satellite0 Star8)
    (pointing satellite1 Phenomenon21)
    (pointing satellite2 Star4)
    (pointing satellite3 Phenomenon16)
    (pointing satellite4 Phenomenon18)

    ;; Power availability (no instrument is using power initially)
    (power-available satellite0)
    (power-available satellite1)
    (power-available satellite2)
    (power-available satellite3)
    (power-available satellite4)

    ;; Instrument initial states: all are off and uncalibrated (we represent off by absence of (on ...) and absence of (calibrated ...))

    ;; Instrument supports (from given instrument_supports)
    (supports instrument0 thermograph0)
    (supports instrument0 thermograph2)
    (supports instrument0 thermograph4)

    (supports instrument1 thermograph3)

    (supports instrument2 image1)

    (supports instrument3 thermograph3)
    (supports instrument4 image1)
    (supports instrument5 thermograph3)
    (supports instrument6 image1)
    (supports instrument6 thermograph0)
    (supports instrument6 thermograph2)

    (supports instrument7 thermograph0)
    (supports instrument8 thermograph2)
    (supports instrument8 thermograph3)
    (supports instrument8 thermograph4)
    (supports instrument9 thermograph2)
    (supports instrument9 thermograph3)
    (supports instrument10 thermograph2)
    (supports instrument11 thermograph0)
    (supports instrument11 thermograph2)
    (supports instrument11 thermograph4)
    (supports instrument12 thermograph4)

    ;; Calibration targets
    (calibration-target instrument0 Star4)
    (calibration-target instrument1 Star0)
    (calibration-target instrument2 Star4)
    (calibration-target instrument3 Star1)
    (calibration-target instrument4 Star1)
    (calibration-target instrument5 Star3)
    (calibration-target instrument6 Star0)
    (calibration-target instrument7 Star3)
    (calibration-target instrument8 Star3)
    (calibration-target instrument9 Star1)
    (calibration-target instrument10 Star3)
    (calibration-target instrument11 Star1)
    (calibration-target instrument12 Star3)
  )

  (:goal (and
    (have-image Phenomenon5 thermograph4)
    (have-image Planet7 image1)
    (have-image Star8 thermograph3)
    (have-image Star9 image1)
    (have-image Star10 image1)
    (have-image Phenomenon13 thermograph2)
    (have-image Star15 thermograph2)
    (have-image Phenomenon17 thermograph4)
    (have-image Phenomenon18 image1)
    (have-image Planet19 thermograph2)
    (have-image Planet20 thermograph4)
    (have-image Phenomenon21 image1)
    (have-image Star22 thermograph3)
  ))
)