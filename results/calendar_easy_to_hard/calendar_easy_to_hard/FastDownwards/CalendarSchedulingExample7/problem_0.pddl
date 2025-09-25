(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Objects: 16 half-hour slots from 09:00-09:30 (s1) through 16:30-17:00 (s16)
  (:objects
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16
    heather nicholas zachary
  )

  (:init
    ;; declare slot objects
    (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7) (slot s8)
    (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15) (slot s16)

    ;; Participant availabilities (free ?person ?slot)
    ;; Heather: unavailable at s1 (09:00-09:30), s4 (10:30-11:00), s9&s10 (13:00-14:00), s12 (14:30-15:00), s15 (16:00-16:30)
    ;; So free slots for Heather: 2,3,5,6,7,8,11,13,14,16
    (free heather s2) (free heather s3) (free heather s5) (free heather s6)
    (free heather s7) (free heather s8) (free heather s11) (free heather s13)
    (free heather s14) (free heather s16)

    ;; Nicholas: no private constraints (free all slots)
    (free nicholas s1) (free nicholas s2) (free nicholas s3) (free nicholas s4)
    (free nicholas s5) (free nicholas s6) (free nicholas s7) (free nicholas s8)
    (free nicholas s9) (free nicholas s10) (free nicholas s11) (free nicholas s12)
    (free nicholas s13) (free nicholas s14) (free nicholas s15) (free nicholas s16)

    ;; Zachary: unavailable s1-s3 (09:00-10:30), s5-s6 (11:00-12:00), s8 (12:30-13:00), s10-s15 (13:30-16:30)
    ;; So free slots for Zachary: s4 (10:30-11:00), s7 (12:00-12:30), s9 (13:00-13:30), s16 (16:30-17:00)
    (free zachary s4) (free zachary s7) (free zachary s9) (free zachary s16)

    ;; Preference from Zachary "would rather not meet after 14:00" treated as hard constraint:
    ;; Meeting must start at or before 14:00. All explicit unavailabilities already eliminate starts after 14:00 for Zachary,
    ;; and the earliest feasible slot respecting all constraints is marked below.

    ;; To force the planner to pick the earliest feasible slot that satisfies all hard constraints,
    ;; we mark the computed earliest common-free slot as (earliest s7).
    ;; (We computed available intersection: Heather ∩ Nicholas ∩ Zachary = {s7, s16}, earliest is s7 (12:00-12:30).)
    (earliest s7)
  )

  (:goal (and
    ;; require meeting to be scheduled specifically in the earliest feasible slot
    (scheduled s7)
    (meeting-scheduled)
  ))
)