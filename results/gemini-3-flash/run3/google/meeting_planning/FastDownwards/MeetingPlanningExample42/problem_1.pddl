(define (problem meeting_planning_example_42)
  (:domain meeting_planning)
  (:objects
    nob_hill presidio - location
    t_0900 t_0917 t_1243 t_1300 t_1330 t_1348 t_1900 - time
    timothy - person
  )
  (:init
    ;; Arrival at Nob Hill at 9:00 AM
    (at nob_hill)
    (current_time t_0900)

    ;; Travel Links
    ;; Nob Hill to Presidio: 17 minutes
    (travel_link nob_hill presidio t_0900 t_0917)
    (travel_link nob_hill presidio t_1243 t_1300)

    ;; Presidio to Nob Hill: 18 minutes
    (travel_link presidio nob_hill t_1330 t_1348)

    ;; Wait Links
    (wait_link t_0900 t_1243)
    (wait_link t_0917 t_1300)
    (wait_link t_1300 t_1330)
    (wait_link t_1330 t_1900)

    ;; Timothy Presence at Presidio from 1:00 PM (t_1300) to 7:00 PM (t_1900)
    ;; To meet him for 30 minutes, we define a 30-min presence slot starting at 1:00 PM.
    (presence timothy presidio t_1300 t_1330)
  )
  (:goal
    (met timothy)
  )
)