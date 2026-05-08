(define (problem meeting_planning_example_47)
  (:domain meeting_planning)
  (:objects
    richmond_district nob_hill - location
    time_0900 time_0917 time_0930 time_0945 - time
    paul - person
  )
  (:init
    ;; Starting condition: arrive at Richmond District at 9:00 AM.
    (at richmond_district time_0900)

    ;; Travel from Richmond District to Nob Hill takes 17 minutes.
    ;; 09:00 AM + 17 minutes = 09:17 AM.
    (travel_possible richmond_district nob_hill time_0900 time_0917)

    ;; Once at Nob Hill at 09:17 AM, the agent must wait for Paul.
    ;; Paul arrives at 09:30 AM.
    (wait_possible nob_hill time_0917 time_0930)

    ;; Paul is at Nob Hill from 9:30 AM to 11:15 AM.
    ;; The goal requires a 15-minute meeting.
    ;; 09:30 AM + 15 minutes = 09:45 AM.
    ;; 09:45 AM is before Paul departs at 11:15 AM.
    (meet_possible paul nob_hill time_0930 time_0945)
  )
  (:goal
    ;; The goal is to meet as many friends as possible. 
    ;; In this instance, Paul is the only friend mentioned.
    (met paul)
  )
)