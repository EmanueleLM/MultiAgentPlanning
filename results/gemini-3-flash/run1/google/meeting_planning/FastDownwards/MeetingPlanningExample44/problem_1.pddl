(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    me betty - person
    pacific_heights fishermans_wharf - location
    t_0900 t_0913 t_1058 - time
  )
  (:init
    ;; Starting position and time
    (at me pacific_heights)
    (time_at t_0900)

    ;; Betty's location (she is at Fisherman's Wharf from 8:45 AM to 6:00 PM)
    (at betty fishermans_wharf)

    ;; Connectivity and temporal transitions
    ;; Travel from Pacific Heights to Fisherman's Wharf takes 13 minutes
    (can_travel me pacific_heights fishermans_wharf t_0900 t_0913)

    ;; Meeting Betty for 105 minutes
    ;; If travel starts at 9:00 and ends at 9:13, meeting can start at 9:13.
    ;; 9:13 AM + 105 minutes = 10:58 AM.
    ;; Both 9:13 AM and 10:58 AM are within Betty's window (8:45 AM - 6:00 PM).
    (can_meet me betty fishermans_wharf t_0913 t_1058)
  )
  (:goal
    (and
      (met betty)
    )
  )
)