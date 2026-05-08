(define (problem meeting_planning_example_44)
  (:domain meeting_planning)
  (:objects
    pacific_heights fishermans_wharf - location
    betty - person
    t_0900 t_0913 t_1058 t_1110 - timepoint
  )
  (:init
    ;; Starting state: User arrives at Pacific Heights at 9:00 AM.
    (at pacific_heights)
    (at_time t_0900)

    ;; Fixed location for Betty.
    (person_at betty fishermans_wharf)

    ;; Travel time from Pacific Heights to Fisherman's Wharf: 13 minutes.
    ;; 9:00 AM + 13 minutes = 9:13 AM.
    (can_travel pacific_heights fishermans_wharf t_0900 t_0913)

    ;; Travel time from Fisherman's Wharf back to Pacific Heights: 12 minutes.
    ;; Assuming a return trip is possible after the meeting ends at 10:58 AM.
    (can_travel fishermans_wharf pacific_heights t_1058 t_1110)

    ;; Meeting with Betty at Fisherman's Wharf: minimum 105 minutes.
    ;; Betty is at FW from 8:45 AM to 6:00 PM.
    ;; Arrival at FW is at 9:13 AM. 9:13 AM + 105 minutes = 10:58 AM.
    ;; Since 9:13 AM and 10:58 AM are both within Betty's availability window, this is feasible.
    (can_meet betty t_0913 t_1058)
  )
  (:goal
    ;; Objective: Meet Betty for the required duration.
    (met betty)
  )
)