(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  ;; Predicates (canonical names from analyst)
  (:predicates
    (hand ?x - obj)
    (cat ?x - obj)
    (texture ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)   ; collect(texture, stupendous)
    (next ?x - obj ?y - obj)      ; successor link: next(entity,entity)
    (vase ?x - obj ?y - obj)      ; vase(owner,object)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions (one-to-one with the normalized schemas from analyst)
  ;; Each action uses only the canonical predicates and enforces
  ;; required ordering by preconditions that mention the necessary fluents.
  ;; Comments annotate the original normalized action name.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Action: paltry
  ;; (Original normalized schema: paltry)
  ;; Intuition: given a vase(hand,cat) and a cat->texture link, grant the hand the same texture link.
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cat ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; Action: sip
  ;; (Original normalized schema: sip)
  ;; Intuition: if a hand and a cat share the same successor ?t, create vase(hand,cat) and remove hand's link to ?t.
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cat ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; Action: clip
  ;; (Original normalized schema: clip)
  ;; Intuition: when a hand and a sneeze both point to the same texture, create vase(hand,sneeze) and remove the hand->texture link.
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; Action: wretched
  ;; (Original normalized schema: wretched)
  ;; Intuition: re-route a sneeze's successor from ?t1 to another texture ?t2, provided both textures collect the same stupendous object.
  ;; This enforces that the choice of ?t2 must share the same stupendous collector as ?t1.
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; Action: memory
  ;; (Original normalized schema: memory)
  ;; Intuition: move a cat's successor link from one spring (?s1) to another (?s2).
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and
      (cat ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; Action: tightfisted
  ;; (Original normalized schema: tightfisted)
  ;; Intuition: consume a vase(hand,sneeze) and the sneeze->texture link to give the hand that texture link.
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )

)