(define (domain crave-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent entity)

  (:predicates
    ;; agent controls an entity (only the controlling agent may induce cravings on that entity)
    (controls ?ag - agent ?e - entity)
    ;; craving relation between entities
    (craves ?s - entity ?t - entity)
  )

  ;; Actions are distinct per agent and parameterized over subject and target entities.
  ;; Each action can only be applied to a subject the specific agent controls.
  (:action induce-crave-ag1
    :parameters (?sub - entity ?obj - entity)
    :precondition (and
      (controls ag1 ?sub)
      (not (craves ?sub ?obj))
    )
    :effect (and
      (craves ?sub ?obj)
    )
  )

  (:action induce-crave-ag2
    :parameters (?sub - entity ?obj - entity)
    :precondition (and
      (controls ag2 ?sub)
      (not (craves ?sub ?obj))
    )
    :effect (and
      (craves ?sub ?obj)
    )
  )

  (:action induce-crave-ag3
    :parameters (?sub - entity ?obj - entity)
    :precondition (and
      (controls ag3 ?sub)
      (not (craves ?sub ?obj))
    )
    :effect (and
      (craves ?sub ?obj)
    )
  )
)