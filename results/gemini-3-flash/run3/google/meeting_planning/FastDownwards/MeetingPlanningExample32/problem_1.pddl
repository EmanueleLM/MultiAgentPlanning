(define (problem meeting_planning_example_32)
  (:domain meeting_planning)
  (:objects 
    the_castro golden_gate_park - location
    t_0900 t_0911 t_1056 - time
    jeffrey - person
  )
  (:init
    ;; Starting state: You arrive at The Castro at 9:00 AM.
    (at_location the_castro)
    (current_time t_0900)
    
    ;; Jeffrey's location: Jeffrey is at Golden Gate Park.
    (person_at jeffrey golden_gate_park)
    
    ;; Feasible transitions based on problem constraints:
    ;; 1. Travel from The Castro to Golden Gate Park (11 minutes).
    ;;    9:00 AM + 11 mins = 9:11 AM.
    (travel_possible the_castro golden_gate_park t_0900 t_0911)
    
    ;; 2. Meet Jeffrey for 105 minutes.
    ;;    Arrival at GGP at 9:11 AM. Jeffrey is there until 5:30 PM (17:30).
    ;;    9:11 AM + 105 mins = 10:56 AM.
    ;;    The meeting is feasible as 10:56 AM is before 5:30 PM.
    (meeting_possible jeffrey t_0911 t_1056)
  )
  (:goal 
    ;; Meet as many friends as possible (Jeffrey is the only friend listed).
    (has_met jeffrey)
  )
)