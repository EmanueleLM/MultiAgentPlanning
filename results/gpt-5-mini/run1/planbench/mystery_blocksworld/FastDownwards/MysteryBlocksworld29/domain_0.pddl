; Domain: orchestrated-craves-domain
; Assumptions introduced to integrate analyst/player/auditor inputs:
; 1) Agents a, b, c are participant entities whose pairwise "craves" relations are the planning goal.
; 2) The "analyst" role produces a formal schema (formalized X Y) that permits a player to observe a provisional craving.
; 3) The "player" role creates provisional observations (provisional X Y) but cannot make a craving final.
; 4) The "auditor" role is the only actor that may finalize a provisional observation into a true (craves X Y).
; 5) To keep actions distinct by origin, actions are prefixed with the originating role: analyst-, player-, auditor-.
; 6) No other actor or action can add (craves ...) (this enforces auditor corrections as a hard constraint).
; 7) There is no temporal model beyond the required ordering: analyst-formalize -> player-observe -> auditor-validate for each pair.
; 8) We do not invent additional resources beyond these predicates and three participant agents a, b, c.
; These assumptions are encoded explicitly by predicates and action preconditions so violating plans are impossible.

(define (domain orchestrated-craves-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent)

  (:predicates
    ; formalized X Y  -- an analyst-formalized schema exists permitting observation
    (formalized ?from - agent ?to - agent)
    ; provisional X Y -- a player observed a provisional craving (requires formalized)
    (provisional ?from - agent ?to - agent)
    ; craves X Y -- final audited craving relation (goal facts)
    (craves ?from - agent ?to - agent)
  )

  ; Analyst action: creates a formal schema linking two agents.
  ; Can be applied only if the schema is not already present.
  (:action analyst-formalize
    :parameters (?from - agent ?to - agent)
    :precondition (not (formalized ?from ?to))
    :effect (formalized ?from ?to)
  )

  ; Player action: observes a formalized schema and creates a provisional observation.
  ; Must not re-create an already-provisional observation.
  (:action player-observe
    :parameters (?from - agent ?to - agent)
    :precondition (and (formalized ?from ?to) (not (provisional ?from ?to)))
    :effect (provisional ?from ?to)
  )

  ; Auditor action: validates a provisional observation, producing a final (craves ...) fact.
  ; This is the only action that may add (craves ...).
  ; It deletes the provisional flag when validating.
  (:action auditor-validate
    :parameters (?from - agent ?to - agent)
    :precondition (and (provisional ?from ?to) (not (craves ?from ?to)))
    :effect (and (craves ?from ?to) (not (provisional ?from ?to)))
  )
)