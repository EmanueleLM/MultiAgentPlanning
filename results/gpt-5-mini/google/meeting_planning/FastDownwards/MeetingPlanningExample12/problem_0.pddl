(define (problem meet-barbara)
  (:domain schedule-meetings)
  (:objects
    ; timepoints in 30-minute increments from 09:00 through 21:30
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30 t13_00 t13_30
    t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 t17_00 t17_30 t18_00 t18_30
    t19_00 t19_30 t20_00 t20_30 t21_00 t21_30 - timepoint

    north_beach barbara_place - location

    organizer barbara - person
  )

  (:init
    ; time succession (30-minute increments)
    (next t09_00 t09_30) (next t09_30 t10_00) (next t10_00 t10_30) (next t10_30 t11_00)
    (next t11_00 t11_30) (next t11_30 t12_00) (next t12_00 t12_30) (next t12_30 t13_00)
    (next t13_00 t13_30) (next t13_30 t14_00) (next t14_00 t14_30) (next t14_30 t15_00)
    (next t15_00 t15_30) (next t15_30 t16_00) (next t16_00 t16_30) (next t16_30 t17_00)
    (next t17_00 t17_30) (next t17_30 t18_00) (next t18_00 t18_30) (next t18_30 t19_00)
    (next t19_00 t19_30) (next t19_30 t20_00) (next t20_00 t20_30) (next t20_30 t21_00)
    (next t21_00 t21_30)

    ; Allowed travel intervals: one 30-minute step between adjacent timepoints (travel requires advancing time).
    (allowed-travel-interval t09_00 t09_30) (allowed-travel-interval t09_30 t10_00)
    (allowed-travel-interval t10_00 t10_30) (allowed-travel-interval t10_30 t11_00)
    (allowed-travel-interval t11_00 t11_30) (allowed-travel-interval t11_30 t12_00)
    (allowed-travel-interval t12_00 t12_30) (allowed-travel-interval t12_30 t13_00)
    (allowed-travel-interval t13_00 t13_30) (allowed-travel-interval t13_30 t14_00)
    (allowed-travel-interval t14_00 t14_30) (allowed-travel-interval t14_30 t15_00)
    (allowed-travel-interval t15_00 t15_30) (allowed-travel-interval t15_30 t16_00)
    (allowed-travel-interval t16_00 t16_30) (allowed-travel-interval t16_30 t17_00)
    (allowed-travel-interval t17_00 t17_30) (allowed-travel-interval t17_30 t18_00)
    (allowed-travel-interval t18_00 t18_30) (allowed-travel-interval t18_30 t19_00)
    (allowed-travel-interval t19_00 t19_30) (allowed-travel-interval t19_30 t20_00)
    (allowed-travel-interval t20_00 t20_30) (allowed-travel-interval t20_30 t21_00)
    (allowed-travel-interval t21_00 t21_30)

    ; Allowed meeting intervals for Barbara: minimum 90 minutes (3 * 30min slots).
    ; Meeting start must be within Barbara's availability window (18:00-21:30) and end must not exceed 21:30.
    (allowed-meeting-interval t18_00 t19_30)
    (allowed-meeting-interval t18_30 t20_00)
    (allowed-meeting-interval t19_00 t20_30)
    (allowed-meeting-interval t19_30 t21_00)
    (allowed-meeting-interval t20_00 t21_30)

    ; Availability: Barbara is present at barbara_place throughout her availability window (every 30-minute timepoint from 18:00 to 21:30).
    (at barbara barbara_place t18_00) (at barbara barbara_place t18_30)
    (at barbara barbara_place t19_00) (at barbara barbara_place t19_30)
    (at barbara barbara_place t20_00) (at barbara barbara_place t20_30)
    (at barbara barbara_place t21_00) (at barbara barbara_place t21_30)

    ; Starting conditions: organizer is at North Beach at 09:00.
    (at organizer north_beach t09_00)

    ; Start time is 09:00
    (current-time t09_00)
  )

  ; Goal: meet Barbara (this encodes the principal optimization: maximize friends met; with only Barbara enumerated, goal requires meeting her).
  (:goal (and
    (met barbara)
  ))
)