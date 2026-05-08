(define (problem meeting_planning_example_18)
  (:domain meeting_planning)
  (:objects
    marina_district richmond_district - location
    t_0900 t_0911 t_2019 t_2030 t_2145 t_2200 t_2154 - time
    betty - person
  )
  (:init
    (at marina_district)
    (time t_0900)
    
    ;; Travel Marina to Richmond (11 minutes)
    (can_travel marina_district richmond_district t_0900 t_0911)
    (can_travel marina_district richmond_district t_2019 t_2030)
    
    ;; Travel Richmond to Marina (9 minutes)
    (can_travel richmond_district marina_district t_2145 t_2154)

    ;; Waiting possibilities
    (can_wait t_0900 t_2019)
    (can_wait t_0911 t_2030)
    (can_wait t_2145 t_2200)

    ;; Betty availability: Richmond District 8:30PM (20:30) to 10:00PM (22:00)
    ;; Required duration: 75 minutes.
    ;; 20:30 + 75 minutes = 21:45. 21:45 <= 22:00.
    (can_meet betty richmond_district t_2030 t_2145)
  )
  (:goal (and (has_met betty)))
)