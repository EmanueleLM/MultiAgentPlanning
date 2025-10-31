(define (problem schedule-single-30min-monday)
  (:domain meeting-scheduling)

  (:objects
    ;; Timeslots are 30-minute start times on Monday between 09:00 and 17:00 inclusive.
    ;; A 30-minute meeting may start at any of these times (last start at 16:30).
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - timeslot

    m1 - meeting
  )

  (:init
    ;; Participant availabilities on Monday (mapped from the provided constraint: meeting must be between 09:00 and 17:00).
    ;; These facts state each participant is free for every 30-minute start time in the allowed window.
    ;; (Treating the natural-language "between 09:00 and 17:00" as a strict availability window.)
    ;; Alice availability:
    (free alice t09_00) (free alice t09_30) (free alice t10_00) (free alice t10_30)
    (free alice t11_00) (free alice t11_30) (free alice t12_00) (free alice t12_30)
    (free alice t13_00) (free alice t13_30) (free alice t14_00) (free alice t14_30)
    (free alice t15_00) (free alice t15_30) (free alice t16_00) (free alice t16_30)

    ;; Bob availability:
    (free bob t09_00) (free bob t09_30) (free bob t10_00) (free bob t10_30)
    (free bob t11_00) (free bob t11_30) (free bob t12_00) (free bob t12_30)
    (free bob t13_00) (free bob t13_30) (free bob t14_00) (free bob t14_30)
    (free bob t15_00) (free bob t15_30) (free bob t16_00) (free bob t16_30)

    ;; Carol availability:
    (free carol t09_00) (free carol t09_30) (free carol t10_00) (free carol t10_30)
    (free carol t11_00) (free carol t11_30) (free carol t12_00) (free carol t12_30)
    (free carol t13_00) (free carol t13_30) (free carol t14_00) (free carol t14_30)
    (free carol t15_00) (free carol t15_30) (free carol t16_00) (free carol t16_30)
  )

  ;; Goal: schedule the single 30-minute meeting m1 at some allowed timeslot where all participants are free.
  ;; The domain action will set (scheduled m1) when it succeeds, so requiring (scheduled m1) is sufficient.
  (:goal (and (scheduled m1)))
)