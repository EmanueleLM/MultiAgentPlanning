(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    berlin warsaw bucharest - city
  )
  (:init
    (at berlin)
    (= (current-day) 0)
    (= (days-in-berlin) 0)
    (= (days-in-warsaw) 0)
    (= (days-in-bucharest) 0)
    (not (friend_met))
    (= (total-cost) 0)

    ;; Direct flight connectivity
    (connected berlin warsaw)
    (connected warsaw berlin)
    (connected warsaw bucharest)
    (connected bucharest warsaw)
  )
  (:goal (and
    (= (days-in-berlin) 2)
    (= (days-in-warsaw) 2)
    (= (days-in-bucharest) 2)
    (friend_met)
    (= (current-day) 6)
  ))
  (:metric minimize (total-cost))
)