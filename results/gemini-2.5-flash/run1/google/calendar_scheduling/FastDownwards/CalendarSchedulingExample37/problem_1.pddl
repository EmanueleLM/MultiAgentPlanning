(define (problem calendarschedulingexample37)
  (:domain calendar_scheduling)
  (:objects
    gregory teresa carol - person
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230
    t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - time_slot
  )
  (:init
    (at_time_slot t_0900)

    ;; Define time slot sequence
    (next_slot t_0900 t_0930)
    (next_slot t_0930 t_1000)
    (next_slot t_1000 t_1030)
    (next_slot t_1030 t_1100)
    (next_slot t_1100 t_1130)
    (next_slot t_1130 t_1200)
    (next_slot t_1200 t_1230)
    (next_slot t_1230 t_1300)
    (next_slot t_1300 t_1330)
    (next_slot t_1330 t_1400)
    (next_slot t_1400 t_1430)
    (next_slot t_1430 t_1500)
    (next_slot t_1500 t_1530)
    (next_slot t_1530 t_1600)
    (next_slot t_1600 t_1630)

    ;; Teresa's schedule (wide open)
    (is_free teresa t_0900)
    (is_free teresa t_0930)
    (is_free teresa t_1000)
    (is_free teresa t_1030)
    (is_free teresa t_1100)
    (is_free teresa t_1130)
    (is_free teresa t_1200)
    (is_free teresa t_1230)
    (is_free teresa t_1300)
    (is_free teresa t_1330)
    (is_free teresa t_1400)
    (is_free teresa t_1430)
    (is_free teresa t_1500)
    (is_free teresa t_1530)
    (is_free teresa t_1600)
    (is_free teresa t_1630)

    ;; Gregory's schedule (blocked: 11:00-11:30, 12:00-12:30, 15:30-16:30)
    (is_free gregory t_0900)
    (is_free gregory t_0930)
    (is_free gregory t_1000)
    (is_free gregory t_1030)
    ;; t_1100 is blocked
    (is_free gregory t_1130)
    ;; t_1200 is blocked
    (is_free gregory t_1230)
    (is_free gregory t_1300)
    (is_free gregory t_1330)
    (is_free gregory t_1400)
    (is_free gregory t_1430)
    (is_free gregory t_1500)
    ;; t_1530 is blocked
    ;; t_1600 is blocked
    (is_free gregory t_1630)

    ;; Carol's schedule (blocked: 9:00-10:30, 11:00-16:00, 16:30-17:00)
    ;; t_0900, t_0930, t_1000 are blocked
    (is_free carol t_1030)
    ;; t_1100 to t_1530 are blocked (t_1100 t_1130 t_1200 t_1230 t_1300 t_1330 t_1400 t_1430 t_1500 t_1530)
    (is_free carol t_1600)
    ;; t_1630 is blocked
  )
  (:goal (exists (?s - time_slot) (meeting_scheduled ?s)))
)