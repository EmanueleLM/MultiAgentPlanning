(define (problem trip-10days)
  (:domain trip-planning)
  (:objects
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    (current-day d1)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)
    (last-day d10)
    (unassigned d1) (unassigned d2) (unassigned d3) (unassigned d4) (unassigned d5)
    (unassigned d6) (unassigned d7) (unassigned d8) (unassigned d9) (unassigned d10)
    (direct-flight lyon frankfurt)
    (direct-flight frankfurt lyon)
    (direct-flight frankfurt krakow)
    (direct-flight krakow frankfurt)
    (at lyon)
    (= (stays lyon) 0)
    (= (stays frankfurt) 0)
    (= (stays krakow) 0)
  )
  (:goal (and
    ; Human-specified fixed attendance at Krakow days 8-10
    (assigned d8 krakow) (assigned d9 krakow) (assigned d10 krakow)
    ; Itinerary agent numerical desires encoded as numeric goals (may be unsatisfiable together)
    (= (stays lyon) 7)
    (= (stays krakow) 3)
    (= (stays frankfurt) 2)
  ))
)