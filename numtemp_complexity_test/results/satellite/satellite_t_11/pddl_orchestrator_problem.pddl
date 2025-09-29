(define (problem multi-sat-temporal-problem)
  (:domain multi-sat-temporal)
  (:objects
    satellite0 satellite1 satellite2 satellite3 - satellite
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 - instrument
    GroundStation1 Phenomenon5 Phenomenon8 Phenomenon9 Phenomenon12 Phenomenon13 Phenomenon14 Planet11 Star0 Star2 Star3 Star4 Star6 Star7 Star10 - direction
    image0 spectrograph3 thermograph1 thermograph2 - mode
  )

  (:init
    ;; on relations
    (on instrument0 satellite0)
    (on instrument1 satellite0)
    (on instrument2 satellite0)
    (on instrument3 satellite1)
    (on instrument4 satellite1)
    (on instrument5 satellite1)
    (on instrument6 satellite2)
    (on instrument7 satellite2)
    (on instrument8 satellite3)
    (on instrument9 satellite3)

    ;; supports (instrument modes)
    (supports instrument0 image0)
    (supports instrument0 thermograph1)

    (supports instrument1 spectrograph3)
    (supports instrument1 thermograph1)
    (supports instrument1 thermograph2)

    (supports instrument2 spectrograph3)

    (supports instrument3 image0)
    (supports instrument3 thermograph2)

    (supports instrument4 thermograph1)

    (supports instrument5 spectrograph3)
    (supports instrument5 thermograph1)
    (supports instrument5 thermograph2)

    (supports instrument6 thermograph1)
    (supports instrument6 thermograph2)

    (supports instrument7 image0)
    (supports instrument7 thermograph1)
    (supports instrument7 thermograph2)

    (supports instrument8 image0)

    (supports instrument9 image0)
    (supports instrument9 spectrograph3)
    (supports instrument9 thermograph1)

    ;; calibration targets
    (calibration-target instrument0 Star3)
    (calibration-target instrument1 Star2)
    (calibration-target instrument2 Star4)
    (calibration-target instrument3 GroundStation1)
    (calibration-target instrument4 Star4)
    (calibration-target instrument5 Star0)
    (calibration-target instrument6 Star3)
    (calibration-target instrument7 Star0)
    (calibration-target instrument8 Star3)
    (calibration-target instrument9 Star4)

    ;; initial pointing
    (pointing satellite0 Phenomenon14)
    (pointing satellite1 Star4)
    (pointing satellite2 Star6)
    (pointing satellite3 Phenomenon5)

    ;; satellites start not turning
    ;; power feed initial states (all satellites have power available and are free)
    (power-free satellite0)
    (power-free satellite1)
    (power-free satellite2)
    (power-free satellite3)

    ;; no instruments powered or calibrated initially (absence of predicates)

    ;; Calibration time values
    (= (calibration-time instrument0 Star3) 62.7)
    (= (calibration-time instrument1 Star2) 13.1)
    (= (calibration-time instrument2 Star4) 7.1)
    (= (calibration-time instrument3 GroundStation1) 98.9)
    (= (calibration-time instrument4 Star4) 74.8)
    (= (calibration-time instrument5 Star0) 61.0)
    (= (calibration-time instrument6 Star3) 45.4)
    (= (calibration-time instrument7 Star0) 45.5)
    (= (calibration-time instrument8 Star3) 96.5)
    (= (calibration-time instrument9 Star4) 14.2)

    ;; Slew time values (include both directions for symmetry)
    (= (slew-time GroundStation1 Phenomenon5) 31.6)
    (= (slew-time Phenomenon5 GroundStation1) 31.6)

    (= (slew-time GroundStation1 Phenomenon8) 64.08)
    (= (slew-time Phenomenon8 GroundStation1) 64.08)

    (= (slew-time GroundStation1 Phenomenon9) 34.8)
    (= (slew-time Phenomenon9 GroundStation1) 34.8)

    (= (slew-time GroundStation1 Phenomenon12) 63.1)
    (= (slew-time Phenomenon12 GroundStation1) 63.1)

    (= (slew-time GroundStation1 Phenomenon13) 14.41)
    (= (slew-time Phenomenon13 GroundStation1) 14.41)

    (= (slew-time GroundStation1 Phenomenon14) 11.89)
    (= (slew-time Phenomenon14 GroundStation1) 11.89)

    (= (slew-time GroundStation1 Planet11) 19.96)
    (= (slew-time Planet11 GroundStation1) 19.96)

    (= (slew-time GroundStation1 Star0) 62.34)
    (= (slew-time Star0 GroundStation1) 62.34)

    (= (slew-time GroundStation1 Star2) 9.039)
    (= (slew-time Star2 GroundStation1) 9.039)

    (= (slew-time GroundStation1 Star3) 52.67)
    (= (slew-time Star3 GroundStation1) 52.67)

    (= (slew-time GroundStation1 Star4) 34.15)
    (= (slew-time Star4 GroundStation1) 34.15)

    (= (slew-time GroundStation1 Star6) 36.8)
    (= (slew-time Star6 GroundStation1) 36.8)

    (= (slew-time GroundStation1 Star7) 62.44)
    (= (slew-time Star7 GroundStation1) 62.44)

    (= (slew-time GroundStation1 Star10) 89.58)
    (= (slew-time Star10 GroundStation1) 89.58)

    (= (slew-time Phenomenon5 Phenomenon8) 16.3)
    (= (slew-time Phenomenon8 Phenomenon5) 16.3)

    (= (slew-time Phenomenon5 Phenomenon9) 33.82)
    (= (slew-time Phenomenon9 Phenomenon5) 33.82)

    (= (slew-time Phenomenon5 Phenomenon12) 35.36)
    (= (slew-time Phenomenon12 Phenomenon5) 35.36)

    (= (slew-time Phenomenon5 Phenomenon13) 18.31)
    (= (slew-time Phenomenon13 Phenomenon5) 18.31)

    (= (slew-time Phenomenon5 Phenomenon14) 40.24)
    (= (slew-time Phenomenon14 Phenomenon5) 40.24)

    (= (slew-time Phenomenon5 Planet11) 14.03)
    (= (slew-time Planet11 Phenomenon5) 14.03)

    (= (slew-time Phenomenon5 Star0) 57.6)
    (= (slew-time Star0 Phenomenon5) 57.6)

    (= (slew-time Phenomenon5 Star2) 13.92)
    (= (slew-time Star2 Phenomenon5) 13.92)

    (= (slew-time Phenomenon5 Star3) 11.75)
    (= (slew-time Star3 Phenomenon5) 11.75)

    (= (slew-time Phenomenon5 Star4) 55.9)
    (= (slew-time Star4 Phenomenon5) 55.9)

    (= (slew-time Phenomenon5 Star6) 40.91)
    (= (slew-time Star6 Phenomenon5) 40.91)

    (= (slew-time Phenomenon5 Star7) 18.87)
    (= (slew-time Star7 Phenomenon5) 18.87)

    (= (slew-time Phenomenon5 Star10) 48.8)
    (= (slew-time Star10 Phenomenon5) 48.8)

    (= (slew-time Phenomenon8 Phenomenon9) 4.557)
    (= (slew-time Phenomenon9 Phenomenon8) 4.557)

    (= (slew-time Phenomenon8 Phenomenon12) 21.34)
    (= (slew-time Phenomenon12 Phenomenon8) 21.34)

    (= (slew-time Phenomenon8 Phenomenon13) 16.53)
    (= (slew-time Phenomenon13 Phenomenon8) 16.53)

    (= (slew-time Phenomenon8 Phenomenon14) 19.57)
    (= (slew-time Phenomenon14 Phenomenon8) 19.57)

    (= (slew-time Phenomenon8 Planet11) 43.2)
    (= (slew-time Planet11 Phenomenon8) 43.2)

    (= (slew-time Phenomenon8 Star0) 65.16)
    (= (slew-time Star0 Phenomenon8) 65.16)

    (= (slew-time Phenomenon8 Star2) 2.837)
    (= (slew-time Star2 Phenomenon8) 2.837)

    (= (slew-time Phenomenon8 Star3) 11.96)
    (= (slew-time Star3 Phenomenon8) 11.96)

    (= (slew-time Phenomenon8 Star4) 17.1)
    (= (slew-time Star4 Phenomenon8) 17.1)

    (= (slew-time Phenomenon8 Star6) 9.918)
    (= (slew-time Star6 Phenomenon8) 9.918)

    (= (slew-time Phenomenon8 Star7) 7.165)
    (= (slew-time Star7 Phenomenon8) 7.165)

    (= (slew-time Phenomenon8 Star10) 7.569)
    (= (slew-time Star10 Phenomenon8) 7.569)

    (= (slew-time Phenomenon9 Phenomenon12) 3.596)
    (= (slew-time Phenomenon12 Phenomenon9) 3.596)

    (= (slew-time Phenomenon9 Phenomenon13) 47.05)
    (= (slew-time Phenomenon13 Phenomenon9) 47.05)

    (= (slew-time Phenomenon9 Phenomenon14) 19.79)
    (= (slew-time Phenomenon14 Phenomenon9) 19.79)

    (= (slew-time Phenomenon9 Planet11) 6.488)
    (= (slew-time Planet11 Phenomenon9) 6.488)

    (= (slew-time Phenomenon9 Star0) 16.22)
    (= (slew-time Star0 Phenomenon9) 16.22)

    (= (slew-time Phenomenon9 Star2) 0.9776)
    (= (slew-time Star2 Phenomenon9) 0.9776)

    (= (slew-time Phenomenon9 Star3) 4.41)
    (= (slew-time Star3 Phenomenon9) 4.41)

    (= (slew-time Phenomenon9 Star4) 26.77)
    (= (slew-time Star4 Phenomenon9) 26.77)

    (= (slew-time Phenomenon9 Star6) 35.04)
    (= (slew-time Star6 Phenomenon9) 35.04)

    (= (slew-time Phenomenon9 Star7) 17.12)
    (= (slew-time Star7 Phenomenon9) 17.12)

    (= (slew-time Phenomenon9 Star10) 9.911)
    (= (slew-time Star10 Phenomenon9) 9.911)

    (= (slew-time Phenomenon12 Phenomenon13) 1.492)
    (= (slew-time Phenomenon13 Phenomenon12) 1.492)

    (= (slew-time Phenomenon12 Phenomenon14) 53.64)
    (= (slew-time Phenomenon14 Phenomenon12) 53.64)

    (= (slew-time Phenomenon12 Planet11) 18.27)
    (= (slew-time Planet11 Phenomenon12) 18.27)

    (= (slew-time Phenomenon12 Star0) 21.19)
    (= (slew-time Star0 Phenomenon12) 21.19)

    (= (slew-time Phenomenon12 Star2) 33.28)
    (= (slew-time Star2 Phenomenon12) 33.28)

    (= (slew-time Phenomenon12 Star3) 8.303)
    (= (slew-time Star3 Phenomenon12) 8.303)

    (= (slew-time Phenomenon12 Star4) 0.0354)
    (= (slew-time Star4 Phenomenon12) 0.0354)

    (= (slew-time Phenomenon12 Star6) 28.91)
    (= (slew-time Star6 Phenomenon12) 28.91)

    (= (slew-time Phenomenon12 Star7) 79.29)
    (= (slew-time Star7 Phenomenon12) 79.29)

    (= (slew-time Phenomenon12 Star10) 26.75)
    (= (slew-time Star10 Phenomenon12) 26.75)

    (= (slew-time Phenomenon13 Phenomenon14) 2.715)
    (= (slew-time Phenomenon14 Phenomenon13) 2.715)

    (= (slew-time Phenomenon13 Planet11) 5.432)
    (= (slew-time Planet11 Phenomenon13) 5.432)

    (= (slew-time Phenomenon13 Star0) 6.402)
    (= (slew-time Star0 Phenomenon13) 6.402)

    (= (slew-time Phenomenon13 Star2) 32.41)
    (= (slew-time Star2 Phenomenon13) 32.41)

    (= (slew-time Phenomenon13 Star3) 30.34)
    (= (slew-time Star3 Phenomenon13) 30.34)

    (= (slew-time Phenomenon13 Star4) 13.91)
    (= (slew-time Star4 Phenomenon13) 13.91)

    (= (slew-time Phenomenon13 Star6) 10.86)
    (= (slew-time Star6 Phenomenon13) 10.86)

    (= (slew-time Phenomenon13 Star7) 37.39)
    (= (slew-time Star7 Phenomenon13) 37.39)

    (= (slew-time Phenomenon13 Star10) 69.35)
    (= (slew-time Star10 Phenomenon13) 69.35)

    (= (slew-time Phenomenon14 Planet11) 73.58)
    (= (slew-time Planet11 Phenomenon14) 73.58)

    (= (slew-time Phenomenon14 Star0) 0.5408)
    (= (slew-time Star0 Phenomenon14) 0.5408)

    (= (slew-time Phenomenon14 Star2) 2.42)
    (= (slew-time Star2 Phenomenon14) 2.42)

    (= (slew-time Phenomenon14 Star3) 75.22)
    (= (slew-time Star3 Phenomenon14) 75.22)

    (= (slew-time Phenomenon14 Star4) 12.98)
    (= (slew-time Star4 Phenomenon14) 12.98)

    (= (slew-time Phenomenon14 Star6) 32.17)
    (= (slew-time Star6 Phenomenon14) 32.17)

    (= (slew-time Phenomenon14 Star7) 34.6)
    (= (slew-time Star7 Phenomenon14) 34.6)

    (= (slew-time Phenomenon14 Star10) 19.33)
    (= (slew-time Star10 Phenomenon14) 19.33)

    (= (slew-time Planet11 Star0) 6.627)
    (= (slew-time Star0 Planet11) 6.627)

    (= (slew-time Planet11 Star2) 17.65)
    (= (slew-time Star2 Planet11) 17.65)

    (= (slew-time Planet11 Star3) 29.83)
    (= (slew-time Star3 Planet11) 29.83)

    (= (slew-time Planet11 Star4) 82.89)
    (= (slew-time Star4 Planet11) 82.89)

    (= (slew-time Planet11 Star6) 51.23)
    (= (slew-time Star6 Planet11) 51.23)

    (= (slew-time Planet11 Star7) 18.7)
    (= (slew-time Star7 Planet11) 18.7)

    (= (slew-time Planet11 Star10) 13.94)
    (= (slew-time Star10 Planet11) 13.94)

    (= (slew-time Star0 Star2) 63.53)
    (= (slew-time Star2 Star0) 63.53)

    (= (slew-time Star0 Star3) 4.325)
    (= (slew-time Star3 Star0) 4.325)

    (= (slew-time Star0 Star4) 45.66)
    (= (slew-time Star4 Star0) 45.66)

    (= (slew-time Star0 Star6) 23.46)
    (= (slew-time Star6 Star0) 23.46)

    (= (slew-time Star0 Star7) 5.342)
    (= (slew-time Star7 Star0) 5.342)

    (= (slew-time Star0 Star10) 37.57)
    (= (slew-time Star10 Star0) 37.57)

    (= (slew-time Star2 Star3) 3.529)
    (= (slew-time Star3 Star2) 3.529)

    (= (slew-time Star2 Star4) 70.99)
    (= (slew-time Star4 Star2) 70.99)

    (= (slew-time Star2 Star6) 67.83)
    (= (slew-time Star6 Star2) 67.83)

    (= (slew-time Star2 Star7) 67.54)
    (= (slew-time Star7 Star2) 67.54)

    (= (slew-time Star2 Star10) 1.56)
    (= (slew-time Star10 Star2) 1.56)

    (= (slew-time Star3 Star4) 9.409)
    (= (slew-time Star4 Star3) 9.409)

    (= (slew-time Star3 Star6) 53.27)
    (= (slew-time Star6 Star3) 53.27)

    (= (slew-time Star3 Star7) 0.3619)
    (= (slew-time Star7 Star3) 0.3619)

    (= (slew-time Star3 Star10) 8.979)
    (= (slew-time Star10 Star3) 8.979)

    (= (slew-time Star4 Star6) 2.914)
    (= (slew-time Star6 Star4) 2.914)

    (= (slew-time Star4 Star7) 68.47)
    (= (slew-time Star7 Star4) 68.47)

    (= (slew-time Star4 Star10) 3.0)
    (= (slew-time Star10 Star4) 3.0)

    (= (slew-time Star6 Star7) 23.81)
    (= (slew-time Star7 Star6) 23.81)

    (= (slew-time Star6 Star10) 54.23)
    (= (slew-time Star10 Star6) 54.23)

    (= (slew-time Star7 Star10) 30.1)
    (= (slew-time Star10 Star7) 30.1)
  )

  (:goal (and
    (have-image Phenomenon5 thermograph1)
    (have-image Star6 thermograph1)
    (have-image Star7 spectrograph3)
    (have-image Phenomenon8 image0)
    (have-image Phenomenon9 image0)
    (have-image Star10 spectrograph3)
    (have-image Planet11 thermograph2)
    (have-image Phenomenon12 image0)
    (have-image Phenomenon13 thermograph1)
    (have-image Phenomenon14 thermograph2)
  ))

  (:metric minimize (total-time))
)