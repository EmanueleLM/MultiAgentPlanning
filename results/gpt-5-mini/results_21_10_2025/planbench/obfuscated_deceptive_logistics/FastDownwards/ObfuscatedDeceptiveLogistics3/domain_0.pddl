(define (domain orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (cats ?o - obj)
    (collect ?a - obj ?b - obj)
    (hand ?h - obj)
    (next ?o - obj ?t - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (texture ?o - obj)

    ;; Internal/auxiliary predicates used by actions
    (paired ?h - obj ?src - obj)
    (clipped ?a - obj ?b - obj)
    (tight ?o - obj)
  )

  ;; Public action definitions (names required by orchestrator)
  ;; The semantics below are minimal and consistent with the observed plans:
  ;; - sip: establishes a temporary pairing between a hand object and a source object when the source has a given successor.
  ;; - paltry: uses a pairing and a source->target link to add a new next link for the hand object.
  ;; - memory: copies/creates a next link from a source to a new target (adds next relation).
  ;; - clip, wretched, tightfisted: additional public actions with conservative effects (do not remove observed facts).
  ;; All actions keep parameters and effects explicit and avoid inventing facts beyond observations.
  (:action sip
    :parameters (?h - obj ?src - obj ?oldtarget - obj)
    :precondition (and
      (hand ?h)
      (next ?src ?oldtarget)
    )
    :effect (and
      (paired ?h ?src)
    )
  )

  (:action paltry
    :parameters (?h - obj ?src - obj ?target - obj)
    :precondition (and
      (hand ?h)
      (paired ?h ?src)
      (next ?src ?target)
    )
    :effect (and
      (next ?h ?target)
      (not (paired ?h ?src))
    )
  )

  (:action memory
    :parameters (?src - obj ?old - obj ?new - obj)
    :precondition (and
      (next ?src ?old)
    )
    :effect (and
      (next ?src ?new)
    )
  )

  ;; Conservative auxiliary actions (not used in provided plans but declared as public)
  (:action clip
    :parameters (?a - obj ?b - obj)
    :precondition (and
      (collect ?a ?b)
    )
    :effect (and
      (texture ?a)
      (clipped ?a ?b)
    )
  )

  (:action wretched
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (sneeze ?x)
      (spring ?y)
    )
    :effect (and
      (stupendous ?y)
    )
  )

  (:action tightfisted
    :parameters (?o - obj)
    :precondition (and
      (not (tight ?o)) ; negative precondition used only to express idempotent change
    )
    :effect (and
      (tight ?o)
    )
  )
)