(define (problem meet_margaret_task)
  (:domain meeting_planning)
  (:objects
    me margaret - person
    mission_district haight_ashbury - location
    t_0900 t_0912 t_0915 t_0923 t_0927 t_0942 t_0953 t_0957 t_1008 - time
  )
  (:init
    ;; Starting state: me at Mission District at 9:00 AM
    (at me mission_district)
    (time_at t_0900)

    ;; Margaret's location
    (at margaret haight_ashbury)

    ;; Travel Options
    ;; Mission to Haight takes 12 minutes
    (can_travel mission_district haight_ashbury t_0900 t_0912)
    (can_travel mission_district haight_ashbury t_0915 t_0927)
    
    ;; Haight to Mission takes 11 minutes (for completeness)
    (can_travel haight_ashbury mission_district t_0912 t_0923)
    (can_travel haight_ashbury mission_district t_0942 t_0953)
    (can_travel haight_ashbury mission_district t_0957 t_1008)

    ;; Meeting Options
    ;; Minimum of 30 minutes, Margaret is available at Haight-Ashbury
    ;; 9:12 to 9:42 is well before the 3:45 PM deadline
    (can_meet margaret haight_ashbury t_0912 t_0942)
    (can_meet margaret haight_ashbury t_0927 t_0957)

    ;; Wait Options (allowing for various schedule considerations)
    (can_wait me t_0900 t_0915)
  )
  (:goal
    (met margaret)
  )
)