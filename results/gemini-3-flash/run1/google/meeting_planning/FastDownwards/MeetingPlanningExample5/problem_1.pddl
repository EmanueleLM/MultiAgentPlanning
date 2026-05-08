(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    me william - person
    nob_hill the_castro - location
    t0900 t0917 t1215 t1330 t2200 - time
  )
  (:init
    ;; Starting state: Me at Nob Hill at 9:00 AM
    (at me nob_hill)
    (at_time t0900)

    ;; Timeline definition
    (next t0900 t0917) ;; Travel duration 17m
    (next t0917 t1215) ;; Waiting until William arrives
    (next t1215 t1330) ;; Meeting duration 75m
    (next t1330 t2200) ;; Remainder of William's stay

    ;; Travel constraints
    ;; Nob Hill to The Castro: 17 minutes. 09:00 -> 09:17.
    (travel_possible nob_hill the_castro t0900 t0917)

    ;; Meeting constraints
    ;; William is at The Castro from 12:15 PM to 10:00 PM.
    ;; Meeting duration is 75 minutes. 12:15 -> 13:30 (1:30 PM).
    (meeting_possible william the_castro t1215 t1330)
  )
  (:goal (and 
    (met william)
  ))
)