(define (problem meetingplanningexample9)
  (:domain meeting-planning-example9)
  (:objects
    union_square nob_hill - location
    traveler mary - person
  )
  (:init
    (at union_square)
    (= (time) 0)         ; 09:00
    (= (met-mary) 0)
  )
  ; Goal: meet Mary for at least 75 minutes (15 blocks of 5 minutes),
  ; starting and ending each meeting block within her availability window.
  (:goal (and
    (>= (met-mary) 75)
  ))
)