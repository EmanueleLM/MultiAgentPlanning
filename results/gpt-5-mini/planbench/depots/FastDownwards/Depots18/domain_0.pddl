; Domain: crate_stacking_domain
; Modeling choices:
; - Two agents are modeled explicitly: ag1 and ag2. Agent-specific actions are namespaced with ag1- and ag2- prefixes.
; - Supports (pallets and ground supports) and crates are all typed as subtypes of object, and the predicate (on ?c ?s) accepts any object as a support.
; - Agents must be at the same location as a support to pick from or put onto that support. Locations are explicit objects.
; - Hand occupancy is modeled with (handfree ?ag) and (holding ?ag ?c). Both are maintained in action effects to prevent multi-grasp.
; - "clear" is defined for any object (crate, pallet, ground support). A support is not clear when some crate is directly on it.
; - To enforce the ordering implied by the goals, placing crate0 onto crate2 is only possible when crate2 is already on pallet3. This is enforced by a specialized put action (ag?-put-crate0-on-crate2).
; - No post-hoc penalty or bookkeeping shortcuts are used. All constraints are hard (encoded as preconditions/effects).
; - :requirements are limited to :strips, :typing, and :negative-preconditions for compatibility with FastDownwards.

(define (domain crate_stacking_domain)
  (:requirements :strips :typing :negative-preconditions)

  ;; Types: agent, crate, pallet, support, location are subtypes of object
  (:types agent crate pallet support location - object)

  ;; Predicates
  (:predicates
    ;; agent location
    (at ?ag - agent ?l - location)

    ;; agent hand state
    (handfree ?ag - agent)
    (holding ?ag - agent ?c - crate)

    ;; stacking relation: crate on object (pallet, support, or another crate)
    (on ?c - crate ?s - object)

    ;; top-of relation: object (crate, pallet, or support) has nothing on it
    (clear ?o - object)

    ;; object location: where a support or crate is located (absent for crates when held)
    (loc-of ?o - object ?l - location)
  )

  ;; -------------------------
  ;; Agent-specific move actions
  ;; -------------------------
  (:action ag1-move
    :parameters (?from - location ?to - location)
    :precondition (and (at ag1 ?from))
    :effect (and
      (not (at ag1 ?from))
      (at ag1 ?to)
    )
  )

  (:action ag2-move
    :parameters (?from - location ?to - location)
    :precondition (and (at ag2 ?from))
    :effect (and
      (not (at ag2 ?from))
      (at ag2 ?to)
    )
  )

  ;; -------------------------
  ;; Agent-specific pick actions
  ;; Preconditions require:
  ;; - agent is handfree
  ;; - agent is at the same location as the support
  ;; - crate is directly on the support
  ;; - crate is clear (nothing on top)
  ;; Effects:
  ;; - agent holds the crate, support becomes clear, crate loses loc-of
  ;; -------------------------
  (:action ag1-pick
    :parameters (?c - crate ?s - object ?l - location)
    :precondition (and
      (handfree ag1)
      (at ag1 ?l)
      (on ?c ?s)
      (loc-of ?s ?l)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (holding ag1 ?c)
      (not (handfree ag1))
      ;; removing crate location while held
      (not (loc-of ?c ?l))
      ;; support becomes clear when its top crate is removed
      (clear ?s)
    )
  )

  (:action ag2-pick
    :parameters (?c - crate ?s - object ?l - location)
    :precondition (and
      (handfree ag2)
      (at ag2 ?l)
      (on ?c ?s)
      (loc-of ?s ?l)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (holding ag2 ?c)
      (not (handfree ag2))
      (not (loc-of ?c ?l))
      (clear ?s)
    )
  )

  ;; -------------------------
  ;; Agent-specific put actions onto any pallet
  ;; Preconditions require:
  ;; - agent holds the crate
  ;; - agent at same location as pallet
  ;; - pallet is clear
  ;; Effects:
  ;; - crate is placed on pallet, pallet not clear, crate becomes clear, crate has loc-of pallet location
  ;; -------------------------
  (:action ag1-put-on-pallet
    :parameters (?c - crate ?p - pallet ?l - location)
    :precondition (and
      (holding ag1 ?c)
      (at ag1 ?l)
      (loc-of ?p ?l)
      (clear ?p)
    )
    :effect (and
      (not (holding ag1 ?c))
      (handfree ag1)
      (on ?c ?p)
      (not (clear ?p))
      (clear ?c)
      (loc-of ?c ?l)
    )
  )

  (:action ag2-put-on-pallet
    :parameters (?c - crate ?p - pallet ?l - location)
    :precondition (and
      (holding ag2 ?c)
      (at ag2 ?l)
      (loc-of ?p ?l)
      (clear ?p)
    )
    :effect (and
      (not (holding ag2 ?c))
      (handfree ag2)
      (on ?c ?p)
      (not (clear ?p))
      (clear ?c)
      (loc-of ?c ?l)
    )
  )

  ;; -------------------------
  ;; Agent-specific put action to place crate0 onto crate2
  ;; This specialized action enforces the ordering constraint that crate2 must already be on pallet3.
  ;; Preconditions require:
  ;; - agent holds crate0
  ;; - agent at same location as crate2
  ;; - crate2 is clear
  ;; - crate2 is already on pallet3 (enforces that crate2 is on pallet3 before crate0 is placed)
  ;; Effects:
  ;; - crate0 is on crate2, crate2 becomes not clear, crate0 becomes clear and has loc-of crate2's location
  ;; -------------------------
  (:action ag1-put-crate0-on-crate2
    :parameters (?l - location)
    :precondition (and
      (holding ag1 crate0)
      (at ag1 ?l)
      (loc-of crate2 ?l)
      (clear crate2)
      (on crate2 pallet3)
    )
    :effect (and
      (not (holding ag1 crate0))
      (handfree ag1)
      (on crate0 crate2)
      (not (clear crate2))
      (clear crate0)
      (loc-of crate0 ?l)
    )
  )

  (:action ag2-put-crate0-on-crate2
    :parameters (?l - location)
    :precondition (and
      (holding ag2 crate0)
      (at ag2 ?l)
      (loc-of crate2 ?l)
      (clear crate2)
      (on crate2 pallet3)
    )
    :effect (and
      (not (holding ag2 crate0))
      (handfree ag2)
      (on crate0 crate2)
      (not (clear crate2))
      (clear crate0)
      (loc-of crate0 ?l)
    )
  )

  ;; Note: No general "put on crate" action is provided, only the specialized put-crate0-on-crate2,
  ;; to prevent placing crate0 on crate2 before crate2 is on pallet3.
)