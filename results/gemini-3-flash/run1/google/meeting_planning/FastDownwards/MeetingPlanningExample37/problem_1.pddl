(define (problem meeting_planning_example)
  (:domain meeting_planning)
  (:objects
    bayview financial_district - location
    jeffrey - person
    t0900 t0919 t1215 t1230 t1345 t1400 - time
  )
  (:init
    ;; Starting conditions: At Bayview at 9:00 AM
    (at_loc bayview)
    (time_at t0900)

    ;; Valid travel: Bayview to Financial District takes 19 minutes
    ;; 9:00 + 19 mins = 9:19
    (can_travel bayview financial_district t0900 t0919)
    (can_travel financial_district bayview t1345 t1404) ;; Optional return path implied by spec

    ;; Valid waiting times to align with Jeffrey's availability
    (can_wait financial_district t0919 t1215)
    (can_wait financial_district t1215 t1230)
    (can_wait financial_district t1345 t1400)

    ;; Jeffrey's availability at Financial District: 12:15 PM to 2:00 PM
    ;; Jeffrey must be met for a minimum of 90 minutes.
    ;; Option 1: Start at 12:15, end at 13:45 (90 mins)
    (available_to_meet jeffrey financial_district t1215 t1345)
    ;; Option 2: Start at 12:30, end at 14:00 (90 mins)
    (available_to_meet jeffrey financial_district t1230 t1400)
  )
  (:goal
    ;; Objective: Meet as many friends as possible (Jeffrey is the only one specified)
    (has_met jeffrey)
  )
)