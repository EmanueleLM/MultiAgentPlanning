(define (problem meeting_planning_example_16)
  (:domain meeting_planning)
  (:objects
    chinatown russian_hill - location
    ronald - person
    t_0900 t_0907 t_1515 t_1522 t_1700 t_1707 t_1709 t_1716 t_2130 - time
  )

  (:init
    ;; Starting conditions
    (at chinatown)
    (current_time t_0900)

    ;; Temporal ordering (strictly increasing timeline)
    (next t_0900 t_0907)
    (next t_0907 t_1515)
    (next t_1515 t_1522)
    (next t_1522 t_1700)
    (next t_1700 t_1707)
    (next t_1707 t_1709)
    (next t_1709 t_1716)
    (next t_1716 t_2130)

    ;; Feasible Travel (Chinatown to Russian Hill = 7 mins)
    (can_travel chinatown russian_hill t_0900 t_0907)
    (can_travel chinatown russian_hill t_1515 t_1522)

    ;; Feasible Travel (Russian Hill to Chinatown = 9 mins)
    (can_travel russian_hill chinatown t_1700 t_1709)
    (can_travel russian_hill chinatown t_1707 t_1716)

    ;; Feasible Meetings (Ronald at Russian Hill from 15:15 to 21:30 for 105 mins)
    ;; Meeting starts at 3:15 PM and ends at 5:00 PM
    (can_meet ronald russian_hill t_1515 t_1700)
    ;; Meeting starts at 3:22 PM (after travel) and ends at 5:07 PM
    (can_meet ronald russian_hill t_1522 t_1707)
  )

  (:goal
    (and
      (met ronald)
    )
  )
)