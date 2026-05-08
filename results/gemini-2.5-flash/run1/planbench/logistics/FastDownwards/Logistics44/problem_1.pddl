(define (problem logistics44-problem)
    (:domain logistics44)
    (:objects
        city0 city1 city2 - city
        loc00 loc10 loc20 - location
        truck0 truck1 truck2 - truck
        airplane0 airplane1 - airplane
        package0 - package
    )
    (:init
        (is_airport loc00)
        (is_airport loc10)
        (is_airport loc20)

        (at_location airplane0 loc00)
        (at_location airplane1 loc10)
        (at_location package0 loc20)
        (at_location truck0 loc00)
        (at_location truck1 loc10)
        (at_location truck2 loc20)

        (in_city loc00 city0)
        (in_city loc10 city1)
        (in_city loc20 city2)
    )
    (:goal
        (at_location package0 loc10)
    )
)