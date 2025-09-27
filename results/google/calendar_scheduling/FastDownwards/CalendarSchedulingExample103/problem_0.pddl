(define (problem schedule-meeting-monday-09-17-30min)
  (:domain meeting-scheduling)
  (:objects
    diane jack eugene patricia - participant
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )
  (:init
    ;; meeting not yet scheduled
    (unscheduled)

    ;; identity facts for binding participants in the schedule action
    (is-diane diane) (is-jack jack) (is-eugene eugene) (is-patricia patricia)

    ;; Availability is expressed per participant per 30-minute slot on Monday between 09:00 and 17:00.
    ;; Slot mapping:
    ;; s0  = 09:00-09:30
    ;; s1  = 09:30-10:00
    ;; s2  = 10:00-10:30
    ;; s3  = 10:30-11:00
    ;; s4  = 11:00-11:30
    ;; s5  = 11:30-12:00
    ;; s6  = 12:00-12:30
    ;; s7  = 12:30-13:00
    ;; s8  = 13:00-13:30
    ;; s9  = 13:30-14:00
    ;; s10 = 14:00-14:30
    ;; s11 = 14:30-15:00
    ;; s12 = 15:00-15:30
    ;; s13 = 15:30-16:00
    ;; s14 = 16:00-16:30
    ;; s15 = 16:30-17:00

    ;; Diane: blocked 09:30-10:00 (s1) and 14:30-15:00 (s11)
    (available diane s0) (available diane s2) (available diane s3) (available diane s4)
    (available diane s5) (available diane s6) (available diane s7) (available diane s8)
    (available diane s9) (available diane s10) (available diane s12) (available diane s13)
    (available diane s14) (available diane s15)

    ;; Jack: blocked 13:30-14:00 (s9) and 14:30-15:00 (s11)
    (available jack s0) (available jack s1) (available jack s2) (available jack s3)
    (available jack s4) (available jack s5) (available jack s6) (available jack s7)
    (available jack s8) (available jack s10) (available jack s12) (available jack s13)
    (available jack s14) (available jack s15)

    ;; Eugene: blocked 09:00-10:00 (s0,s1), 10:30-11:30 (s3,s4), 12:00-14:30 (s6,s7,s8,s9,s10), 15:00-16:30 (s12,s13,s14)
    ;; Available slots: s2, s5, s11, s15
    (available eugene s2) (available eugene s5) (available eugene s11) (available eugene s15)

    ;; Patricia: blocked 09:30-10:30 (s1,s2), 11:00-12:00 (s4,s5), 12:30-14:00 (s7,s8,s9), 15:00-16:30 (s12,s13,s14)
    ;; Available slots: s0, s3, s6, s10, s11, s15
    (available patricia s0) (available patricia s3) (available patricia s6)
    (available patricia s10) (available patricia s11) (available patricia s15)
  )

  ;; The earliest feasible slot common to all participants (respecting all hard unavailability constraints)
  ;; is s15 (16:30-17:00). Require scheduling at this slot.
  (:goal (scheduled s15))
)