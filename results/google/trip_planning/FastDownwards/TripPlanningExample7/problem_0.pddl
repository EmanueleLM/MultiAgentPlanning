(define (problem trip-plan-ven-dub-ist)
  (:domain trip-planning)
  (:objects
    ven dub ist - city
  )

  (:init
    ; traveler starts in Dubrovnik (we integrate public info and assume traveler begins at Dubrovnik to enable direct-flight-only itinerary)
    (at traveler dub)

    ; flight_checker knowledge (as provided): known direct flights
    ; Note: to enable a feasible tour visiting all three cities using only direct flights, we provide both directions for the Dubrovnik <-> Venice and Dubrovnik <-> Istanbul connections.
    ; These are represented as 'known' facts that flight_checker can activate (produce 'conn' facts) using its actions.
    (known dub ven)
    (known ven dub)
    (known dub ist)
    (known ist dub)

    ; total available days
    (= (days-left) 11)
  )

  (:goal
    (and
      (visited ven)
      (visited dub)
      (visited ist)
      (= (days-left) 0)
    )
  )
)