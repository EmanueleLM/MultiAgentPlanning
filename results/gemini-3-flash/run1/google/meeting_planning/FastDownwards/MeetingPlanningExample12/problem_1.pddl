(define (problem MeetingPlanningExample12)
  (:domain meeting_planning)
  (:objects
    north_beach alamo_square - location
    t0900 t0916 t1800 t1830 t1900 t1930 t2000 t2030 t2100 t2130 - time
    m0_min m30_min m60_min m90_min - level
    barbara - person
  )

  (:init
    ;; Starting state
    (at_me north_beach)
    (time_at t0900)
    (meeting_progress barbara m0_min)

    ;; Time progression
    (next_time t0900 t0916)
    (next_time t0916 t1800)
    (next_time t1800 t1830)
    (next_time t1830 t1900)
    (next_time t1900 t1930)
    (next_time t1930 t2000)
    (next_time t2000 t2030)
    (next_time t2030 t2100)
    (next_time t2100 t2130)

    ;; Meeting progression levels (30-minute intervals)
    (next_level m0_min m30_min)
    (next_level m30_min m60_min)
    (next_level m60_min m90_min)

    ;; Connectivity and schedule
    ;; Travel NB to AS takes 16 minutes
    (can_travel north_beach alamo_square t0900 t0916)

    ;; Barbara's schedule at Alamo Square (6:00 PM to 9:30 PM)
    ;; She is present for the intervals starting at these times:
    (at_person barbara alamo_square t1800)
    (at_person barbara alamo_square t1830)
    (at_person barbara alamo_square t1900)
    (at_person barbara alamo_square t1930)
    (at_person barbara alamo_square v2000)
    (at_person barbara alamo_square t2000)
    (at_person barbara alamo_square t2030)
    (at_person barbara alamo_square t2100)
  )

  (:goal
    ;; Meet Barbara for at least 90 minutes
    (meeting_progress barbara m90_min)
  )
)