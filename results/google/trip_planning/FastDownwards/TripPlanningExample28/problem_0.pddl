(define (problem visit-venice-florence-zurich)
  (:domain multiagent-trip)
  (:objects
    venice zurich florence - city
  )
  (:init
    ; start location (chosen to produce a concrete, solvable itinerary)
    (at venice)

    ; direct flight topology (as provided/shared by agents)
    (direct venice zurich)
    (direct zurich venice)
    (direct zurich florence)
    (direct florence zurich)

    ; start with zero days spent
    (= (days-passed) 0)
  )

  ; Goal: visit all three cities and spend exactly 12 days total (sum of stay actions)
  (:goal
    (and
      (visited venice)
      (visited zurich)
      (visited florence)
      (= (days-passed) 12)
    )
  )
)