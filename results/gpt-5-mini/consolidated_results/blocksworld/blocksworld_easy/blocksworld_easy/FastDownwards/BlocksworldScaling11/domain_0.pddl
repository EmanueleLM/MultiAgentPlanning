(define (domain multi-agent-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item location)

  (:predicates
    ; types are declared separately but listing instance-type predicates is implicit
    (at ?i - item ?l - location)           ; item is on a location (table/surface)
    (on ?i - item ?j - item)              ; item i is directly on item j
    (clear ?i - item)                     ; nothing is on item i (top of stack)
    (holding ?a - agent ?i - item)        ; agent is holding item
    (emptyhand ?a - agent)                ; agent has empty hand
    (phase-stacking)                      ; system is in stacking phase
    (phase-unstacking)                    ; system is in unstacking phase
    (target_on ?i - item ?j - item)       ; desired final stacking relation i on j for stacking phase
    (target_at ?i - item ?l - location)   ; desired final placement of an item on a location for stacking phase
    (placed ?i - item)                    ; item has been placed into its target stacking position
    (destination ?l - location)           ; location designated as final destination for unstacked items
    (agent ?a - agent)                    ; typing convenience (optional)
    (item ?i - item)                      ; typing convenience (optional)
    (location ?l - location)              ; typing convenience (optional)
  )

  ; ---------------------------
  ; Stacker actions (namespaced)
  ; ---------------------------

  (:action stacker-pick-from-loc
    :parameters (?a - agent ?i - item ?loc - location)
    :precondition (and
      (phase-stacking)
      (emptyhand ?a)
      (at ?i ?loc)
      (clear ?i)
    )
    :effect (and
      (holding ?a ?i)
      (not (at ?i ?loc))
      (not (emptyhand ?a))
    )
  )

  (:action stacker-pick-from-item
    :parameters (?a - agent ?i - item ?below - item)
    :precondition (and
      (phase-stacking)
      (emptyhand ?a)
      (on ?i ?below)
      (clear ?i)
    )
    :effect (and
      (holding ?a ?i)
      (clear ?below)
      (not (on ?i ?below))
      (not (emptyhand ?a))
    )
  )

  (:action stacker-place-on-loc
    :parameters (?a - agent ?i - item ?loc - location)
    :precondition (and
      (phase-stacking)
      (holding ?a ?i)
      (target_at ?i ?loc)    ; allow only placements that match the target stacking map
    )
    :effect (and
      (at ?i ?loc)
      (clear ?i)
      (placed ?i)
      (emptyhand ?a)
      (not (holding ?a ?i))
    )
  )

  (:action stacker-place-on-item
    :parameters (?a - agent ?i - item ?below - item)
    :precondition (and
      (phase-stacking)
      (holding ?a ?i)
      (clear ?below)
      (target_on ?i ?below)  ; allow only placements that match the target stacking map
      (placed ?below)        ; enforce ordering: the item below must already be placed
    )
    :effect (and
      (on ?i ?below)
      (clear ?i)
      (not (clear ?below))
      (placed ?i)
      (emptyhand ?a)
      (not (holding ?a ?i))
    )
  )

  ; The stacker explicitly advances the system phase to unstacking, but only when
  ; all required placed facts are true and both agents have empty hands.
  (:action stacker-advance-to-unstacking
    :parameters (?s - agent ?u - agent)
    :precondition (and
      (phase-stacking)
      (emptyhand ?s)
      (emptyhand ?u)
      ; explicit conjuncts enumerate the required placed items for this problem instance.
      ; The problem must name the exact items for which (placed ...) is required.
      (placed box1)
      (placed box2)
      (placed box3)
    )
    :effect (and
      (phase-unstacking)
      (not (phase-stacking))
    )
  )

  ; --------------------------------
  ; Unstacker actions (namespaced)
  ; --------------------------------

  (:action unstacker-pick-from-item
    :parameters (?a - agent ?i - item ?below - item)
    :precondition (and
      (phase-unstacking)
      (emptyhand ?a)
      (on ?i ?below)
      (clear ?i)
    )
    :effect (and
      (holding ?a ?i)
      (clear ?below)
      (not (on ?i ?below))
      (not (emptyhand ?a))
    )
  )

  (:action unstacker-pick-from-loc
    :parameters (?a - agent ?i - item ?loc - location)
    :precondition (and
      (phase-unstacking)
      (emptyhand ?a)
      (at ?i ?loc)
      (clear ?i)
    )
    :effect (and
      (holding ?a ?i)
      (not (at ?i ?loc))
      (not (emptyhand ?a))
    )
  )

  (:action unstacker-place-on-destination
    :parameters (?a - agent ?i - item ?loc - location)
    :precondition (and
      (phase-unstacking)
      (holding ?a ?i)
      (destination ?loc)   ; allow placing only to declared destination locations
    )
    :effect (and
      (at ?i ?loc)
      (clear ?i)
      (emptyhand ?a)
      (not (holding ?a ?i))
    )
  )

)