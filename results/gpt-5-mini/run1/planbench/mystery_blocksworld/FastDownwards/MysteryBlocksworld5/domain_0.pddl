(define (domain craving-domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    ;; explicit relation stating one object is "other" to another
    (other-object ?x - obj ?y - obj)

    ;; phased, explicit facts used to enforce ordered sequence
    (stage1-done)
    (stage2-done)
    (stage3-done)

    ;; object state predicates
    (is-target ?o - obj)    ; object that must be inspected first (c)
    (is-origin ?o - obj)    ; object that must be prepared first (a)

    (inspected ?o - obj)
    (prepared ?o - obj)
    (exposed ?a - obj ?c - obj)

    ;; final goal relation
    (craves ?a - obj ?c - obj)
  )

  ;; Action performed by Agent Alpha: inspect the target object.
  ;; Causes stage1 to be completed. Can be applied only to object flagged as the target.
  (:action alpha_inspect
    :parameters (?o - obj)
    :precondition (and
      (is-target ?o)
    )
    :effect (and
      (inspected ?o)
      (stage1-done)
    )
  )

  ;; Action performed by Agent Beta: prepare the origin object.
  ;; Requires stage1 to be complete (inspection done) and the object to be the designated origin.
  ;; Causes stage2 to be completed.
  (:action beta_prepare
    :parameters (?o - obj)
    :precondition (and
      (stage1-done)
      (is-origin ?o)
    )
    :effect (and
      (prepared ?o)
      (stage2-done)
    )
  )

  ;; Action performed by Agent Gamma: expose the origin object to the inspected target.
  ;; Enforces that stage2 is complete, the target has been inspected, the origin was prepared,
  ;; and that the origin is explicitly marked as "other-object" relative to the target.
  ;; Causes stage3 to be completed and creates an exposed relation (a exposed to c).
  (:action gamma_expose
    :parameters (?a - obj ?c - obj)
    :precondition (and
      (stage2-done)
      (inspected ?c)
      (prepared ?a)
      (other-object ?a ?c)
    )
    :effect (and
      (exposed ?a ?c)
      (stage3-done)
    )
  )

  ;; Action performed by Agent Delta: trigger the craving relation.
  ;; Requires the exposure step and stage3 completion. Produces the final craves relation.
  (:action delta_activate
    :parameters (?a - obj ?c - obj)
    :precondition (and
      (stage3-done)
      (exposed ?a ?c)
    )
    :effect (and
      (craves ?a ?c)
    )
  )
)