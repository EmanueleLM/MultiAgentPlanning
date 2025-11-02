(define (problem schedule-30min-monday)
  (:domain multiagent-meeting)
  (:objects
    brandon jerry bradley - person
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )
  ;; Time slot mapping (informational):
  ;; s0=09:00-09:30, s1=09:30-10:00, s2=10:00-10:30, s3=10:30-11:00,
  ;; s4=11:00-11:30, s5=11:30-12:00, s6=12:00-12:30, s7=12:30-13:00,
  ;; s8=13:00-13:30, s9=13:30-14:00, s10=14:00-14:30, s11=14:30-15:00,
  ;; s12=15:00-15:30, s13=15:30-16:00, s14=16:00-16:30, s15=16:30-17:00

  (:init
    ;; total-cost starts at 0
    (= (total-cost) 0)

    ;; Define which slots are considered "before 14:30" (preference for Brandon).
    ;; before-1430 true for s0..s10 (09:00 up to 14:00-14:30 slot is s10)
    (before-1430 s0) (before-1430 s1) (before-1430 s2) (before-1430 s3)
    (before-1430 s4) (before-1430 s5) (before-1430 s6) (before-1430 s7)
    (before-1430 s8) (before-1430 s9) (before-1430 s10)

    ;; Availability facts:
    ;; Brandon: busy 13:00-14:00 (s8,s9), 15:30-16:00 (s13), 16:30-17:00 (s15)
    ;; So Brandon is free at all other slots s0..s15 except s8,s9,s13,s15
    (free brandon s0) (free brandon s1) (free brandon s2) (free brandon s3)
    (free brandon s4) (free brandon s5) (free brandon s6) (free brandon s7)
    ;; s8 and s9 busy -> omitted
    (free brandon s10) (free brandon s11) (free brandon s12)
    ;; s13 busy -> omitted
    (free brandon s14)
    ;; s15 busy -> omitted

    ;; Jerry: no meetings on Monday -> free all slots
    (free jerry s0) (free jerry s1) (free jerry s2) (free jerry s3)
    (free jerry s4) (free jerry s5) (free jerry s6) (free jerry s7)
    (free jerry s8) (free jerry s9) (free jerry s10) (free jerry s11)
    (free jerry s12) (free jerry s13) (free jerry s14) (free jerry s15)

    ;; Bradley: busy 09:00-11:30 (s0..s5), 12:00-15:00 (s6..s11), 16:00-16:30 (s14)
    ;; So Bradley free at s12 (15:00-15:30), s13 (15:30-16:00), s15 (16:30-17:00)
    (free bradley s12) (free bradley s13) (free bradley s15)
  )

  ;; Goal: schedule a single 30-minute meeting (one slot) between 09:00 and 17:00
  ;; that all participants attend. We minimize total-cost to respect Brandon's preference.
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)