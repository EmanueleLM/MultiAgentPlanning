(define (problem trip_planning_example12_problem)
  (:domain trip_planning_example12)

  ; Comments / assumptions:
  ; - Days are discrete objects d1..d15.
  ; - City capacity tokens (slots) implement required hard stay-length constraints:
  ;   valencia: 5 slots, amsterdam: 5 slots, tallinn: 7 slots (these are strict requirements).
  ; - Direct flights are only those explicitly listed in the human specification.
  ; - The model therefore encodes the human agents' hard stay requirements exactly;
  ;   since 5+5+7 = 17 > total 15 days, the instance is expected to be inconsistent (no plan).
  ; - The meeting in Tallinn must be recorded by executing record_meeting_in_tallinn on some day from d9..d15;
  ;   that action requires that the chosen day is assigned to Tallinn.

  (:objects
    ; days
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day

    ; cities
    valencia amsterdam tallinn - city

    ; slots (capacity tokens) - number equals requested days per city
    ; valencia: 5
    v_slot1 v_slot2 v_slot3 v_slot4 v_slot5
    ; amsterdam: 5
    a_slot1 a_slot2 a_slot3 a_slot4 a_slot5
    ; tallinn: 7
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

    ; direct flights (only allowed direct legs)
    (direct_flight amsterdam tallinn)
    (direct_flight tallinn amsterdam)
    (direct_flight valencia amsterdam)
    (direct_flight amsterdam valencia)

    ; initial city slots (capacity tokens)
    ; Valencia slots (5)
    (city_slot valencia v_slot1) (city_slot valencia v_slot2)
    (city_slot valencia v_slot3) (city_slot valencia v_slot4) (city_slot valencia v_slot5)

    ; Amsterdam slots (5)
    (city_slot amsterdam a_slot1) (city_slot amsterdam a_slot2)
    (city_slot amsterdam a_slot3) (city_slot amsterdam a_slot4) (city_slot amsterdam a_slot5)

    ; Tallinn slots (7)
    (city_slot tallinn t_slot1) (city_slot tallinn t_slot2) (city_slot tallinn t_slot3)
    (city_slot tallinn t_slot4) (city_slot tallinn t_slot5) (city_slot tallinn t_slot6)
    (city_slot tallinn t_slot7)

    ; Meeting window days (day 9..15 inclusive)
    (meeting_window d9) (meeting_window d10) (meeting_window d11)
    (meeting_window d12) (meeting_window d13) (meeting_window d14) (meeting_window d15)
  )

  (:goal
    (and
      ; All days must be assigned to some city
      (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
      (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10)
      (assigned d11) (assigned d12) (assigned d13) (assigned d14) (assigned d15)

      ; All city slots must be consumed to meet the agents' hard requested stay lengths
      (not (city_slot valencia v_slot1)) (not (city_slot valencia v_slot2))
      (not (city_slot valencia v_slot3)) (not (city_slot valencia v_slot4))
      (not (city_slot valencia v_slot5))

      (not (city_slot amsterdam a_slot1)) (not (city_slot amsterdam a_slot2))
      (not (city_slot amsterdam a_slot3)) (not (city_slot amsterdam a_slot4))
      (not (city_slot amsterdam a_slot5))

      (not (city_slot tallinn t_slot1)) (not (city_slot tallinn t_slot2))
      (not (city_slot tallinn t_slot3)) (not (city_slot tallinn t_slot4))
      (not (city_slot tallinn t_slot5)) (not (city_slot tallinn t_slot6))
      (not (city_slot tallinn t_slot7))

      ; The meeting in Tallinn must occur during the allowed window
      (meeting_happened)
    )
  )
)