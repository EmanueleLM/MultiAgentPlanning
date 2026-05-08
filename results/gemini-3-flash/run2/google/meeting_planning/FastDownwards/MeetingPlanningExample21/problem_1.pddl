(define (problem MeetingPlanningExample21)
  (:domain meeting_planning)
  (:objects
    mission_district haight_ashbury - location
    t0900 t0912 t0942 - time
    margaret - person
  )

  (:init
    ;; Starting state: You arrive at Mission District at 9:00AM
    (at mission_district)
    (time_at t0900)

    ;; Margaret's location: Margaret is at Haight-Ashbury from 8:00AM to 3:45PM
    ;; Since our meeting window is 9:12AM to 9:42AM, she is at HA for the entire duration.
    (person_at margaret haight_ashbury)

    ;; Travel time: Mission District to Haight-Ashbury takes 12 minutes.
    ;; 9:00 AM + 12 minutes = 9:12 AM
    (travel_duration mission_district haight_ashbury t0900 t0912)

    ;; Meeting duration: You want to meet Margaret for a minimum of 30 minutes.
    ;; 9:12 AM + 30 minutes = 9:42 AM
    ;; This is well within Margaret's 3:45 PM deadline.
    (meeting_duration margaret t0912 t0942)
  )

  (:goal
    ;; The objective is to meet as many friends as possible. Only Margaret is mentioned.
    (has_met margaret)
  )
)