(define (problem meeting_planning_example_23)
  (:domain meeting_planning)

  (:objects
    bayview russian_hill - location
    john - person
    t_0900 t_0923 t_1707 t_1730 t_1845 t_2100 - time
  )

  (:init
    ;; Starting state
    (at_location bayview)
    (current_time t_0900)

    ;; Chronological order of time points
    (next_time t_0900 t_0923)
    (next_time t_0923 t_1707)
    (next_time t_1707 t_1730)
    (next_time t_1730 t_1845)
    (next_time t_1845 t_2100)

    ;; Travel schedule options (23 minutes travel time)
    ;; Travel early at 9:00 AM
    (is_travel bayview russian_hill t_0900 t_0923)
    ;; Travel late to arrive just in time for John's availability
    (is_travel bayview russian_hill t_1707 t_1730)

    ;; John's availability and meeting duration (min 75 minutes)
    ;; John is at Russian Hill from 17:30 to 21:00.
    ;; A meeting from 17:30 to 18:45 lasts exactly 75 minutes.
    (can_meet john russian_hill t_1730 t_1845)
  )

  (:goal
    (and
      (met_person john)
    )
  )
)