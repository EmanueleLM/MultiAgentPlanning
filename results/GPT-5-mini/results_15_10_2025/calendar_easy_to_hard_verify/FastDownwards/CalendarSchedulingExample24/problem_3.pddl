(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    s09_00_09_30 s09_30_10_00 s10_00_10_30 s10_30_11_00
    s11_00_11_30 s11_30_12_00 s12_00_12_30 s12_30_13_00
    s13_00_13_30 s13_30_14_00 s14_00_14_30 s14_30_15_00
    s15_00_15_30 s15_30_16_00 s16_00_16_30 s16_30_17_00 - slot
    benjamin juan heather nathan jacob - participant
  )

  (:init
    (= (total-cost) 0)
    (free benjamin s09_00_09_30)
    (free benjamin s09_30_10_00)
    (free benjamin s10_30_11_00)
    (free benjamin s11_00_11_30)
    (free benjamin s12_00_12_30)
    (free benjamin s13_00_13_30)
    (free benjamin s14_00_14_30)
    (free benjamin s14_30_15_00)
    (free benjamin s15_30_16_00)
    (free benjamin s16_30_17_00)

    (free juan s09_00_09_30)
    (free juan s09_30_10_00)
    (free juan s10_30_11_00)
    (free juan s11_30_12_00)
    (free juan s12_30_13_00)
    (free juan s13_00_13_30)
    (free juan s13_30_14_00)
    (free juan s14_00_14_30)
    (free juan s16_00_16_30)
    (free juan s16_30_17_00)

    (free heather s09_30_10_00)
    (free heather s10_30_11_00)
    (free heather s11_00_11_30)
    (free heather s11_30_12_00)
    (free heather s12_00_12_30)
    (free heather s13_00_13_30)
    (free heather s13_30_14_00)
    (free heather s14_30_15_00)
    (free heather s15_00_15_30)
    (free heather s15_30_16_00)
    (free heather s16_00_16_30)
    (free heather s16_30_17_00)

    (free nathan s11_00_11_30)
    (free nathan s12_30_13_00)
    (free nathan s13_00_13_30)
    (free nathan s13_30_14_00)
    (free nathan s14_30_15_00)
    (free nathan s16_00_16_30)

    (free jacob s09_30_10_00)
    (free jacob s10_30_11_00)
    (free jacob s12_30_13_00)
    (free jacob s13_00_13_30)
    (free jacob s15_00_15_30)
  )

  (:goal (scheduled s13_00_13_30))
  (:metric minimize (total-cost))
)