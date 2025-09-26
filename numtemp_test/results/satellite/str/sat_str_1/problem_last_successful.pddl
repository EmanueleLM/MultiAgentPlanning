(define (problem multi-sat-problem)
  (:domain multi-satellite)

  (:objects
    ; satellites
    satellite0 satellite1 satellite2 satellite3 satellite4 satellite5 satellite6 satellite7 satellite8 satellite9 - satellite

    ; instruments
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 instrument10 instrument11 instrument12 instrument13 instrument14 instrument15 instrument16 instrument17 instrument18 instrument19 instrument20 instrument21 instrument22 - instrument

    ; modes
    image0 image2 infrared4 spectrograph3 thermograph1 - mode

    ; directions
    GroundStation0 GroundStation1 GroundStation4 Phenomenon5 Phenomenon9 Phenomenon17 Phenomenon18 Phenomenon23 Planet6 Planet7 Planet8 Planet10 Planet11 Planet19 Planet21 Planet22 Star2 Star3 Star12 Star13 Star14 Star15 Star16 Star20 Star24 - direction
  )

  (:init
    ; on-board instrument mappings
    (on-board instrument0 satellite0)
    (on-board instrument1 satellite0)
    (on-board instrument2 satellite0)

    (on-board instrument3 satellite1)
    (on-board instrument4 satellite1)
    (on-board instrument5 satellite1)

    (on-board instrument6 satellite2)

    (on-board instrument7 satellite3)

    (on-board instrument8 satellite4)
    (on-board instrument9 satellite4)
    (on-board instrument10 satellite4)

    (on-board instrument11 satellite5)
    (on-board instrument12 satellite5)
    (on-board instrument13 satellite5)

    (on-board instrument14 satellite6)
    (on-board instrument15 satellite6)
    (on-board instrument16 satellite6)

    (on-board instrument17 satellite7)
    (on-board instrument18 satellite7)

    (on-board instrument19 satellite8)
    (on-board instrument20 satellite8)
    (on-board instrument21 satellite8)

    (on-board instrument22 satellite9)

    ; instrument supports (mode capabilities)
    (supports instrument0 infrared4)
    (supports instrument1 spectrograph3)
    (supports instrument2 image0)
    (supports instrument2 image2)
    (supports instrument2 thermograph1)

    (supports instrument3 image0)
    (supports instrument3 thermograph1)

    (supports instrument4 image2)
    (supports instrument4 thermograph1)

    (supports instrument5 image2)
    (supports instrument5 spectrograph3)
    (supports instrument5 thermograph1)

    (supports instrument6 image0)

    (supports instrument7 infrared4)

    (supports instrument8 spectrograph3)

    (supports instrument9 image0)
    (supports instrument9 image2)
    (supports instrument9 thermograph1)

    (supports instrument10 image0)
    (supports instrument10 image2)
    (supports instrument10 spectrograph3)

    (supports instrument11 image0)

    (supports instrument12 image0)
    (supports instrument12 infrared4)

    (supports instrument13 spectrograph3)

    (supports instrument14 image0)
    (supports instrument14 spectrograph3)
    (supports instrument14 thermograph1)

    (supports instrument15 image0)
    (supports instrument15 image2)
    (supports instrument15 thermograph1)

    (supports instrument16 image2)
    (supports instrument16 spectrograph3)

    (supports instrument17 image0)
    (supports instrument17 image2)
    (supports instrument17 thermograph1)

    (supports instrument18 image2)
    (supports instrument18 thermograph1)

    (supports instrument19 infrared4)
    (supports instrument19 thermograph1)

    (supports instrument20 thermograph1)
    (supports instrument21 thermograph1)

    (supports instrument22 infrared4)
    (supports instrument22 spectrograph3)
    (supports instrument22 thermograph1)

    ; instrument calibration targets
    (cal-target instrument0 Star3)
    (cal-target instrument1 GroundStation0)
    (cal-target instrument2 GroundStation1)
    (cal-target instrument3 GroundStation4)
    (cal-target instrument4 Star3)
    (cal-target instrument5 GroundStation4)
    (cal-target instrument6 GroundStation1)
    (cal-target instrument7 Star3)
    (cal-target instrument8 GroundStation0)
    (cal-target instrument9 Star3)
    (cal-target instrument10 Star2)
    (cal-target instrument11 Star3)
    (cal-target instrument12 GroundStation4)
    (cal-target instrument13 Star2)
    (cal-target instrument14 Star3)
    (cal-target instrument15 GroundStation4)
    (cal-target instrument16 GroundStation0)
    (cal-target instrument17 GroundStation4)
    (cal-target instrument18 Star3)
    (cal-target instrument19 Star2)
    (cal-target instrument20 GroundStation4)
    (cal-target instrument21 Star2)
    (cal-target instrument22 GroundStation1)

    ; initial pointing for each satellite
    (pointing satellite0 Star15)
    (pointing satellite1 Planet10)
    (pointing satellite2 Star24)
    (pointing satellite3 Phenomenon9)
    (pointing satellite4 Planet19)
    (pointing satellite5 Planet10)
    (pointing satellite6 Planet11)
    (pointing satellite7 Planet11)
    (pointing satellite8 GroundStation4)
    (pointing satellite9 Planet11)

    ; power availability: all satellites start with power free (single-power resource available)
    (power-free satellite0)
    (power-free satellite1)
    (power-free satellite2)
    (power-free satellite3)
    (power-free satellite4)
    (power-free satellite5)
    (power-free satellite6)
    (power-free satellite7)
    (power-free satellite8)
    (power-free satellite9)

    ; Initially no instruments are powered on and none are calibrated.
    ; (instrument-on ...) and (calibrated ...) and (powered-by ...) are intentionally absent.
  )

  (:goal
    (and
      ; have_image goals
      (have-image Phenomenon5 thermograph1)
      (have-image Planet6 infrared4)
      (have-image Planet7 image0)
      (have-image Planet8 thermograph1)
      (have-image Phenomenon9 image2)
      (have-image Planet10 image0)
      (have-image Planet11 infrared4)
      (have-image Star12 image0)
      (have-image Star13 image0)
      (have-image Star14 thermograph1)
      (have-image Star15 image0)
      (have-image Star16 thermograph1)
      (have-image Phenomenon17 infrared4)
      (have-image Phenomenon18 spectrograph3)
      (have-image Star20 image0)
      (have-image Planet21 thermograph1)
      (have-image Planet22 image2)
      (have-image Phenomenon23 image0)
      (have-image Star24 infrared4)

      ; final pointing requirements
      (pointing satellite5 Planet6)
      (pointing satellite7 Star3)
      (pointing satellite8 Star15)
      (pointing satellite9 Star16)
    )
  )
)