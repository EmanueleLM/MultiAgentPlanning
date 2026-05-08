(define (domain multi_agent_crave)
  (:requirements :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (craves ?who - obj ?what - obj)
    (start)
    (prep_done_ca)
    (verified_ca)
    (final_ca_done)
    (prep_done_db)
    (verified_db)
    (final_db_done)
  )

  (:action agent1_prep_ca
    :parameters ()
    :precondition (and (start) (not (prep_done_ca)))
    :effect (and (prep_done_ca))
  )

  (:action auditor_verify_ca
    :parameters ()
    :precondition (and (prep_done_ca) (not (verified_ca)))
    :effect (and (verified_ca))
  )

  (:action agent1_set_crave_ca
    :parameters ()
    :precondition (and (verified_ca) (not (craves c a)))
    :effect (and (craves c a) (final_ca_done))
  )

  (:action agent2_prep_db
    :parameters ()
    :precondition (and (start) (not (prep_done_db)))
    :effect (and (prep_done_db))
  )

  (:action auditor_verify_db
    :parameters ()
    :precondition (and (prep_done_db) (not (verified_db)))
    :effect (and (verified_db))
  )

  (:action agent2_set_crave_db
    :parameters ()
    :precondition (and (verified_db) (not (craves d b)))
    :effect (and (craves d b) (final_db_done))
  )
)