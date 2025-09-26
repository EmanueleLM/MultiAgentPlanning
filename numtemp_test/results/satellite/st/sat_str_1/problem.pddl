(define (problem satellite-imaging-problem)
  (:domain satellite-imaging-temporal)

  (:objects
    satellite0 satellite1 satellite2 satellite3 satellite4 - satellite
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 - instrument
    GroundStation3 Phenomenon7 Phenomenon9 Phenomenon15 Planet6 Planet13 Planet14 Planet16 Planet19 Star0 Star1 Star2 Star4 Star5 Star8 Star10 Star11 Star12 Star17 Star18 - direction
    image3 infrared0 infrared1 spectrograph4 thermograph2 - mode
  )

  (:init
    ;; initial pointings
    (pointing satellite0 Star8)
    (pointing satellite1 GroundStation3)
    (pointing satellite2 Star4)
    (pointing satellite3 Phenomenon9)
    (pointing satellite4 Phenomenon9)

    ;; power availability initially
    (power-free satellite0)
    (power-free satellite1)
    (power-free satellite2)
    (power-free satellite3)
    (power-free satellite4)

    ;; onboard relations
    (onboard instrument0 satellite0)
    (onboard instrument1 satellite1)
    (onboard instrument2 satellite1)
    (onboard instrument3 satellite1)
    (onboard instrument4 satellite2)
    (onboard instrument5 satellite2)
    (onboard instrument6 satellite2)
    (onboard instrument7 satellite3)
    (onboard instrument8 satellite4)

    ;; supports relations
    (supports instrument0 spectrograph4)

    (supports instrument1 infrared0)
    (supports instrument1 infrared1)

    (supports instrument2 infrared0)
    (supports instrument2 infrared1)

    (supports instrument3 infrared1)
    (supports instrument3 spectrograph4)
    (supports instrument3 thermograph2)

    (supports instrument4 image3)
    (supports instrument4 infrared0)
    (supports instrument4 infrared1)

    (supports instrument5 spectrograph4)
    (supports instrument5 thermograph2)

    (supports instrument6 infrared0)

    (supports instrument7 image3)

    (supports instrument8 infrared0)
    (supports instrument8 infrared1)
    (supports instrument8 spectrograph4)

    ;; calibration targets
    (calibration-target instrument0 Star0)
    (calibration-target instrument1 GroundStation3)
    (calibration-target instrument2 Star2)
    (calibration-target instrument3 Star0)
    (calibration-target instrument4 Star2)
    (calibration-target instrument5 Star0)
    (calibration-target instrument6 GroundStation3)
    (calibration-target instrument7 Star2)
    (calibration-target instrument8 Star2)

    ;; instruments initially not powered and not calibrated (omitted predicates mean false)
  )

  (:goal (and
    ;; Have the requested images (specific direction+mode goals)
    (image-taken Star5 image3)
    (image-taken Planet6 infrared1)
    (image-taken Phenomenon7 infrared1)
    (image-taken Star8 image3)
    (image-taken Star10 thermograph2)
    (image-taken Star11 infrared1)
    (image-taken Planet13 spectrograph4)
    (image-taken Planet14 thermograph2)
    (image-taken Phenomenon15 infrared0)
    (image-taken Planet16 image3)
    (image-taken Star17 infrared0)

    ;; final pointing constraints for some satellites
    (pointing satellite0 Phenomenon9)
    (pointing satellite1 Star4)
    (pointing satellite4 Star11)
  ))

  (:metric minimize (total-time))
)