(define (domain multiagent-travel)
  (:requirements :strips :typing :adl)
  (:types day rslot lslot zslot)

  (:predicates
    (unassigned ?d - day)
    (in-rome ?d - day)
    (in-lyon ?d - day)
    (in-zurich ?d - day)
    (next ?d1 - day ?d2 - day)
    (start ?d - day)
    (early ?d - day)
    (late ?d - day)
    (wedding-attended)

    (rome-slot-free ?s - rslot)
    (rome-slot-filled ?s - rslot ?d - day)
    (lyon-slot-free ?s - lslot)
    (lyon-slot-filled ?s - lslot ?d - day)
    (zurich-slot-free ?s - zslot)
    (zurich-slot-filled ?s - zslot ?d - day)
  )

  (:action assign-start-rome
    :parameters (?d - day ?s - rslot)
    :precondition (and (start ?d) (unassigned ?d) (rome-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-rome ?d) (not (rome-slot-free ?s)) (rome-slot-filled ?s ?d))
  )

  (:action assign-after-rome-to-rome
    :parameters (?prev - day ?d - day ?s - rslot)
    :precondition (and (in-rome ?prev) (next ?prev ?d) (unassigned ?d) (rome-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-rome ?d) (not (rome-slot-free ?s)) (rome-slot-filled ?s ?d))
  )

  (:action assign-after-lyon-to-rome
    :parameters (?prev - day ?d - day ?s - rslot)
    :precondition (and (in-lyon ?prev) (next ?prev ?d) (unassigned ?d) (rome-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-rome ?d) (not (rome-slot-free ?s)) (rome-slot-filled ?s ?d))
  )

  (:action assign-after-zurich-to-rome
    :parameters (?prev - day ?d - day ?s - rslot)
    :precondition (and (in-zurich ?prev) (next ?prev ?d) (unassigned ?d) (rome-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-rome ?d) (not (rome-slot-free ?s)) (rome-slot-filled ?s ?d))
  )

  (:action assign-start-lyon
    :parameters (?d - day ?s - lslot)
    :precondition (and (start ?d) (unassigned ?d) (lyon-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-lyon ?d) (not (lyon-slot-free ?s)) (lyon-slot-filled ?s ?d))
  )

  (:action assign-after-lyon-to-lyon
    :parameters (?prev - day ?d - day ?s - lslot)
    :precondition (and (in-lyon ?prev) (next ?prev ?d) (unassigned ?d) (lyon-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-lyon ?d) (not (lyon-slot-free ?s)) (lyon-slot-filled ?s ?d))
  )

  (:action assign-after-rome-to-lyon
    :parameters (?prev - day ?d - day ?s - lslot)
    :precondition (and (in-rome ?prev) (next ?prev ?d) (unassigned ?d) (lyon-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-lyon ?d) (not (lyon-slot-free ?s)) (lyon-slot-filled ?s ?d))
  )

  (:action assign-start-zurich-early
    :parameters (?d - day ?s - zslot)
    :precondition (and (start ?d) (unassigned ?d) (early ?d) (zurich-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (not (zurich-slot-free ?s)) (zurich-slot-filled ?s ?d) (wedding-attended))
  )

  (:action assign-start-zurich-late
    :parameters (?d - day ?s - zslot)
    :precondition (and (start ?d) (unassigned ?d) (late ?d) (zurich-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (not (zurich-slot-free ?s)) (zurich-slot-filled ?s ?d))
  )

  (:action assign-after-zurich-to-zurich-early
    :parameters (?prev - day ?d - day ?s - zslot)
    :precondition (and (in-zurich ?prev) (next ?prev ?d) (unassigned ?d) (early ?d) (zurich-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (not (zurich-slot-free ?s)) (zurich-slot-filled ?s ?d) (wedding-attended))
  )

  (:action assign-after-zurich-to-zurich-late
    :parameters (?prev - day ?d - day ?s - zslot)
    :precondition (and (in-zurich ?prev) (next ?prev ?d) (unassigned ?d) (late ?d) (zurich-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (not (zurich-slot-free ?s)) (zurich-slot-filled ?s ?d))
  )

  (:action assign-after-rome-to-zurich-early
    :parameters (?prev - day ?d - day ?s - zslot)
    :precondition (and (in-rome ?prev) (next ?prev ?d) (unassigned ?d) (early ?d) (zurich-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (not (zurich-slot-free ?s)) (zurich-slot-filled ?s ?d) (wedding-attended))
  )

  (:action assign-after-rome-to-zurich-late
    :parameters (?prev - day ?d - day ?s - zslot)
    :precondition (and (in-rome ?prev) (next ?prev ?d) (unassigned ?d) (late ?d) (zurich-slot-free ?s))
    :effect (and (not (unassigned ?d)) (in-zurich ?d) (not (zurich-slot-free ?s)) (zurich-slot-filled ?s ?d))
  )
)