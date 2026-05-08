(define (problem meeting_planning_problem)
  (:domain meeting_planning_domain)
  (:objects
    alamo_square sunset_district - location
    t_0900 t_1314 t_1330 t_1345 - time
    matthew - person
  )

  (:init
    ;; Starting conditions: arrived at Alamo Square at 9:00 AM
    (at alamo_square)
    (time_is t_0900)

    ;; Define the timeline transitions
    ;; Wait at Alamo Square until it's time to depart for Sunset District
    (next t_0900 t_1314)

    ;; Travel from Alamo Square to Sunset District takes 16 minutes (13:14 to 13:30)
    (can_travel alamo_square sunset_district t_1314 t_1330)

    ;; Matthew is at Sunset District during the required window.
    ;; We define a 15-minute slot that fits within his 1:30 PM - 2:30 PM availability.
    (person_at matthew sunset_district t_1330 t_1345)
  )

  (:goal
    ;; The objective is to meet Matthew for the minimum 15 minutes.
    (met matthew)
  )
)