(define (problem multi-sat-observations-problem)
  (:domain multi-sat-observations)

  (:objects
    ;; satellites
    satellite0 satellite1 satellite2 satellite3 satellite4 satellite5 satellite6 satellite7 - satellite

    ;; instruments
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 instrument10 instrument11 instrument12 instrument13 instrument14 instrument15 instrument16 instrument17 instrument18 - instrument

    ;; modes
    image1 infrared0 spectrograph2 thermograph3 thermograph4 - mode

    ;; directions
    GroundStation0 GroundStation2 Phenomenon5 Phenomenon9 Phenomenon10 Phenomenon16 Planet6 Planet7 Planet11 Planet14 Planet17 Planet20 Planet21 Planet22 Planet23 Planet24 Star1 Star3 Star4 Star8 Star12 Star13 Star15 Star18 Star19 - direction
  )

  (:init
    ;; static attachments (on)
    (on instrument0 satellite0)
    (on instrument1 satellite0)
    (on instrument2 satellite1)
    (on instrument3 satellite1)
    (on instrument4 satellite2)
    (on instrument5 satellite2)
    (on instrument6 satellite3)
    (on instrument7 satellite4)
    (on instrument8 satellite4)
    (on instrument9 satellite4)
    (on instrument10 satellite5)
    (on instrument11 satellite5)
    (on instrument12 satellite5)
    (on instrument13 satellite6)
    (on instrument14 satellite6)
    (on instrument15 satellite6)
    (on instrument16 satellite7)
    (on instrument17 satellite7)
    (on instrument18 satellite7)

    ;; instrument supports
    (supports instrument0 image1)
    (supports instrument0 thermograph4)

    (supports instrument1 spectrograph2)
    (supports instrument1 thermograph3)

    (supports instrument2 spectrograph2)

    (supports instrument3 image1)
    (supports instrument3 spectrograph2)

    (supports instrument4 spectrograph2)
    (supports instrument4 thermograph3)
    (supports instrument4 thermograph4)

    (supports instrument5 image1)
    (supports instrument5 infrared0)
    (supports instrument5 thermograph3)

    (supports instrument6 infrared0)
    (supports instrument6 spectrograph2)

    (supports instrument7 spectrograph2)
    (supports instrument7 thermograph3)

    (supports instrument8 image1)

    (supports instrument9 infrared0)

    (supports instrument10 infrared0)
    (supports instrument10 spectrograph2)
    (supports instrument10 thermograph4)

    (supports instrument11 infrared0)
    (supports instrument12 infrared0)

    (supports instrument13 infrared0)
    (supports instrument13 thermograph3)

    (supports instrument14 spectrograph2)

    (supports instrument15 thermograph4)

    (supports instrument16 thermograph4)
    (supports instrument17 spectrograph2)
    (supports instrument18 thermograph4)

    ;; instrument calibration targets
    (calibration-target instrument0 GroundStation0)
    (calibration-target instrument1 Star3)
    (calibration-target instrument2 Star4)
    (calibration-target instrument3 GroundStation2)
    (calibration-target instrument4 Star1)
    (calibration-target instrument5 GroundStation2)
    (calibration-target instrument6 GroundStation2)
    (calibration-target instrument7 Star3)
    (calibration-target instrument8 GroundStation2)
    (calibration-target instrument9 Star3)
    (calibration-target instrument10 GroundStation0)
    (calibration-target instrument11 GroundStation0)
    (calibration-target instrument12 Star1)
    (calibration-target instrument13 Star3)
    (calibration-target instrument14 GroundStation2)
    (calibration-target instrument15 GroundStation0)
    (calibration-target instrument16 GroundStation2)
    (calibration-target instrument17 Star1)
    (calibration-target instrument18 Star4)

    ;; initial pointing for each satellite (not pointing-none)
    (pointing satellite0 Star19)
    (pointing satellite1 Star18)
    (pointing satellite2 Star19)
    (pointing satellite3 Star4)
    (pointing satellite4 Phenomenon9)
    (pointing satellite5 Planet6)
    (pointing satellite6 Planet17)
    (pointing satellite7 Planet11)

    ;; initial power feed availability (all satellites have power free initially)
    (power-free satellite0)
    (power-free satellite1)
    (power-free satellite2)
    (power-free satellite3)
    (power-free satellite4)
    (power-free satellite5)
    (power-free satellite6)
    (power-free satellite7)

    ;; instruments initially powered off and uncalibrated
    (not (powered instrument0))
    (not (powered instrument1))
    (not (powered instrument2))
    (not (powered instrument3))
    (not (powered instrument4))
    (not (powered instrument5))
    (not (powered instrument6))
    (not (powered instrument7))
    (not (powered instrument8))
    (not (powered instrument9))
    (not (powered instrument10))
    (not (powered instrument11))
    (not (powered instrument12))
    (not (powered instrument13))
    (not (powered instrument14))
    (not (powered instrument15))
    (not (powered instrument16))
    (not (powered instrument17))
    (not (powered instrument18))

    (not (calibrated instrument0))
    (not (calibrated instrument1))
    (not (calibrated instrument2))
    (not (calibrated instrument3))
    (not (calibrated instrument4))
    (not (calibrated instrument5))
    (not (calibrated instrument6))
    (not (calibrated instrument7))
    (not (calibrated instrument8))
    (not (calibrated instrument9))
    (not (calibrated instrument10))
    (not (calibrated instrument11))
    (not (calibrated instrument12))
    (not (calibrated instrument13))
    (not (calibrated instrument14))
    (not (calibrated instrument15))
    (not (calibrated instrument16))
    (not (calibrated instrument17))
    (not (calibrated instrument18))

    ;; no initial observations
    ;; (observed ...) facts will be produced by take_image actions

    ;; invariant: no satellite starts in pointing-none state
    (not (pointing-none satellite0))
    (not (pointing-none satellite1))
    (not (pointing-none satellite2))
    (not (pointing-none satellite3))
    (not (pointing-none satellite4))
    (not (pointing-none satellite5))
    (not (pointing-none satellite6))
    (not (pointing-none satellite7))
  )

  (:goal (and
    ;; all required specific observations (all_images list)
    (observed Phenomenon5 spectrograph2)
    (observed Planet6 spectrograph2)
    (observed Planet7 infrared0)
    (observed Phenomenon9 infrared0)
    (observed Phenomenon10 image1)
    (observed Planet11 image1)
    (observed Star12 thermograph3)
    (observed Star13 thermograph3)
    (observed Planet14 thermograph4)
    (observed Star15 thermograph4)
    (observed Phenomenon16 image1)
    (observed Planet17 thermograph3)
    (observed Star18 image1)
    (observed Planet20 image1)
    (observed Planet21 infrared0)
    (observed Planet22 image1)
    (observed Planet23 thermograph3)
    (observed Planet24 infrared0)

    ;; final pointing constraints for specified satellites
    (pointing satellite0 Star19)
    (pointing satellite1 Planet22)
    (pointing satellite2 Star13)
    (pointing satellite3 Planet14)
    (pointing satellite5 Planet24)
    (pointing satellite7 Star3)
  ))

  ;; objective: minimize makespan / total time
  (:metric minimize (total-time))
)