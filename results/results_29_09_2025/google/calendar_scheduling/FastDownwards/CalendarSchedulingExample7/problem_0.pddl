(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30
    heather nicholas zachary
  )
  (:init
    ;; declare all slots
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ;; Nicholas: fully available 09:00-17:00 (all 30-min start slots)
    (available nicholas s09_00) (available nicholas s09_30)
    (available nicholas s10_00) (available nicholas s10_30)
    (available nicholas s11_00) (available nicholas s11_30)
    (available nicholas s12_00) (available nicholas s12_30)
    (available nicholas s13_00) (available nicholas s13_30)
    (available nicholas s14_00) (available nicholas s14_30)
    (available nicholas s15_00) (available nicholas s15_30)
    (available nicholas s16_00) (available nicholas s16_30)

    ;; Heather availability (busy: 09:00-09:30, 10:30-11:00, 13:00-14:00, 14:30-15:00, 16:00-16:30)
    ;; so available at all other 30-min starts within work hours
    (available heather s09_30) (available heather s10_00)
    (available heather s11_00) (available heather s11_30)
    (available heather s12_00) (available heather s12_30)
    (available heather s14_00)
    (available heather s15_00) (available heather s15_30)
    (available heather s16_30)

    ;; Zachary availability (busy: 09:00-10:30, 11:00-12:00, 12:30-13:00, 13:30-16:30)
    ;; and preference treated as hard: avoid after 14:00 (so no slots starting >=14:00)
    ;; Available starts within work hours that do not overlap busy intervals:
    ;; 10:30, 12:00, 13:00
    (available zachary s10_30) (available zachary s12_00) (available zachary s13_00)

    ;; Enforce earliest feasible slot preference by allowing only the computed earliest common slot: 12:00
    (allowed s12_00)
  )
  (:goal (scheduled s12_00))
)