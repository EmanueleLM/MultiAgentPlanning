(define (problem satellite-problem)
  (:domain satellite-domain)

  (:objects
    satellite0 satellite1 satellite2 satellite3 satellite4 - satellite
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 instrument10 - instrument
    image2 image3 image4 infrared1 spectrograph0 - mode
    GroundStation1 Phenomenon6 Phenomenon7 Phenomenon8 Phenomenon12 Phenomenon13 Planet5 Planet10 Planet11 Star0 Star2 Star3 Star4 Star9 Star14 - direction
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
    (onboard instrument7 satellite3)
    (onboard instrument8 satellite4)
    (onboard instrument9 satellite4)
    (onboard instrument10 satellite4)

    ;; supports
    (supports instrument0 image4) (supports instrument0 infrared1)
    (supports instrument1 image2) (supports instrument1 image4) (supports instrument1 spectrograph0)
    (supports instrument2 image2)
    (supports instrument3 image2) (supports instrument3 image3) (supports instrument3 image4)
    (supports instrument4 image2) (supports instrument4 image3)
    (supports instrument5 image4) (supports instrument5 infrared1) (supports instrument5 spectrograph0)
    (supports instrument6 image2) (supports instrument6 spectrograph0)
    (supports instrument7 image3) (supports instrument7 image4) (supports instrument7 spectrograph0)
    (supports instrument8 image3) (supports instrument8 image4) (supports instrument8 infrared1)
    (supports instrument9 image4)
    (supports instrument10 image2) (supports instrument10 image4) (supports instrument10 infrared1)

    ;; calibration targets
    (calibration-target instrument0 Star3)
    (calibration-target instrument1 Star4)
    (calibration-target instrument2 Star2)
    (calibration-target instrument3 Star2)
    (calibration-target instrument4 Star3)
    (calibration-target instrument5 Star3)
    (calibration-target instrument6 Star2)
    (calibration-target instrument7 Star0)
    (calibration-target instrument8 GroundStation1)
    (calibration-target instrument9 Star0)
    (calibration-target instrument10 Star2)

    ;; initial pointing
    (pointing satellite0 Star0)
    (pointing satellite1 Planet11)
    (pointing satellite2 Phenomenon6)
    (pointing satellite3 Planet10)
    (pointing satellite4 Star9)

    ;; power available initially
    (power-avail satellite0) (power-avail satellite1) (power-avail satellite2) (power-avail satellite3) (power-avail satellite4)

    ;; per-satellite numeric fluents
    (= (fuel satellite0) 153)
    (= (fuel satellite1) 120)
    (= (fuel satellite2) 137)
    (= (fuel satellite3) 199)
    (= (fuel satellite4) 166)

    (= (data-capacity satellite0) 1000)
    (= (data-capacity satellite1) 1000)
    (= (data-capacity satellite2) 1000)
    (= (data-capacity satellite3) 1000)
    (= (data-capacity satellite4) 1000)

    ;; global accumulators
    (= (data-stored) 0)
    (= (fuel-used) 0)

    ;; data sizes (only directions listed in the human spec)
    (= (data-size Phenomenon6 image2) 160) (= (data-size Phenomenon6 image3) 86) (= (data-size Phenomenon6 image4) 260) (= (data-size Phenomenon6 infrared1) 199) (= (data-size Phenomenon6 spectrograph0) 259)
    (= (data-size Phenomenon7 image2) 52)  (= (data-size Phenomenon7 image3) 270) (= (data-size Phenomenon7 image4) 105) (= (data-size Phenomenon7 infrared1) 224) (= (data-size Phenomenon7 spectrograph0) 71)
    (= (data-size Phenomenon8 image2) 276) (= (data-size Phenomenon8 image3) 193) (= (data-size Phenomenon8 image4) 11)  (= (data-size Phenomenon8 infrared1) 113) (= (data-size Phenomenon8 spectrograph0) 292)
    (= (data-size Phenomenon12 image2) 42) (= (data-size Phenomenon12 image3) 100) (= (data-size Phenomenon12 image4) 106) (= (data-size Phenomenon12 infrared1) 140) (= (data-size Phenomenon12 spectrograph0) 19)
    (= (data-size Phenomenon13 image2) 242) (= (data-size Phenomenon13 image3) 114) (= (data-size Phenomenon13 image4) 279) (= (data-size Phenomenon13 infrared1) 32) (= (data-size Phenomenon13 spectrograph0) 41)
    (= (data-size Planet5 image2) 162) (= (data-size Planet5 image3) 4)  (= (data-size Planet5 image4) 226) (= (data-size Planet5 infrared1) 189) (= (data-size Planet5 spectrograph0) 33)
    (= (data-size Planet10 image2) 299) (= (data-size Planet10 image3) 228) (= (data-size Planet10 image4) 242) (= (data-size Planet10 infrared1) 70)  (= (data-size Planet10 spectrograph0) 280)
    (= (data-size Planet11 image2) 8)   (= (data-size Planet11 image3) 98)  (= (data-size Planet11 image4) 214) (= (data-size Planet11 infrared1) 271) (= (data-size Planet11 spectrograph0) 170)
    (= (data-size Star9 image2) 172)     (= (data-size Star9 image3) 74)   (= (data-size Star9 image4) 240) (= (data-size Star9 infrared1) 248) (= (data-size Star9 spectrograph0) 239)
    (= (data-size Star14 image2) 265)    (= (data-size Star14 image3) 20)  (= (data-size Star14 image4) 136) (= (data-size Star14 infrared1) 87) (= (data-size Star14 spectrograph0) 31)

    ;; slew times (symmetric) as given in the human specification
    ;; GroundStation1 to ...
    (= (slewtime GroundStation1 Phenomenon6) 35.44) (= (slewtime Phenomenon6 GroundStation1) 35.44)
    (= (slewtime GroundStation1 Phenomenon7) 43.55) (= (slewtime Phenomenon7 GroundStation1) 43.55)
    (= (slewtime GroundStation1 Phenomenon8) 6.877) (= (slewtime Phenomenon8 GroundStation1) 6.877)
    (= (slewtime GroundStation1 Phenomenon12) 20.77) (= (slewtime Phenomenon12 GroundStation1) 20.77)
    (= (slewtime GroundStation1 Phenomenon13) 58.05) (= (slewtime Phenomenon13 GroundStation1) 58.05)
    (= (slewtime GroundStation1 Planet5) 48.9) (= (slewtime Planet5 GroundStation1) 48.9)
    (= (slewtime GroundStation1 Planet10) 54.03) (= (slewtime Planet10 GroundStation1) 54.03)
    (= (slewtime GroundStation1 Planet11) 34.8) (= (slewtime Planet11 GroundStation1) 34.8)
    (= (slewtime GroundStation1 Star0) 31.11) (= (slewtime Star0 GroundStation1) 31.11)
    (= (slewtime GroundStation1 Star2) 54.29) (= (slewtime Star2 GroundStation1) 54.29)
    (= (slewtime GroundStation1 Star3) 78.01) (= (slewtime Star3 GroundStation1) 78.01)
    (= (slewtime GroundStation1 Star4) 17.74) (= (slewtime Star4 GroundStation1) 17.74)
    (= (slewtime GroundStation1 Star9) 46.94) (= (slewtime Star9 GroundStation1) 46.94)
    (= (slewtime GroundStation1 Star14) 11.74) (= (slewtime Star14 GroundStation1) 11.74)

    ;; Phenomenon6 to ...
    (= (slewtime Phenomenon6 Phenomenon7) 47.94) (= (slewtime Phenomenon7 Phenomenon6) 47.94)
    (= (slewtime Phenomenon6 Phenomenon8) 33.75) (= (slewtime Phenomenon8 Phenomenon6) 33.75)
    (= (slewtime Phenomenon6 Phenomenon12) 2.427) (= (slewtime Phenomenon12 Phenomenon6) 2.427)
    (= (slewtime Phenomenon6 Phenomenon13) 59.45) (= (slewtime Phenomenon13 Phenomenon6) 59.45)
    (= (slewtime Phenomenon6 Planet5) 28.88) (= (slewtime Planet5 Phenomenon6) 28.88)
    (= (slewtime Phenomenon6 Planet10) 15.98) (= (slewtime Planet10 Phenomenon6) 15.98)
    (= (slewtime Phenomenon6 Planet11) 10.81) (= (slewtime Planet11 Phenomenon6) 10.81)
    (= (slewtime Phenomenon6 Star0) 36.86) (= (slewtime Star0 Phenomenon6) 36.86)
    (= (slewtime Phenomenon6 Star2) 48.67) (= (slewtime Star2 Phenomenon6) 48.67)
    (= (slewtime Phenomenon6 Star3) 36.81) (= (slewtime Star3 Phenomenon6) 36.81)
    (= (slewtime Phenomenon6 Star4) 47.72) (= (slewtime Star4 Phenomenon6) 47.72)
    (= (slewtime Phenomenon6 Star9) 17.25) (= (slewtime Star9 Phenomenon6) 17.25)
    (= (slewtime Phenomenon6 Star14) 9.591) (= (slewtime Star14 Phenomenon6) 9.591)

    ;; Phenomenon7 to ...
    (= (slewtime Phenomenon7 Phenomenon8) 0.5836) (= (slewtime Phenomenon8 Phenomenon7) 0.5836)
    (= (slewtime Phenomenon7 Phenomenon12) 27.43) (= (slewtime Phenomenon12 Phenomenon7) 27.43)
    (= (slewtime Phenomenon7 Phenomenon13) 50.22) (= (slewtime Phenomenon13 Phenomenon7) 50.22)
    (= (slewtime Phenomenon7 Planet5) 67.51) (= (slewtime Planet5 Phenomenon7) 67.51)
    (= (slewtime Phenomenon7 Planet10) 0.9005) (= (slewtime Planet10 Phenomenon7) 0.9005)
    (= (slewtime Phenomenon7 Planet11) 55.1) (= (slewtime Planet11 Phenomenon7) 55.1)
    (= (slewtime Phenomenon7 Star0) 23.4) (= (slewtime Star0 Phenomenon7) 23.4)
    (= (slewtime Phenomenon7 Star2) 77.99) (= (slewtime Star2 Phenomenon7) 77.99)
    (= (slewtime Phenomenon7 Star3) 23.38) (= (slewtime Star3 Phenomenon7) 23.38)
    (= (slewtime Phenomenon7 Star4) 82.72) (= (slewtime Star4 Phenomenon7) 82.72)
    (= (slewtime Phenomenon7 Star9) 8.972) (= (slewtime Star9 Phenomenon7) 8.972)
    (= (slewtime Phenomenon7 Star14) 51.05) (= (slewtime Star14 Phenomenon7) 51.05)

    ;; Phenomenon8 to ...
    (= (slewtime Phenomenon8 Phenomenon12) 46.02) (= (slewtime Phenomenon12 Phenomenon8) 46.02)
    (= (slewtime Phenomenon8 Phenomenon13) 21.34) (= (slewtime Phenomenon13 Phenomenon8) 21.34)
    (= (slewtime Phenomenon8 Planet5) 9.429) (= (slewtime Planet5 Phenomenon8) 9.429)
    (= (slewtime Phenomenon8 Planet10) 22.54) (= (slewtime Planet10 Phenomenon8) 22.54)
    (= (slewtime Phenomenon8 Planet11) 1.469) (= (slewtime Planet11 Phenomenon8) 1.469)
    (= (slewtime Phenomenon8 Star0) 5.79) (= (slewtime Star0 Phenomenon8) 5.79)
    (= (slewtime Phenomenon8 Star2) 25.52) (= (slewtime Star2 Phenomenon8) 25.52)
    (= (slewtime Phenomenon8 Star3) 55.78) (= (slewtime Star3 Phenomenon8) 55.78)
    (= (slewtime Phenomenon8 Star4) 55.15) (= (slewtime Star4 Phenomenon8) 55.15)
    (= (slewtime Phenomenon8 Star9) 21.83) (= (slewtime Star9 Phenomenon8) 21.83)
    (= (slewtime Phenomenon8 Star14) 18.95) (= (slewtime Star14 Phenomenon8) 18.95)

    ;; Phenomenon12 to ...
    (= (slewtime Phenomenon12 Phenomenon13) 4.346) (= (slewtime Phenomenon13 Phenomenon12) 4.346)
    (= (slewtime Phenomenon12 Planet5) 51.94) (= (slewtime Planet5 Phenomenon12) 51.94)
    (= (slewtime Phenomenon12 Planet10) 8.949) (= (slewtime Planet10 Phenomenon12) 8.949)
    (= (slewtime Phenomenon12 Planet11) 55.97) (= (slewtime Planet11 Phenomenon12) 55.97)
    (= (slewtime Phenomenon12 Star0) 61.81) (= (slewtime Star0 Phenomenon12) 61.81)
    (= (slewtime Phenomenon12 Star2) 67.55) (= (slewtime Star2 Phenomenon12) 67.55)
    (= (slewtime Phenomenon12 Star3) 17.94) (= (slewtime Star3 Phenomenon12) 17.94)
    (= (slewtime Phenomenon12 Star4) 1.243) (= (slewtime Star4 Phenomenon12) 1.243)
    (= (slewtime Phenomenon12 Star9) 73.83) (= (slewtime Star9 Phenomenon12) 73.83)
    (= (slewtime Phenomenon12 Star14) 27.29) (= (slewtime Star14 Phenomenon12) 27.29)

    ;; Phenomenon13 to ...
    (= (slewtime Phenomenon13 Planet5) 99.46) (= (slewtime Planet5 Phenomenon13) 99.46)
    (= (slewtime Phenomenon13 Planet10) 18.9) (= (slewtime Planet10 Phenomenon13) 18.9)
    (= (slewtime Phenomenon13 Planet11) 53.23) (= (slewtime Planet11 Phenomenon13) 53.23)
    (= (slewtime Phenomenon13 Star0) 59.85) (= (slewtime Star0 Phenomenon13) 59.85)
    (= (slewtime Phenomenon13 Star2) 5.415) (= (slewtime Star2 Phenomenon13) 5.415)
    (= (slewtime Phenomenon13 Star3) 40.3) (= (slewtime Star3 Phenomenon13) 40.3)
    (= (slewtime Phenomenon13 Star4) 56.7) (= (slewtime Star4 Phenomenon13) 56.7)
    (= (slewtime Phenomenon13 Star9) 18.82) (= (slewtime Star9 Phenomenon13) 18.82)
    (= (slewtime Phenomenon13 Star14) 0.2689) (= (slewtime Star14 Phenomenon13) 0.2689)

    ;; Planet5 to ...
    (= (slewtime Planet5 Planet10) 1.259) (= (slewtime Planet10 Planet5) 1.259)
    (= (slewtime Planet5 Planet11) 2.536) (= (slewtime Planet11 Planet5) 2.536)
    (= (slewtime Planet5 Star0) 20.86) (= (slewtime Star0 Planet5) 20.86)
    (= (slewtime Planet5 Star2) 47.19) (= (slewtime Star2 Planet5) 47.19)
    (= (slewtime Planet5 Star3) 31.7) (= (slewtime Star3 Planet5) 31.7)
    (= (slewtime Planet5 Star4) 72.71) (= (slewtime Star4 Planet5) 72.71)
    (= (slewtime Planet5 Star9) 2.868) (= (slewtime Star9 Planet5) 2.868)
    (= (slewtime Planet5 Star14) 74.82) (= (slewtime Star14 Planet5) 74.82)

    ;; Planet10 to ...
    (= (slewtime Planet10 Planet11) 60.37) (= (slewtime Planet11 Planet10) 60.37)
    (= (slewtime Planet10 Star0) 78.34) (= (slewtime Star0 Planet10) 78.34)
    (= (slewtime Planet10 Star2) 1.69) (= (slewtime Star2 Planet10) 1.69)
    (= (slewtime Planet10 Star3) 14.6) (= (slewtime Star3 Planet10) 14.6)
    (= (slewtime Planet10 Star4) 79.32) (= (slewtime Star4 Planet10) 79.32)
    (= (slewtime Planet10 Star9) 57.12) (= (slewtime Star9 Planet10) 57.12)
    (= (slewtime Planet10 Star14) 68.7) (= (slewtime Star14 Planet10) 68.7)

    ;; Planet11 to ...
    (= (slewtime Planet11 Star0) 31.56) (= (slewtime Star0 Planet11) 31.56)
    (= (slewtime Planet11 Star2) 73.92) (= (slewtime Star2 Planet11) 73.92)
    (= (slewtime Planet11 Star3) 39.03) (= (slewtime Star3 Planet11) 39.03)
    (= (slewtime Planet11 Star4) 17.07) (= (slewtime Star4 Planet11) 17.07)
    (= (slewtime Planet11 Star9) 26.86) (= (slewtime Star9 Planet11) 26.86)
    (= (slewtime Planet11 Star14) 4.1) (= (slewtime Star14 Planet11) 4.1)

    ;; Star0 to ...
    (= (slewtime Star0 Star2) 30.86) (= (slewtime Star2 Star0) 30.86)
    (= (slewtime Star0 Star3) 35.26) (= (slewtime Star3 Star0) 35.26)
    (= (slewtime Star0 Star4) 23.5)  (= (slewtime Star4 Star0) 23.5)
    (= (slewtime Star0 Star9) 73.97) (= (slewtime Star9 Star0) 73.97)
    (= (slewtime Star0 Star14) 62.77) (= (slewtime Star14 Star0) 62.77)

    ;; Star2 to ...
    (= (slewtime Star2 Star3) 84.2) (= (slewtime Star3 Star2) 84.2)
    (= (slewtime Star2 Star4) 33.63) (= (slewtime Star4 Star2) 33.63)
    (= (slewtime Star2 Star9) 64.9)  (= (slewtime Star9 Star2) 64.9)
    (= (slewtime Star2 Star14) 79.59) (= (slewtime Star14 Star2) 79.59)

    ;; Star3 to ...
    (= (slewtime Star3 Star4) 50.36) (= (slewtime Star4 Star3) 50.36)
    (= (slewtime Star3 Star9) 52.68) (= (slewtime Star9 Star3) 52.68)
    (= (slewtime Star3 Star14) 59.26) (= (slewtime Star14 Star3) 59.26)

    ;; Star4 to ...
    (= (slewtime Star4 Star9) 4.125) (= (slewtime Star9 Star4) 4.125)
    (= (slewtime Star4 Star14) 20.26) (= (slewtime Star14 Star4) 20.26)

    ;; Star9 to Star14
    (= (slewtime Star9 Star14) 67.82) (= (slewtime Star14 Star9) 67.82)
  )

  (:goal (and
    (have-image Planet5 image2)
    (have-image Phenomenon6 image3)
    (have-image Phenomenon7 infrared1)
    (have-image Phenomenon8 image2)
    (have-image Star9 image3)
    (have-image Planet10 image4)
    (have-image Planet11 spectrograph0)
    (have-image Phenomenon12 image3)
    (have-image Phenomenon13 spectrograph0)
    (have-image Star14 image4)

    (pointing satellite0 Phenomenon7)
    (pointing satellite3 Star9)
    (pointing satellite4 Planet5)
  ))

  (:metric minimize (fuel-used))
)