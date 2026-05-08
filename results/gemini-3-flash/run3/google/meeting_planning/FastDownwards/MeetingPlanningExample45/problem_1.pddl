(define (problem meeting_planning_example_45)
  (:domain meeting_planning)
  (:objects
    north_beach alamo_square - location
    t_0900 t_0916 t_1930 t_1945 t_2100 - time_point
    emily - person
  )
  (:init
    ;; Starting conditions: Arrive at North Beach at 9:00 AM.
    (at_me north_beach)
    (current_time t_0900)

    ;; Travel constraint: North Beach to Alamo Square takes 16 minutes.
    ;; 9:00 AM to 9:16 AM.
    (can_travel north_beach alamo_square t_0900 t_0916)

    ;; Time transition: Waiting from arrival at Alamo Square (9:16 AM) until Emily arrives (7:30 PM).
    (next t_0916 t_1930)

    ;; Meeting constraint: Emily is at Alamo Square from 7:30 PM to 9:00 PM.
    ;; Minimum meeting duration is 15 minutes. 
    ;; We model a meeting slot from 7:30 PM (t_1930) to 7:45 PM (t_1945).
    (can_meet emily alamo_square t_1930 t_1945)

    ;; Remaining time in Emily's window.
    (next t_1945 t_2100)
  )
  ;; Goal: Meet as many friends as possible (Emily is the only friend specified).
  (:goal (met emily))
)