(define (problem schedule-meeting)
  (:domain meeting-scheduling)

  (:objects
    raymond billy donald - person
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  ;; Slots:
  ;; s1  = 09:00-09:30
  ;; s2  = 09:30-10:00
  ;; s3  = 10:00-10:30
  ;; s4  = 10:30-11:00
  ;; s5  = 11:00-11:30
  ;; s6  = 11:30-12:00
  ;; s7  = 12:00-12:30
  ;; s8  = 12:30-13:00
  ;; s9  = 13:00-13:30
  ;; s10 = 13:30-14:00
  ;; s11 = 14:00-14:30
  ;; s12 = 14:30-15:00
  ;; s13 = 15:00-15:30
  ;; s14 = 15:30-16:00
  ;; s15 = 16:00-16:30
  ;; s16 = 16:30-17:00

  (:init
    ;; Interpret every busy/blocked interval as unavailable by omission.
    ;; Raymond busy: s1, s6, s9, s13  (those slots are NOT listed as available for raymond)
    ;; Billy busy:   s3, s7, s8, s16  (and preference -> hard constraint: avoid after 15:00 => disallow s13..s16)
    ;; Donald busy:  s1, s3, s4, s7, s8, s11, s15, s16

    ;; s1 = 09:00-09:30
    (available billy s1)

    ;; s2 = 09:30-10:00  <-- earliest feasible slot where all three are available
    (available raymond s2)
    (available billy s2)
    (available donald s2)

    ;; s3 = 10:00-10:30
    (available raymond s3)

    ;; s4 = 10:30-11:00
    (available raymond s4)
    (available billy s4)

    ;; s5 = 11:00-11:30
    (available raymond s5)
    (available billy s5)
    (available donald s5)

    ;; s6 = 11:30-12:00
    (available billy s6)
    (available donald s6)

    ;; s7 = 12:00-12:30
    (available raymond s7)

    ;; s8 = 12:30-13:00
    (available raymond s8)

    ;; s9 = 13:00-13:30
    (available billy s9)
    (available donald s9)

    ;; s10 = 13:30-14:00
    (available raymond s10)
    (available billy s10)
    (available donald s10)

    ;; s11 = 14:00-14:30
    (available raymond s11)
    (available billy s11)

    ;; s12 = 14:30-15:00
    (available raymond s12)
    (available billy s12)
    (available donald s12)

    ;; s13 = 15:00-15:30  (Raymond busy; Billy forbids after 15:00 -> not available; Donald available)
    (available donald s13)

    ;; s14 = 15:30-16:00  (Billy forbids after 15:00 -> not available)
    (available raymond s14)
    (available donald s14)

    ;; s15 = 16:00-16:30  (Donald busy; Billy forbids after 15:00)
    (available raymond s15)

    ;; s16 = 16:30-17:00  (Billy busy; Donald busy; Billy forbids after 15:00)
    (available raymond s16)
  )

  ;; Goal: schedule the meeting at the earliest feasible slot found (s2 = 09:30-10:00)
  (:goal (scheduled s2))
)