; Problem: trip-scheduling-problem
(define (problem trip-scheduling-problem)
  (:domain trip-scheduling)
  (:objects krakow athens zurich - city)

  (:init
    (at krakow)
    ; no city visited yet
    (not (visited krakow))
    (not (visited athens))
    (not (visited zurich))
    (not (occupied-krakow))
    (not (occupied-athens))
    (not (occupied-zurich))
    (not (relatives-visited))
    (= (elapsed) 0)
  )

  (:goal
    (and
      (visited krakow)
      (visited athens)
      (visited zurich)
      (relatives-visited)
      (= (elapsed) 18)
    )
  )
)