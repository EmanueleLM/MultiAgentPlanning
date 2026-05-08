(define (problem meeting_planning_example_24)
  (:domain meeting_planning)
  
  (:objects
    nob_hill presidio - location
    t0900 t0917 t1100 t1130 t1515 - time
    matthew - person
  )

  (:init
    ;; Starting state: Arrive at Nob Hill at 9:00 AM.
    (at_location nob_hill)
    (at_time t0900)

    ;; Travel from Nob Hill to Presidio takes 17 minutes.
    ;; 9:00 AM (t0900) + 17 mins = 9:17 AM (t0917).
    (travel_link nob_hill presidio t0900 t0917)

    ;; Waiting period between arriving at Presidio (9:17 AM) and Matthew arriving (11:00 AM).
    (next_time t0917 t1100)

    ;; Matthew is at Presidio from 11:00 AM to 3:15 PM (15:15).
    ;; We need a minimum of 30 minutes to meet him.
    ;; Meeting from 11:00 AM (t1100) to 11:30 AM (t1130) is a valid 30-minute window.
    (meeting_link matthew presidio t1100 t1130)
    
    ;; Optional: the remaining time Matthew is available.
    (next_time t1130 t1515)
  )

  (:goal
    ;; The goal is to meet as many friends as possible. Only Matthew is specified.
    (met matthew)
  )
)