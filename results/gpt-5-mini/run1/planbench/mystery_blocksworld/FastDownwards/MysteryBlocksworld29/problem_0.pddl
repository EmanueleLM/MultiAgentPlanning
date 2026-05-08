; Problem: orchestrated-craves-problem
; Notes on mapping to the domain:
; - Initial state encodes the analyst's formalized schemas and the player's observations (provisionals).
; - The auditor has not yet validated them; the planner must apply auditor-validate for each pair.
; - Goals are exactly the two final audited craves facts requested by the user: craves(a,c) and craves(b,a).

(define (problem orchestrated-craves-problem)
  (:domain orchestrated-craves-domain)
  (:objects
    a b c - agent
  )

  (:init
    ; Analyst has formalized both relations observed by the player.
    (formalized a c)
    (formalized b a)

    ; Player has observed and created provisional records for both relations.
    (provisional a c)
    (provisional b a)

    ; No craves facts are present initially; only the auditor can create them.
  )

  (:goal (and
    (craves a c)
    (craves b a)
  ))
)