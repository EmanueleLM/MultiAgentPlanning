(define (problem multi_agent_crave_problem)
  (:domain multi_agent_crave)
  (:objects a b c d - obj)
  (:init
    ;; initial trigger to allow preparations to begin
    (start)
    ;; Note: all other state predicates (prep_done_*, verified_*, final_*, craves ...) are false by omission.
  )
  (:goal
    (and
      ;; The mandated terminal conditions: both craving facts must hold...
      (craves c a)
      (craves d b)
      ;; ...and their corresponding finalization markers must also hold to fix terminal conditions.
      (final_ca_done)
      (final_db_done)
    )
  )
)