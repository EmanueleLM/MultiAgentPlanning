```
(define (problem meet-james-integrated)
    (:domain integrated-meeting)
    
    (:objects
        James Traveler - person
        marina-district alamo-square - location
    )
    
    (:init
        (at Traveler marina-district)
        (at James alamo-square)
        (= (time) 540) ; 09:00 in minutes
    )
    
    (:goal
        (met Traveler James)
    )
)
```