(define (domain betty-meet-two-agents)
  (:requirements :typing)
  (:types agent location)

  (:constants
     you betty - agent
     Richmond Financial - location)

  (:predicates
     (at ?a - agent ?l - location)
     (met)
  )

  (:action travel-you-to-financial
     :parameters ()
     :precondition (at you Richmond)
     :effect (and
               (not (at you Richmond))
               (at you Financial)))
  (:action travel-you-to-richmond
     :parameters ()
     :precondition (at you Financial)
     :effect (and
               (not (at you Financial))
               (at you Richmond)))
  (:action travel-betty-to-financial
     :parameters ()
     :precondition (at betty Richmond)
     :effect (and
               (not (at betty Richmond))
               (at betty Financial)))
  (:action travel-betty-to-richmond
     :parameters ()
     :precondition (at betty Financial)
     :effect (and
               (not (at betty Financial))
               (at betty Richmond)))
  (:action meet-betty
     :parameters ()
     :precondition (and
       (at you Financial)
       (at betty Financial))
     :effect (met)
  )
)