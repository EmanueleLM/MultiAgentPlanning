(define (problem schedule_meeting_problem)
  (:domain calendar_scheduling_example3)
  (:objects
    arthur michael samantha - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - time_point
  )
  (:init
    ; Time progression (30-minute intervals)
    (next_time t0900 t0930)
    (next_time t0930 t1000)
    (next_time t1000 t1030)
    (next_time t1030 t1100)
    (next_time t1100 t1130)
    (next_time t1130 t1200)
    (next_time t1200 t1230)
    (next_time t1230 t1300)
    (next_time t1300 t1330)
    (next_time t1330 t1400)
    (next_time t1400 t1430)
    (next_time t1430 t1500)
    (next_time t1500 t1530)
    (next_time t1530 t1600)
    (next_time t1600 t1630)
    (next_time t1630 t1700) ; This link is needed to define t1630 as a starting point. The 'valid_meeting_interval' predicate will constrain its usage as a 't_mid'.

    ; Valid time intervals for meeting segments (within 9:00-17:00 boundary)
    ; A 1-hour meeting ending by 17:00 means the latest second 30-min segment starts at 16:30 (t1630).
    ; Thus, t0900 through t1630 are valid start/mid points. t1700 is not a valid mid-point.
    (valid_meeting_interval t0900)
    (valid_meeting_interval t0930)
    (valid_meeting_interval t1000)
    (valid_meeting_interval t1030)
    (valid_meeting_interval t1100)
    (valid_meeting_interval t1130)
    (valid_meeting_interval t1200)
    (valid_meeting_interval t1230)
    (valid_meeting_interval t1300)
    (valid_meeting_interval t1330)
    (valid_meeting_interval t1400)
    (valid_meeting_interval t1430)
    (valid_meeting_interval t1500)
    (valid_meeting_interval t1530)
    (valid_meeting_interval t1600)
    (valid_meeting_interval t1630) ; Latest valid start for a 30-min segment within 9:00-17:00

    ; Arthur's busy schedule (Monday) - each is_busy_at covers a 30-min slot
    (is_busy_at arthur t0900) ; 9:00 to 9:30
    (is_busy_at arthur t1030) ; 10:30 to 11:00
    (is_busy_at arthur t1100) ; 11:00 to 11:30
    (is_busy_at arthur t1130) ; 11:30 to 12:00
    (is_busy_at arthur t1600) ; 16:00 to 16:30
    (is_busy_at arthur t1630) ; 16:30 to 17:00

    ; Michael's busy schedule (Monday)
    (is_busy_at michael t1300) ; 13:00 to 13:30
    (is_busy_at michael t1400) ; 14:00 to 14:30

    ; Samantha's busy schedule (Monday)
    (is_busy_at samantha t1030) ; 10:30 to 11:00
    (is_busy_at samantha t1200) ; 12:00 to 12:30
    (is_busy_at samantha t1230) ; 12:30 to 13:00
    (is_busy_at samantha t1300) ; 13:00 to 13:30
    (is_busy_at samantha t1330) ; 13:30 to 14:00
    (is_busy_at samantha t1400) ; 14:00 to 14:30
    (is_busy_at samantha t1430) ; 14:30 to 15:00
    (is_busy_at samantha t1530) ; 15:30 to 16:00
    (is_busy_at samantha t1600) ; 16:00 to 16:30
    (is_busy_at samantha t1630) ; 16:30 to 17:00
  )
  (:goal (exists (?t - time_point) (meeting_scheduled ?t)))
)