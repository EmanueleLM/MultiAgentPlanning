(define (domain combined-visit-meeting-domain)
  (:requirements :typing :numeric-fluents :durative-actions)
  (:types person loc)
  (:constants haight sunset - loc)

  (:predicates
    (at ?p - person ?l - loc)
    (met)
  )

  (:functions (time))

  (:action travel-you-haight-to-sunset
     :parameters (?you - person)
     :precondition (at ?you haight)
     :effect (and (not (at ?you haight)) (at ?you sunset) (increase (time) 15))
  )

  (:action travel-you-sunset-to-haight
     :parameters (?you - person)
     :precondition (at ?you sunset)
     :effect (and (not (at ?you sunset)) (at ?you haight) (increase (time) 15))
  )

  (:action travel-jessica-haight-to-sunset
     :parameters (?jessica - person)
     :precondition (at ?jessica haight)
     :effect (and (not (at ?jessica haight)) (at ?jessica sunset) (increase (time) 15))
  )

  (:action travel-jessica-sunset-to-haight
     :parameters (?jessica - person)
     :precondition (at ?jessica sunset)
     :effect (and (not (at ?jessica sunset)) (at ?jessica haight) (increase (time) 15))
  )

  (:action wait-visitor-at-sunset
     :parameters (?you - person)
     :precondition (at ?you sunset)
     :effect (increase (time) 15)
  )

  (:action wait-jessica-at-sunset
     :parameters (?jessica - person)
     :precondition (at ?jessica sunset)
     :effect (increase (time) 15)
  )

  (:durative-action meet-90
     :parameters (?you - person ?jessica - person)
     :duration (= ?dur 90)
     :condition (and (at start (at ?you sunset) (at ?jessica sunset) (>= (time) 375) (<= (time) 585)))
     :effect (and (at end (met))
                  (at end (increase (time) 90)))
  )
)