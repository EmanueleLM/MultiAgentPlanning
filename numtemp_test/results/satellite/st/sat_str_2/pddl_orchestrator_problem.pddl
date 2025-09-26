(define (problem satellite-problem)
  (:domain satellite-domain)
  (:objects
    satellite0 satellite1 satellite2 satellite3 satellite4 - satellite
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 - instrument
    infrared0 infrared1 infrared3 spectrograph4 thermograph2 - mode
    GroundStation1 Phenomenon6 Phenomenon13 Phenomenon17 Phenomenon21 Phenomenon24 Planet5 Planet8 Planet10 Planet11 Planet16 Planet20 Star0 Star2 Star3 Star4 Star7 Star9 Star12 Star14 Star15 Star18 Star19 Star22 Star23 - direction
  )

  (:init
    ;; Initial pointing for each satellite
    (pointing satellite0 Planet16)
    (pointing satellite1 Star4)
    (pointing satellite2 Star15)
    (pointing satellite3 Phenomenon6)
    (pointing satellite4 Star14)

    ;; Initial power availability for satellites
    (power-available satellite0)
    (power-available satellite1)
    (power-available satellite2)
    (power-available satellite3)
    (power-available satellite4)

    ;; Instruments onboard mapping
    (onboard instrument0 satellite0)
    (onboard instrument1 satellite0)
    (onboard instrument2 satellite0)
    (onboard instrument3 satellite1)
    (onboard instrument4 satellite1)
    (onboard instrument5 satellite2)
    (onboard instrument6 satellite3)
    (onboard instrument7 satellite4)
    (onboard instrument8 satellite4)
    (onboard instrument9 satellite4)

    ;; Instrument supports (instrument -> mode)
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

    ;; Instrument calibration targets
    (cal-target instrument0 Star0)
    (cal-target instrument1 Star2)
    (cal-target instrument2 Star3)
    (cal-target instrument3 Star4)
    (cal-target instrument4 Star4)
    (cal-target instrument5 GroundStation1)
    (cal-target instrument6 Star4)
    (cal-target instrument7 Star2)
    (cal-target instrument8 Star2)
    (cal-target instrument9 Star4)

    ;; All instruments start powered off and uncalibrated (no powered/calibrated facts)
  )

  (:goal (and
    ;; Goal: have images for listed direction-mode pairs
    (have-image infrared0 Planet5)
    (have-image spectrograph4 Phenomenon6)
    (have-image infrared0 Star7)
    (have-image infrared1 Planet8)
    (have-image spectrograph4 Star9)
    (have-image thermograph2 Planet10)
    (have-image infrared3 Planet11)
    (have-image spectrograph4 Phenomenon13)
    (have-image thermograph2 Star14)
    (have-image infrared3 Star15)
    (have-image infrared1 Planet16)
    (have-image spectrograph4 Phenomenon17)
    (have-image spectrograph4 Star18)
    (have-image thermograph2 Star19)
    (have-image thermograph2 Planet20)
    (have-image thermograph2 Phenomenon21)
    (have-image infrared1 Star22)
    (have-image spectrograph4 Star23)
    (have-image infrared0 Phenomenon24)
  ))

  (:metric minimize (total-time))
)