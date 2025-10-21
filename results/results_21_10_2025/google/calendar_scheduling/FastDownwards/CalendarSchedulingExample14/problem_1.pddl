(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    ; 30-minute slots between 09:00 and 17:00 (inclusive)
    s_09_00_09_30
    s_09_30_10_00
    s_10_00_10_30
    s_10_30_11_00
    s_11_00_11_30
    s_11_30_12_00
    s_12_00_12_30
    s_12_30_13_00
    s_13_00_13_30
    s_13_30_14_00
    s_14_00_14_30
    s_14_30_15_00
    s_15_00_15_30
    s_15_30_16_00
    s_16_00_16_30
    s_16_30_17_00
    - slot
  )

  (:init
    ;; Brandon's availability (respects his hard busy times and his stated preference to avoid meetings before 14:30)
    ;; Allowed for Brandon: 14:30-15:00, 15:00-15:30, 16:00-16:30
    (available brandon s_14_30_15_00)
    (available brandon s_15_00_15_30)
    (available brandon s_16_00_16_30)

    ;; Jerry has no meetings all day: available on every 30-minute slot
    (available jerry s_09_00_09_30)
    (available jerry s_09_30_10_00)
    (available jerry s_10_00_10_30)
    (available jerry s_10_30_11_00)
    (available jerry s_11_00_11_30)
    (available jerry s_11_30_12_00)
    (available jerry s_12_00_12_30)
    (available jerry s_12_30_13_00)
    (available jerry s_13_00_13_30)
    (available jerry s_13_30_14_00)
    (available jerry s_14_00_14_30)
    (available jerry s_14_30_15_00)
    (available jerry s_15_00_15_30)
    (available jerry s_15_30_16_00)
    (available jerry s_16_00_16_30)
    (available jerry s_16_30_17_00)

    ;; Bradley's availability given his busy slots:
    ;; Busy 09:00-11:30 -> unavailable s_09_00_09_30 .. s_11_00_11_30
    ;; Busy 12:00-15:00 -> unavailable s_12_00_12_30 .. s_14_00_14_30
    ;; Busy 16:00-16:30 -> unavailable s_16_00_16_30
    ;; Therefore available: 11:30-12:00, 15:00-15:30, 15:30-16:00, 16:30-17:00
    (available bradley s_11_30_12_00)
    (available bradley s_15_00_15_30)
    (available bradley s_15_30_16_00)
    (available bradley s_16_30_17_00)
  )

  ;; Goal: choose a valid meeting time (one slot) that satisfies all participants' availabilities.
  (:goal (meeting-scheduled))
)