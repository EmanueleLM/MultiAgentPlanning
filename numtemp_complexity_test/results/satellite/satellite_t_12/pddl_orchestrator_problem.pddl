(define (problem satellite-multiagent-problem)
  (:domain satellite-multiagent)

  (:objects
    ;; satellites
    satellite0 satellite1 satellite2 satellite3 satellite4 - satellite

    ;; instruments
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 instrument10 - instrument

    ;; directions
    GroundStation1 Phenomenon6 Phenomenon7 Phenomenon8 Phenomenon12 Phenomenon13 Planet5 Planet10 Planet11 Star0 Star2 Star3 Star4 Star9 Star14 - direction

    ;; modes
    image2 image3 image4 infrared1 spectrograph0 - mode
  )

  ;; Initial state
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

    ;; supports (instrument modes)
    (supports instrument0 image4)
    (supports instrument0 infrared1)

    (supports instrument1 image2)
    (supports instrument1 image4)
    (supports instrument1 spectrograph0)

    (supports instrument2 image2)

    (supports instrument3 image2)
    (supports instrument3 image3)
    (supports instrument3 image4)

    (supports instrument4 image2)
    (supports instrument4 image3)

    (supports instrument5 image4)
    (supports instrument5 infrared1)
    (supports instrument5 spectrograph0)

    (supports instrument6 image2)
    (supports instrument6 spectrograph0)

    (supports instrument7 image3)
    (supports instrument7 image4)
    (supports instrument7 spectrograph0)

    (supports instrument8 image3)
    (supports instrument8 image4)
    (supports instrument8 infrared1)

    (supports instrument9 image4)

    (supports instrument10 image2)
    (supports instrument10 image4)
    (supports instrument10 infrared1)

    ;; calibration targets
    (cal-target instrument0 Star3)
    (cal-target instrument1 Star4)
    (cal-target instrument2 Star2)
    (cal-target instrument3 Star2)
    (cal-target instrument4 Star3)
    (cal-target instrument5 Star3)
    (cal-target instrument6 Star2)
    (cal-target instrument7 Star0)
    (cal-target instrument8 GroundStation1)
    (cal-target instrument9 Star0)
    (cal-target instrument10 Star2)

    ;; initial pointing
    (pointing satellite0 Star0)
    (pointing satellite1 Planet11)
    (pointing satellite2 Phenomenon6)
    (pointing satellite3 Planet10)
    (pointing satellite4 Star9)

    ;; power feed initially available on each satellite
    (power-free satellite0)
    (power-free satellite1)
    (power-free satellite2)
    (power-free satellite3)
    (power-free satellite4)

    ;; instruments initially not powered and not calibrated are implicit (predicates absent)
    ;; have_image none initially

    ;; mode counters initialized to 0
    (= (mode-count image2) 0.0)
    (= (mode-count image3) 0.0)
    (= (mode-count image4) 0.0)
    (= (mode-count infrared1) 0.0)
    (= (mode-count spectrograph0) 0.0)

    ;; calibration times
    (= (calibtime instrument0 Star3) 72.8)
    (= (calibtime instrument1 Star4) 90.0)
    (= (calibtime instrument2 Star2) 45.9)
    (= (calibtime instrument3 Star2) 46.4)
    (= (calibtime instrument4 Star3) 62.2)
    (= (calibtime instrument5 Star3) 26.7)
    (= (calibtime instrument6 Star2) 19.0)
    (= (calibtime instrument7 Star0) 60.5)
    (= (calibtime instrument8 GroundStation1) 15.0)
    (= (calibtime instrument9 Star0) 46.9)
    (= (calibtime instrument10 Star2) 95.2)

    ;; slew times as given (partial asymmetric mapping)
    ;; GroundStation1 row
    (= (slewtime GroundStation1 Phenomenon6) 35.44)
    (= (slewtime GroundStation1 Phenomenon7) 43.55)
    (= (slewtime GroundStation1 Phenomenon8) 6.877)
    (= (slewtime GroundStation1 Phenomenon12) 20.77)
    (= (slewtime GroundStation1 Phenomenon13) 58.05)
    (= (slewtime GroundStation1 Planet5) 48.9)
    (= (slewtime GroundStation1 Planet10) 54.03)
    (= (slewtime GroundStation1 Planet11) 34.8)
    (= (slewtime GroundStation1 Star0) 31.11)
    (= (slewtime GroundStation1 Star2) 54.29)
    (= (slewtime GroundStation1 Star3) 78.01)
    (= (slewtime GroundStation1 Star4) 17.74)
    (= (slewtime GroundStation1 Star9) 46.94)
    (= (slewtime GroundStation1 Star14) 11.74)

    ;; Phenomenon6 row
    (= (slewtime Phenomenon6 Phenomenon7) 47.94)
    (= (slewtime Phenomenon6 Phenomenon8) 33.75)
    (= (slewtime Phenomenon6 Phenomenon12) 2.427)
    (= (slewtime Phenomenon6 Phenomenon13) 59.45)
    (= (slewtime Phenomenon6 Planet5) 28.88)
    (= (slewtime Phenomenon6 Planet10) 15.98)
    (= (slewtime Phenomenon6 Planet11) 10.81)
    (= (slewtime Phenomenon6 Star0) 36.86)
    (= (slewtime Phenomenon6 Star2) 48.67)
    (= (slewtime Phenomenon6 Star3) 36.81)
    (= (slewtime Phenomenon6 Star4) 47.72)
    (= (slewtime Phenomenon6 Star9) 17.25)
    (= (slewtime Phenomenon6 Star14) 9.591)

    ;; Phenomenon7 row
    (= (slewtime Phenomenon7 Phenomenon8) 0.5836)
    (= (slewtime Phenomenon7 Phenomenon12) 27.43)
    (= (slewtime Phenomenon7 Phenomenon13) 50.22)
    (= (slewtime Phenomenon7 Planet5) 67.51)
    (= (slewtime Phenomenon7 Planet10) 0.9005)
    (= (slewtime Phenomenon7 Planet11) 55.1)
    (= (slewtime Phenomenon7 Star0) 23.4)
    (= (slewtime Phenomenon7 Star2) 77.99)
    (= (slewtime Phenomenon7 Star3) 23.38)
    (= (slewtime Phenomenon7 Star4) 82.72)
    (= (slewtime Phenomenon7 Star9) 8.972)
    (= (slewtime Phenomenon7 Star14) 51.05)

    ;; Phenomenon8 row
    (= (slewtime Phenomenon8 Phenomenon12) 46.02)
    (= (slewtime Phenomenon8 Phenomenon13) 21.34)
    (= (slewtime Phenomenon8 Planet5) 9.429)
    (= (slewtime Phenomenon8 Planet10) 22.54)
    (= (slewtime Phenomenon8 Planet11) 1.469)
    (= (slewtime Phenomenon8 Star0) 5.79)
    (= (slewtime Phenomenon8 Star2) 25.52)
    (= (slewtime Phenomenon8 Star3) 55.78)
    (= (slewtime Phenomenon8 Star4) 55.15)
    (= (slewtime Phenomenon8 Star9) 21.83)
    (= (slewtime Phenomenon8 Star14) 18.95)

    ;; Phenomenon12 row
    (= (slewtime Phenomenon12 Phenomenon13) 4.346)
    (= (slewtime Phenomenon12 Planet5) 51.94)
    (= (slewtime Phenomenon12 Planet10) 8.949)
    (= (slewtime Phenomenon12 Planet11) 55.97)
    (= (slewtime Phenomenon12 Star0) 61.81)
    (= (slewtime Phenomenon12 Star2) 67.55)
    (= (slewtime Phenomenon12 Star3) 17.94)
    (= (slewtime Phenomenon12 Star4) 1.243)
    (= (slewtime Phenomenon12 Star9) 73.83)
    (= (slewtime Phenomenon12 Star14) 27.29)

    ;; Phenomenon13 row
    (= (slewtime Phenomenon13 Planet5) 99.46)
    (= (slewtime Phenomenon13 Planet10) 18.9)
    (= (slewtime Phenomenon13 Planet11) 53.23)
    (= (slewtime Phenomenon13 Star0) 59.85)
    (= (slewtime Phenomenon13 Star2) 5.415)
    (= (slewtime Phenomenon13 Star3) 40.3)
    (= (slewtime Phenomenon13 Star4) 56.7)
    (= (slewtime Phenomenon13 Star9) 18.82)
    (= (slewtime Phenomenon13 Star14) 0.2689)

    ;; Planet5 row
    (= (slewtime Planet5 Planet10) 1.259)
    (= (slewtime Planet5 Planet11) 2.536)
    (= (slewtime Planet5 Star0) 20.86)
    (= (slewtime Planet5 Star2) 47.19)
    (= (slewtime Planet5 Star3) 31.7)
    (= (slewtime Planet5 Star4) 72.71)
    (= (slewtime Planet5 Star9) 2.868)
    (= (slewtime Planet5 Star14) 74.82)

    ;; Planet10 row
    (= (slewtime Planet10 Planet11) 60.37)
    (= (slewtime Planet10 Star0) 78.34)
    (= (slewtime Planet10 Star2) 1.69)
    (= (slewtime Planet10 Star3) 14.6)
    (= (slewtime Planet10 Star4) 79.32)
    (= (slewtime Planet10 Star9) 57.12)
    (= (slewtime Planet10 Star14) 68.7)

    ;; Planet11 row
    (= (slewtime Planet11 Star0) 31.56)
    (= (slewtime Planet11 Star2) 73.92)
    (= (slewtime Planet11 Star3) 39.03)
    (= (slewtime Planet11 Star4) 17.07)
    (= (slewtime Planet11 Star9) 26.86)
    (= (slewtime Planet11 Star14) 4.1)

    ;; Star0 row
    (= (slewtime Star0 Star2) 30.86)
    (= (slewtime Star0 Star3) 35.26)
    (= (slewtime Star0 Star4) 23.5)
    (= (slewtime Star0 Star9) 73.97)
    (= (slewtime Star0 Star14) 62.77)

    ;; Star2 row
    (= (slewtime Star2 Star3) 84.2)
    (= (slewtime Star2 Star4) 33.63)
    (= (slewtime Star2 Star9) 64.9)
    (= (slewtime Star2 Star14) 79.59)

    ;; Star3 row
    (= (slewtime Star3 Star4) 50.36)
    (= (slewtime Star3 Star9) 52.68)
    (= (slewtime Star3 Star14) 59.26)

    ;; Star4 row
    (= (slewtime Star4 Star9) 4.125)
    (= (slewtime Star4 Star14) 20.26)

    ;; Star9 row
    (= (slewtime Star9 Star14) 67.82)
  )

  ;; Goal: specific image tasks must be achieved
  (:goal (and
    ;; image goals list (must have each specific image)
    (have_image Planet5 image2)
    (have_image Phenomenon6 image3)
    (have_image Phenomenon7 infrared1)
    (have_image Phenomenon8 image2)
    (have_image Star9 image3)
    (have_image Planet10 image4)
    (have_image Planet11 spectrograph0)
    (have_image Phenomenon12 image3)
    (have_image Phenomenon13 spectrograph0)
    (have_image Star14 image4)

    ;; mode counts minimums
    (>= (mode-count image3) 3.0)
    (>= (mode-count image2) 2.0)
    (>= (mode-count image4) 2.0)
    (>= (mode-count spectrograph0) 2.0)
    (>= (mode-count infrared1) 1.0)

    ;; final pointing constraints
    (pointing satellite0 Phenomenon7)
    (pointing satellite3 Star9)
    (pointing satellite4 Planet5)
  ))

  (:metric minimize (total-time))
)