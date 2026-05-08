(define (problem meeting_planning_example_37)
  (:domain meeting_planning)
  (:objects
    visitor jeffrey - person
    bayview financial_district - location
    t0900 t0919 t1215 t1345 t1404 - time
  )
  (:init
    (at visitor bayview)
    (current_time t0900)
    
    ;; Travel durations
    (can_travel bayview financial_district t0900 t0919)
    (can_travel financial_district bayview t1345 t1404)
    
    ;; Waiting gaps
    (can_wait t0919 t1215)
    
    ;; Jeffrey's availability at Financial District (12:15 PM to 2:00 PM)
    (friend_at jeffrey financial_district t1215)
    (friend_at jeffrey financial_district t1345)
    
    ;; Meeting duration constraint (minimum 90 minutes)
    ;; 12:15 PM to 1:45 PM is 90 minutes.
    (is_90_min_meeting t1215 t1345)
  )
  (:goal
    (and
      (met jeffrey)
    )
  )
)