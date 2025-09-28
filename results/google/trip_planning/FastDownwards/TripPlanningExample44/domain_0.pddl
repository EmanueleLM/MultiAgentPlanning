(define (domain multiagent-travel)
  (:requirements :strips :typing :fluents :numeric-fluents)
  (:types day)

  (:predicates
    (unassigned ?d - day)
    (in-rome ?d - day)
    (in-lyon ?d - day)
    (in-zurich ?d - day)
    (next ?d1 - day ?d2 - day)
    (start ?d - day)
    (early ?d - day)    ; days 1..7
    (late ?d - day)     ; days 8..17
    (wedding-attended)
  )

  (:functions
    (rome-count)   ; number of days currently assigned to Rome
    (lyon-count)   ; number of days currently assigned to Lyon
    (zurich-count) ; number of days currently assigned to Zurich
  )

  ; -------------------------
  ; Rome-assignment actions (rome_agent responsibilities)
  ; Allowed transitions to Rome: Rome->Rome, Lyon->Rome, Zurich->Rome
  ; Each action consumes one unassigned day and increments rome-count.
  ; -------------------------
  (:action assign-start-rome
    :parameters (?d - day)
    :precondition (and (start ?d) (unassigned ?d) (< (rome-count) 6))
    :effect (and (not (unassigned ?d)) (in-rome ?d) (increase (rome-count) 1))
  )

  (:action assign-after-rome-to-rome
    :parameters (?prev - day ?d - day)
    :precondition (and (in-rome ?prev) (next ?prev ?d) (unassigned ?d) (< (rome-count) 6))
    :effect (and (not (unassigned ?d)) (in-rome ?d) (increase (rome-count) 1))
  )

  (:action assign-after-lyon-to-rome
    :parameters (?prev - day ?d - day)
    :precondition (and (in-lyon ?prev) (next ?prev ?d) (unassigned ?d) (< (rome-count) 6))
    :effect (and (not (unassigned ?d)) (in-rome ?d) (increase (rome-count) 1))
  )

  (:action assign-after-zurich-to-rome
    :parameters (?prev - day ?d - day)
    :precondition (and (in-zurich ?prev) (next ?prev ?d) (unassigned ?d) (< (rome-count) 6))
    :effect (and (not (unassigned ?d)) (in-rome ?d) (increase (rome-count) 1))
  )

  ; -------------------------
  ; Lyon-assignment actions (lyon_agent responsibilities)
  ; Allowed transitions to Lyon: Lyon->Lyon, Rome->Lyon
  ; No direct Zurich <-> Lyon flights are available, so Zurich->Lyon is not allowed.
  ; -------------------------
  (:action assign-start-lyon
    :parameters (?d - day)
    :precondition (and (start ?d) (unassigned ?d) (< (lyon-count) 6))
    :effect (and (not (unassigned ?d)) (in-lyon ?d) (increase (lyon-count) 1))
  )

  (:action assign-after-lyon-to-lyon
    :parameters (?prev - day ?d - day)
    :precondition (and (in-lyon ?prev) (next ?prev ?d) (unassigned ?d) (< (lyon-count) 6))
    :effect (and (not (unassigned ?d)) (in-lyon ?d) (increase (lyon-count) 1))
  )

  (:action assign-after-rome-to-lyon
    :parameters (?prev - day ?d - day)
    :precondition (and (in-rome ?prev) (next ?prev ?d) (unassigned ?d) (< (lyon-count) 6))
    :effect (and (not (unassigned ?d)) (in-lyon ?d) (increase (lyon-count) 1))
  )

  ; -------------------------
  ; Zurich-assignment actions (zurich_agent responsibilities)
  ; Allowed transitions to Zurich: Zurich->Zurich, Rome->Zurich
  ; Zurich days 1..7 (early) must be able to mark wedding-attended.
  ; -------------------------
  (:action assign-start-zurich-early
    :parameters (?d - day)
    :precondition (and (start ?d) (unassigned ?d) (early ?d) (< (zurich-count) 7))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (increase (zurich-count) 1) (wedding-attended))
  )

  (:action assign-start-zurich-late
    :parameters (?d - day)
    :precondition (and (start ?d) (unassigned ?d) (late ?d) (< (zurich-count) 7))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (increase (zurich-count) 1))
  )

  (:action assign-after-zurich-to-zurich-early
    :parameters (?prev - day ?d - day)
    :precondition (and (in-zurich ?prev) (next ?prev ?d) (unassigned ?d) (early ?d) (< (zurich-count) 7))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (increase (zurich-count) 1) (wedding-attended))
  )

  (:action assign-after-zurich-to-zurich-late
    :parameters (?prev - day ?d - day)
    :precondition (and (in-zurich ?prev) (next ?prev ?d) (unassigned ?d) (late ?d) (< (zurich-count) 7))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (increase (zurich-count) 1))
  )

  (:action assign-after-rome-to-zurich-early
    :parameters (?prev - day ?d - day)
    :precondition (and (in-rome ?prev) (next ?prev ?d) (unassigned ?d) (early ?d) (< (zurich-count) 7))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (increase (zurich-count) 1) (wedding-attended))
  )

  (:action assign-after-rome-to-zurich-late
    :parameters (?prev - day ?d - day)
    :precondition (and (in-rome ?prev) (next ?prev ?d) (unassigned ?d) (late ?d) (< (zurich-count) 7))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (increase (zurich-count) 1))
  )

  ; No action allows Zurich->Lyon or Lyon->Zurich directly (no direct flight), satisfying the "only-direct-flights" constraint.
)