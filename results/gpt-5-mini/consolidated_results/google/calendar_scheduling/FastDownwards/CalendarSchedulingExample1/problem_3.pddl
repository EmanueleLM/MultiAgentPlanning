(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:objects
    slot-09_30-10_00 slot-11_00-11_30 slot-13_30-14_00 slot-14_30-15_00 slot-15_30-16_00 - slot

    t09_30 t10_00 t11_00 t11_30 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 - time
  )

  (:init
    ;; Slot time annotations (explicit start/end times).
    (starts slot-09_30-10_00 t09_30)
    (ends   slot-09_30-10_00 t10_00)

    (starts slot-11_00-11_30 t11_00)
    (ends   slot-11_00-11_30 t11_30)

    (starts slot-13_30-14_00 t13_30)
    (ends   slot-13_30-14_00 t14_00)

    (starts slot-14_30-15_00 t14_30)
    (ends   slot-14_30-15_00 t15_00)

    (starts slot-15_30-16_00 t15_30)
    (ends   slot-15_30-16_00 t16_00)

    ;; All candidate slots are within the Monday 09:00-17:00 work hours.
    (within_workhours slot-09_30-10_00)
    (within_workhours slot-11_00-11_30)
    (within_workhours slot-13_30-14_00)
    (within_workhours slot-14_30-15_00)
    (within_workhours slot-15_30-16_00)

    ;; Intersection free 30-minute slots (available).
    ;; ; human-readable: 09:30-10:00
    (available slot-09_30-10_00)
    ;; ; human-readable: 11:00-11:30
    (available slot-11_00-11_30)
    ;; ; human-readable: 13:30-14:00
    (available slot-13_30-14_00)
    ;; ; human-readable: 14:30-15:00
    (available slot-14_30-15_00)
    ;; ; human-readable: 15:30-16:00
    (available slot-15_30-16_00)

    ;; Mark the earliest preference-compliant slot for Billy (ends at or before 15:00).
    (earliest_preferred slot-09_30-10_00)
  )

  ;; Require that some slot has been chosen and that the earliest preference-compliant
  ;; slot is selected. This enforces selecting the earliest preference-compliant slot.
  (:goal (and (chosen_done) (earliest_preferred_chosen)))
)