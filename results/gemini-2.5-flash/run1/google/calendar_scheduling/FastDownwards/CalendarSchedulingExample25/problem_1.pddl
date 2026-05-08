(define (problem calendar_scheduling_instance)
  (:domain calendar_scheduling)
  (:objects
    anthony pamela zachary - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_30min_slot
  )
  (:init
    ; Anthony's calculated 1-hour availability (start slots)
    (is_available_for_1hr anthony t1000)
    (is_available_for_1hr anthony t1030)
    (is_available_for_1hr anthony t1100)
    (is_available_for_1hr anthony t1300)
    (is_available_for_1hr anthony t1330)
    (is_available_for_1hr anthony t1400)
    (is_available_for_1hr anthony t1430)
    (is_available_for_1hr anthony t1500)

    ; Pamela's calculated 1-hour availability (start slots), respecting preference
    (is_available_for_1hr pamela t1000)
    (is_available_for_1hr pamela t1030)
    (is_available_for_1hr pamela t1100)
    (is_available_for_1hr pamela t1130)
    (is_available_for_1hr pamela t1200)
    (is_available_for_1hr pamela t1230)
    (is_available_for_1hr pamela t1300)
    (is_available_for_1hr pamela t1330)

    ; Zachary's calculated 1-hour availability (start slots)
    (is_available_for_1hr zachary t1330)
    (is_available_for_1hr zachary t1500)
  )
  (:goal (exists (?s - time_30min_slot) (meeting_scheduled ?s)))
)