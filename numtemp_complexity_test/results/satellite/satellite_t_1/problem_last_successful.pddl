(define (problem satellite-problem-0)
  (:domain satellite-multiagent)

  (:objects
    satellite0 - satellite
    instrument0 - instrument
    thermograph0 image1 spectrograph2 - mode
    GroundStation1 GroundStation2 Phenomenon3 Phenomenon4 Phenomenon6 Star0 Star5 - direction
  )

  (:init
    ;; static relations
    (on-board instrument0 satellite0)
    (supports-mode instrument0 thermograph0)
    (calibration-target instrument0 GroundStation2)

    ;; initial dynamic state
    (pointing satellite0 Phenomenon6)
    (power-available satellite0)
    ;; instrument0 initially powered off and uncalibrated: do not assert (powered) or (calibrated)

    ;; slew-time values (symmetric as public info)
    (= (slew-time GroundStation1 GroundStation2) 68.04)
    (= (slew-time GroundStation2 GroundStation1) 68.04)
    (= (slew-time GroundStation1 Phenomenon3) 89.48)
    (= (slew-time Phenomenon3 GroundStation1) 89.48)
    (= (slew-time GroundStation1 Phenomenon4) 31.79)
    (= (slew-time Phenomenon4 GroundStation1) 31.79)
    (= (slew-time GroundStation1 Phenomenon6) 17.63)
    (= (slew-time Phenomenon6 GroundStation1) 17.63)
    (= (slew-time GroundStation1 Star0) 18.17)
    (= (slew-time Star0 GroundStation1) 18.17)
    (= (slew-time GroundStation1 Star5) 8.59)
    (= (slew-time Star5 GroundStation1) 8.59)

    (= (slew-time GroundStation2 Phenomenon3) 33.94)
    (= (slew-time Phenomenon3 GroundStation2) 33.94)
    (= (slew-time GroundStation2 Phenomenon4) 39.73)
    (= (slew-time Phenomenon4 GroundStation2) 39.73)
    (= (slew-time GroundStation2 Phenomenon6) 50.73)
    (= (slew-time Phenomenon6 GroundStation2) 50.73)
    (= (slew-time GroundStation2 Star0) 38.61)
    (= (slew-time Star0 GroundStation2) 38.61)
    (= (slew-time GroundStation2 Star5) 62.86)
    (= (slew-time Star5 GroundStation2) 62.86)

    (= (slew-time Phenomenon3 Phenomenon4) 25.72)
    (= (slew-time Phenomenon4 Phenomenon3) 25.72)
    (= (slew-time Phenomenon3 Phenomenon6) 14.75)
    (= (slew-time Phenomenon6 Phenomenon3) 14.75)
    (= (slew-time Phenomenon3 Star0) 14.29)
    (= (slew-time Star0 Phenomenon3) 14.29)
    (= (slew-time Phenomenon3 Star5) 10.18)
    (= (slew-time Star5 Phenomenon3) 10.18)

    (= (slew-time Phenomenon4 Phenomenon6) 2.098)
    (= (slew-time Phenomenon6 Phenomenon4) 2.098)
    (= (slew-time Phenomenon4 Star0) 35.01)
    (= (slew-time Star0 Phenomenon4) 35.01)
    (= (slew-time Phenomenon4 Star5) 64.5)
    (= (slew-time Star5 Phenomenon4) 64.5)

    (= (slew-time Phenomenon6 Star0) 77.07)
    (= (slew-time Star0 Phenomenon6) 77.07)
    (= (slew-time Phenomenon6 Star5) 29.32)
    (= (slew-time Star5 Phenomenon6) 29.32)

    (= (slew-time Star0 Star5) 36.56)
    (= (slew-time Star5 Star0) 36.56)

    ;; calibration times
    (= (calibration-time instrument0 GroundStation2) 5.9)
  )

  (:goal (and
    (have-image Phenomenon4 thermograph0)
    (have-image Star5 thermograph0)
    (have-image Phenomenon6 thermograph0)
  ))

  (:metric minimize (total-time))
)