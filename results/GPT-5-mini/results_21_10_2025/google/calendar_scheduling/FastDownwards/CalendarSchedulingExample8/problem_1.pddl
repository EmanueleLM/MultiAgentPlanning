(define (problem schedule-single-30min-monday)
  (:domain calendar-scheduling)

  (:objects
    ;; 30-minute start times between 09:00 and 17:00 (last start 16:30)
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - timeslot

    m1 - meeting
  )

  (:init
    ;; Adam's free 30-minute start times (adam busy: 10:00-10:30, 12:30-13:00, 13:30-14:30)
    (free adam t09_00) (free adam t09_30) (free adam t10_30)
    (free adam t11_00) (free adam t11_30) (free adam t12_00)
    (free adam t13_00)
    (free adam t14_30) (free adam t15_00) (free adam t15_30)
    (free adam t16_00) (free adam t16_30)

    ;; Jerry's free 30-minute start times (jerry busy: 09:00-09:30, 12:00-12:30, 15:00-16:00)
    (free jerry t09_30) (free jerry t10_00) (free jerry t10_30)
    (free jerry t11_00) (free jerry t11_30) (free jerry t12_30)
    (free jerry t13_00) (free jerry t13_30) (free jerry t14_00)
    (free jerry t14_30) (free jerry t16_00) (free jerry t16_30)

    ;; Matthew's free 30-minute start times (matthew busy: 09:30-11:00, 11:30-12:30, 13:00-14:00, 14:30-17:00)
    (free matthew t09_00) (free matthew t11_00) (free matthew t12_30)
    (free matthew t14_00)
  )

  ;; Goal: have the single meeting scheduled at some timeslot where all participants are free.
  ;; The planner will only succeed if it can apply (schedule m1 ?t) for a timeslot where
  ;; all three participants are free.
  (:goal (and (scheduled m1)))
)