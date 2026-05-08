(define (problem meeting_planning_example)
  (:domain meeting_planning)
  (:objects
    bayview financial_district - location
    jeffrey - person
    t0900 t0919 t1215 t1230 t1345 t1400 t1404 - time
  )
  (:init
    (at_loc bayview)
    (time_at t0900)
    (can_travel bayview financial_district t0900 t0919)
    (can_travel financial_district bayview t1345 t1404)
    (can_wait financial_district t0919 t1215)
    (can_wait financial_district t1215 t1230)
    (can_wait financial_district t1345 t1400)
    (available_to_meet jeffrey financial_district t1215 t1345)
    (available_to_meet jeffrey financial_district t1230 t1400)
  )
  (:goal
    (has_met jeffrey)
  )
)