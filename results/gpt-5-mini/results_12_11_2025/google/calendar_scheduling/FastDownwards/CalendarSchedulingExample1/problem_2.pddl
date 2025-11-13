(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:objects
    slot-09_30-10_00 slot-11_00-11_30 slot-13_30-14_00 slot-14_30-15_00 slot-15_30-16_00 - slot
  )

  (:init
    ;; Intersection free 30-minute slots (normalized HH:MM-HH:MM)
    (available slot-09_30-10_00)   ; 09:30-10:00
    (available slot-11_00-11_30)   ; 11:00-11:30
    (available slot-13_30-14_00)   ; 13:30-14:00
    (available slot-14_30-15_00)   ; 14:30-15:00
    (available slot-15_30-16_00)   ; 15:30-16:00

    ;; Mark the earliest preference-compliant slot for Billy (ends at or before 15:00).
    (earliest_preferred slot-09_30-10_00)
  )

  ;; Require that a slot is chosen and that the earliest preference-compliant slot
  ;; has been selected. This enforces selecting the earliest preference-compliant slot.
  (:goal (and (chosen_done) (earliest_preferred_chosen)))
)