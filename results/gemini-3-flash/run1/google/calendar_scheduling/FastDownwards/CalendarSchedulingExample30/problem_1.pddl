(define (problem schedule_meeting_30)
  (:domain calendar_scheduling)
  (:objects
    jeffrey virginia melissa - person
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230 t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - timeslot
  )
  (:init
    ;; Jeffrey is busy: 9:30-10:00 (t_0930), 10:30-11:00 (t_1030).
    ;; Jeffrey is free at all other slots from 9:00 to 17:00.
    (is_available jeffrey t_0900)
    (is_available jeffrey t_1000)
    (is_available jeffrey t_1100)
    (is_available jeffrey t_1130)
    (is_available jeffrey t_1200)
    (is_available jeffrey t_1230)
    (is_available jeffrey t_1300)
    (is_available jeffrey t_1330)
    (is_available jeffrey t_1400)
    (is_available jeffrey t_1430)
    (is_available jeffrey t_1500)
    (is_available jeffrey t_1530)
    (is_available jeffrey t_1600)
    (is_available jeffrey t_1630)

    ;; Virginia is busy: 9:00-9:30 (t_0900), 10:00-10:30 (t_1000), 14:30-15:00 (t_1430), 16:00-16:30 (t_1600).
    (is_available virginia t_0930)
    (is_available virginia t_1030)
    (is_available virginia t_1100)
    (is_available virginia t_1130)
    (is_available virginia t_1200)
    (is_available virginia t_1230)
    (is_available virginia t_1300)
    (is_available virginia t_1330)
    (is_available virginia t_1400)
    (is_available virginia t_1500)
    (is_available virginia t_1530)
    (is_available virginia t_1630)

    ;; Melissa is busy: 
    ;; 9:00-11:30 (t_0900, t_0930, t_1000, t_1030, t_1100), 
    ;; 12:00-12:30 (t_1200), 
    ;; 13:00-15:00 (t_1300, t_1330, t_1400, t_1430), 
    ;; 16:00-17:00 (t_1600, t_1630).
    ;; Melissa preference: rather not after 14:00 (t_1400, t_1430, t_1500, t_1530, t_1600, t_1630).
    ;; Melissa is available satisfying all constraints and preferences at:
    (is_available melissa t_1130)
    (is_available melissa t_1230)
  )
  (:goal (scheduled))
)