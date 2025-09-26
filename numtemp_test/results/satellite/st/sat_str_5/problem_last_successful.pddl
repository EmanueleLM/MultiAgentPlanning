(define (problem satellite-imaging-problem)
  (:domain SatelliteImaging)

  (:objects
    satellite0 satellite1 satellite2 satellite3 satellite4 - satellite
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 - instrument
    infrared0 infrared1 infrared3 spectrograph4 thermograph2 - mode
    GroundStation1 Phenomenon6 Phenomenon13 Phenomenon17 Phenomenon21 Phenomenon24 Planet5 Planet8 Planet10 Planet11 Planet16 Planet20 Star0 Star2 Star3 Star4 Star7 Star9 Star12 Star14 Star15 Star18 Star19 Star22 Star23 - direction
  )

  (:init
    ;; on-board assignments
    (on-board instrument0 satellite0)
    (on-board instrument1 satellite0)
    (on-board instrument2 satellite0)
    (on-board instrument3 satellite1)
    (on-board instrument4 satellite1)
    (on-board instrument5 satellite2)
    (on-board instrument6 satellite3)
    (on-board instrument7 satellite4)
    (on-board instrument8 satellite4)
    (on-board instrument9 satellite4)

    ;; supports
    (supports instrument0 infrared1)
    (supports instrument0 spectrograph4)
    (supports instrument1 infrared0)
    (supports instrument1 infrared1)
    (supports instrument2 infrared0)
    (supports instrument2 infrared1)
    (supports instrument3 infrared0)
    (supports instrument3 spectrograph4)
    (supports instrument4 infrared0)
    (supports instrument4 infrared3)
    (supports instrument4 thermograph2)
    (supports instrument5 infrared1)
    (supports instrument6 infrared1)
    (supports instrument7 infrared1)
    (supports instrument7 infrared3)
    (supports instrument8 infrared0)
    (supports instrument8 infrared3)
    (supports instrument8 spectrograph4)
    (supports instrument9 infrared1)
    (supports instrument9 infrared3)
    (supports instrument9 spectrograph4)

    ;; calibration targets
    (calib-target instrument0 Star0)
    (calib-target instrument1 Star2)
    (calib-target instrument2 Star3)
    (calib-target instrument3 Star4)
    (calib-target instrument4 Star4)
    (calib-target instrument5 GroundStation1)
    (calib-target instrument6 Star4)
    (calib-target instrument7 Star2)
    (calib-target instrument8 Star2)
    (calib-target instrument9 Star4)

    ;; initial pointing
    (pointing satellite0 Planet16)
    (pointing satellite1 Star4)
    (pointing satellite2 Star15)
    (pointing satellite3 Phenomenon6)
    (pointing satellite4 Star14)

    ;; initial power available
    (power-available satellite0)
    (power-available satellite1)
    (power-available satellite2)
    (power-available satellite3)
    (power-available satellite4)

    ;; initial instrument states: all unpowered and uncalibrated (predicates absent)
    ;; satellites not calibrating initially
    ;; count-mode initializations
    (= (count-mode spectrograph4) 0)
    (= (count-mode thermograph2) 0)
    (= (count-mode infrared0) 0)
    (= (count-mode infrared1) 0)
    (= (count-mode infrared3) 0)
  )

  (:goal (and
    ;; image goals as (mode, direction)
    (image-taken infrared0 Planet5)
    (image-taken spectrograph4 Phenomenon6)
    (image-taken infrared0 Star7)
    (image-taken infrared1 Planet8)
    (image-taken spectrograph4 Star9)
    (image-taken thermograph2 Planet10)
    (image-taken infrared3 Planet11)
    (image-taken spectrograph4 Phenomenon13)
    (image-taken thermograph2 Star14)
    (image-taken infrared3 Star15)
    (image-taken infrared1 Planet16)
    (image-taken spectrograph4 Phenomenon17)
    (image-taken spectrograph4 Star18)
    (image-taken thermograph2 Star19)
    (image-taken thermograph2 Planet20)
    (image-taken thermograph2 Phenomenon21)
    (image-taken infrared1 Star22)
    (image-taken spectrograph4 Star23)
    (image-taken infrared0 Phenomenon24)

    ;; mode counts match required totals
    (= (count-mode spectrograph4) 6)
    (= (count-mode thermograph2) 5)
    (= (count-mode infrared0) 3)
    (= (count-mode infrared1) 3)
    (= (count-mode infrared3) 2)
  ))

  (:metric minimize (total-time))
)