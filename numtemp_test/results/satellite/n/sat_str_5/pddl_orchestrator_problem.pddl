(define (problem satellite-multiagent-problem)
  (:domain satellite-multiagent)
  (:objects
    ; satellites
    satellite0 satellite1 satellite2 satellite3 satellite4 - satellite

    ; instruments
    instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 instrument10 - instrument

    ; directions (converted to lowercase identifiers)
    groundstation1 phenomenon6 phenomenon7 phenomenon8 phenomenon12 phenomenon13 planet5 planet10 planet11 star0 star2 star3 star4 star9 star14 - direction

    ; modes
    image2 image3 image4 infrared1 spectrograph0 - mode
  )

  (:init
    ; initial pointing
    (pointing satellite0 star0)
    (pointing satellite1 planet11)
    (pointing satellite2 phenomenon6)
    (pointing satellite3 planet10)
    (pointing satellite4 star9)

    ; power availability initial
    (power-available satellite0)
    (power-available satellite1)
    (power-available satellite2)
    (power-available satellite3)
    (power-available satellite4)

    ; instrument onboard mapping
    (instrument-onboard instrument0 satellite0)
    (instrument-onboard instrument1 satellite0)
    (instrument-onboard instrument2 satellite0)
    (instrument-onboard instrument3 satellite1)
    (instrument-onboard instrument4 satellite1)
    (instrument-onboard instrument5 satellite1)
    (instrument-onboard instrument6 satellite2)
    (instrument-onboard instrument7 satellite3)
    (instrument-onboard instrument8 satellite4)
    (instrument-onboard instrument9 satellite4)
    (instrument-onboard instrument10 satellite4)

    ; instrument supports (instrument-supports)
    (instrument-supports instrument0 image4)
    (instrument-supports instrument0 infrared1)

    (instrument-supports instrument1 image2)
    (instrument-supports instrument1 image4)
    (instrument-supports instrument1 spectrograph0)

    (instrument-supports instrument2 image2)

    (instrument-supports instrument3 image2)
    (instrument-supports instrument3 image3)
    (instrument-supports instrument3 image4)

    (instrument-supports instrument4 image2)
    (instrument-supports instrument4 image3)

    (instrument-supports instrument5 image4)
    (instrument-supports instrument5 infrared1)
    (instrument-supports instrument5 spectrograph0)

    (instrument-supports instrument6 image2)
    (instrument-supports instrument6 spectrograph0)

    (instrument-supports instrument7 image3)
    (instrument-supports instrument7 image4)
    (instrument-supports instrument7 spectrograph0)

    (instrument-supports instrument8 image3)
    (instrument-supports instrument8 image4)
    (instrument-supports instrument8 infrared1)

    (instrument-supports instrument9 image4)

    (instrument-supports instrument10 image2)
    (instrument-supports instrument10 image4)
    (instrument-supports instrument10 infrared1)

    ; instrument calibration targets
    (instrument-cal-target instrument0 star3)
    (instrument-cal-target instrument1 star4)
    (instrument-cal-target instrument2 star2)
    (instrument-cal-target instrument3 star2)
    (instrument-cal-target instrument4 star3)
    (instrument-cal-target instrument5 star3)
    (instrument-cal-target instrument6 star2)
    (instrument-cal-target instrument7 star0)
    (instrument-cal-target instrument8 groundstation1)
    (instrument-cal-target instrument9 star0)
    (instrument-cal-target instrument10 star2)

    ; initial power-on / calibrated / have-image none (no facts)

    ; per-satellite data capacity initial
    (= (data-capacity-satellite0) 1000)
    (= (data-capacity-satellite1) 1000)
    (= (data-capacity-satellite2) 1000)
    (= (data-capacity-satellite3) 1000)
    (= (data-capacity-satellite4) 1000)

    ; per-satellite fuel initial
    (= (fuel-satellite0) 153)
    (= (fuel-satellite1) 120)
    (= (fuel-satellite2) 137)
    (= (fuel-satellite3) 199)
    (= (fuel-satellite4) 166)

    ; global accumulators
    (= (fuel-used) 0)
    (= (data-stored) 0)

    ; data_size table (direction x mode)
    (= (data_size phenomenon6 image2) 160)
    (= (data_size phenomenon6 image3) 86)
    (= (data_size phenomenon6 image4) 260)
    (= (data_size phenomenon6 infrared1) 199)
    (= (data_size phenomenon6 spectrograph0) 259)

    (= (data_size phenomenon7 image2) 52)
    (= (data_size phenomenon7 image3) 270)
    (= (data_size phenomenon7 image4) 105)
    (= (data_size phenomenon7 infrared1) 224)
    (= (data_size phenomenon7 spectrograph0) 71)

    (= (data_size phenomenon8 image2) 276)
    (= (data_size phenomenon8 image3) 193)
    (= (data_size phenomenon8 image4) 11)
    (= (data_size phenomenon8 infrared1) 113)
    (= (data_size phenomenon8 spectrograph0) 292)

    (= (data_size phenomenon12 image2) 42)
    (= (data_size phenomenon12 image3) 100)
    (= (data_size phenomenon12 image4) 106)
    (= (data_size phenomenon12 infrared1) 140)
    (= (data_size phenomenon12 spectrograph0) 19)

    (= (data_size phenomenon13 image2) 242)
    (= (data_size phenomenon13 image3) 114)
    (= (data_size phenomenon13 image4) 279)
    (= (data_size phenomenon13 infrared1) 32)
    (= (data_size phenomenon13 spectrograph0) 41)

    (= (data_size planet5 image2) 162)
    (= (data_size planet5 image3) 4)
    (= (data_size planet5 image4) 226)
    (= (data_size planet5 infrared1) 189)
    (= (data_size planet5 spectrograph0) 33)

    (= (data_size planet10 image2) 299)
    (= (data_size planet10 image3) 228)
    (= (data_size planet10 image4) 242)
    (= (data_size planet10 infrared1) 70)
    (= (data_size planet10 spectrograph0) 280)

    (= (data_size planet11 image2) 8)
    (= (data_size planet11 image3) 98)
    (= (data_size planet11 image4) 214)
    (= (data_size planet11 infrared1) 271)
    (= (data_size planet11 spectrograph0) 170)

    (= (data_size star9 image2) 172)
    (= (data_size star9 image3) 74)
    (= (data_size star9 image4) 240)
    (= (data_size star9 infrared1) 248)
    (= (data_size star9 spectrograph0) 239)

    (= (data_size star14 image2) 265)
    (= (data_size star14 image3) 20)
    (= (data_size star14 image4) 136)
    (= (data_size star14 infrared1) 87)
    (= (data_size star14 spectrograph0) 31)

    ; slew time table (from -> to). Only entries provided are initialized.
    ; from groundstation1
    (= (slew groundstation1 phenomenon6) 35.44)
    (= (slew groundstation1 phenomenon7) 43.55)
    (= (slew groundstation1 phenomenon8) 6.877)
    (= (slew groundstation1 phenomenon12) 20.77)
    (= (slew groundstation1 phenomenon13) 58.05)
    (= (slew groundstation1 planet5) 48.9)
    (= (slew groundstation1 planet10) 54.03)
    (= (slew groundstation1 planet11) 34.8)
    (= (slew groundstation1 star0) 31.11)
    (= (slew groundstation1 star2) 54.29)
    (= (slew groundstation1 star3) 78.01)
    (= (slew groundstation1 star4) 17.74)
    (= (slew groundstation1 star9) 46.94)
    (= (slew groundstation1 star14) 11.74)

    ; from phenomenon6
    (= (slew phenomenon6 phenomenon7) 47.94)
    (= (slew phenomenon6 phenomenon8) 33.75)
    (= (slew phenomenon6 phenomenon12) 2.427)
    (= (slew phenomenon6 phenomenon13) 59.45)
    (= (slew phenomenon6 planet5) 28.88)
    (= (slew phenomenon6 planet10) 15.98)
    (= (slew phenomenon6 planet11) 10.81)
    (= (slew phenomenon6 star0) 36.86)
    (= (slew phenomenon6 star2) 48.67)
    (= (slew phenomenon6 star3) 36.81)
    (= (slew phenomenon6 star4) 47.72)
    (= (slew phenomenon6 star9) 17.25)
    (= (slew phenomenon6 star14) 9.591)

    ; from phenomenon7
    (= (slew phenomenon7 phenomenon8) 0.5836)
    (= (slew phenomenon7 phenomenon12) 27.43)
    (= (slew phenomenon7 phenomenon13) 50.22)
    (= (slew phenomenon7 planet5) 67.51)
    (= (slew phenomenon7 planet10) 0.9005)
    (= (slew phenomenon7 planet11) 55.1)
    (= (slew phenomenon7 star0) 23.4)
    (= (slew phenomenon7 star2) 77.99)
    (= (slew phenomenon7 star3) 23.38)
    (= (slew phenomenon7 star4) 82.72)
    (= (slew phenomenon7 star9) 8.972)
    (= (slew phenomenon7 star14) 51.05)

    ; from phenomenon8
    (= (slew phenomenon8 phenomenon12) 46.02)
    (= (slew phenomenon8 phenomenon13) 21.34)
    (= (slew phenomenon8 planet5) 9.429)
    (= (slew phenomenon8 planet10) 22.54)
    (= (slew phenomenon8 planet11) 1.469)
    (= (slew phenomenon8 star0) 5.79)
    (= (slew phenomenon8 star2) 25.52)
    (= (slew phenomenon8 star3) 55.78)
    (= (slew phenomenon8 star4) 55.15)
    (= (slew phenomenon8 star9) 21.83)
    (= (slew phenomenon8 star14) 18.95)

    ; from phenomenon12
    (= (slew phenomenon12 phenomenon13) 4.346)
    (= (slew phenomenon12 planet5) 51.94)
    (= (slew phenomenon12 planet10) 8.949)
    (= (slew phenomenon12 planet11) 55.97)
    (= (slew phenomenon12 star0) 61.81)
    (= (slew phenomenon12 star2) 67.55)
    (= (slew phenomenon12 star3) 17.94)
    (= (slew phenomenon12 star4) 1.243)
    (= (slew phenomenon12 star9) 73.83)
    (= (slew phenomenon12 star14) 27.29)

    ; from phenomenon13
    (= (slew phenomenon13 planet5) 99.46)
    (= (slew phenomenon13 planet10) 18.9)
    (= (slew phenomenon13 planet11) 53.23)
    (= (slew phenomenon13 star0) 59.85)
    (= (slew phenomenon13 star2) 5.415)
    (= (slew phenomenon13 star3) 40.3)
    (= (slew phenomenon13 star4) 56.7)
    (= (slew phenomenon13 star9) 18.82)
    (= (slew phenomenon13 star14) 0.2689)

    ; from planet5
    (= (slew planet5 planet10) 1.259)
    (= (slew planet5 planet11) 2.536)
    (= (slew planet5 star0) 20.86)
    (= (slew planet5 star2) 47.19)
    (= (slew planet5 star3) 31.7)
    (= (slew planet5 star4) 72.71)
    (= (slew planet5 star9) 2.868)
    (= (slew planet5 star14) 74.82)

    ; from planet10
    (= (slew planet10 planet11) 60.37)
    (= (slew planet10 star0) 78.34)
    (= (slew planet10 star2) 1.69)
    (= (slew planet10 star3) 14.6)
    (= (slew planet10 star4) 79.32)
    (= (slew planet10 star9) 57.12)
    (= (slew planet10 star14) 68.7)

    ; from planet11
    (= (slew planet11 star0) 31.56)
    (= (slew planet11 star2) 73.92)
    (= (slew planet11 star3) 39.03)
    (= (slew planet11 star4) 17.07)
    (= (slew planet11 star9) 26.86)
    (= (slew planet11 star14) 4.1)

    ; from star0
    (= (slew star0 star2) 30.86)
    (= (slew star0 star3) 35.26)
    (= (slew star0 star4) 23.5)
    (= (slew star0 star9) 73.97)
    (= (slew star0 star14) 62.77)

    ; from star2
    (= (slew star2 star3) 84.2)
    (= (slew star2 star4) 33.63)
    (= (slew star2 star9) 64.9)
    (= (slew star2 star14) 79.59)

    ; from star3
    (= (slew star3 star4) 50.36)
    (= (slew star3 star9) 52.68)
    (= (slew star3 star14) 59.26)

    ; from star4
    (= (slew star4 star9) 4.125)
    (= (slew star4 star14) 20.26)

    ; from star9
    (= (slew star9 star14) 67.82)
  )

  (:goal (and
    ; image goals list (from the goal definition)
    (have-image planet5 image2)
    (have-image phenomenon6 image3)
    (have-image phenomenon7 infrared1)
    (have-image phenomenon8 image2)
    (have-image star9 image3)
    (have-image planet10 image4)
    (have-image planet11 spectrograph0)
    (have-image phenomenon12 image3)
    (have-image phenomenon13 spectrograph0)
    (have-image star14 image4)

    ; final pointing constraints
    (pointing satellite0 phenomenon7)
    (pointing satellite3 star9)
    (pointing satellite4 planet5)
  ))

  (:metric minimize (fuel-used))
)