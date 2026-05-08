(define (problem trip_planning_example12_problem)
  (:domain trip_planning_example12)

  ;;; Notes:
  ;;; - Days are discrete from d1..d15.
  ;;; - City stay requests are encoded as explicit slot tokens:
  ;;;     valencia: 5 slots, amsterdam: 5 slots, tallinn: 7 slots.
  ;;;   Because 5+5+7 = 17 > total days (15), this instance is intentionally
  ;;;   encoded as an inconsistent / unsolvable instance to preserve the agents'
  ;;;   hard requests exactly (per instruction). The planner will therefore find
  ;;;   no plan; this models the hard conflict explicitly.
  ;;; - All identifiers are lowercase to ensure FastDownward parsing.

  (:objects
    ; days
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day

    ; cities
    valencia amsterdam tallinn - city

    ; slots (tokens equal to each city's requested days)
    v_slot1 v_slot2 v_slot3 v_slot4 v_slot5
    a_slot1 a_slot2 a_slot3 a_slot4 a_slot5
    t_slot1 t_slot2 t_slot3 t_slot4 t_slot5 t_slot6 t_slot7
    - slot
  )

  (:init
    ; ordering between days
    (first_day d1)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)
    (next d13 d14) (next d14 d15)

    ; permitted direct flights (only direct legs allowed)
    (direct_flight amsterdam tallinn)
    (direct_flight tallinn amsterdam)
    (direct_flight valencia amsterdam)
    (direct_flight amsterdam valencia)

    ; city slots representing the hard requested stay lengths
    (free_slot valencia v_slot1) (free_slot valencia v_slot2)
    (free_slot valencia v_slot3) (free_slot valencia v_slot4) (free_slot valencia v_slot5)

    (free_slot amsterdam a_slot1) (free_slot amsterdam a_slot2)
    (free_slot amsterdam a_slot3) (free_slot amsterdam a_slot4) (free_slot amsterdam a_slot5)

    (free_slot tallinn t_slot1) (free_slot tallinn t_slot2) (free_slot tallinn t_slot3)
    (free_slot tallinn t_slot4) (free_slot tallinn t_slot5) (free_slot tallinn t_slot6)
    (free_slot tallinn t_slot7)

    ; meeting window days for tallinn (d9..d15 inclusive)
    (meeting_window d9) (meeting_window d10) (meeting_window d11)
    (meeting_window d12) (meeting_window d13) (meeting_window d14) (meeting_window d15)
  )

  (:goal
    (and
      ; all days must be assigned to some city
      (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
      (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10)
      (assigned d11) (assigned d12) (assigned d13) (assigned d14) (assigned d15)

      ; all city slots must be consumed to respect agents' hard requested stay lengths
      (not (free_slot valencia v_slot1)) (not (free_slot valencia v_slot2))
      (not (free_slot valencia v_slot3)) (not (free_slot valencia v_slot4))
      (not (free_slot valencia v_slot5))

      (not (free_slot amsterdam a_slot1)) (not (free_slot amsterdam a_slot2))
      (not (free_slot amsterdam a_slot3)) (not (free_slot amsterdam a_slot4))
      (not (free_slot amsterdam a_slot5))

      (not (free_slot tallinn t_slot1)) (not (free_slot tallinn t_slot2))
      (not (free_slot tallinn t_slot3)) (not (free_slot tallinn t_slot4))
      (not (free_slot tallinn t_slot5)) (not (free_slot tallinn t_slot6))
      (not (free_slot tallinn t_slot7))

      ; meeting in tallinn must be recorded during the allowed window
      (meeting_happened)
    )
  )
)