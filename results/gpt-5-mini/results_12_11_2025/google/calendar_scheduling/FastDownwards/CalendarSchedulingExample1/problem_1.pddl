(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:objects
    ;; Objects are named to map directly to human-readable time ranges (HH:MM-HH:MM).
    slot-09_30-10_00 slot-11_00-11_30 slot-13_30-14_00 slot-14_30-15_00 slot-15_30-16_00 - slot
  )
  (:init
    ;; Available intersection slots (all exactly 30 minutes, within 09:00-17:00 Monday).
    (available slot-09_30-10_00)   ; 09:30-10:00
    (available slot-11_00-11_30)   ; 11:00-11:30
    (available slot-13_30-14_00)   ; 13:30-14:00
    (available slot-14_30-15_00)   ; 14:30-15:00
    (available slot-15_30-16_00)   ; 15:30-16:00

    ;; Mark earliest preference-compliant slot for Billy (ends at or before 15:00).
    (earliest_preferred slot-09_30-10_00)

    ;; Initialize total-cost to zero.
    (= (total-cost) 0)
  )

  ;; Goal: some slot has been chosen. We encode this via the auxiliary predicate chosen-satisfied
  ;; which the single choose_slot action always adds when it chooses any available slot.
  (:goal (chosen-satisfied))

  ;; Prefer plans with lower total-cost if the planner supports optimization.
  (:metric minimize (total-cost))
)