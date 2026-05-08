(define (problem orchestrated-problem)
  (:domain orchestrated-domain)

  ; Objects: as mandated, define a, b, c, d
  (:objects
    a b c d - agent
  )

  ; Initial facts:
  ; The original inputs did not supply explicit initial facts. Conservatively assume:
  ;  - all agents exist and are alive
  ;  - no agent is exposed, defeated, has-feasted, craves, or recorded as overcame initially
  ;
  ; If the inputs intended different initial conditions, replace these initial facts accordingly.
  (:init
    (alive a)
    (alive b)
    (alive c)
    (alive d)
    ; No other predicates true initially (explicit non-existence is handled by absence)
  )

  ; Goal: both required cravings must hold simultaneously.
  (:goal
    (and
      (craves c b)
      (craves d a)
    )
  )

  ; Comments:
  ; - To achieve (craves c b) the solver must (1) make b defeated (via attack then succumb),
  ;   then (2) have c feast on b. The ordering "attack -> succumb" is enforced by the
  ;   requirement that succumb requires (exposed ?target), which only attack adds.
  ; - Similarly for (craves d a): a must be defeated before d can feast on a.
  ; - No post-hoc penalty or quota mechanisms are provided: all constraints are hard.
  ; - If additional domain constraints or initial facts were intended (who may attack whom,
  ;   forbidden interactions, or explicit multi-phase sequencing), they must be provided;
  ;   otherwise the conservative, minimal model above is used.
)