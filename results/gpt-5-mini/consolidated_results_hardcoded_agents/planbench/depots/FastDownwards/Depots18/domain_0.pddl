; Domain: Multi-agent stacking domain for Fast-Downward
; Modeling choices:
; - Objects: agents, crates, pallets. Crates and pallets both function as "supports".
; - Predicates:
;     (on c s)      : crate c is directly on support s (support = crate or pallet)
;     (clear s)     : support s has nothing on top
;     (at a s)      : agent a is located at support s (agents move between supports)
;     (holding a c) : agent a holds crate c
;     (free-hand a) : agent a is free (holding nothing)
;     (has-target s)    : support s has a designated final-target constraint (used to enforce ordering)
;     (target-loc s t)  : if s has a target, s's required final support is t
; - Ordering constraint enforcement:
;     If a support s has a designated target (has-target s), the general "place" action forbids placing onto s
;     until s itself has been placed on its target support t. A separate place action permits placing onto s
;     only when (on s t) holds. This enforces sequencing such as "crate0 on crate2" only after crate2 is at its target.
; - Actions are namespaced by prefixing with "agent-" in their names. Each action accepts an agent parameter,
;   so action schemas are generic for any agent instance.
; - No bookkeeping shortcuts or penalty actions are present. All constraints expressed as hard conditions.
; - :requirements are limited to :strips, :typing, :negative-preconditions as requested.

(define (domain multi-agent-stack)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent crate pallet)
  ; Note: supports in predicates are expressed as (either crate pallet) where needed.

  (:predicates
    (on ?c - crate ?s - (either crate pallet))     ; crate c directly on support s
    (clear ?s - (either crate pallet))             ; support s has nothing on top
    (at ?a - agent ?s - (either crate pallet))     ; agent a is at support s
    (holding ?a - agent ?c - crate)                ; agent a holds crate c
    (free-hand ?a - agent)                         ; agent a is free (holds nothing)
    (has-target ?s - (either crate pallet))       ; support s has a designated final-target constraint
    (target-loc ?s - (either crate pallet) ?t - (either crate pallet)) ; s must end up on t
  )

  ; ACTION: agent-move
  ; Move agent between supports. No adjacency constraints are modeled (connectivity not specified).
  (:action agent-move
    :parameters (?a - agent ?from - (either crate pallet) ?to - (either crate pallet))
    :precondition (at ?a ?from)
    :effect (and
              (not (at ?a ?from))
              (at ?a ?to)
            )
  )

  ; ACTION: agent-pick
  ; Agent picks a clear crate that is on support s, becoming holding that crate.
  (:action agent-pick
    :parameters (?a - agent ?c - crate ?s - (either crate pallet))
    :precondition (and
                    (at ?a ?s)
                    (on ?c ?s)
                    (clear ?c)
                    (free-hand ?a)
                  )
    :effect (and
              (not (on ?c ?s))
              (holding ?a ?c)
              (not (free-hand ?a))
              (clear ?s)           ; the support becomes clear after removing the top crate
            )
  )

  ; ACTION: agent-place-general
  ; Place a held crate on a support that does NOT have a designated final-target.
  ; Uses negative precondition to forbid placing onto supports that are intended to be placed later (has-target).
  (:action agent-place-general
    :parameters (?a - agent ?c - crate ?s - (either crate pallet))
    :precondition (and
                    (holding ?a ?c)
                    (at ?a ?s)
                    (clear ?s)
                    (not (has-target ?s))
                  )
    :effect (and
              (on ?c ?s)
              (not (holding ?a ?c))
              (free-hand ?a)
              (not (clear ?s))
              (clear ?c)
            )
  )

  ; ACTION: agent-place-on-target-support
  ; Place a held crate on a support that DOES have a designated target, but only when that support is already
  ; at its own target location. This enforces required ordering for stacking on supports that must be first
  ; moved to their targets.
  (:action agent-place-on-target-support
    :parameters (?a - agent ?c - crate ?s - (either crate pallet) ?t - (either crate pallet))
    :precondition (and
                    (holding ?a ?c)
                    (at ?a ?s)
                    (clear ?s)
                    (has-target ?s)
                    (target-loc ?s ?t)
                    (on ?s ?t)   ; support s must already be on its target t before receiving a placement
                  )
    :effect (and
              (on ?c ?s)
              (not (holding ?a ?c))
              (free-hand ?a)
              (not (clear ?s))
              (clear ?c)
            )
  )
)