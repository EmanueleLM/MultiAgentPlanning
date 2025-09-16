(define (problem composite-meeting-problem)
    (:domain composite-meeting-scheduling)

    (:objects
      diana - person
      ethan partner1 partner2 - person
      s09_00 s09_30 s10_00 s10_30 s11_00 s12_00 s12_30 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
      slot_10_00_10_30 slot_10_30_11_00 slot_11_00_11_30 slot_11_30_12_00 - slot
    )

    (:init
      ;; Diana's availability
      (available diana s09_00)
      (available diana s09_30)
      (available diana s10_00)
      (available diana s10_30)
      (available diana s11_00)
      (available diana s12_00)
      (available diana s12_30)
      (available diana s13_30)
      (available diana s14_00)
      (available diana s14_30)
      (available diana s15_00)
      (available diana s15_30)
      (available diana s16_00)
      (available diana s16_30)

      ;; Ethan's availability
      (available ethan s09_00)
      (available ethan s09_30)
      (available ethan s10_00)
      (available ethan s10_30)
      (available ethan s11_00)
      (available ethan s12_00)
      (available ethan s12_30)
      (available ethan s13_30)
      (available ethan s14_00)
      (available ethan s14_30)
      (available ethan s15_00)
      (available ethan s15_30)
      (available ethan s16_00)
      (available ethan s16_30)

      ;; Partner 1 availability
      (available partner1 s10_00)
      (available partner1 s10_30)
      (available partner1 s14_00)
      (available partner1 s14_30)

      ;; Partner 2 availability
      (available partner2 s11_00)
      (available partner2 s11_30)
      (available partner2 s14_30)

      ;; Janet's constraints
      (janet-free slot_10_00_10_30)
      (janet-free slot_10_30_11_00)
      (janet-free slot_11_00_11_30)
      (janet-free slot_11_30_12_00)
    )

    (:goal (janet-scheduled))
)