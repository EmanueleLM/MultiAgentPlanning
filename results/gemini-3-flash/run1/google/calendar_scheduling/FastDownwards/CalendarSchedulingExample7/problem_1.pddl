(define (problem calendar_problem)
  (:domain calendar_scheduling)
  (:objects
    s_0900 s_0930 s_1000 s_1030 s_1100 s_1130 s_1200 s_1230 
    s_1300 s_1330 s_1400 s_1430 s_1500 s_1530 s_1600 s_1630 - slot
  )
  (:init
    ;; Heather availability: blocked 9:00-9:30, 10:30-11:00, 13:00-14:00, 14:30-15:00, 16:00-16:30.
    (heather_available s_0930)
    (heather_available s_1000)
    (heather_available s_1100)
    (heather_available s_1130)
    (heather_available s_1200)
    (heather_available s_1230)
    (heather_available s_1400)
    (heather_available s_1500)
    (heather_available s_1530)
    (heather_available s_1630)

    ;; Nicholas availability: no meetings all day (9:00 to 17:00).
    (nicholas_available s_0900)
    (nicholas_available s_0930)
    (nicholas_available s_1000)
    (nicholas_available s_1030)
    (nicholas_available s_1100)
    (nicholas_available s_1130)
    (nicholas_available s_1200)
    (nicholas_available s_1230)
    (nicholas_available s_1300)
    (nicholas_available s_1330)
    (nicholas_available s_1400)
    (nicholas_available s_1430)
    (nicholas_available s_1500)
    (nicholas_available s_1530)
    (nicholas_available s_1600)
    (nicholas_available s_1630)

    ;; Zachary availability: blocked 9:00-10:30, 11:00-12:00, 12:30-13:00, 13:30-16:30.
    (zachary_available s_1030)
    (zachary_available s_1200)
    (zachary_available s_1300)
    (zachary_available s_1630)

    ;; Zachary preference: rather not meet after 14:00.
    ;; Preferred slots start at 09:00 and the last one starts at 13:30 (ending at 14:00).
    (is_preferred s_0900)
    (is_preferred s_0930)
    (is_preferred s_1000)
    (is_preferred s_1030)
    (is_preferred s_1100)
    (is_preferred s_1130)
    (is_preferred s_1200)
    (is_preferred s_1230)
    (is_preferred s_1300)
    (is_preferred s_1330)
  )
  (:goal (meeting_scheduled))
)