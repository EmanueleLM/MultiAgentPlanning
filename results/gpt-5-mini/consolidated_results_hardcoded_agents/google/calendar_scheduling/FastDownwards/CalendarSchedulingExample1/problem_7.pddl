(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)

  (:objects
    slot-09_30-10_00 slot-11_00-11_30 slot-13_30-14_00 slot-14_30-15_00 slot-15_30-16_00 - slot

    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30 t13_00 t13_30
    t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 t17_00 - time
  )

  (:init
    ;; Explicit temporal ordering (contiguous half-hour units).
    (next t09_00 t09_30) (next t09_30 t10_00) (next t10_00 t10_30)
    (next t10_30 t11_00) (next t11_00 t11_30) (next t11_30 t12_00)
    (next t12_00 t12_30) (next t12_30 t13_00) (next t13_00 t13_30)
    (next t13_30 t14_00) (next t14_00 t14_30) (next t14_30 t15_00)
    (next t15_00 t15_30) (next t15_30 t16_00) (next t16_00 t16_30)
    (next t16_30 t17_00)

    ;; Slot start and end times (each slot is exactly one contiguous half-hour unit).
    (slot_start slot-09_30-10_00 t09_30) (slot_end slot-09_30-10_00 t10_00)
    (slot_start slot-11_00-11_30 t11_00) (slot_end slot-11_00-11_30 t11_30)
    (slot_start slot-13_30-14_00 t13_30) (slot_end slot-13_30-14_00 t14_00)
    (slot_start slot-14_30-15_00 t14_30) (slot_end slot-14_30-15_00 t15_00)
    (slot_start slot-15_30-16_00 t15_30) (slot_end slot-15_30-16_00 t16_00)

    ;; All candidate slots lie within the Monday 09:00-17:00 work window.
    (within_workhours slot-09_30-10_00)
    (within_workhours slot-11_00-11_30)
    (within_workhours slot-13_30-14_00)
    (within_workhours slot-14_30-15_00)
    (within_workhours slot-15_30-16_00)

    ;; These slots were audited as mutually-free for all participants.
    (available slot-09_30-10_00)
    (available slot-11_00-11_30)
    (available slot-13_30-14_00)
    (available slot-14_30-15_00)
    (available slot-15_30-16_00)

    ;; Mark the earliest slot that satisfies Billy's preference (ends at or before 15:00).
    (earliest_preferred slot-09_30-10_00)

    ;; Allow exactly one selection to occur.
    (selection_open)
  )

  ;; Require that the earliest preference-compliant slot is chosen.
  (:goal (and
    (chosen slot-09_30-10_00)
  ))
)