(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    david debra kevin - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ;; No meeting scheduled yet
    (unscheduled)

    ;; next relations (30-minute steps)
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ;; David's availability (private info: no meetings all Monday) -> free all half-hour slots
    (free david t0900) (free david t0930) (free david t1000) (free david t1030)
    (free david t1100) (free david t1130) (free david t1200) (free david t1230)
    (free david t1300) (free david t1330) (free david t1400) (free david t1430)
    (free david t1500) (free david t1530) (free david t1600) (free david t1630)

    ;; Debra's availability (private busy slots: 09:30-10:00, 11:00-11:30, 12:00-13:00, 14:00-14:30, 16:00-16:30)
    ;; So she is NOT free at t0930, t1100, t1200, t1230, t1400, t1600; free otherwise
    (free debra t0900)
    ;; t0930 busy -> omitted
    (free debra t1000) (free debra t1030)
    ;; t1100 busy -> omitted
    (free debra t1130)
    ;; t1200 busy -> omitted
    ;; t1230 busy -> omitted
    (free debra t1300) (free debra t1330)
    ;; t1400 busy -> omitted
    (free debra t1430) (free debra t1500) (free debra t1530)
    ;; t1600 busy -> omitted
    (free debra t1630)

    ;; Kevin's availability (private info: 09:00-12:00 and 14:00-17:00)
    (free kevin t0900) (free kevin t0930) (free kevin t1000) (free kevin t1030)
    (free kevin t1100) (free kevin t1130)
    ;; 12:00-14:00 not available -> t1200 t1230 t1300 t1330 omitted
    (free kevin t1400) (free kevin t1430) (free kevin t1500) (free kevin t1530)
    (free kevin t1600) (free kevin t1630)
  )

  ;; Goal: schedule one 60-minute meeting (represented as two consecutive half-hour slots)
  (:goal (meeting-done))
)