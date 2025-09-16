(define (domain combined-visit-meeting-domain)
  (:requirements :typing)
  (:types loc person)
  (:constants haight sunset - loc)

  (:predicates
    (at ?p - person ?l - loc)
    (met)
  )

  (:action travel-you-haight-to-sunset
     :precondition (at you haight)
     :effect (and (not (at you haight)) (at you sunset))
  )

  (:action travel-you-sunset-to-haight
     :precondition (at you sunset)
     :effect (and (not (at you sunset)) (at you haight))
  )

  (:action travel-jessica-haight-to-sunset
     :precondition (at jessica haight)
     :effect (and (not (at jessica haight)) (at jessica sunset))
  )

  (:action travel-jessica-sunset-to-haight
     :precondition (at jessica sunset)
     :effect (and (not (at jessica sunset)) (at jessica haight))
  )

  (:action meet-jessica_A
     :precondition (and (at you sunset) (at jessica sunset))
     :effect (met)
  )

  (:action meet-90_B
     :precondition (and (at you sunset) (at jessica sunset))
     :effect (met)
  )
)