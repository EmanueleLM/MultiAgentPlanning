```
(define (domain integrated-meeting)
    (:requirements :strips :durative-actions :typing :fluents :negative-preconditions)
    
    (:types person location)
    
    (:predicates
        (at ?person - person ?loc - location)
        (met ?person1 - person ?person2 - person)
        (meeting-planned ?person1 - person ?person2 - person)
        (meet-for-75 ?person1 - person ?person2 - person)
    )
    
    (:functions 
        (time)
    )

    ;; Agent 1's Actions
    (:durative-action travel
        :parameters (?person - person ?from ?to - location)
        :duration (= ?duration 15)
        :condition (and (at start (at ?person ?from)))
        :effect (and (at end (at ?person ?to)) 
                     (at start (not (at ?person ?from))) 
                     (increase (time) 15))
    )
    
    (:durative-action wait
        :parameters (?person - person ?loc - location)
        :duration (>= ?duration 1)
        :condition (and (at start (at ?person ?loc)))
        :effect (increase (time) ?duration)
    )
    
    ;; Combined Action
    (:durative-action meet
        :parameters (?person1 - person ?person2 - person)
        :duration (= ?duration 75)
        :condition (and (at start (at ?person1 alamo-square))
                        (at start (at ?person2 alamo-square))
                        (>= (time) 945) 
                        (<= (time) 1200))
        :effect (at end (met ?person1 ?person2))
    )
)
```