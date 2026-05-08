(define (problem schedule_monday)
  (:domain calendar_scheduling)
  (:objects
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - time_slot
  )
  (:init
    ;; Joyce's schedule: 11:00-11:30, 13:30-14:00, 14:30-16:30
    (person_busy joyce t_11_00)
    (person_busy joyce t_13_30)
    (person_busy joyce t_14_30)
    (person_busy joyce t_15_00)
    (person_busy joyce t_15_30)
    (person_busy joyce t_16_00)

    ;; Christine's schedule: Cannot meet before 12:00
    (person_busy christine t_09_00)
    (person_busy christine t_09_30)
    (person_busy christine t_10_00)
    (person_busy christine t_10_30)
    (person_busy christine t_11_00)
    (person_busy christine t_11_30)

    ;; Alexander's schedule: 9:00-11:00, 12:00-12:30, 13:30-15:00, 15:30-16:00, 16:30-17:00
    (person_busy alexander t_09_00)
    (person_busy alexander t_09_30)
    (person_busy alexander t_10_00)
    (person_busy alexander t_10_30)
    (person_busy alexander t_12_00)
    (person_busy alexander t_13_30)
    (person_busy alexander t_14_00)
    (person_busy alexander t_14_30)
    (person_busy alexander t_15_30)
    (person_busy alexander t_16_30)
  )
  (:goal
    (meeting_scheduled)
  )
)