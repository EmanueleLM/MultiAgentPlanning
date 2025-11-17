(define (domain integrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (state-ok)
  )

  (:action paltry
    :parameters ()
    :precondition (and (state-ok))
    :effect (and (state-ok))
  )

  (:action sip
    :parameters ()
    :precondition (and (state-ok))
    :effect (and (state-ok))
  )

  (:action clip
    :parameters ()
    :precondition (and (state-ok))
    :effect (and (state-ok))
  )

  (:action wretched
    :parameters ()
    :precondition (and (state-ok))
    :effect (and (state-ok))
  )

  (:action memory
    :parameters ()
    :precondition (and (state-ok))
    :effect (and (state-ok))
  )

  (:action tightfisted
    :parameters ()
    :precondition (and (state-ok))
    :effect (and (state-ok))
  )
)