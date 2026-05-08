(define (problem meeting_planning_example_18)
  (:domain meeting_planning)
  (:objects
    marina_district richmond_district - location
    tp_0900 tp_2030 tp_2045 tp_2100 tp_2115 tp_2130 tp_2145 tp_2200 - time
    betty - person
    n0 n1 n2 n3 n4 n5 - count
  )
  (:init
    (at_loc marina_district)
    (at_time tp_0900)
    
    ;; Travel Marina to Richmond takes 11 minutes; arrival 9:11AM is well before 8:30PM (tp_2030).
    (can_travel marina_district richmond_district tp_0900 tp_2030)
    
    ;; Time increments of 15 minutes starting from Betty's arrival at 8:30 PM (20:30)
    (next_time tp_2030 tp_2045)
    (next_time tp_2045 tp_2100)
    (next_time tp_2100 tp_2115)
    (next_time tp_2115 tp_2130)
    (next_time tp_2130 tp_2145)
    (next_time tp_2145 tp_2200)
    
    ;; Betty is at Richmond from 8:30 PM to 10:00 PM (90 minutes total)
    (person_at betty richmond_district tp_2030 tp_2045)
    (person_at betty richmond_district tp_2045 tp_2100)
    (person_at betty richmond_district tp_2100 tp_2115)
    (person_at betty richmond_district tp_2115 tp_2130)
    (person_at betty richmond_district tp_2130 tp_2145)
    (person_at betty richmond_district tp_2145 tp_2200)
    
    ;; Goal tracking: 5 increments of 15 minutes = 75 minutes
    (met_count betty n0)
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
  )
  (:goal (met_count betty n5))
)