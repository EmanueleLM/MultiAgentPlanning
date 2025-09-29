(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    satellite0 satellite1 satellite2 - satellite

    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 - instrument

    GroundStation0 GroundStation1 GroundStation2 Phenomenon5 Phenomenon6 Phenomenon8 Planet9 Star3 Star4 Star7 - direction

    image2 spectrograph1 thermograph0 - mode
  )

  (:init
    ;; onboard relations
    (onboard instrument0 satellite0)
    (onboard instrument1 satellite0)
    (onboard instrument2 satellite0)

    (onboard instrument3 satellite1)
    (onboard instrument4 satellite1)
    (onboard instrument5 satellite1)

    (onboard instrument6 satellite2)
    (onboard instrument7 satellite2)
    (onboard instrument8 satellite2)

    ;; instrument supported modes
    (supports instrument0 image2)
    (supports instrument0 spectrograph1)
    (supports instrument0 thermograph0)

    (supports instrument1 image2)
    (supports instrument1 spectrograph1)
    (supports instrument1 thermograph0)

    (supports instrument2 image2)

    (supports instrument3 spectrograph1)
    (supports instrument3 thermograph0)

    (supports instrument4 image2)
    (supports instrument4 spectrograph1)

    (supports instrument5 image2)
    (supports instrument5 spectrograph1)
    (supports instrument5 thermograph0)

    (supports instrument6 image2)

    (supports instrument7 image2)
    (supports instrument7 thermograph0)

    (supports instrument8 image2)
    (supports instrument8 spectrograph1)
    (supports instrument8 thermograph0)

    ;; calibration targets
    (cal-target instrument0 GroundStation2)
    (cal-target instrument1 GroundStation1)
    (cal-target instrument2 GroundStation0)
    (cal-target instrument3 GroundStation0)
    (cal-target instrument4 GroundStation2)
    (cal-target instrument5 GroundStation1)
    (cal-target instrument6 GroundStation1)
    (cal-target instrument7 GroundStation1)
    (cal-target instrument8 GroundStation0)

    ;; initial pointings
    (pointing satellite0 Phenomenon8)
    (pointing satellite1 GroundStation2)
    (pointing satellite2 Phenomenon5)

    ;; initial power availability (single feed per satellite is free)
    (power-available satellite0)
    (power-available satellite1)
    (power-available satellite2)

    ;; initial instrument states: powered and calibrated are false by absence

    ;; durations (constants)
    (= (switch-on-duration) 2.0)
    (= (switch-off-duration) 1.0)
    (= (take-image-duration) 7.0)

    ;; calibration times (per-instrument per-target)
    (= (calibration-time instrument0 GroundStation2) 85.0)
    (= (calibration-time instrument1 GroundStation1) 53.5)
    (= (calibration-time instrument2 GroundStation0) 60.4)
    (= (calibration-time instrument3 GroundStation0) 4.65)
    (= (calibration-time instrument4 GroundStation2) 44.6)
    (= (calibration-time instrument5 GroundStation1) 63.9)
    (= (calibration-time instrument6 GroundStation1) 96.1)
    (= (calibration-time instrument7 GroundStation1) 28.7)
    (= (calibration-time instrument8 GroundStation0) 53.6)

    ;; slew times between directions (symmetric values provided)
    ;; From GroundStation0
    (= (slew-time GroundStation0 GroundStation1) 40.62)
    (= (slew-time GroundStation0 GroundStation2) 18.86)
    (= (slew-time GroundStation0 Phenomenon5) 14.42)
    (= (slew-time GroundStation0 Phenomenon6) 13.89)
    (= (slew-time GroundStation0 Phenomenon8) 80.35)
    (= (slew-time GroundStation0 Planet9) 19.76)
    (= (slew-time GroundStation0 Star3) 36.06)
    (= (slew-time GroundStation0 Star4) 24.93)
    (= (slew-time GroundStation0 Star7) 6.096)

    ;; From GroundStation1
    (= (slew-time GroundStation1 GroundStation0) 40.62)
    (= (slew-time GroundStation1 GroundStation2) 34.96)
    (= (slew-time GroundStation1 Phenomenon5) 85.8)
    (= (slew-time GroundStation1 Phenomenon6) 22.65)
    (= (slew-time GroundStation1 Phenomenon8) 36.26)
    (= (slew-time GroundStation1 Planet9) 61.54)
    (= (slew-time GroundStation1 Star3) 25.22)
    (= (slew-time GroundStation1 Star4) 10.73)
    (= (slew-time GroundStation1 Star7) 52.9)

    ;; From GroundStation2
    (= (slew-time GroundStation2 GroundStation0) 18.86)
    (= (slew-time GroundStation2 GroundStation1) 34.96)
    (= (slew-time GroundStation2 Phenomenon5) 22.02)
    (= (slew-time GroundStation2 Phenomenon6) 15.22)
    (= (slew-time GroundStation2 Phenomenon8) 16.34)
    (= (slew-time GroundStation2 Planet9) 17.61)
    (= (slew-time GroundStation2 Star3) 18.48)
    (= (slew-time GroundStation2 Star4) 5.657)
    (= (slew-time GroundStation2 Star7) 21.27)

    ;; From Phenomenon5
    (= (slew-time Phenomenon5 GroundStation0) 14.42)
    (= (slew-time Phenomenon5 GroundStation1) 85.8)
    (= (slew-time Phenomenon5 GroundStation2) 22.02)
    (= (slew-time Phenomenon5 Phenomenon6) 40.12)
    (= (slew-time Phenomenon5 Phenomenon8) 35.27)
    (= (slew-time Phenomenon5 Planet9) 19.98)
    (= (slew-time Phenomenon5 Star3) 75.0)
    (= (slew-time Phenomenon5 Star4) 46.06)
    (= (slew-time Phenomenon5 Star7) 72.01)

    ;; From Phenomenon6
    (= (slew-time Phenomenon6 GroundStation0) 13.89)
    (= (slew-time Phenomenon6 GroundStation1) 22.65)
    (= (slew-time Phenomenon6 GroundStation2) 15.22)
    (= (slew-time Phenomenon6 Phenomenon5) 40.12)
    (= (slew-time Phenomenon6 Phenomenon8) 37.31)
    (= (slew-time Phenomenon6 Planet9) 11.83)
    (= (slew-time Phenomenon6 Star3) 31.49)
    (= (slew-time Phenomenon6 Star4) 19.53)
    (= (slew-time Phenomenon6 Star7) 15.45)

    ;; From Phenomenon8
    (= (slew-time Phenomenon8 GroundStation0) 80.35)
    (= (slew-time Phenomenon8 GroundStation1) 36.26)
    (= (slew-time Phenomenon8 GroundStation2) 16.34)
    (= (slew-time Phenomenon8 Phenomenon5) 35.27)
    (= (slew-time Phenomenon8 Phenomenon6) 37.31)
    (= (slew-time Phenomenon8 Planet9) 18.68)
    (= (slew-time Phenomenon8 Star3) 2.598)
    (= (slew-time Phenomenon8 Star4) 30.65)
    (= (slew-time Phenomenon8 Star7) 7.013)

    ;; From Planet9
    (= (slew-time Planet9 GroundStation0) 19.76)
    (= (slew-time Planet9 GroundStation1) 61.54)
    (= (slew-time Planet9 GroundStation2) 17.61)
    (= (slew-time Planet9 Phenomenon5) 19.98)
    (= (slew-time Planet9 Phenomenon6) 11.83)
    (= (slew-time Planet9 Phenomenon8) 18.68)
    (= (slew-time Planet9 Star3) 19.42)
    (= (slew-time Planet9 Star4) 34.09)
    (= (slew-time Planet9 Star7) 38.52)

    ;; From Star3
    (= (slew-time Star3 GroundStation0) 36.06)
    (= (slew-time Star3 GroundStation1) 25.22)
    (= (slew-time Star3 GroundStation2) 18.48)
    (= (slew-time Star3 Phenomenon5) 75.0)
    (= (slew-time Star3 Phenomenon6) 31.49)
    (= (slew-time Star3 Phenomenon8) 2.598)
    (= (slew-time Star3 Planet9) 19.42)
    (= (slew-time Star3 Star4) 42.59)
    (= (slew-time Star3 Star7) 25.54)

    ;; From Star4
    (= (slew-time Star4 GroundStation0) 24.93)
    (= (slew-time Star4 GroundStation1) 10.73)
    (= (slew-time Star4 GroundStation2) 5.657)
    (= (slew-time Star4 Phenomenon5) 46.06)
    (= (slew-time Star4 Phenomenon6) 19.53)
    (= (slew-time Star4 Phenomenon8) 30.65)
    (= (slew-time Star4 Planet9) 34.09)
    (= (slew-time Star4 Star3) 42.59)
    (= (slew-time Star4 Star7) 64.46)

    ;; From Star7
    (= (slew-time Star7 GroundStation0) 6.096)
    (= (slew-time Star7 GroundStation1) 52.9)
    (= (slew-time Star7 GroundStation2) 21.27)
    (= (slew-time Star7 Phenomenon5) 72.01)
    (= (slew-time Star7 Phenomenon6) 15.45)
    (= (slew-time Star7 Phenomenon8) 7.013)
    (= (slew-time Star7 Planet9) 38.52)
    (= (slew-time Star7 Star3) 25.54)
    (= (slew-time Star7 Star4) 64.46)
  )

  (:goal (and
    ;; image goals (specific targets)
    (have-image Phenomenon5 image2)
    (have-image Phenomenon6 image2)
    (have-image Phenomenon8 image2)

    (have-image Star3 thermograph0)
    (have-image Star7 thermograph0)

    (have-image Planet9 spectrograph1)

    ;; final pointing goals
    (pointing satellite0 Phenomenon5)
    (pointing satellite1 GroundStation2)
  ))

  (:metric minimize (total-time))
)