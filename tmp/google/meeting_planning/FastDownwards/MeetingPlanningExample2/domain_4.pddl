(define (domain combined-visit-meeting-domain)
  (:requirements :typing)
  (:types person loc)
  (:constants haight sunset - loc)

  (:predicates
    (at ?p - person ?l - loc)
    (met)
  )

  (:action travel-you-haight-to-sunset
     :parameters (?you - person)
     :precondition (at ?you haight)
     :effect (and (not (at ?you haight)) (at ?you sunset))
  )

  (:action travel-you-sunset-to-haight
     :parameters (?you - person)
     :precondition (at ?you sunset)
     :effect (and (not (at ?you sunset)) (at ?you haight))
  )

  (:action travel-jessica-haight-to-sunset
     :parameters (?jessica - person)
     :precondition (at ?jessica haight)
     :effect (and (not (at ?jessica haight)) (at ?jessica sunset))
  )

  (:action travel-jessica-sunset-to-haight
     :parameters (?jessica - person)
     :precondition (at ?jessica sunset)
     :effect (and (not (at ?jessica sunset)) (at ?jessica haight))
  )

  (:action meet-jessica_A
     :parameters (?you - person ?jessica - person)
     :precondition (and (at ?you sunset) (at ?jessica sunset))
     :effect (met)
  )

  (:action meet-90_B
     :parameters (?you - person ?jessica - person)
     :precondition (and (at ?you sunset) (at ?jessica sunset))
     :effect (met)
  )
)