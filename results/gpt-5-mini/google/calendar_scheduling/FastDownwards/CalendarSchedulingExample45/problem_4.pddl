(define (problem schedule_meeting_monday)
  (:domain jack_of_all_trades_scheduling)
  (:objects
    andrew grace samuel - participant
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - time_slot
  )
  (:init
    ;; ordering of adjacent half-hour slots
    (next_slot s0 s1)
    (next_slot s1 s2)
    (next_slot s2 s3)
    (next_slot s3 s4)
    (next_slot s4 s5)
    (next_slot s5 s6)
    (next_slot s6 s7)
    (next_slot s7 s8)
    (next_slot s8 s9)
    (next_slot s9 s10)
    (next_slot s10 s11)
    (next_slot s11 s12)
    (next_slot s12 s13)
    (next_slot s13 s14)
    (next_slot s14 s15)

    ;; meeting initially unscheduled
    (meeting_not_scheduled)

    ;; Andrew: wide open entire day -> free in all slots
    (free andrew s0) (free andrew s1) (free andrew s2) (free andrew s3)
    (free andrew s4) (free andrew s5) (free andrew s6) (free andrew s7)
    (free andrew s8) (free andrew s9) (free andrew s10) (free andrew s11)
    (free andrew s12) (free andrew s13) (free andrew s14) (free andrew s15)

    ;; Grace: no meetings whole day -> free in all slots
    (free grace s0) (free grace s1) (free grace s2) (free grace s3)
    (free grace s4) (free grace s5) (free grace s6) (free grace s7)
    (free grace s8) (free grace s9) (free grace s10) (free grace s11)
    (free grace s12) (free grace s13) (free grace s14) (free grace s15)

    ;; Samuel: blocked slots removed; free only where specified
    ;; Samuel blocked: s0,s1,s2 (09:00-10:30), s5 (11:30-12:00), s8 (13:00-13:30),
    ;; s10,s11,s12,s13 (14:00-16:00), s15 (16:30-17:00)
    ;; Therefore free at: s3, s4, s6, s7, s9, s14
    (free samuel s3)
    (free samuel s4)
    (free samuel s6)
    (free samuel s7)
    (free samuel s9)
    (free samuel s14)
  )

  (:goal (meeting_scheduled_at s3))
)