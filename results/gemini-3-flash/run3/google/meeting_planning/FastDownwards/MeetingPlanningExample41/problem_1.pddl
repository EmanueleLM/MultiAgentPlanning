(define (problem meeting_george)
  (:domain meeting_planning)
  (:objects
    north_beach haight_ashbury - location
    t0900 t0918 t1003 - timepoint
    george - person
  )

  (:init
    ;; Starting state: Arriving at North Beach at 9:00 AM
    (at_loc north_beach)
    (at_time t0900)

    ;; Travel distance from North Beach to Haight-Ashbury: 18 minutes
    ;; 9:00 AM + 18 minutes = 9:18 AM
    (travel_possible north_beach haight_ashbury t0900 t0918)

    ;; Meeting George at Haight-Ashbury for 45 minutes
    ;; George is there from 7:30 AM to 1:15 PM (13:15)
    ;; If travel starts at 9:00 AM, arrive at 9:18 AM.
    ;; Meeting starts at 9:18 AM and ends at 10:03 AM (45 minutes).
    ;; 10:03 AM is well before George leaves at 1:15 PM.
    (meeting_possible george haight_ashbury t0918 t1003)
  )

  (:goal
    (met george)
  )
)