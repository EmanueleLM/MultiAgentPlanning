(define (problem meeting_planning_problem)
  (:domain meeting_planning)

  (:objects
    the_castro sunset_district - location
    t0900 t0917 t1415 t1530 - time
    deborah - person
  )

  (:init
    ;; Starting state: At The Castro at 9:00 AM.
    (at the_castro)
    (current_time t0900)

    ;; Travel constraint: 17 minutes from The Castro to Sunset District.
    ;; 9:00 AM + 17 mins = 9:17 AM.
    (valid_move the_castro sunset_district t0900 t0917)

    ;; Waiting constraint: Wait at Sunset District until Deborah arrives at 2:15 PM (14:15).
    (valid_wait sunset_district t0917 t1415)

    ;; Meeting constraint: Deborah is at Sunset District from 2:15 PM (14:15) to 8:00 PM (20:00).
    ;; Meeting her for the required minimum of 75 minutes.
    ;; 14:15 + 75 mins = 15:30.
    ;; This window [14:15, 15:30] is valid as she stays until 20:00.
    (valid_meeting deborah sunset_district t1415 t1530)
  )

  (:goal
    (met deborah)
  )
)