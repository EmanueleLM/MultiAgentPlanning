(define (problem multi-sat-problem)
  (:domain multi-sat-temporal)

  (:objects
    ;; satellites
    satellite0 satellite1 satellite2 satellite3 - satellite

    ;; instruments
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 - instrument

    ;; directions
    GroundStation0 GroundStation2 GroundStation4 Phenomenon5 Planet8 Planet9 Planet10 Planet11 Star1 Star3 Star6 Star7 - direction

    ;; imaging modes
    image0 image1 image2 image3 - imagemode
  )

  (:init
    ;; onboard relations
    (onboard instrument0 satellite0)
    (onboard instrument1 satellite0)
    (onboard instrument2 satellite0)
    (onboard instrument3 satellite1)
    (onboard instrument4 satellite2)
    (onboard instrument5 satellite2)
    (onboard instrument6 satellite3)
    (onboard instrument7 satellite3)

    ;; supports modes
    (supports instrument0 image1)
    (supports instrument0 image3)
    (supports instrument1 image3)
    (supports instrument2 image0)
    (supports instrument3 image0)
    (supports instrument3 image2)
    (supports instrument4 image0)
    (supports instrument4 image1)
    (supports instrument5 image0)
    (supports instrument5 image1)
    (supports instrument5 image2)
    (supports instrument6 image0)
    (supports instrument6 image1)
    (supports instrument6 image2)
    (supports instrument7 image0)
    (supports instrument7 image1)
    (supports instrument7 image3)

    ;; calibration targets
    (calib-target instrument0 Star1)
    (calib-target instrument1 GroundStation0)
    (calib-target instrument2 GroundStation2)
    (calib-target instrument3 GroundStation4)
    (calib-target instrument4 Star1)
    (calib-target instrument5 Star1)
    (calib-target instrument6 GroundStation4)
    (calib-target instrument7 GroundStation0)

    ;; initial satellite pointing
    (pointing satellite0 Star6)
    (pointing satellite1 GroundStation0)
    (pointing satellite2 Star6)
    (pointing satellite3 GroundStation2)

    ;; initial power feed availability
    (power-available satellite0)
    (power-available satellite1)
    (power-available satellite2)
    (power-available satellite3)

    ;; slew times (symmetric) - provided values; include both directions
    ;; GroundStation0 <-> ...
    (= (slew-time GroundStation0 GroundStation2) 8.984)
    (= (slew-time GroundStation2 GroundStation0) 8.984)
    (= (slew-time GroundStation0 GroundStation4) 80.7)
    (= (slew-time GroundStation4 GroundStation0) 80.7)
    (= (slew-time GroundStation0 Phenomenon5) 63.72)
    (= (slew-time Phenomenon5 GroundStation0) 63.72)
    (= (slew-time GroundStation0 Planet8) 20.73)
    (= (slew-time Planet8 GroundStation0) 20.73)
    (= (slew-time GroundStation0 Planet9) 62.23)
    (= (slew-time Planet9 GroundStation0) 62.23)
    (= (slew-time GroundStation0 Planet10) 86.06)
    (= (slew-time Planet10 GroundStation0) 86.06)
    (= (slew-time GroundStation0 Planet11) 31.93)
    (= (slew-time Planet11 GroundStation0) 31.93)
    (= (slew-time GroundStation0 Star1) 12.95)
    (= (slew-time Star1 GroundStation0) 12.95)
    (= (slew-time GroundStation0 Star3) 94.87)
    (= (slew-time Star3 GroundStation0) 94.87)
    (= (slew-time GroundStation0 Star6) 21.64)
    (= (slew-time Star6 GroundStation0) 21.64)
    (= (slew-time GroundStation0 Star7) 39.77)
    (= (slew-time Star7 GroundStation0) 39.77)

    ;; GroundStation2 <-> ...
    (= (slew-time GroundStation2 GroundStation4) 41.5)
    (= (slew-time GroundStation4 GroundStation2) 41.5)
    (= (slew-time GroundStation2 Phenomenon5) 5.002)
    (= (slew-time Phenomenon5 GroundStation2) 5.002)
    (= (slew-time GroundStation2 Planet8) 7.345)
    (= (slew-time Planet8 GroundStation2) 7.345)
    (= (slew-time GroundStation2 Planet9) 30.07)
    (= (slew-time Planet9 GroundStation2) 30.07)
    (= (slew-time GroundStation2 Planet10) 51.95)
    (= (slew-time Planet10 GroundStation2) 51.95)
    (= (slew-time GroundStation2 Planet11) 28.99)
    (= (slew-time Planet11 GroundStation2) 28.99)
    (= (slew-time GroundStation2 Star1) 42.7)
    (= (slew-time Star1 GroundStation2) 42.7)
    (= (slew-time GroundStation2 Star3) 3.204)
    (= (slew-time Star3 GroundStation2) 3.204)
    (= (slew-time GroundStation2 Star6) 43.51)
    (= (slew-time Star6 GroundStation2) 43.51)
    (= (slew-time GroundStation2 Star7) 24.93)
    (= (slew-time Star7 GroundStation2) 24.93)

    ;; GroundStation4 <-> ...
    (= (slew-time GroundStation4 Phenomenon5) 35.49)
    (= (slew-time Phenomenon5 GroundStation4) 35.49)
    (= (slew-time GroundStation4 Planet8) 86.67)
    (= (slew-time Planet8 GroundStation4) 86.67)
    (= (slew-time GroundStation4 Planet9) 84.72)
    (= (slew-time Planet9 GroundStation4) 84.72)
    (= (slew-time GroundStation4 Planet10) 44.82)
    (= (slew-time Planet10 GroundStation4) 44.82)
    (= (slew-time GroundStation4 Planet11) 3.917)
    (= (slew-time Planet11 GroundStation4) 3.917)
    (= (slew-time GroundStation4 Star1) 41.28)
    (= (slew-time Star1 GroundStation4) 41.28)
    (= (slew-time GroundStation4 Star3) 44.56)
    (= (slew-time Star3 GroundStation4) 44.56)
    (= (slew-time GroundStation4 Star6) 2.664)
    (= (slew-time Star6 GroundStation4) 2.664)
    (= (slew-time GroundStation4 Star7) 86.2)
    (= (slew-time Star7 GroundStation4) 86.2)

    ;; Phenomenon5 <-> ...
    (= (slew-time Phenomenon5 Planet8) 51.94)
    (= (slew-time Planet8 Phenomenon5) 51.94)
    (= (slew-time Phenomenon5 Planet9) 11.66)
    (= (slew-time Planet9 Phenomenon5) 11.66)
    (= (slew-time Phenomenon5 Planet10) 3.764)
    (= (slew-time Planet10 Phenomenon5) 3.764)
    (= (slew-time Phenomenon5 Planet11) 73.81)
    (= (slew-time Planet11 Phenomenon5) 73.81)
    (= (slew-time Phenomenon5 Star1) 14.03)
    (= (slew-time Star1 Phenomenon5) 14.03)
    (= (slew-time Phenomenon5 Star3) 12.33)
    (= (slew-time Star3 Phenomenon5) 12.33)
    (= (slew-time Phenomenon5 Star6) 38.25)
    (= (slew-time Star6 Phenomenon5) 38.25)
    (= (slew-time Phenomenon5 Star7) 28.3)
    (= (slew-time Star7 Phenomenon5) 28.3)

    ;; Planet8 <-> ...
    (= (slew-time Planet8 Planet9) 46.81)
    (= (slew-time Planet9 Planet8) 46.81)
    (= (slew-time Planet8 Planet10) 34.15)
    (= (slew-time Planet10 Planet8) 34.15)
    (= (slew-time Planet8 Planet11) 18.43)
    (= (slew-time Planet11 Planet8) 18.43)
    (= (slew-time Planet8 Star1) 14.01)
    (= (slew-time Star1 Planet8) 14.01)
    (= (slew-time Planet8 Star3) 59.35)
    (= (slew-time Star3 Planet8) 59.35)
    (= (slew-time Planet8 Star6) 52.15)
    (= (slew-time Star6 Planet8) 52.15)
    (= (slew-time Planet8 Star7) 32.8)
    (= (slew-time Star7 Planet8) 32.8)

    ;; Planet9 <-> ...
    (= (slew-time Planet9 Planet10) 25.51)
    (= (slew-time Planet10 Planet9) 25.51)
    (= (slew-time Planet9 Planet11) 53.1)
    (= (slew-time Planet11 Planet9) 53.1)
    (= (slew-time Planet9 Star1) 1.098)
    (= (slew-time Star1 Planet9) 1.098)
    (= (slew-time Planet9 Star3) 2.942)
    (= (slew-time Star3 Planet9) 2.942)
    (= (slew-time Planet9 Star6) 23.46)
    (= (slew-time Star6 Planet9) 23.46)
    (= (slew-time Planet9 Star7) 32.59)
    (= (slew-time Star7 Planet9) 32.59)

    ;; Planet10 <-> ...
    (= (slew-time Planet10 Planet11) 17.0)
    (= (slew-time Planet11 Planet10) 17.0)
    (= (slew-time Planet10 Star1) 29.49)
    (= (slew-time Star1 Planet10) 29.49)
    (= (slew-time Planet10 Star3) 42.41)
    (= (slew-time Star3 Planet10) 42.41)
    (= (slew-time Planet10 Star6) 61.54)
    (= (slew-time Star6 Planet10) 61.54)
    (= (slew-time Planet10 Star7) 75.08)
    (= (slew-time Star7 Planet10) 75.08)

    ;; Planet11 <-> ...
    (= (slew-time Planet11 Star1) 25.12)
    (= (slew-time Star1 Planet11) 25.12)
    (= (slew-time Planet11 Star3) 42.59)
    (= (slew-time Star3 Planet11) 42.59)
    (= (slew-time Planet11 Star6) 12.16)
    (= (slew-time Star6 Planet11) 12.16)
    (= (slew-time Planet11 Star7) 9.39)
    (= (slew-time Star7 Planet11) 9.39)

    ;; Stars interrelations
    (= (slew-time Star1 Star3) 4.36)
    (= (slew-time Star3 Star1) 4.36)
    (= (slew-time Star1 Star6) 4.968)
    (= (slew-time Star6 Star1) 4.968)
    (= (slew-time Star1 Star7) 61.2)
    (= (slew-time Star7 Star1) 61.2)
    (= (slew-time Star3 Star6) 13.88)
    (= (slew-time Star6 Star3) 13.88)
    (= (slew-time Star3 Star7) 41.6)
    (= (slew-time Star7 Star3) 41.6)
    (= (slew-time Star6 Star7) 64.03)
    (= (slew-time Star7 Star6) 64.03)

    ;; zero self-slew times
    (= (slew-time GroundStation0 GroundStation0) 0.0)
    (= (slew-time GroundStation2 GroundStation2) 0.0)
    (= (slew-time GroundStation4 GroundStation4) 0.0)
    (= (slew-time Phenomenon5 Phenomenon5) 0.0)
    (= (slew-time Planet8 Planet8) 0.0)
    (= (slew-time Planet9 Planet9) 0.0)
    (= (slew-time Planet10 Planet10) 0.0)
    (= (slew-time Planet11 Planet11) 0.0)
    (= (slew-time Star1 Star1) 0.0)
    (= (slew-time Star3 Star3) 0.0)
    (= (slew-time Star6 Star6) 0.0)
    (= (slew-time Star7 Star7) 0.0)

    ;; calibration times per instrument->target
    (= (calibration-time instrument0 Star1) 10.5)
    (= (calibration-time instrument1 GroundStation0) 0.718)
    (= (calibration-time instrument2 GroundStation2) 71.1)
    (= (calibration-time instrument3 GroundStation4) 7.43)
    (= (calibration-time instrument4 Star1) 0.349)
    (= (calibration-time instrument5 Star1) 58.2)
    (= (calibration-time instrument6 GroundStation4) 24.7)
    (= (calibration-time instrument7 GroundStation0) 9.43)
  )

  (:goal (and
    ;; required images
    (have-image Phenomenon5 image0)
    (have-image Star6 image1)
    (have-image Star7 image0)
    (have-image Planet8 image0)
    (have-image Planet9 image3)
    (have-image Planet10 image0)
    (have-image Planet11 image2)

    ;; final pointing requirements
    (pointing satellite1 Star1)
    (pointing satellite2 Phenomenon5)
  ))

  (:metric minimize (total-time))
)