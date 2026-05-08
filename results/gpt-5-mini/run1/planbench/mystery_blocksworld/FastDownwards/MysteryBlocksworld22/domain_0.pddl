(define (domain multi_agent_crave)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    ;; core desire facts
    (craves ?who - obj ?what - obj)

    ;; ordered-phase predicates for c->a
    (start)
    (prep_done_ca)        ;; agent1 prepared the c<-a task
    (verified_ca)         ;; auditor verified the c<-a preparation
    (final_ca_done)       ;; finalization marker for c<-a

    ;; ordered-phase predicates for d->b
    (prep_done_db)        ;; agent2 prepared the d<-b task
    (verified_db)         ;; auditor verified the d<-b preparation
    (final_db_done)       ;; finalization marker for d<-b
  )

  ;; Agent 1 prepares the action sequence for making c crave a.
  (:action agent1_prep_ca
    :parameters ()
    :precondition (and (start) (not (prep_done_ca)))
    :effect (and (prep_done_ca))
  )

  ;; Auditor must verify the preparation for c<-a before finalization.
  (:action auditor_verify_ca
    :parameters ()
    :precondition (and (prep_done_ca) (not (verified_ca)))
    :effect (and (verified_ca))
  )

  ;; Agent 1 finalizes and establishes craves(c,a). Requires prior verification.
  (:action agent1_set_crave_ca
    :parameters ()
    :precondition (and (verified_ca) (not (craves c a)))
    :effect (and (craves c a) (final_ca_done))
  )

  ;; Agent 2 prepares the action sequence for making d crave b.
  (:action agent2_prep_db
    :parameters ()
    :precondition (and (start) (not (prep_done_db)))
    :effect (and (prep_done_db))
  )

  ;; Auditor must verify the preparation for d<-b before finalization.
  (:action auditor_verify_db
    :parameters ()
    :precondition (and (prep_done_db) (not (verified_db)))
    :effect (and (verified_db))
  )

  ;; Agent 2 finalizes and establishes craves(d,b). Requires prior verification.
  (:action agent2_set_crave_db
    :parameters ()
    :precondition (and (verified_db) (not (craves d b)))
    :effect (and (craves d b) (final_db_done))
  )
)