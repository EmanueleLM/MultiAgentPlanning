(define (problem multi-sat-problem)
  (:domain multi-sat-temporal)

  (:objects
    ; satellites
    satellite0 satellite1 - satellite

    ; instruments
    instrument0 instrument1 instrument2 instrument3 - instrument

    ; modes
    image1 infrared0 spectrograph2 - mode

    ; directions
    Phenomenon5 Phenomenon6 Phenomenon7 Star0 Star1 Star2 Star3 Star4 - direction
  )

  ;; initial state
  (:init
    ;; onboard relations
    (onboard instrument0 satellite0)
    (onboard instrument1 satellite0)
    (onboard instrument2 satellite0)
    (onboard instrument3 satellite1)

    ;; initial pointing
    (pointing satellite0 Star4)
    (pointing satellite1 Star0)

    ;; initial power availability
    (power-available satellite0)
    (power-available satellite1)

    ;; instrument supports
    (supports instrument0 infrared0)
    (supports instrument0 spectrograph2)

    (supports instrument1 image1)

    (supports instrument2 image1)
    (supports instrument2 infrared0)

    (supports instrument3 image1)
    (supports instrument3 infrared0)
    (supports instrument3 spectrograph2)

    ;; calibration targets
    (calibration-target instrument0 Star1)
    (calibration-target instrument1 Star2)
    (calibration-target instrument2 Star0)
    (calibration-target instrument3 Star0)

    ;; numeric fluents initial values
    (= (total-time) 0)
    (= (num-images image1) 0)
    (= (num-images infrared0) 0)
    (= (num-images spectrograph2) 0)

    ;; Calibration times (instrument -> calibration target)
    (= (cal-time instrument0 Star1) 37.3)
    (= (cal-time instrument1 Star2) 15.9)
    (= (cal-time instrument2 Star0) 38.1)
    (= (cal-time instrument3 Star0) 16.9)

    ;; Slew times (symmetric entries provided). Any other pairs are left unspecified (planner should not call them).
    (= (slew-time Phenomenon5 Phenomenon6) 67.57)
    (= (slew-time Phenomenon6 Phenomenon5) 67.57)

    (= (slew-time Phenomenon5 Phenomenon7) 43.97)
    (= (slew-time Phenomenon7 Phenomenon5) 43.97)

    (= (slew-time Phenomenon5 Star0) 67.92)
    (= (slew-time Star0 Phenomenon5) 67.92)

    (= (slew-time Phenomenon5 Star1) 4.095)
    (= (slew-time Star1 Phenomenon5) 4.095)

    (= (slew-time Phenomenon5 Star2) 30.24)
    (= (slew-time Star2 Phenomenon5) 30.24)

    (= (slew-time Phenomenon5 Star3) 7.589)
    (= (slew-time Star3 Phenomenon5) 7.589)

    (= (slew-time Phenomenon5 Star4) 0.5297)
    (= (slew-time Star4 Phenomenon5) 0.5297)

    (= (slew-time Phenomenon6 Phenomenon7) 32.34)
    (= (slew-time Phenomenon7 Phenomenon6) 32.34)

    (= (slew-time Phenomenon6 Star0) 77.1)
    (= (slew-time Star0 Phenomenon6) 77.1)

    (= (slew-time Phenomenon6 Star1) 47.3)
    (= (slew-time Star1 Phenomenon6) 47.3)

    (= (slew-time Phenomenon6 Star2) 64.11)
    (= (slew-time Star2 Phenomenon6) 64.11)

    (= (slew-time Phenomenon6 Star3) 51.56)
    (= (slew-time Star3 Phenomenon6) 51.56)

    (= (slew-time Phenomenon6 Star4) 56.36)
    (= (slew-time Star4 Phenomenon6) 56.36)

    (= (slew-time Phenomenon7 Star0) 9.943)
    (= (slew-time Star0 Phenomenon7) 9.943)

    (= (slew-time Phenomenon7 Star1) 13.3)
    (= (slew-time Star1 Phenomenon7) 13.3)

    (= (slew-time Phenomenon7 Star2) 60.53)
    (= (slew-time Star2 Phenomenon7) 60.53)

    (= (slew-time Phenomenon7 Star3) 53.93)
    (= (slew-time Star3 Phenomenon7) 53.93)

    (= (slew-time Phenomenon7 Star4) 67.87)
    (= (slew-time Star4 Phenomenon7) 67.87)

    (= (slew-time Star0 Star1) 34.35)
    (= (slew-time Star1 Star0) 34.35)

    (= (slew-time Star0 Star2) 8.768)
    (= (slew-time Star2 Star0) 8.768)

    (= (slew-time Star0 Star3) 25.66)
    (= (slew-time Star3 Star0) 25.66)

    (= (slew-time Star0 Star4) 71.99)
    (= (slew-time Star4 Star0) 71.99)

    (= (slew-time Star1 Star2) 18.57)
    (= (slew-time Star2 Star1) 18.57)

    (= (slew-time Star1 Star3) 25.96)
    (= (slew-time Star3 Star1) 25.96)

    (= (slew-time Star1 Star4) 1.526)
    (= (slew-time Star4 Star1) 1.526)

    (= (slew-time Star2 Star3) 17.99)
    (= (slew-time Star3 Star2) 17.99)

    (= (slew-time Star2 Star4) 35.34)
    (= (slew-time Star4 Star2) 35.34)

    (= (slew-time Star3 Star4) 49.61)
    (= (slew-time Star4 Star3) 49.61)
  )

  (:goal
    (and
      ;; required specific images
      (have_image Star3 infrared0)
      (have_image Star4 spectrograph2)
      (have_image Phenomenon5 spectrograph2)
      (have_image Phenomenon7 spectrograph2)

      ;; numeric image-count goals
      (>= (num-images spectrograph2) 3)
      (>= (num-images infrared0) 1)

      ;; pointing goal
      (pointing satellite0 Phenomenon5)
    )
  )

  (:metric minimize (total-time))
)